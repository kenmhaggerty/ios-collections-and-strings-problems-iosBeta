//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self printArrayOfStringsInFrame:@[@"Hello", @"World", @"in", @"a", @"frame"]];
    
    NSLog(@"%@", [self translateEnglishToPigLatin:@"The quick brown fox"]);
    
    NSLog(@"%@", [self translatePigLatinToEnglish:@"Hetay uickqay rownbay oxfay"]);
    
    NSLog(@"%@", [self combineByAlternatingArray:@[@"a", @"b", @"c"] withArray:@[@1, @2, @3]]);
    
    NSLog(@"%@", [self integerToArray:12045]);
    
    return YES;
}

- (void)printArrayOfStringsInFrame:(NSArray *)strings {
    
    NSString *characterForFrame = @"*";
    NSUInteger frameWidth = 0;
    NSMutableArray *rowsOfText = [NSMutableArray arrayWithCapacity:strings.count];
    for (NSString *string in strings) {
        [rowsOfText addObject:[NSString stringWithFormat:@"%@ %@ ", characterForFrame, string]];
        frameWidth = MAX(frameWidth, string.length+4);
    }
    NSString *frame = [@"" stringByPaddingToLength:frameWidth withString:characterForFrame startingAtIndex:0];
    NSLog(@"%@", frame);
    for (NSUInteger i = 0; i < rowsOfText.count; i++) {
        NSLog(@"%@%@", [rowsOfText[i] stringByPaddingToLength:frameWidth-1 withString:@" " startingAtIndex:0], characterForFrame);
    }
    NSLog(@"%@", frame);
}

- (NSString *)translateEnglishToPigLatin:(NSString *)string {
    
    NSString *suffix = @"ay";
    NSMutableArray *words = [NSMutableArray arrayWithArray:[string componentsSeparatedByString:@" "]];
    NSString *word, *pigLatin, *character;
    for (NSUInteger i = 0; i < words.count; i++) {
        pigLatin = @"";
        word = [words objectAtIndex:i];
        for (NSUInteger j = 0; j < word.length; j++) {
            character = [NSString stringWithFormat:@"%c", [word characterAtIndex:((j+1)%word.length)]];
            if ([[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[word characterAtIndex:j]]) character = character.uppercaseString;
            else character = character.lowercaseString;
            pigLatin = [pigLatin stringByAppendingString:character];
        }
        [words replaceObjectAtIndex:i withObject:[pigLatin stringByAppendingString:suffix]];
    }
    return [words componentsJoinedByString:@" "];
}

- (NSString *)translatePigLatinToEnglish:(NSString *)string {
    
    NSString *suffix = @"ay";
    NSMutableArray *words = [NSMutableArray arrayWithArray:[string componentsSeparatedByString:@" "]];
    NSString *word, *english, *character;
    for (NSUInteger i = 0; i < words.count; i++) {
        english = @"";
        word = [words objectAtIndex:i];
        word = [word substringToIndex:word.length-suffix.length];
        for (NSUInteger j = 0; j < word.length; j++) {
            character = [NSString stringWithFormat:@"%c", [word characterAtIndex:((j+word.length-1)%word.length)]];
            if ([[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[word characterAtIndex:j]]) character = character.uppercaseString;
            else character = character.lowercaseString;
            english = [english stringByAppendingString:character];
        }
        [words replaceObjectAtIndex:i withObject:english];
    }
    return [words componentsJoinedByString:@" "];
}

- (NSArray *)combineByAlternatingArray:(NSArray *)array1 withArray:(NSArray *)array2 {
    
    NSMutableArray *combinedArray = [NSMutableArray arrayWithCapacity:array1.count+array2.count];
    NSArray *array;
    NSUInteger index;
    for (NSUInteger i = 0; i < MAX(array1.count, array2.count)*2; i++) {
        if (i % 2) array = array2;
        else array = array1;
        index = (i-(i % 2))/2;
        if (index >= array.count) continue;
        
        [combinedArray addObject:[array objectAtIndex:index]];
    }
    return combinedArray;
}

- (NSArray *)integerToArray:(NSUInteger)integer {
    
    NSUInteger power = (NSUInteger)floorf(log10f(integer));
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:power];
    for (NSUInteger i = 0; i <= power; i++) {
        [array insertObject:[NSNumber numberWithInt:(int)floorf(integer/powf(10, i))%10] atIndex:0];
    }
    return array;
}

- (void)reverseArray:(NSMutableArray *)array {
    
    //
}

@end
