//
//  ALSecureStore.h
//  ApplozicCore
//
//  Created by apple on 11/03/21.
//  Copyright © 2021 applozic Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ALSecureStoreQueryable <NSObject>
@property (nonatomic, readonly, copy) NSMutableDictionary<NSString *, id> * _Nonnull query;
@end

@interface ALSecureStore : NSObject

@property (nonatomic) id <ALSecureStoreQueryable> secureStoreQueryable;

- (nonnull instancetype)init NS_UNAVAILABLE;

- (nonnull instancetype)initWithSecureStoreQueryable:(id <ALSecureStoreQueryable> _Nonnull)secureStoreQueryable;

- (BOOL)setValue:(NSString * _Nonnull)value
  forUserAccount:(NSString * _Nonnull)userAccount
           error:(NSError * _Nullable * _Nullable)error;

- (NSString * _Nullable)getValueFor:(NSString * _Nonnull)userAccount
                              error:(NSError * _Nullable * _Nullable)error;
- (BOOL)removeValueFor:(NSString * _Nonnull)userAccount
                 error:(NSError * _Nullable * _Nullable)error;
- (BOOL)removeAllValuesAndReturnError:(NSError * _Nullable * _Nullable)error;

@end

NS_ASSUME_NONNULL_END
