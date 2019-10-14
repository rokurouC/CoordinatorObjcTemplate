//
//  LobbyViewController.h
//  CoordinatorObjcTemplate
//
//  Created by Will Chen on 2019/10/9.
//  Copyright © 2019 rukurouc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class LobbyViewController;
@protocol LobbyViewControllerCoordinator <NSObject>
-(void)lobbyViewController:(LobbyViewController*)lobbyViewController enterGarageButtonDidTap:(UIButton*)sender;
@end

@interface LobbyViewController : UIViewController
@property(nonatomic, weak) id <LobbyViewControllerCoordinator> coordinator;
@end

NS_ASSUME_NONNULL_END
