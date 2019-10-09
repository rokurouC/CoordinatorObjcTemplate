//
//  RCBaseCoordinator.h
//  CoordinatorObjcTemplate
//
//  Created by Will Chen on 2019/10/8.
//  Copyright © 2019 rukurouc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coordinator.h"


NS_ASSUME_NONNULL_BEGIN

@interface RCBaseCoordinator : NSObject <Coordinator>
-(instancetype)initWithRouter:(id <Router>)router;
@end

NS_ASSUME_NONNULL_END
