//
//  HomeViewController.m
//  CoordinatorObjcTemplate
//
//  Created by Will Chen on 2019/10/8.
//  Copyright © 2019 rukurouc. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

-(instancetype)instantiateFromStoryboard {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
    HomeViewController * homeViewController = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    return homeViewController;
}

- (IBAction)enterHome:(UIButton *)sender {
    [self.coordinator homeViewController:self enterHomeButtonDidTap:sender];
}
- (IBAction)walkToBackyard:(UIButton *)sender {
    [self.coordinator homeViewController:self walkToBackyardButtonDidTap:sender];
}
@end
