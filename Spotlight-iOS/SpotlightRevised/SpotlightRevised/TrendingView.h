//
//  TrendingView.h
//  SpotlightRevised
//
//  Created by Kunal Shah on 4/18/16.
//  Copyright © 2016 Spotlight. All rights reserved.
//

#import <SWTableViewCell/SWTableViewCell.h>

@interface TrendingView : SWTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cityName;
@property (weak, nonatomic) IBOutlet UILabel *eventName;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *number;

@property (weak, nonatomic) IBOutlet UILabel *cityName1;
@property (weak, nonatomic) IBOutlet UILabel *eventName1;
@property (weak, nonatomic) IBOutlet UILabel *time1;
@property (weak, nonatomic) IBOutlet UILabel *number1;

@end
