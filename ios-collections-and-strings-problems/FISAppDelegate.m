//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self printArrayOfStringsInFrame:@[@"Hello", @"World", @"in", @"a", @"frame"]];
    
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

@end
