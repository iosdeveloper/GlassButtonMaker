#import <UIKit/UIKit.h>

@class GlassButtonMakerViewController;

@interface GlassButtonMakerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GlassButtonMakerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GlassButtonMakerViewController *viewController;

@end