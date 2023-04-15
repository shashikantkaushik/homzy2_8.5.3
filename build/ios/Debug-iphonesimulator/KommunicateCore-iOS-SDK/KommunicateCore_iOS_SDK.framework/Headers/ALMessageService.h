//
// ALMessageService.h
// ALChat
//
// Copyright (c) 2015 AppLozic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALConstant.h"
#import "ALSyncMessageFeed.h"
#import "ALMessageList.h"
#import "ALMessage.h"
#import "DB_FileMetaInfo.h"
#import "ALUserDetail.h"
#import "ALChannelService.h"
#import "MessageListRequest.h"
#import "ALMessageInfoResponse.h"
#import "ALMQTTConversationService.h"
#import "ALRealTimeUpdate.h"
#import "ALConversationProxy.h"
#import "ALMessageClientService.h"
#import "ALUserService.h"
#import "ALChannelService.h"

static NSString *const NEW_MESSAGE_NOTIFICATION = @"newMessageNotification";
static NSString *const CONVERSATION_CALL_COMPLETED = @"conversationCallCompleted";
static NSString *const AL_MESSAGE_META_DATA_UPDATE = @"messageMetaDataUpdateNotification";

@interface ALMessageService : NSObject

+ (ALMessageService *)sharedInstance;

@property (nonatomic, strong) ALMessageClientService *messageClientService;
@property (nonatomic, strong) ALUserService *userService;
@property (nonatomic, strong) ALChannelService *channelService;

@property (nonatomic, weak) id<ApplozicUpdatesDelegate> delegate;

/// This method is used for fetching the one-to-one or group chat messages from the server.
/// @param messageListRequest Pass the MessageListRequest in case of one-to-one pass the userId or channelKey in case of a group.
/// @param completion If messages are fetched successfully, it will have a list of ALMessage objects; else, it will have NSError in case any error comes.
- (void)getMessageListForUser:(MessageListRequest *)messageListRequest
               withCompletion:(void(^)(NSMutableArray *messages, NSError *error, NSMutableArray *userDetailArray)) completion;

+ (void)getMessageListForContactId:(NSString *)contactIds
                           isGroup:(BOOL)isGroup
                        channelKey:(NSNumber *)channelKey
                    conversationId:(NSNumber *)conversationId
                        startIndex:(NSInteger)startIndex
                    withCompletion:(void (^)(NSMutableArray *))completion;

/// This method is used for sending a text message one to one or group conversation.
/// @param message Pass the ALMessage object for sending a text message.
/// @param completion If success in sending a message the NSError will be nil; else, if there is an error in sending a message the NSError will not be nil.
- (void)sendMessages:(ALMessage *)message withCompletion:(void(^)(NSString *message, NSError *error)) completion;

+ (void)getLatestMessageForUser:(NSString *)deviceKeyString withCompletion:(void(^)(NSMutableArray *message, NSError *error)) completion;

+ (ALMessage *)processFileUploadSucess:(ALMessage *)message;

/// This method is used for deleting the message thread or conversation in a one-to-one or group chat.
/// @param contactId Pass the userId in case deleting the conversation for one-to-one; otherwise, it will be nil.
/// @param channelKey Pass the channelKey in case of deleting conversation for group chat, else it will be nil.
/// @param completion If success in deleting the thread then NSError is nil; else, if failure in deleting then NSError will not be nil.
- (void)deleteMessageThread:(NSString *)contactId
               orChannelKey:(NSNumber *)channelKey
             withCompletion:(void (^)(NSString *, NSError *))completion;

/// This method is used for deleting a message
/// @param keyString Pass the message key from the message object to delete the message.
/// @param contactId Pass it as nil.
/// @param completion If success in deleting the message then NSError is nil else on failure in deleting then NSError will not be nil.
- (void)deleteMessage:(NSString *)keyString andContactId:(NSString *)contactId withCompletion:(void (^)(NSString *, NSError *))completion;

- (void)processPendingMessages;

+ (ALMessage *)getMessagefromKeyValuePair:(NSString *)key andValue:(NSString*)value;

/// This method is used for fetching the message information which will have delivered and read for users in group chat.
/// @param messageKey Pass the message key from the message object.
/// @param completion If success in fetching the message information then NSError will be nil else on failure in fetching message information then NSError will not be nil.
- (void)getMessageInformationWithMessageKey:(NSString *)messageKey
                      withCompletionHandler:(void(^)(ALMessageInfoResponse *msgInfo, NSError *theError))completion;

+ (void)multiUserSendMessage:(ALMessage *)alMessage
                  toContacts:(NSMutableArray *)contactIdsArray
                    toGroups:(NSMutableArray *)channelKeysArray
              withCompletion:(void(^)(NSString * json, NSError * error)) completion;

