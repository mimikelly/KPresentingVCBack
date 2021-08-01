//
//  PresentingVC.m
//  KPresentingVCBack
//
//  Created by 仲嘉仪 on 2021/7/15.
//
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

#import "PresentingVC.h"

@interface PresentingVC () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *pan;

@property (nonatomic, assign) CGPoint startViewCenter;

@end

@implementation PresentingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
     
    _pan = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(handleBackGesture:)];
    _pan.edges = UIRectEdgeLeft;
    _pan.delegate = self;
    [self.view addGestureRecognizer:_pan];
    self.startViewCenter = self.view.center;

}

- (void)handleBackGesture:(UIPanGestureRecognizer *)sender{
    int location_X = kHeight/2;
    CGPoint velocity = [sender velocityInView:self.view];
    CGRect frame = self.view.frame;
    switch (sender.state) {
        case UIGestureRecognizerStateChanged: {
            CGPoint touchPoint = [sender locationInView:self.view];
            frame.origin.y = (touchPoint.x / kWidth) * kHeight;
            self.view.frame = frame;
        } break;
        case UIGestureRecognizerStateEnded: {
            if(velocity.x > 200) {
                [UIView animateWithDuration:0.2 animations:^{
                    self.view.center = CGPointMake(kWidth / 2, kHeight + kHeight / 2);
                } completion:^(BOOL finished) {
                    [self dismissViewControllerAnimated:NO completion:nil];
                }];
            } else {
                if(self.view.frame.origin.y > location_X) {
                    [UIView animateWithDuration:0.25 animations:^{
                        self.view.center = CGPointMake(kWidth / 2, kHeight + kHeight / 2);
                    } completion:^(BOOL finished) {
                        [self dismissViewControllerAnimated:NO completion:nil];
                    }];
                } else {
                    [UIView animateWithDuration:0.25 animations:^{
                        self.view.center = self.startViewCenter;
                    }];
                }
            }
        } break;
        default:
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
