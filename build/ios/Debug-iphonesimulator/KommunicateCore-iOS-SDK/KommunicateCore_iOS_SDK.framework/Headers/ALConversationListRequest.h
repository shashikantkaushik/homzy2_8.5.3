//
//  ALConversationListRequest.h
//  ApplozicCore
//
//  Created by Sunil on 08/04/21.
//  Copyright © 2021 applozic Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ALConversationListRequest : NSObject

@property(nonatomic,retain) NSNumber *startTimeStamp;
@property(nonatomic,retain) NSNumber *endTimeStamp;

@end

NS_ASSUME_NONNULL_END
