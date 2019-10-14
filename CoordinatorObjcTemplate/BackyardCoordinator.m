//
//  BackyardCoordinator.m
//  CoordinatorObjcTemplate
//
//  Created by Will Chen on 2019/10/9.
//  Copyright © 2019 rukurouc. All rights reserved.
//

#import "BackyardCoordinator.h"

@implementation BackyardCoordinator
// MARK: Coordinator
-(void)presentWithAnimated:(Boolean)animated onDismiss:(void (^)(void))onDismiss {
    BackyardViewController * backyardViewController = [BackyardViewController new];
    [backyardViewController setTitle:@"Backyard"];
    backyardViewController.coordinator = self;
    [self.router presentViewController:backyardViewController withAnimated:animated onDismissed:onDismiss];
}

// MARK: BackyardViewControllerCoordinator
- (void)backyardViewController:(nonnull BackyardViewController *)backyardViewController enterGarageButtonDidTap:(nonnull UIButton *)sender {
    GarageViewController *garageViewController = [GarageViewController new];
    [self.router presentViewController:garageViewController withAnimated:YES onDismissed:nil];
}

@end
