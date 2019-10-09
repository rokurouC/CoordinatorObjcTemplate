//
//  ModalNavigationRouter.h
//  CoordinatorObjcTemplate
//
//  Created by Will Chen on 2019/10/9.
//  Copyright © 2019 rukurouc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Router.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModalNavigationRouter : NSObject <Router>
@property (nonatomic, weak) UIViewController *parentViewController;
-(instancetype)initWithParentViewController:(UIViewController*)viewController;
@end

NS_ASSUME_NONNULL_END
