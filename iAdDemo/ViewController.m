//
//  ViewController.m
//  iAdDemo
// Suraj Ramjan Mirajkar
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize iAdBannerView;
@synthesize lblBlogUrl;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [iAdBannerView setHidden:YES];
    
    
    UITapGestureRecognizer *tapPublicLink = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureTapBolgLink)];
    lblBlogUrl.userInteractionEnabled = YES;
    [lblBlogUrl addGestureRecognizer:tapPublicLink];
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
    [UIView beginAnimations:@"animateAdBanner" context:NULL];
    [iAdBannerView setHidden:NO];
    [UIView commitAnimations];
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
    [iAdBannerView setHidden:YES];
    [UIView commitAnimations];
    
    NSLog(@"iADBannerView failed to load with Error: %@",[error localizedDescription]);
    UIAlertView *alertMsg = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertMsg show];
}

-(void)gestureTapBolgLink {
    NSURL *url = [NSURL URLWithString:lblBlogUrl.text];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)viewDidUnload
{
    [self setIAdBannerView:nil];
    [self setLblBlogUrl:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
