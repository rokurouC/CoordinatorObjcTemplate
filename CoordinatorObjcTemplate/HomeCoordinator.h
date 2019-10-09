//
//  HomeCoordinator.h
//  CoordinatorObjcTemplate
//
//  Created by Will Chen on 2019/10/8.
//  Copyright © 2019 rukurouc. All rights reserved.
//

#import "RCBaseCoordinator.h"
#import "HomeViewController.h"
#import "LobbyCoordinator.h"
#import "BackyardCoordinator.h"
#import "ModalNavigationRouter.h"
#import "PushNavigationRouter.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeCoordinator : RCBaseCoordinator <HomeViewControllerCoordinator>
@end

NS_ASSUME_NONNULL_END
