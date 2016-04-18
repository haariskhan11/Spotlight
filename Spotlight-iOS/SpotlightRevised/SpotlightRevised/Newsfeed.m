//
//  Newsfeed.m
//  SpotlightRevised
//
//  Created by Kunal Shah on 4/14/16.
//  Copyright © 2016 Spotlight. All rights reserved.
//

#import "Newsfeed.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface Newsfeed ()

@end

@implementation Newsfeed

-(BOOL)prefersStatusBarHidden{return YES;}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{return 39.0;}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header.png"]];
}

# pragma  mark - On Cell Tap

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    if (row == 1) {
        [self presentTrumpVid];
        [self performSegueWithIdentifier:@"trumpvid" sender:self];
    }
    else if (row == 2){
        [self presentPoliceBrutalityScene];
        [self performSegueWithIdentifier:@"policebrutality" sender:self];
    }
    else if (row == 3){
        [self presentBlackLivesMatterProtest];
        [self performSegueWithIdentifier:@"blacklivesmatter" sender:self];
    }
    else if (row == 4){
        [self presentWarRuins];
        [self performSegueWithIdentifier:@"warruins" sender:self];
    }
    
}

-(void)presentTrumpVid{
    // this video occurs in Chicago,IL
    NSURL *videoURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"chicagotrump" ofType:@"mp4"]];
    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
    AVPlayerViewController *playerViewController = [AVPlayerViewController new];
    playerViewController.player = player;
    [playerViewController.player play];
    [self presentViewController:playerViewController animated:YES completion:nil];
}

-(void)presentPoliceBrutalityScene{
    // this video occurs in Houston,TX
    NSURL *videoURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"policebrutality" ofType:@"mp4"]];
    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
    AVPlayerViewController *playerViewController = [AVPlayerViewController new];
    playerViewController.player = player;
    [playerViewController.player play];
    [self presentViewController:playerViewController animated:YES completion:nil];
}

-(void)presentBlackLivesMatterProtest{
    // this video occurs in Gainesville,FL
    NSURL *videoURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"blacklivesmatter" ofType:@"mp4"]];
    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
    AVPlayerViewController *playerViewController = [AVPlayerViewController new];
    playerViewController.player = player;
    [playerViewController.player play];
    [self presentViewController:playerViewController animated:YES completion:nil];
}

-(void)presentWarRuins{
    // this video was taken in Syria
    NSURL *videoURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"warruins" ofType:@"mp4"]];
    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
    AVPlayerViewController *playerViewController = [AVPlayerViewController new];
    playerViewController.player = player;
    [playerViewController.player play];
    [self presentViewController:playerViewController animated:YES completion:nil];
}

@end
