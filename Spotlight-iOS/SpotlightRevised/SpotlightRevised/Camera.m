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



-(void)viewWillAppear:(BOOL)animated{
  
    [super viewDidAppear:animated];
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        [self showCamera];
    });

}

-(void)showCamera{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
}

-(void)viewDidLoad{
    [super viewDidLoad];
  
//    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
//        
//        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//        picker.delegate = self;
//        picker.allowsEditing = YES;
//        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
//        picker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
//        
//        [self presentViewController:picker animated:YES completion:NULL];
//    }
//
}


-(BOOL)prefersStatusBarHidden{return YES;}


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

- (IBAction)postVideo:(id)sender {
    // POST request to database
}

-(IBAction)camera:(id)sender{
    [self showCamera];
}
- (IBAction)dismissVideo:(id)sender {
    [self.videoController.view removeFromSuperview];
}


@end
