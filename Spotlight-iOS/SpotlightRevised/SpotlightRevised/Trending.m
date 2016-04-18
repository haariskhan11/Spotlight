//
//  Trending.m
//  SpotlightRevised
//
//  Created by Kunal Shah on 4/9/16.
//  Copyright © 2016 Spotlight. All rights reserved.
//

#import "Trending.h"
#import "MGSwipeTableCell.h"
#import "TestData.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>


@interface Trending ()

@end

@implementation Trending
{
    
    NSMutableArray * tests;
    UIBarButtonItem * prevButton;
    UITableViewCellAccessoryType accessory;
    UIImageView * background; //used for transparency test
    BOOL allowMultipleSwipe;
    
}
@synthesize tableView;

-(void) cancelTableEditClick: (id) sender
{
    [tableView setEditing: NO animated: YES];
    self.navigationItem.rightBarButtonItem = prevButton;
    prevButton = nil;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        return;
    }
    
    if (buttonIndex == 1) {
        tests = [TestData data];
        [tableView reloadData];
    }
    else if (buttonIndex == 2) {
        tableView.allowsMultipleSelectionDuringEditing = YES;
        [tableView setEditing: YES animated: YES];
        prevButton = self.navigationItem.rightBarButtonItem;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(cancelTableEditClick:)];
    }
    else if (buttonIndex == 3) {
        accessory++;
        if (accessory >=4) {
            accessory = 0;
        }
        [tableView reloadData];
    }
    else if (buttonIndex == 4) {
        if (background) {
            [background removeFromSuperview];
            tableView.backgroundColor = [UIColor whiteColor];
        }
        else {
            background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.jpg"]];
            background.frame = self.view.bounds;
            background.contentMode = UIViewContentModeScaleToFill;
            background.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            [self.view insertSubview:background belowSubview:tableView];
            tableView.backgroundColor = [UIColor clearColor];
        }
        [tableView reloadData];
    }
    else if (buttonIndex == 5) {
        allowMultipleSwipe = !allowMultipleSwipe;
        [tableView reloadData];
    }
    else {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"autolayout_test" bundle:nil];
        Trending *vc = [sb instantiateInitialViewController];
        vc.testingStoryboardCell = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

-(void) actionClick: (id) sender
{
    
    UIActionSheet * sheet = [[UIActionSheet alloc] initWithTitle:@"Select action" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles: nil];
    [sheet addButtonWithTitle:@"Reload test"];
    [sheet addButtonWithTitle:@"Multiselect test"];
    [sheet addButtonWithTitle:@"Change accessory button"];
    [sheet addButtonWithTitle:@"Transparency test"];
    [sheet addButtonWithTitle: allowMultipleSwipe ?  @"Single Swipe" : @"Multiple Swipe"];
    if (!_testingStoryboardCell) {
        [sheet addButtonWithTitle:@"Storyboard test"];
    }
    [sheet showInView:self.view];
}



- (void)viewDidLoad {
    [super viewDidLoad];

    tests = [TestData data];
    self.title = @"MGSwipeCell";
    
    if (!_testingStoryboardCell) {
        tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        tableView.dataSource = self;
        tableView.delegate = self;
        [self.view addSubview:tableView];
    }
    
    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(actionClick:)];
    
    
}

//-(NSArray *) createLeftButtons: (int) number
//{
//    NSMutableArray * result = [NSMutableArray array];
//    UIColor * colors[3] = {[UIColor greenColor],
//        [UIColor colorWithRed:0 green:0x99/255.0 blue:0xcc/255.0 alpha:1.0],
//        [UIColor colorWithRed:0.59 green:0.29 blue:0.08 alpha:1.0]};
//    UIImage * icons[3] = {[UIImage imageNamed:@"check.png"], [UIImage imageNamed:@"fav.png"], [UIImage imageNamed:@"menu.png"]};
//    for (int i = 0; i < number; ++i)
//    {
//        MGSwipeButton * button = [MGSwipeButton buttonWithTitle:@"" icon:icons[i] backgroundColor:colors[i] padding:15 callback:^BOOL(MGSwipeTableCell * sender){
//            NSLog(@"Convenience callback received (left).");
//            return YES;
//        }];
//        [result addObject:button];
//    }
//    return result;
//}


