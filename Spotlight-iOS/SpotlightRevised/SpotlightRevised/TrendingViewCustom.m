//
//  TrendingViewCustom.m
//  SpotlightRevised
//
//  Created by Kunal Shah on 4/18/16.
//  Copyright © 2016 Spotlight. All rights reserved.
//

#import "TrendingViewCustom.h"
#import "TrendingView.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import "CNPPopupController.h"



@interface TrendingViewCustom () <CNPPopupControllerDelegate> {
    NSMutableArray *cityLabels;
    NSMutableArray *eventLabels;
    NSMutableArray *times;
    
}

@property (nonatomic, strong) CNPPopupController *popupController;

@end

@implementation TrendingViewCustom
    


-(BOOL)prefersStatusBarHidden{return YES;}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header1.png"]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    cityLabels = [NSMutableArray arrayWithObjects:@"Chicago,IL", @"Houston,TX", @"Gainesville,FL", @"Syria", @"San Francisco,CA", @"Bismark, ND", @"New York, NY", @"Atlanta,GA",nil];
    eventLabels = [NSMutableArray arrayWithObjects:@"Trump Protest", @"Police Brutality", @"Black Lives Matter Protest", @"War Ruins", @"Freedom of Speech", @"Protect your rights", @"Peaceful protest against racism", @"Racism", nil];
    times = [NSMutableArray arrayWithObjects:@"7:58 P.M.", @"11:10 A.M.", @"12:58 P.M.", @"3:02 P.M.", @"1:20 A.M.", @"9:26 P.M.", @"12:00 P.M.", @"10:09 P.M.",nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [cityLabels count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    TrendingView *cell = (TrendingView *)[self.tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[TrendingView alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    

    // Add utility buttons
    NSMutableArray *leftUtilityButtons = [NSMutableArray new];
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    
//    [leftUtilityButtons sw_addUtilityButtonWithColor:
//     [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:0.7]
//                                                icon:[UIImage imageNamed:@"like.png"]];
//    [leftUtilityButtons sw_addUtilityButtonWithColor:
//     [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:0.7]
//                                                icon:[UIImage imageNamed:@"message.png"]];
//    [leftUtilityButtons sw_addUtilityButtonWithColor:
//     [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:0.7]
//                                                icon:[UIImage imageNamed:@"facebook.png"]];
//    [leftUtilityButtons sw_addUtilityButtonWithColor:
//     [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:0.7]
//                                                icon:[UIImage imageNamed:@"twitter.png"]];
    
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:255.0 green:255.0 blue:255.0 alpha:1.0]
                                                icon:[UIImage imageNamed:@"CommentIcon.png"]];
//    [rightUtilityButtons sw_addUtilityButtonWithColor:
//     [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
//                                                title:@"Delete"];
    
    cell.leftUtilityButtons = leftUtilityButtons;
    cell.rightUtilityButtons = rightUtilityButtons;
    cell.delegate = self;
    
    // Configure the cell...
//    cell.patternLabel.text = [patterns objectAtIndex:indexPath.row];
//    cell.patternImageView.image = [UIImage imageNamed:[patternImages objectAtIndex:indexPath.row]];
    cell.cityName.text = [cityLabels objectAtIndex:indexPath.row];
    cell.eventName.text = [eventLabels objectAtIndex:indexPath.row];
    cell.time.text = [times objectAtIndex:indexPath.row];
    
    
    return cell;
}

// method not used as we do not need to implement swipe left action

//- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index {
//    
//    switch (index) {
//        case 0:
//        {
////            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Bookmark" message:@"Save to favorites successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
////            [alertView show];
//            [self performSegueWithIdentifier:@"trumpcomment" sender:self];
//            break;
//        }
//        case 1:
//        {
//            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Email sent" message:@"Just sent the image to your INBOX" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//            [alertView show];
//            break;
//        }
//        case 2:
//        {
//            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Facebook Sharing" message:@"Just shared the pattern image on Facebook" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//            [alertView show];
//            break;
//        }

//        case 3:
//        {
//            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Twitter Sharing" message:@"Just shared the pattern image on Twitter" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//            [alertView show];
//        }
//        default:
//            break;
//    }
//}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    switch (index) {
        case 0:
        {
//            // More button is pressed
//            UIActionSheet *shareActionSheet = [[UIActionSheet alloc] initWithTitle:@"Share" delegate:nil cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Share on Facebook", @"Share on Twitter", nil];
//            [shareActionSheet showInView:self.view];
//            
//            [cell hideUtilityButtonsAnimated:YES];
            [self performSegueWithIdentifier:@"trumpcomment" sender:self];
            break;
        }
        case 1:
        {
            // Delete button is pressed
            NSIndexPath *cellIndexPath = [self.tableView indexPathForCell:cell];
//            [patterns removeObjectAtIndex:cellIndexPath.row];
//            [patternImages removeObjectAtIndex:cellIndexPath.row];
            [self.tableView deleteRowsAtIndexPaths:@[cellIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
            break;
        }
        default:
            break;
    }
}

# pragma  mark - On Cell Tap

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    if (row == 0) {
        [self presentTrumpVid];
        [self performSegueWithIdentifier:@"trumpvid" sender:self];
    }
    else if (row == 1){
        [self presentPoliceBrutalityScene];
        [self performSegueWithIdentifier:@"policebrutality" sender:self];
    }
    else if (row == 2){
        [self presentBlackLivesMatterProtest];
        [self performSegueWithIdentifier:@"blacklivesmatter" sender:self];
    }
    else if (row == 3){
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

-(void)vc{
    
}


@end
