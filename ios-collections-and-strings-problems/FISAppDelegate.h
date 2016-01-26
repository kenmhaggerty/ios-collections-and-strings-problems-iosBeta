//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)printArrayOfStringsInFrame:(NSArray *)strings;
- (NSString *)translateEnglishToPigLatin:(NSString *)string;
- (NSString *)translatePigLatinToEnglish:(NSString *)string;

@end
