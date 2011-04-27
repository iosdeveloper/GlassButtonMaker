#import "GlassButtonMakerAppDelegate.h"
#import "GlassButtonMakerViewController.h"

@implementation GlassButtonMakerAppDelegate

@synthesize window, viewController;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}

@end