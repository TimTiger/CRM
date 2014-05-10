//
//  DBManager.m
//  CRM
//
//  Created by TimTiger on 5/6/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "DBManager.h"
#import <FMDB/FMDatabase.h>
#import <FMDB/FMDatabaseQueue.h>
#import "TimFramework.h"


@interface DBManager ()
{
    FMDatabaseQueue *_fmDatabaseQueue;
    NSString *DoctorTableName;
    NSString *MaterialTableName;
    NSString *IntroducerTableName;
    NSString *PatientTableName;
    NSString *CTLibTableName;
    NSString *MedicalCaseTableName;
    NSString *MedicalExpenseTableName;
    NSString *MedicalRecordableName;
    NSString *MedicalReserveTableName;
}

@property (nonatomic,readonly) FMDatabaseQueue *fmDatabaseQueue;

@end

@implementation DBManager
@synthesize fmDatabaseQueue = _fmDatabaseQueue;
Realize_ShareInstance(DBManager);

//create .db file and create tables
- (BOOL)createdbFile {
    //创建db文件
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *dbPath = [docPath stringByAppendingPathComponent:@"iscrm.db"];
    _fmDatabaseQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    
    //打开数据库
    __block BOOL result = NO;
    [_fmDatabaseQueue inDatabase:^(FMDatabase *db) {
        result = [db open];
    }];
    
    return result;
}

- (BOOL)createDBTableWithTableName:(NSString *)tableName andParams:(NSString *)params {
    //参数判断
    if ([tableName isEmpty] || [params isEmpty]) {
        return NO;
    }
    
    NSString *sqlstr = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (%@)", tableName, params];
    
    __block BOOL ret = NO;
    
    [self.fmDatabaseQueue inDatabase:^(FMDatabase *db) {
        ret = [db executeUpdate:sqlstr];
        if (ret != YES)
        {
            
        }
    }];
    
    return ret;
}


- (BOOL)createTables {
    
    DoctorTableName = @"DoctorTableName";         //医生表名
    MaterialTableName = @"MaterialTableName";     //材料表名
    IntroducerTableName = @"IoctorTableName";
    PatientTableName = @"PatientTableName";
    CTLibTableName = @"CTLibTableName";
    MedicalCaseTableName = @"MedicalCaseTableName";
    MedicalExpenseTableName = @"MedicalExpenseTableName";
    MedicalRecordableName = @"MedicalRecordableName";
    MedicalReserveTableName = @"MedicalReserveTableName";
    
    [self createDBTableWithTableName:DoctorTableName andParams:@"\"KeyId\" integer PRIMARY KEY,\n\t \"doctor_name\" text,\n\t \"doctor_dept\" text,\n\t \"doctor_phone\" text"];
    
    [self createDBTableWithTableName:MaterialTableName andParams:@"\"KeyId\" integer PRIMARY KEY,\n\t \"mat_name\" text,\n\t \"mat_price\"  integer ,\n\t \"mat_type\" integer"];
    
    [self createDBTableWithTableName:IntroducerTableName andParams:@"\"KeyId\" integer PRIMARY KEY,\n\t \"intr_name\" text,\n\t \"intr_phone\" text ,\n\t \"intr_level\" integer"];
    
    [self createDBTableWithTableName:PatientTableName andParams:@"\"KeyId\" integer PRIMARY KEY,\n\t \"patient_name\" text,\n\t \"patient_phone\" text ,\n\t \"introducer_id\" integer"];
    
    [self createDBTableWithTableName:CTLibTableName andParams:@"\"KeyId\" integer PRIMARY KEY,\n\t \"patient_id\" integer,\n\t \"case_id\" integer ,\n\t \"ct_image\" text,\n\t \"ct_desc\" text,\n\t \"creation_date\" text"];

    [self createDBTableWithTableName:MedicalCaseTableName andParams:@"\"KeyId\" integer PRIMARY KEY,\n\t \"case_name\" text,\n\t \"creation_date\" text ,\n\t \"patient_id\" integer,\n\t \"case_status\" integer"];
    
    [self createDBTableWithTableName:MedicalExpenseTableName andParams:@"\"KeyId\" integer PRIMARY KEY,\n\t \"patient_id\" integer,\n\t \"case_id\" integer ,\n\t \"mat_id\" integer,\n\t \"expense_num\" integer,\n\t \"expense_price\"  integer,\n\t \"expense_money\"  integer"];
    
    [self createDBTableWithTableName:MedicalRecordableName andParams:@"\"KeyId\" integer PRIMARY KEY,\n\t \"patient_id\" integer,\n\t \"case_id\" integer ,\n\t \"record_content\" text,\n\t \"creation_date\" text"];
    
    [self createDBTableWithTableName:MedicalReserveTableName andParams:@"\"KeyId\" integer PRIMARY KEY,\n\t \"patient_id\" integer,\n\t \"case_id\" integer ,\n\t \"reserve_time\" text,\n\t \"actual_time\" text,\n\t \"creation_date\" text,\n\t"];
    
    return YES;
}


@end
