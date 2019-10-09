//
//  AppRouter.h
//  CoordinatorObjcTemplate
//
//  Created by Will Chen on 2019/10/8.
//  Copyright © 2019 rukurouc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Router.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppRouter : NSObject <Router>
@property (nonatomic, strong) UIWindow*window;
-(instancetype)initWithWindow:(UIWindow*)window;
@end

NS_ASSUME_NONNULL_END
