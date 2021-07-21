//
//  ViewController.m
//  KPresentingVCBack
//
//  Created by 仲嘉仪 on 2021/7/15.
//

#import "ViewController.h"
#import "PresentingVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    PresentingVC *vc = [[PresentingVC alloc]init];
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
}


@end
