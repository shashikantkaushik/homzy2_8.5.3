//
//  ApplozicClient.h
//  Applozic
//
//  Created by Sunil on 12/03/18.
//  Copyright © 2018 applozic Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALMessageService.h"
#import "ALMessageDBService.h"
#import "ALUserService.h"
#import "ALChannelService.h"
#import "ALRegistrationResponse.h"
#import "ALUser.h"

typedef NS_ENUM(NSInteger, ApplozicClientError) {
    MessageNotPresent = 1
};

/// This protocol is used for listening attachment upload or download events.
@protocol ApplozicAttachmentDelegate <NSObject>

/// This delegate callback will be called on bytes downloaded in attachment with message object.
/// @param bytesReceived It will have total bytes received so far.
/// @param alMessage It will have a message which can be used for identifying which attachment is currently downloading using the message key.
- (void)onUpdateBytesDownloaded:(int64_t)bytesReceived withMessage:(ALMessage *)alMessage;

/// This delegate callback will be called on the progress of uploading bytes.
/// @param bytesSent Bytes uploaded to the server so far.
/// @param alMessage It will have ALMessage which can be used for identifying which attachment is currently uploading using messageKey.
- (void)onUpdateBytesUploaded:(int64_t)bytesSent withMessage:(ALMessage *)alMessage;

/// This delegate callback will be called once the attachment upload is failed.
/// @param alMessage It will have a message which can be used for identifying which attachment is failed for uploading using the message key.
- (void)onUploadFailed:(ALMessage *)alMessage;

/// This delegate callback will be called once the download failed.
/// @param alMessage It will have a message which can be used for identifying which attachment is currently downloading using the message key.
- (void)onDownloadFailed:(ALMessage *)alMessage;

/// This delegate callback will be called once the uploading is completed.
/// @param alMessage It will have a message which will have updated details like message key and file meta.
/// @param oldMessageKey The old message key is used to identify the message in view for replacing the uploaded attachment ALMessage.
- (void)onUploadCompleted:(ALMessage *)alMessage withOldMessageKey:(NSString *)oldMessageKey;

/// This delegate callback will be called once the downloading is completed.
/// @param alMessage It will have ALMessage.
- (void)onDownloadCompleted:(ALMessage *)alMessage;

@optional

@end

@interface ApplozicClient : NSObject  <NSURLConnectionDataDelegate>

@property (nonatomic, strong) id<ApplozicAttachmentDelegate>attachmentProgressDelegate;
@property (nonatomic, retain) ALMessageService *messageService;
@property (nonatomic, retain) ALMessageDBService *messageDbService;
@property (nonatomic, retain) ALUserService *userService;
@property (nonatomic, retain) ALChannelService *channelService;

@property (nonatomic, weak) id<ApplozicUpdatesDelegate> delegate;

/// This is for initialization of the application Key or appID.
/// @param applicationKey Pass application Key or appID that got from applozic.com.
- (instancetype)initWithApplicationKey:(NSString *)applicationKey;

/// This is for initialization of the application key and sets the real-time delegate events for applozic.
/// @param applicationKey Pass application key or appID that got from applozic.com.
/// @param delegate Pass the delegate for real-time event callbacks.
- (instancetype)initWithApplicationKey:(NSString *)applicationKey withDelegate:(id<ApplozicUpdatesDelegate>)delegate;

/// Login user to apploizc using this method once login success then can perform other tasks.
/// @param alUser ALUser object which will be having user details about like userId, displayName, and other
/// @param completion Will have ALRegistrationResponse which will be having details about the user.
- (void)loginUser:(ALUser *)alUser withCompletion:(void(^)(ALRegistrationResponse *rResponse, NSError *error))completion;

/// This method is used for updating APNs device token to applozic server for sending an APNs push notification to iPhone device.
/// @param apnDeviceToken Pass the apple device token which is required for sending for APNS push notification to iPhone device.
/// @param completion It as ALRegistrationResponse which will have isRegisteredSuccessfully if successful update else NSError in case error.
- (void)updateApnDeviceTokenWithCompletion:(NSString *)apnDeviceToken
                            withCompletion:(void(^)(ALRegistrationResponse *rResponse, NSError *error))completion;

/// This method is for sending an Attachment message in one-to-one or group conversation.
/// @param attachmentMessage Pass the ALMessage object for sending an attachment message.
- (void)sendMessageWithAttachment:(ALMessage *)attachmentMessage;

/// This method is used for sending a text message in one-to-one or group conversation.
/// @param alMessage Pass the ALMessage object for sending a text message
/// @param completion In case of successful a message sent it will have ALMessage object with messagekey is updated and it as createdAtTime of the message which is created in our server else in case of any error it will have NSError.
- (void)sendTextMessage:(ALMessage *)alMessage withCompletion:(void(^)(ALMessage *message, NSError *error))completion;

