//
//  HomeViewController.h
//  CoordinatorObjcTemplate
//
//  Created by Will Chen on 2019/10/8.
//  Copyright © 2019 rukurouc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class HomeViewController;
@protocol HomeViewControllerCoordinator <NSObject>
- (void)homeViewController:(HomeViewController*)homeViewController enterHomeButtonDidTap:(UIButton*)sender;
- (void)homeViewController:(HomeViewController*)homeViewController walkToBackyardButtonDidTap:(UIButton*)sender;
@end

@interface HomeViewController : UIViewController
-(instancetype)instantiateFromStoryboard;
@property(nonatomic, weak) id <HomeViewControllerCoordinator> coordinator;
@end

NS_ASSUME_NONNULL_END
