//
//  PushNavigationRouter.m
//  CoordinatorObjcTemplate
//
//  Created by Will Chen on 2019/10/9.
//  Copyright © 2019 rukurouc. All rights reserved.
//

#import "PushNavigationRouter.h"
@interface PushNavigationRouter() <UINavigationControllerDelegate>
@property (nonatomic, weak) UINavigationController *navigationController;
@property (nonatomic, strong) NSMutableDictionary<NSValue *, onDismiss>*onDismissForViewController;
@end

@implementation PushNavigationRouter

// MARK: Initializer
-(instancetype)initWithParentViewController:(UIViewController *)viewController {
    self = [super init];
    if (self) {
        self.onDismissForViewController = [NSMutableDictionary new];
        self.parentViewController = viewController;
        self.navigationController = viewController.navigationController;
        self.navigationController.delegate = self;
    }
    return self;
}

// MARK: Router
- (void)dismissWithAnimated:(Boolean)animated {
    NSUInteger parentViewControllerIndex = [self.navigationController.viewControllers indexOfObject:self.parentViewController];
    NSUInteger rootViewControllerIndex =  parentViewControllerIndex + 1;
    UIViewController *rootViewController = [self.navigationController.viewControllers objectAtIndex:rootViewControllerIndex];
    [self performOnDismissForViewController:rootViewController];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)presentViewController:(nonnull UIViewController *)viewController withAnimated:(Boolean)animated onDismissed:(nullable void (^)(void))onDismiss { 
    NSValue *key = [NSValue valueWithNonretainedObject:viewController];
    [self.onDismissForViewController setObject:onDismiss forKey:key];
    [self presentByPush:viewController withAnimated:animated];
}

// MARK: Transition methods

-(void)presentByPush:(UIViewController*)viewController withAnimated:(Boolean)animated {
    //configure navigationBar
    UIBarButtonItem * leftBarItem = [self configureLeftNavigationItem];
    if (leftBarItem != nil) {
        [viewController.navigationItem setHidesBackButton:YES];
        [viewController.navigationItem setLeftBarButtonItem:leftBarItem];
    }else {
        UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(pop)];
        [viewController.navigationItem setBackBarButtonItem:barItem];
    }
    UIBarButtonItem * rightBarItem = [self configureRightNavigationItem];
    if (rightBarItem != nil) {
        [viewController.navigationItem setRightBarButtonItem:rightBarItem];
    }
    [self.navigationController pushViewController:viewController animated:YES];
}

-(void)performOnDismissForViewController:(UIViewController*)viewController {
    NSValue *key = [NSValue valueWithNonretainedObject:viewController];
    onDismiss onDismiss = [self.onDismissForViewController objectForKey:key];
    if (onDismiss != nil) {
        onDismiss();
        [self.onDismissForViewController removeObjectForKey:key];
    }
}

// MARK: Configure navigation item

-(nullable UIBarButtonItem*)configureLeftNavigationItem {
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(pop)];
    return barItem;
}

-(nullable UIBarButtonItem*)configureRightNavigationItem {
    return nil;
}

-(void)pop {
    [self dismissWithAnimated:YES];
}

// MARK: UINavigationControllerDelegate
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UIViewController*dismissedViewController = [self.navigationController.transitionCoordinator viewControllerForKey:UITransitionContextFromViewControllerKey];
    if (dismissedViewController != nil && ![self.navigationController.viewControllers containsObject:dismissedViewController]) {
        [self performOnDismissForViewController:dismissedViewController];
    }
}

@end
