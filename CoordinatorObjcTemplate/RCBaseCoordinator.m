//
//  RCBaseCoordinator.m
//  CoordinatorObjcTemplate
//
//  Created by Will Chen on 2019/10/8.
//  Copyright © 2019 rukurouc. All rights reserved.
//

#import "RCBaseCoordinator.h"

@implementation RCBaseCoordinator
@synthesize children;
@synthesize router;
//MARK: Initializer
-(instancetype)initWithRouter:(id<Router>)router {
    self = [super init];
    if (self) {
        self.router = router;
        self.children = [NSMutableArray new];
        return self;
    }
    return self;
}

// MARK: Coordinator
-(void)dismissWithAnimated:(Boolean)animated {
    [self.router dismissWithAnimated:true];
}

-(void)presentChild:(id<Coordinator>)child withAnimated:(Boolean)animated onDismiss:(void (^)(void))onDismiss {
    [self.children addObject:child];
    RCBaseCoordinator * __weak weakSelf = self;
    NSObject * __weak weakChild = child;
    [child presentWithAnimated:animated onDismiss:^{
        if (weakSelf != nil && weakChild != nil) {
            [weakSelf removeChild:child];
            onDismiss();
        }
    }];
}

-(void)removeChild:(id<Coordinator>)child {
    NSUInteger indexOfChile = [self.children indexOfObject:child];
    if (indexOfChile != NSNotFound) {
        [self.children removeObjectAtIndex:indexOfChile];
    }
}

- (void)presentWithAnimated:(Boolean)animated onDismiss:(nullable void (^)(void))onDismiss {
    //Child should implement
}

- (void)dealloc
{
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

@end
