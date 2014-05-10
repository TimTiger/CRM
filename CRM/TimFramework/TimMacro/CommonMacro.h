//
//  ComonMacro.h
//  PhotoSharer
//
//  Created by TimTiger on 3/14/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#ifndef PhotoSharer_ComonMacro_h
#define PhotoSharer_ComonMacro_h


#pragma mark - ----------------UIScreen------------------------------------------------------
#define SCREEN_WIDTH     ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT    ([UIScreen mainScreen].bounds.size.height)

#define APP_FRAME        [[UIScreen mainScreen] applicationFrame]
#define APP_SIZE         [[UIScreen mainScreen] applicationFrame].size

#pragma mark - -----------------Singleton-----------------------------------------------------
#undef Declare_ShareInstance
#define Declare_ShareInstance(__class) +(__class *)shareInstance

#undef Realize_ShareInstance
#define Realize_ShareInstance(__class) \
+(__class *)shareInstance { \
static dispatch_once_t onceToken; \
static __class *_instance_; \
dispatch_once(&onceToken, ^{ \
    _instance_ = [[__class alloc]init]; \
});   \
return _instance_;\
}

#pragma mark - -----------------System--------------------------------------------------------
#define SYSTEMVERSION [[UIDevice currentDevice].systemVersion floatValue]

#define IOS_7_OR_LATER (((SYSTEMVERSION) >= 7.0) ? YES:NO)
#define IOS_6_OR_LATER (((SYSTEMVERSION) >= 6.0) ? YES:NO)
#define IOS_5_OR_LATER (((SYSTEMVERSION) >= 5.0) ? YES:NO)
#define IOS_4_OR_LATER (((SYSTEMVERSION) >= 4.0) ? YES:NO)
#define IOS_3_OR_LATER (((SYSTEMVERSION) >= 3.0) ? YES:NO)

#endif
