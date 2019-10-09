//
//  Router.h
//  CoordinatorObjcTemplate
//
//  Created by Will Chen on 2019/10/8.
//  Copyright © 2019 rukurouc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^onDismiss)(void);
@protocol Router <NSObject>

-(void)presentViewController: (UIViewController*)viewController withAnimated:(Boolean)animated onDismissed: (nullable void (^)(void))onDismiss;
-(void)dismissWithAnimated:(Boolean)animated;

@end

NS_ASSUME_NONNULL_END
