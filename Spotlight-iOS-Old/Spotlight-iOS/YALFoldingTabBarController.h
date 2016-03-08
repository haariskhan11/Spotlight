// For License please refer to LICENSE file in the root of YALAnimatingTabBarController project

#import <UIKit/UIKit.h>

//view
#import "YALFoldingTabBar.h"
//#import "HomeViewController.h"

@interface YALFoldingTabBarController : UITabBarController

@property (nonatomic, copy) NSArray *leftBarItems;
@property (nonatomic, copy) NSArray *rightBarItems;
@property (nonatomic, strong) UIImage *centerButtonImage;

@property (nonatomic, assign) CGFloat tabBarViewHeight;

@property (nonatomic, strong) YALFoldingTabBar *tabBarView;

@property (strong, nonatomic) UIWindow *window;
//@property (strong, nonatomic) HomeViewController *homeVC;


@end
