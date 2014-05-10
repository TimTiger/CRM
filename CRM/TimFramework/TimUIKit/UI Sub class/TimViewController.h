//
//  TimViewController.h
//  PhotoSharer
//
//  Created by TimTiger on 3/12/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma Type Define
typedef NS_ENUM(NSUInteger, EventType) {
    EventTypeXXX = 1,
};

@interface TimViewController : UIViewController

@property (nonatomic,readwrite) EventType eventType;

/**
 *  Refresh View&Data according to refreshOptions
 */
- (void)refreshView;
- (void)refreshData;

@end
