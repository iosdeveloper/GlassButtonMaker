#import <UIKit/UIKit.h>

@interface GlassButtonMakerViewController : UIViewController {
	UIButton *theButton;
	
	IBOutlet UISlider *widthSlider;
	IBOutlet UISlider *heightSlider;
	IBOutlet UISlider *rSlider;
	IBOutlet UISlider *gSlider;
	IBOutlet UISlider *bSlider;
	IBOutlet UISwitch *retinaSwitch;
	IBOutlet UIView *theButtonView;
}

- (IBAction)updateTheButton:(id)sender;
- (IBAction)reset;
- (IBAction)writeToDesktop;

@end