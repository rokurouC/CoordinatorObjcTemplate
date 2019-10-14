//
//  BackyardViewController.h
//  CoordinatorObjcTemplate
//
//  Created by Will Chen on 2019/10/9.
//  Copyright © 2019 rukurouc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class BackyardViewController;
@protocol BackyardViewControllerCoordinator <NSObject>
-(void)backyardViewController:(BackyardViewController*)backyardViewController enterGarageButtonDidTap:(UIButton*)sender;
@end
@interface BackyardViewController : UIViewController
@property(nonatomic, weak) id <BackyardViewControllerCoordinator> coordinator;
@end

NS_ASSUME_NONNULL_END