/// This method is for getting the latest messages list of user and group, grouped by the latest messages with createdAtTime of the messages.
/// @param isNextPage Pass YES or true in case if want to fetch the next set of messages else Make NO or false to load the first set of messages.
/// @param completion NSMutableArray will have a list of ALMessage objects else it will have NSError in case of any error comes.
- (void)getLatestMessages:(BOOL)isNextPage withCompletionHandler:(void(^)(NSMutableArray *messageList, NSError *error))completion;

/// This method is used for fetching one-to-one or group chat messages.
/// @param messageListRequest Pass the MessageListRequest in case of one-to-one pass the userId or channelKey in case of a group.
/// @param completion If messages are fetched successfully it will have a list of ALMessage objects else it will have NSError in case of any error comes.
- (void)getMessages:(MessageListRequest *)messageListRequest withCompletionHandler:(void(^)(NSMutableArray *messageList, NSError *error))completion;

/// Theis method is used for downloading an Attachment in conversation.
/// @param alMessage Build and pass the ALMessage object.
- (void)downloadMessageAttachment:(ALMessage*)alMessage;

/// This method is for creating a group like public group, open group, private group or group of two.
/// Below are the types of the groups.
/// PRIVATE = 1,
/// PUBLIC = 2,
/// BROADCAST = 5,
/// OPEN = 6,
/// GROUP_OF_TWO = 7
/// @param channelInfo Pass information about group deatils.
/// @param completion it will be having complete  deatils about channel and status, if its error or success else it will have NSError.
- (void)createChannelWithChannelInfo:(ALChannelInfo *)channelInfo withCompletion:(void(^)(ALChannelCreateResponse *response, NSError *error))completion;

/// This method is used for removing a member from the group.
/// @param userId Pass userId that wanted to remove from group/channel.
/// @param channelKey Pass the channelKey for the group that wants to remove a member.
/// @param clientChannelKey Pass clientChannelKey in case it present else it will be nil.
/// @param completion The ALAPIResponse will be having a complete response-like status and when the user is removed else it will have NSError.
- (void)removeMemberFromChannelWithUserId:(NSString *)userId
                            andChannelKey:(NSNumber *)channelKey
                       orClientChannelKey:(NSString *)clientChannelKey
                           withCompletion:(void(^)(NSError *error, ALAPIResponse *response))completion;

/// This method for leave member from the group/channel.
/// @param userId Pass login userId here to leave from the group.
/// @param channelKey Pass the channelkey of the group from which the user wants to leave.
/// @param clientChannelKey Pass here the client clientChannelKey when channelKey is nil.
/// @param completion The ALAPIResponse will have a complete response-like status and when the user is left else it NSError.
- (void)leaveMemberFromChannelWithUserId:(NSString *)userId
                           andChannelKey:(NSNumber *)channelKey
                      orClientChannelKey:(NSString *)clientChannelKey
                          withCompletion:(void(^)(NSError *error, ALAPIResponse *response))completion;

/// This method for add member from the group/channel.
/// @param userId Pass userId that wants to add in group/channel.
/// @param channelKey Pass the channelkey of the group from which the user wants to add.
/// @param clientChannelKey Pass the clientChannelKey in case if have a client channel key.
/// @param completion ALAPIResponse will be having a complete response-like status and when the user is added else it NSError.
- (void)addMemberToChannelWithUserId:(NSString *)userId
                       andChannelKey:(NSNumber *)channelKey
                  orClientChannelKey:(NSString *)clientChannelKey
                      withCompletion:(void(^)(NSError *error, ALAPIResponse *response))completion;

/// This method is used for updating channel/group.
/// @param channelKey Pass channelKey if channel key present for updating.
/// @param newName Pass new channel name here for updating.
/// @param imageURL Pass image URL to update group/channel image.
/// @param clientChannelKey Pass the clientChannelKey in case if have a client channel key
/// @param flag If updating metadata of group then pass YES or true else pass NO or false.
/// @param metaData It is extra information that needs to pass in-group/channel and use it later when it's required
/// @param channelUsers If you want to update group users roles like admin, member
/// @param completion ALAPIResponse will be having a complete response-like status and when the channel is updated else it NSError.
- (void)updateChannelWithChannelKey:(NSNumber *)channelKey
                         andNewName:(NSString *)newName
                        andImageURL:(NSString *)imageURL
                 orClientChannelKey:(NSString *)clientChannelKey
                 isUpdatingMetaData:(BOOL)flag
                           metadata:(NSMutableDictionary *)metaData
                     orChannelUsers:(NSMutableArray *)channelUsers
                     withCompletion:(void(^)(NSError *error, ALAPIResponse *response))completion;