+ (void)getMessageSENT:(ALMessage *)alMessage withCompletion:(void (^)( NSMutableArray *, NSError *))completion;

+ (void)getMessageSENT:(ALMessage *)alMessage
          withDelegate:(id<ApplozicUpdatesDelegate>)theDelegate
        withCompletion:(void (^)(NSMutableArray *, NSError *))completion;

+ (ALMessage *)createCustomTextMessageEntitySendTo:(NSString *)to withText:(NSString*)text;

- (void)getMessageListForUserIfLastIsHiddenMessageinMessageList:(ALMessageList *)alMessageList
                                                 withCompletion:(void (^)(NSMutableArray *, NSError *, NSMutableArray *))completion;

- (void)getMessagesListGroupByContactswithCompletionService:(void(^)(NSMutableArray *messages, NSError *error))completion;

+ (ALMessage *)createHiddenMessageEntitySentTo:(NSString *)to withText:(NSString*)text;

+ (ALMessage *)createMessageWithMetaData:(NSMutableDictionary *)metaData
                          andContentType:(short)contentType
                           andReceiverId:(NSString *)receiverId
                          andMessageText:(NSString *)msgTxt;

- (NSUInteger)getMessagsCountForUser:(NSString *)userId;

- (ALMessage *)getLatestMessageForUser:(NSString *)userId;

- (ALMessage *)getLatestMessageForChannel:(NSNumber *)channelKey excludeChannelOperations:(BOOL)flag;

- (ALMessage *)getALMessageByKey:(NSString *)messageReplyId;

+ (void)syncMessages;
+ (void)getLatestMessageForUser:(NSString *)deviceKeyString
                   withDelegate:(id<ApplozicUpdatesDelegate>)theDelegate
                 withCompletion:(void (^)(NSMutableArray *, NSError *))completion;

/// This method is used for getting the latest messages for contact or group.
/// @param isNextPage If you want to load the next set of messages pass YES or true to load else pass NO or false.
/// @param isGroup To get groups messages only then pass YES or true it will give group latest messages else
/// to get only user latest messages then pass NO or false.
/// @param completion Array of messages of type ALMessage and error if failed to get the messages.
- (void)getLatestMessages:(BOOL)isNextPage
           withOnlyGroups:(BOOL)isGroup
    withCompletionHandler:(void(^)(NSMutableArray *messageList, NSError *error)) completion;

+ (void)addOpenGroupMessage:(ALMessage *)alMessage withDelegate:(id<ApplozicUpdatesDelegate>)delegate;

- (ALMessage *)handleMessageFailedStatus:(ALMessage *)message;

- (ALMessage*)getMessageByKey:(NSString *)messageKey;

/// This method is used for sync the messages where meta data is updated.
/// @param deviceKeyString Pass the [ALUserDefaultsHandler getDeviceKeyString].
/// @param completion If error in syncing a updated meta data messages then NSError will be their else a array of messages if their is no error in syncing a updated meta data messages.
+ (void)syncMessageMetaData:(NSString *)deviceKeyString withCompletion:(void (^)( NSMutableArray *, NSError *))completion;

/// This method is used for updating message metadata.
/// @param messageKey Pass the message key for updating message meta data.
/// @param metadata Pass the updated message metadata for updating.
/// @param completion If an error in deleting a message for all then NSError will not be nil else on successful delete error will be nil.
- (void)updateMessageMetadataOfKey:(NSString *)messageKey
                      withMetadata: (NSMutableDictionary *)metadata
                    withCompletion:(void(^)(ALAPIResponse *theJson, NSError *theError)) completion;

/// This method is used for fetching messages based on the message keys.
/// @param keys Pass the array of message keys.
/// @param completion If there is no error in fetching messages, then it will have an array of messages. else it will have nil.
- (void)fetchReplyMessages:(NSMutableArray<NSString *> *)keys withCompletion: (void(^)(NSMutableArray<ALMessage *>*messages))completion;

/// This method is used for deleting a message for all.
/// @param keyString Pass the message key from ALMessage object.
/// @param completion If an error in deleting a message for all then NSError will not be nil else on successful delete error will be nil.
- (void)deleteMessageForAllWithKey:(NSString *)keyString
                    withCompletion:(void (^)(ALAPIResponse *apiResponse, NSError *error))completion;

/// This method is used for getting the total unread message count.
/// @param completion will have a total unread message count if there is no error in fetching.
- (void)getTotalUnreadMessageCountWithCompletionHandler:(void (^)(NSUInteger unreadCount, NSError *error))completion;

/// This method is used for getting the total unread conversation count.
/// @param completion will have a total unread conversation count if there is no error in fetching.
- (void)getTotalUnreadConversationCountWithCompletionHandler:(void (^)(NSUInteger conversationUnreadCount, NSError *error))completion;

@end
