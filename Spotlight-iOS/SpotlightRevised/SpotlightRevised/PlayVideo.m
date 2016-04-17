//
//  PlayVideo.m
//  SpotlightRevised
//
//  Created by Kunal Shah on 4/15/16.
//  Copyright © 2016 Spotlight. All rights reserved.
//

#import "PlayVideo.h"
#import <MediaPlayer/MediaPlayer.h>
@import AVFoundation;

@interface PlayVideo ()

@end

@implementation PlayVideo

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    NSString *videoFilePath = [[NSBundle mainBundle] pathForResource: @"chicagotrump.mp4"
//                                                              ofType: @"mp4"];//Get the Video from Bundle
//    NSURL *videoFileURL = [NSURL fileURLWithPath: videoFilePath];//Convert the NSString To NSURL
//    AVPlayer *player = [[AVPlayer alloc] initWithURL: videoFileURL]; // Create The AVPlayer With the URL
//    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer: player];//Place it to A Layer
//    playerLayer.frame = self.view.frame;//Create A view frame size to match the view
//    [self.view.layer addSublayer: playerLayer];//Add it to Player Layer
//    [playerLayer setNeedsDisplay];// Set it to Display
//    [player play];//Play it
//    
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
