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

@end
