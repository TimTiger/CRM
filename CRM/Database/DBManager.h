//
//  DBManager.h
//  CRM
//
//  Created by TimTiger on 5/6/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimFramework.h"


@interface DBManager : NSObject

Declare_ShareInstance(DBManager);

//create .db file and create tables
- (BOOL)createdbFile;
- (BOOL)createTables;

@end
