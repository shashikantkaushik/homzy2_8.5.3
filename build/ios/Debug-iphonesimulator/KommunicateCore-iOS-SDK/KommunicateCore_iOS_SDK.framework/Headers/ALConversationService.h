//
//  ALConversationService.h
//  Applozic
//
//  Created by Devashish on 27/02/16.
//  Copyright © 2016 applozic Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALConversationProxy.h"
#import "ALConversationClientService.h"
#import "ALConversationDBService.h"

@interface ALConversationService : NSObject

@property (nonatomic, strong) ALConversationClientService *conversationClientService;

@property (nonatomic, strong) ALConversationDBService *conversationDBService;

- (ALConversationProxy *)getConversationByKey:(NSNumber *)conversationKey;

- (void)addConversations:(NSMutableArray *)conversations;

- (ALConversationProxy *)convertAlConversationProxy:(DB_ConversationProxy *)dbConversation;

- (NSMutableArray*)getConversationProxyListForUserID:(NSString *)userId;

- (NSMutableArray*)getConversationProxyListForChannelKey:(NSNumber *)channelKey;

- (void)createConversation:(ALConversationProxy *)alConversationProxy
            withCompletion:(void(^)(NSError *error, ALConversationProxy *proxy))completion;

- (void)fetchTopicDetails:(NSNumber *)alConversationProxyID withCompletion:(void(^)(NSError *error, ALConversationProxy *proxy))completion;

@end
