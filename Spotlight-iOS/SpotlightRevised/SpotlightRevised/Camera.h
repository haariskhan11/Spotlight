//
//  Camera.h
//  SpotlightRevised
//
//  Created by Kunal Shah on 4/9/16.
//  Copyright © 2016 Spotlight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLSimpleCamera.h"
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface Camera : UIViewController <UIImagePickerControllerDelegate>

@property (strong, nonatomic) NSURL *videoURL;
@property (strong, nonatomic) MPMoviePlayerController *videoController;
- (IBAction)captureVideo:(id)sender;



@end
