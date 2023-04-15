//
//  ALJWTClaim.h
//  ApplozicCore
//
//  Created by apple on 12/03/21.
//  Copyright © 2021 applozic Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALJWTClaim : NSObject

-(instancetype _Nullable )initWithValue:(id _Nullable ) value;

@property (nonatomic, strong) id _Nullable value;

@property (nonatomic, strong) NSString * _Nullable string;

@property (nonatomic) NSNumber* _Nullable doubleValue;

@property (nonatomic) NSInteger integerValue;

@property (nonatomic, strong) NSDate * _Nullable date;

@property (nonatomic, strong) NSMutableArray<NSString*> * _Nullable array;

@end
