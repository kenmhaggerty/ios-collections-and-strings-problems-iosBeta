//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self printArrayOfStringsInFrame:@[@"Hello", @"World", @"in", @"a", @"frame"]];
    
    NSLog(@"%@", [self translateEnglishToPigLatin:@"The quick brown fox"]);
    
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
    
    return nil;
}

@end
