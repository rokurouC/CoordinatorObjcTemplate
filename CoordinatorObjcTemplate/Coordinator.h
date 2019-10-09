//
//  Coordinator.h
//  CoordinatorObjcTemplate
//
//  Created by Will Chen on 2019/10/8.
//  Copyright © 2019 rukurouc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Router.h"

NS_ASSUME_NONNULL_BEGIN

@protocol Coordinator <NSObject>

@property (nonatomic, strong) NSMutableArray<id <Coordinator>> *children;
@property (nonatomic, strong) id <Router> router;
-(void)presentWithAnimated:(Boolean)animated onDismiss: (nullable void (^)(void))onDismiss;
-(void)dismissWithAnimated:(Boolean)animated;
-(void)presentChild:(id <Coordinator>)child withAnimated:(Boolean)animated onDismiss: (nullable void (^)(void))onDismiss;

@end

NS_ASSUME_NONNULL_END
