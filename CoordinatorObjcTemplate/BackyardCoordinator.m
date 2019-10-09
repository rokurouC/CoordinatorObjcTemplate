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
    [self.router presentViewController:backyardViewController withAnimated:animated onDismissed:onDismiss];
}
@end
