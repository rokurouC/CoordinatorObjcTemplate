//
//  LobbyViewController.m
//  CoordinatorObjcTemplate
//
//  Created by Will Chen on 2019/10/9.
//  Copyright © 2019 rukurouc. All rights reserved.
//

#import "LobbyViewController.h"

@interface LobbyViewController ()

@end

@implementation LobbyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

-(void)setupViews {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UILabel *titleLabel = [UILabel new];
    [titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:26]];
    [titleLabel setText:@"Lobby"];
    [self.view addSubview:titleLabel];
    [[titleLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[titleLabel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor] setActive:YES];
}

@end