-(NSArray *) createRightButtons: (int) number
{
    NSMutableArray * result = [NSMutableArray array];
    NSString* titles[2] = {@"Delete", @"More"};
    UIColor * colors[2] = {[UIColor redColor], [UIColor lightGrayColor]};
    for (int i = 0; i < number; ++i)
    {
        MGSwipeButton * button = [MGSwipeButton buttonWithTitle:titles[i] backgroundColor:colors[i] callback:^BOOL(MGSwipeTableCell * sender){
            NSLog(@"Convenience callback received (right).");
            BOOL autoHide = i != 0;
            return autoHide; //Don't autohide in delete button to improve delete expansion animation
        }];
        [result addObject:button];
    }
    return result;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return tests.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MGSwipeTableCell * cell;
    
    if (_testingStoryboardCell) {
        /**
         * Test using storyboard and prototype cell that uses autolayout
         **/
        cell = [tableView dequeueReusableCellWithIdentifier:@"prototypeCell"];
    }
    else {
        /**
         * Test using programmatically created cells
         **/
        static NSString * reuseIdentifier = @"programmaticCell";
        cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        if (!cell) {
            cell = [[MGSwipeTableCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
        }
    }
    
    TestData * data = [tests objectAtIndex:indexPath.row];
    
    cell.textLabel.text = data.title;
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.detailTextLabel.text = data.detailTitle;
    cell.accessoryType = accessory;
    cell.delegate = self;
    cell.allowsMultipleSwipe = allowMultipleSwipe;
    
    if (background) { //transparency test
        cell.backgroundColor = [UIColor clearColor];
        cell.selectedBackgroundView = [[UIView alloc] init];
        cell.selectedBackgroundView.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.3];
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.swipeBackgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor yellowColor];
        cell.detailTextLabel.textColor = [UIColor yellowColor];
    }
    
#if !TEST_USE_MG_DELEGATE
    cell.leftSwipeSettings.transition = data.transition;
    cell.rightSwipeSettings.transition = data.transition;
    cell.leftExpansion.buttonIndex = data.leftExpandableIndex;
    cell.leftExpansion.fillOnTrigger = NO;
    cell.rightExpansion.buttonIndex = data.rightExpandableIndex;
    cell.rightExpansion.fillOnTrigger = YES;
    //cell.leftButtons = [self createLeftButtons:data.leftButtonsCount];
    cell.rightButtons = [self createRightButtons:data.rightButtonsCount];
#endif
    
    return cell;
}

#if TEST_USE_MG_DELEGATE
-(NSArray*) swipeTableCell:(MGSwipeTableCell*) cell swipeButtonsForDirection:(MGSwipeDirection)direction
             swipeSettings:(MGSwipeSettings*) swipeSettings expansionSettings:(MGSwipeExpansionSettings*) expansionSettings;
{
    TestData * data = [tests objectAtIndex:[tableView indexPathForCell:cell].row];
    swipeSettings.transition = data.transition;
    
    if (direction == MGSwipeDirectionLeftToRight) {
        expansionSettings.buttonIndex = data.leftExpandableIndex;
        expansionSettings.fillOnTrigger = NO;
        return [self createLeftButtons:data.leftButtonsCount];
    }
    else {
        expansionSettings.buttonIndex = data.rightExpandableIndex;
        expansionSettings.fillOnTrigger = YES;
        return [self createRightButtons:data.rightButtonsCount];
    }
}
#endif


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(BOOL) swipeTableCell:(MGSwipeTableCell*) cell tappedButtonAtIndex:(NSInteger) index direction:(MGSwipeDirection)direction fromExpansion:(BOOL) fromExpansion
{
    NSLog(@"Delegate: button tapped, %@ position, index %d, from Expansion: %@",
          direction == MGSwipeDirectionLeftToRight ? @"left" : @"right", (int)index, fromExpansion ? @"YES" : @"NO");
    
    if (direction == MGSwipeDirectionRightToLeft && index == 0) {
        //delete button
        NSIndexPath * path = [tableView indexPathForCell:cell];
        [tests removeObjectAtIndex:path.row];
        [tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationLeft];
        return NO; //Don't autohide to improve delete expansion animation
    }
    
    return YES;
}

-(void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Tapped accessory button");
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{return 39.0;}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header.png"]];
}

-(BOOL)prefersStatusBarHidden{return YES;}

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