/// This method is used for getting channel/group information.
/// @param channelKey Pass channelKey for the group/channel you want a deatils.
/// @param clientChannelKey If you have client channelKey pass else pass it as nil.
/// @param completion ALChannel object will have complete details of channel/group and AlChannelFeedResponse if any API error comes in group/channel then check channelResponse else check for NSError
- (void)getChannelInformationWithChannelKey:(NSNumber *)channelKey
                         orClientChannelKey:(NSString *)clientChannelKey
                             withCompletion:(void(^)(NSError *error, ALChannel *alChannel, AlChannelFeedResponse *channelResponse))completion;

/// This method is used for logout user from applozic this will clear all data of login user.
/// @param completion ALAPIResponse will be having a complete response like status else it will have NSError.
- (void)logoutUserWithCompletion:(void(^)(NSError *error, ALAPIResponse *response))completion;

/// This method is used for mute and unmute a group/channel based on time and channelKey
/// @param channelKey Pass channelkey which you want to mute or unmute a group/channel
/// @param notificationTime Pass time you want to mute or unmute group/chanel
/// @param completion ALAPIResponse will have status else NSError
- (void)muteChannelOrUnMuteWithChannelKey:(NSNumber *)channelKey
                                  andTime:(NSNumber *)notificationTime
                           withCompletion:(void(^)(ALAPIResponse *response, NSError *error))completion;

/// This method is used for unblocking the user who is already blocked.
/// @param userId Pass userId whom you want to unblock.
/// @param completion If userBlock is YES or true then it's unblocked else it will have an error.
- (void)unBlockUserWithUserId:(NSString *)userId withCompletion:(void(^)(NSError *error, BOOL userUnblock))completion;

/// This method is used to block the user.
/// @param userId Pass userId whom you want to block.
/// @param completion If userBlock is YES or true then it's unblocked else it will have an error.
- (void)blockUserWithUserId:(NSString *)userId withCompletion:(void(^)(NSError *error, BOOL userBlock))completion;

/// This method is used for mark conversation as read in channel/group conversation where unread count present will be marked as read
/// @param groupId Pass groupId to mark a conversation as read.
/// @param completion If the response is not nil it will have a success or error response string else it will have NSError
- (void)markConversationReadForGroup:(NSNumber *)groupId withCompletion:(void(^)(NSString *response, NSError *error))completion;

///  This method is used for mark conversation as read for one-to-one conversation where unread count present that will be marked as read.
/// @param userId  Pass userId to mark a conversation as read.
/// @param completion If the response is not nil it will have a success or error response string else it will have NSError.
- (void)markConversationReadForOnetoOne:(NSString *)userId withCompletion:(void(^)(NSString *response, NSError *error))completion;

/// This method is for handing the APNS or VOIP push notification messages
/// @param application Pass the UIApplication object.
/// @param userInfo Pass the userInfo its notification data NSDictionary.
- (void)notificationArrivedToApplication:(UIApplication *)application withDictionary:(NSDictionary *)userInfo;

/// This method is used for subscribing to real-time events for conversation.
- (void)subscribeToConversation;

/// This method is used for unsubscribing to real-time events for conversation.
- (void)unsubscribeToConversation;

/// This method is used for unsubscribing to typing status for group/channel.
/// @param chanelKey Pass channelKey of group/channel that you want to unsubscribe.
- (void)unSubscribeToTypingStatusForChannel:(NSNumber *)chanelKey;

/// This method is used for unsubscribing the typing status events from one to one.
- (void)unSubscribeToTypingStatusForOneToOne;

/// This method is used for sending a typing status in one-to-one or group/channel conversation.
/// @param userId If it one to one conversation then pass login userId else pass nil.
/// @param channelKey If its group conversation pass the channelKey for send typing status else pass nil in case of one-to-one conversation.
/// @param isTyping If the logged user is typing pass YES or true in isTyping else on stop of user typing pass NO or false to stop the typing.
- (void)sendTypingStatusForUserId:(NSString *)userId orForGroupId:(NSNumber*)channelKey withTyping:(BOOL)isTyping;

/// This method is used subscribing one-to-one real-time typing status events.
- (void)subscribeToTypingStatusForOneToOne;

/// This method is used subscribing to group/channel typing status events.
/// @param channelKey Pass the channelKey/groupId for subscribing real-time typing events.
- (void)subscribeToTypingStatusForChannel:(NSNumber *)channelKey;

/// This method is used for getting the latest messages for contact or group.
/// @param isNextPage if you want to load the next set of messages pass YES or true to load else pass NO or false.
/// @param isGroup To get groups messages only then pass YES or true it will give group latest messages else
/// to get only user latest messages then pass NO or false.
/// @param completion Array of messages of type ALMessage and error if failed to get the messages.
- (void)getLatestMessages:(BOOL)isNextPage
           withOnlyGroups:(BOOL)isGroup
    withCompletionHandler: (void(^)(NSMutableArray *messageList, NSError *error))completion;

@end
