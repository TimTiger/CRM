//
//  TimViewController.m
//  PhotoSharer
//
//  Created by TimTiger on 3/12/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "TimViewController.h"
#import "CommonMacro.h"

@interface TimViewController ()

@end

@implementation TimViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
#ifdef __IPHONE_7_0
    if (IOS_7_OR_LATER) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
#endif
    if (IOS_7_OR_LATER) {
        self.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Set View 
- (void)refreshView {
    
}

#pragma mark - Set Data
- (void)refreshData {
    
}


@end
