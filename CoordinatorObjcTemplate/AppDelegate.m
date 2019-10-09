//
//  AppDelegate.m
//  CoordinatorObjcTemplate
//
//  Created by Will Chen on 2019/10/8.
//  Copyright © 2019 rukurouc. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (nonatomic, strong) AppRouter *appRouter;
@property (nonatomic, strong) HomeCoordinator *homeCoordinator;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.appRouter = [[AppRouter alloc] initWithWindow:self.window];
    self.homeCoordinator = [[HomeCoordinator alloc] initWithRouter:self.appRouter];
    [self.homeCoordinator presentWithAnimated:NO onDismiss:nil];
    return YES;
}

@end
