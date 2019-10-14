//
//  LobbyViewController.m
//  CoordinatorObjcTemplate
//
//  Created by Will Chen on 2019/10/9.
//  Copyright © 2019 rukurouc. All rights reserved.
//

#import "LobbyViewController.h"

@interface LobbyViewController ()
@property (nonatomic, strong) UIButton *gotoGarageButton;
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
    self.gotoGarageButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.gotoGarageButton setTitle:@"Go to the garage" forState:UIControlStateNormal];
    [self.gotoGarageButton.titleLabel setFont:[UIFont boldSystemFontOfSize:26]];
    [self.gotoGarageButton addTarget:self action:@selector(gotoGarageButtonDidTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.gotoGarageButton];
    [self.gotoGarageButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[self.gotoGarageButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[self.gotoGarageButton.topAnchor constraintEqualToAnchor:titleLabel.bottomAnchor constant:20] setActive:YES];
}

-(void)gotoGarageButtonDidTap {
    [self.coordinator lobbyViewController:self enterGarageButtonDidTap:self.gotoGarageButton];
}

@end
