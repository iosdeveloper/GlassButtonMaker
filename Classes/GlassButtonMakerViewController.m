#import "GlassButtonMakerViewController.h"

@implementation GlassButtonMakerViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[theButton setTitle:[textField text] forState:UIControlStateNormal];
	[textField resignFirstResponder];
	return NO;
}

- (IBAction)updateTheButton:(id)sender {
	if (sender == widthSlider) {
		CGRect frame = [theButton frame];
		[theButton setFrame:CGRectMake(frame.origin.x, frame.origin.y, [widthSlider value] * 320.0, frame.size.height)];
		[theButton setCenter:CGPointMake([theButtonView frame].size.width * 0.5, [theButtonView frame].size.height * 0.5)];
	} else if (sender == heightSlider) {
		CGRect frame = [theButton frame];
		[theButton setFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, [heightSlider value] * 159.0)];
		[theButton setCenter:CGPointMake([theButtonView frame].size.width * 0.5, [theButtonView frame].size.height * 0.5)];
	} else [theButton setValue:[UIColor colorWithRed:[rSlider value] green:[gSlider value] blue:[bSlider value] alpha:1.0] forKey:@"tintColor"];
}

- (IBAction)reset {
	[theButton removeFromSuperview];
	theButton = nil;
	
	Class theClass = NSClassFromString(@"UIGlassButton");
	theButton = [[[theClass alloc] initWithFrame:CGRectMake(0.0, 0.0, 120.0, 44.0)] autorelease];
	[theButton setCenter:CGPointMake([theButtonView frame].size.width * 0.5, [theButtonView frame].size.height * 0.5)];
	[theButtonView addSubview:theButton];
	
	[widthSlider setValue:0.375000 animated:YES];
	[heightSlider setValue:0.276730 animated:YES];
	[rSlider setValue:0.0 animated:YES];
	[gSlider setValue:0.0 animated:YES];
	[bSlider setValue:0.0 animated:YES];
	
	[(UITextField *)[[self view] viewWithTag:100] setText:nil];
}

- (IBAction)writeToDesktop {
	if (retinaSwitch.on) {
		NSString *path = [NSString stringWithFormat:@"/Users/%@/Desktop/button@2x.png", NSUserName()];
		
		CGRect frame = [theButton frame];
		[theButton setFrame:CGRectMake(frame.origin.x * 2.0, frame.origin.y * 2.0, frame.size.width * 2.0, frame.size.height * 2.0)];
		
		UIGraphicsBeginImageContext([theButton frame].size);
		CGContextRef theContext = UIGraphicsGetCurrentContext();
		[[theButton layer] renderInContext:theContext];
		
		UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
		NSData *theData = UIImagePNGRepresentation(theImage);
		[theData writeToFile:path atomically:NO];
		
		UIGraphicsEndImageContext();
		
		[theButton setFrame:frame];
	} else {
		NSString *path = [NSString stringWithFormat:@"/Users/%@/Desktop/button.png", NSUserName()];
		
		UIGraphicsBeginImageContext([theButton frame].size);
		CGContextRef theContext = UIGraphicsGetCurrentContext();
		[[theButton layer] renderInContext:theContext];
		
		UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
		NSData *theData = UIImagePNGRepresentation(theImage);
		[theData writeToFile:path atomically:NO];
		
		UIGraphicsEndImageContext();
	}
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	Class theClass = NSClassFromString(@"UIGlassButton");
	theButton = [[[theClass alloc] initWithFrame:CGRectMake(0.0, 0.0, 120.0, 44.0)] autorelease];
	[theButton setCenter:CGPointMake([theButtonView frame].size.width * 0.5, [theButtonView frame].size.height * 0.5)];
	[theButtonView addSubview:theButton];
	
	[widthSlider setValue:0.375000 animated:YES];
	[heightSlider setValue:0.276730 animated:YES];
}

@end