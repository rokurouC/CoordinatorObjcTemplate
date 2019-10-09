//
//  LobbyCoordinator.m
//  CoordinatorObjcTemplate
//
//  Created by Will Chen on 2019/10/9.
//  Copyright © 2019 rukurouc. All rights reserved.
//

#import "LobbyCoordinator.h"

@implementation LobbyCoordinator
// MARK: Coordinator
-(void)presentWithAnimated:(Boolean)animated onDismiss:(void (^)(void))onDismiss {
    LobbyViewController * lobbyViewController = [LobbyViewController new];
    lobbyViewController.coordinator = self;
    [lobbyViewController setTitle:@"Lobby"];
    [self.router presentViewController:lobbyViewController withAnimated:animated onDismissed:onDismiss];
}
@end
