//
//  AppRouter.m
//  CoordinatorObjcTemplate
//
//  Created by Will Chen on 2019/10/8.
//  Copyright © 2019 rukurouc. All rights reserved.
//

#import "AppRouter.h"

@interface AppRouter()
@property (nonatomic, strong) UINavigationController *navigationController;
@end

@implementation AppRouter
-(instancetype)initWithWindow:(UIWindow *)window {
    self = [super init];
    if (self) {
        self.window = window;
    }
    return self;
}

// MARK: Router
- (void)presentViewController:(nonnull UIViewController *)viewController withAnimated:(Boolean)animated onDismissed:(nullable void (^)(void))onDismiss {
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
}

- (void)dismissWithAnimated:(Boolean)animated {
    // don't do anything
}

@end
