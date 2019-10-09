//
//  HomeCoordinator.m
//  CoordinatorObjcTemplate
//
//  Created by Will Chen on 2019/10/8.
//  Copyright © 2019 rukurouc. All rights reserved.
//

#import "HomeCoordinator.h"

@implementation HomeCoordinator
// MARK: Coordinator
-(void)presentWithAnimated:(Boolean)animated onDismiss:(void (^)(void))onDismiss {
    HomeViewController *homeViewContriller = [[HomeViewController alloc] instantiateFromStoryboard];
    homeViewContriller.coordinator = self;
    [self.router presentViewController:homeViewContriller withAnimated:NO onDismissed:nil];
}

// MARK: HomeViewControllerCoordinator
- (void)homeViewController:(HomeViewController*)homeViewController enterHomeButtonDidTap:(UIButton*)sender {
    ModalNavigationRouter * modalNavigationRouter = [[ModalNavigationRouter alloc] initWithParentViewController:homeViewController];
    LobbyCoordinator *lobbyCoordinator = [[LobbyCoordinator alloc] initWithRouter:modalNavigationRouter];
    [self presentChild:lobbyCoordinator withAnimated:YES onDismiss:^{
        NSLog(@"LobbyCoordinator on dismissed.");
    }];
}

- (void)homeViewController:(nonnull HomeViewController *)homeViewController walkToBackyardButtonDidTap:(nonnull UIButton *)sender {
    PushNavigationRouter *pushNavigationRouter = [[PushNavigationRouter alloc] initWithParentViewController:homeViewController];
    BackyardCoordinator *backyardCoordinator = [[BackyardCoordinator alloc] initWithRouter:pushNavigationRouter];
    [self presentChild:backyardCoordinator withAnimated:YES onDismiss:^{
        NSLog(@"BackyardCoordinator on dismissed.");
    }];
    
}


@end
