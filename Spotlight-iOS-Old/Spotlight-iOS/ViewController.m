//
//  ViewController.m
//  Spotlight-iOS
//
//  Created by Kunal Shah on 2/20/16.
//  Copyright © 2016 Spotlight. All rights reserved.
//

#import "ViewController.h"
@import AVFoundation;
#import "HomeViewController.h"

@interface ViewController () 
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)pressed:(id)sender{

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.homeVC = [[HomeViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:self.homeVC];
    
    self.window.rootViewController = navVC;
    
    [self.window makeKeyAndVisible];
    
}

-(void)bringMeCameraNow{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.homeVC = [[HomeViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:self.homeVC];
    
    self.window.rootViewController = navVC;
    
    [self.window makeKeyAndVisible];

}


@end
