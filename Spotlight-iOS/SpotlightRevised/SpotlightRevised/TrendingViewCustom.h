//
//  TrendingViewCustom.h
//  SpotlightRevised
//
//  Created by Kunal Shah on 4/18/16.
//  Copyright © 2016 Spotlight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface TrendingViewCustom : UITableViewController <SWTableViewCellDelegate>

@property (strong, nonatomic) NSURL *videoURL;
@property (strong, nonatomic) MPMoviePlayerController *videoController;
- (IBAction)captureVideo:(id)sender;

@end
