//
//  ViewController.h
//  iAdDemo
// Suraj Ramjan Mirajkar
//

#import <UIKit/UIKit.h>
#import <iAd/ADBannerView.h>

@interface ViewController : UIViewController <ADBannerViewDelegate>  {
    
}
@property (weak, nonatomic) IBOutlet ADBannerView *iAdBannerView;
@property (weak, nonatomic) IBOutlet UILabel *lblBlogUrl;

-(void)gestureTapBolgLink;

@end
