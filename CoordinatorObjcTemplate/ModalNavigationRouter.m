//
//  ModalNavigationRouter.m
//  CoordinatorObjcTemplate
//
//  Created by Will Chen on 2019/10/9.
//  Copyright © 2019 rukurouc. All rights reserved.
//

#import "ModalNavigationRouter.h"
@interface ModalNavigationRouter() <UINavigationControllerDelegate>
@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, strong) NSMutableDictionary<NSValue *, onDismiss>*onDismissForViewController;
@end

@implementation ModalNavigationRouter

// MARK: Initializer
-(instancetype)initWithParentViewController:(UIViewController *)viewController {
    self = [super init];
    if (self) {
        self.onDismissForViewController = [NSMutableDictionary new];
        self.parentViewController = viewController;
        self.navigationController = [UINavigationController new];
        self.navigationController.delegate = self;
    }
    return self;
}

// MARK: Router
- (void)presentViewController:(nonnull UIViewController *)viewController withAnimated:(Boolean)animated onDismissed:(nullable void (^)(void))onDismiss {
    if (onDismiss != nil) {
        NSValue *key = [NSValue valueWithNonretainedObject:viewController];
        [self.onDismissForViewController setObject:onDismiss forKey:key];
    }
    if (self.navigationController.viewControllers.count == 0) {
        [self presentModally:viewController withAnimated:animated];
    }else {
        [self.navigationController pushViewController:viewController animated:animated];
    }
}

- (void)dismissWithAnimated:(Boolean)animated {
    [self performOnDismissForViewController:self.navigationController.viewControllers.firstObject];
    [self.parentViewController dismissViewControllerAnimated:animated completion:nil];
}

// MARK: Transition methods
-(void)presentModally:(UIViewController*)viewController withAnimated:(Boolean)animated {
    //configure navigationBar
    UIBarButtonItem * leftBarItem = [self configureLeftNavigationItem];
    if (leftBarItem != nil) {
        [viewController.navigationItem setLeftBarButtonItem:leftBarItem];
    }
    UIBarButtonItem * rightBarItem = [self configureRightNavigationItem];
    if (rightBarItem != nil) {
        [viewController.navigationItem setRightBarButtonItem:rightBarItem];
    }
    [self.navigationController setViewControllers:@[viewController] animated:NO];
    [self.parentViewController presentViewController:self.navigationController animated:animated completion:nil];
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
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismiss)];
    return barItem;
}

-(nullable UIBarButtonItem*)configureRightNavigationItem {
    return nil;
}

-(void)dismiss {
    [self dismissWithAnimated:YES];
}

// MARK: UINavigationControllerDelegate
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UIViewController*dismissedViewController = [self.navigationController.transitionCoordinator viewControllerForKey:UITransitionContextFromViewControllerKey];
    if (dismissedViewController != nil && ![self.navigationController.viewControllers containsObject:dismissedViewController]) {
        [self performOnDismissForViewController:dismissedViewController];
    }
}

- (void)dealloc
{
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}
@end
