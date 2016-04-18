//
//  Camera.m
//  SpotlightRevised
//
//  Created by Kunal Shah on 4/9/16.
//  Copyright © 2016 Spotlight. All rights reserved.
//

#import "Camera.h"
#import "ViewUtils.h"
#import "ImageViewController.h"
#import "VideoViewController.h"


@interface Camera ()

@end

@implementation Camera
-(void)viewDidLoad{
    [super viewDidLoad];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
        
        [self presentViewController:picker animated:YES completion:NULL];
    }

}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.tabBarController.tabBar.hidden = YES;
//    self.view.backgroundColor = [UIColor blackColor];
//    
//    self.camera = [[LLSimpleCamera alloc] initWithQuality:AVCaptureSessionPresetHigh
//                                                 position:LLCameraPositionRear
//                                             videoEnabled:YES];
//    CGRect screenRect = [[UIScreen mainScreen] bounds];
//    [self.camera attachToViewController:self withFrame:CGRectMake(0, 0, screenRect.size.width, screenRect.size.height)];
//    
//    
//    // implementation of actual snap button to start taking video
//    self.snapButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.snapButton.frame = CGRectMake(0, 0, 70.0f, 70.0f);
//    self.snapButton.clipsToBounds = YES;
//    self.snapButton.layer.cornerRadius = self.snapButton.width / 2.0f;
//    self.snapButton.layer.borderColor = [UIColor whiteColor].CGColor;
//    self.snapButton.layer.borderWidth = 2.0f;
//    self.snapButton.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
//    self.snapButton.layer.rasterizationScale = [UIScreen mainScreen].scale;
//    self.snapButton.layer.shouldRasterize = YES;
//    [self.snapButton addTarget:self action:@selector(snapButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:self.snapButton];
//    
//    // switch camera positions button
//    if([LLSimpleCamera isFrontCameraAvailable] && [LLSimpleCamera isRearCameraAvailable]) {
//        self.switchButton = [UIButton buttonWithType:UIButtonTypeSystem];
//        self.switchButton.frame = CGRectMake(0, 0, 29.0f + 20.0f, 22.0f + 20.0f);
//        self.switchButton.tintColor = [UIColor whiteColor];
//        [self.switchButton setImage:[UIImage imageNamed:@"camera-switch.png"] forState:UIControlStateNormal];
//        self.switchButton.imageEdgeInsets = UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
//        [self.switchButton addTarget:self action:@selector(switchButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:self.switchButton];
//    }
//}
//
//- (void)snapButtonPressed:(UIButton *)button
//{
//    __weak typeof(self) weakSelf = self;
//    
//    if(self.segmentedControl.selectedSegmentIndex == 0) {
//        // capture
//        [self.camera capture:^(LLSimpleCamera *camera, UIImage *image, NSDictionary *metadata, NSError *error) {
//            if(!error) {
//                
//                // We should stop the camera, we are opening a new vc, thus we don't need it anymore.
//                // This is important, otherwise you may experience memory crashes.
//                // Camera is started again at viewWillAppear after the user comes back to this view.
//                // I put the delay, because in iOS9 the shutter sound gets interrupted if we call it directly.
//                [camera performSelector:@selector(stop) withObject:nil afterDelay:0.2];
//                
//                ImageViewController *imageVC = [[ImageViewController alloc] initWithImage:image];
//                [weakSelf presentViewController:imageVC animated:NO completion:nil];
//            }
//            else {
//                NSLog(@"An error has occured: %@", error);
//            }
//        } exactSeenImage:YES];
//        
//    } else {
//        if(!self.camera.isRecording) {
//            self.segmentedControl.hidden = YES;
//            self.flashButton.hidden = YES;
//            self.switchButton.hidden = YES;
//            
//            self.snapButton.layer.borderColor = [UIColor redColor].CGColor;
//            self.snapButton.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
//            
//            // start recording
//            NSURL *outputURL = [[[self applicationDocumentsDirectory]
//                                 URLByAppendingPathComponent:@"test1"] URLByAppendingPathExtension:@"mov"];
//            [self.camera startRecordingWithOutputUrl:outputURL];
//            
//        } else {
//            self.segmentedControl.hidden = NO;
//            self.flashButton.hidden = NO;
//            self.switchButton.hidden = NO;
//            
//            self.snapButton.layer.borderColor = [UIColor whiteColor].CGColor;
//            self.snapButton.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
//            
//            [self.camera stopRecording:^(LLSimpleCamera *camera, NSURL *outputFileUrl, NSError *error) {
//                VideoViewController *vc = [[VideoViewController alloc] initWithVideoUrl:outputFileUrl];
//                [self.navigationController pushViewController:vc animated:YES];
//            }];
//        }
//    }
//}
//
//
//- (void)didReceiveMemoryWarning {[super didReceiveMemoryWarning];}
//
//- (void)viewWillAppear:(BOOL)animated
//{
//    self.hidesBottomBarWhenPushed = YES;
//    [super viewWillAppear:animated];
//    
//    // start the camera
//    [self.camera start];
//}
//
//- (void)switchButtonPressed:(UIButton *)button{[self.camera togglePosition];}
//
//
//
//- (NSURL *)applicationDocumentsDirectory
//{
//    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
//}
//
-(BOOL)prefersStatusBarHidden{return YES;}
//
//- (void)viewWillLayoutSubviews
//{
//    [super viewWillLayoutSubviews];
//    
//    self.camera.view.frame = self.view.contentBounds;
//    
//    self.snapButton.center = self.view.contentCenter;
//    self.snapButton.bottom = self.view.height - 15.0f;
//    
//    self.flashButton.center = self.view.contentCenter;
//    self.flashButton.top = 5.0f;
//    
//    self.switchButton.top = 5.0f;
//    self.switchButton.right = self.view.width - 5.0f;
//    
//    self.segmentedControl.left = 12.0f;
//    self.segmentedControl.bottom = self.view.height - 35.0f;
//}

- (IBAction)captureVideo:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
}

- (IBAction)postVideo:(id)sender {
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    self.videoURL = info[UIImagePickerControllerMediaURL];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    self.videoController = [[MPMoviePlayerController alloc] init];
    
    [self.videoController setContentURL:self.videoURL];
    [self.videoController.view setFrame:CGRectMake (0, 0, 375, 525)];
    [self.view addSubview:self.videoController.view];
    
    [self.videoController play];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}



@end
