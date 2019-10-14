//
//  GarageViewController.m
//  CoordinatorObjcTemplate
//
//  Created by Will Chen on 2019/10/14.
//  Copyright © 2019 rukurouc. All rights reserved.
//

#import "GarageViewController.h"

@interface GarageViewController ()

@end

@implementation GarageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

-(void)setupViews {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UILabel *titleLabel = [UILabel new];
    [titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:26]];
    [titleLabel setText:@"Garage"];
    [self.view addSubview:titleLabel];
    [[titleLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[titleLabel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor] setActive:YES];
}

@end
