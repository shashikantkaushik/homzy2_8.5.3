//
//  ALRealTimeUpdate.h
//  Applozic
//
//  Created by Sunil on 08/03/18.
//  Copyright © 2018 applozic Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALMessage.h"
#import "ALUserDetail.h"
#import "ALChannel.h"

@protocol ApplozicUpdatesDelegate <NSObject>

/// This callback will be called once the new message is received.
/// @param alMessage Will have ALMessage object which is recieved message.
/// @ref ALMessage for message properties.
- (void)onMessageReceived:(ALMessage *)alMessage;

/// This will be called once the message is sent by same user login in different devices or platforms
/// @param alMessage Will have ALMessage object which is sent message.
/// @ref ALMessage for message properties.
- (void)onMessageSent:(ALMessage *)alMessage;

/// This method will be called once the user details updated like name, profile imageUrl, status etc.
/// @param userDetail Will have ALUserDetail object which will have user properties.
- (void)onUserDetailsUpdate:(ALUserDetail *)userDetail;

/// This method will be called once message is delivered to receiver.
/// @param message Will have ALMessage object which is delivered message it has status.
- (void)onMessageDelivered:(ALMessage *)message;

/// This will be called once message is deleted by same user login in different devices or platforms.
/// @param messageKey Will have messageKey of message which is deleted.
- (void)onMessageDeleted:(NSString *)messageKey;

/// This will be called once the message is read and delivered by receiver user.
/// @param message Will have ALMessage object which is delivered and read.
/// @param userId Will have userId which is delivered and read a message.
- (void)onMessageDeliveredAndRead:(ALMessage *)message withUserId:(NSString *)userId;

/// This method will be called once the conversation is deleted.
/// @param userId If the conversation is deleted for user then userId will be.
/// @param groupId If conversation is deleted for channel then groupId will be there its channelKey.
- (void)onConversationDelete:(NSString *)userId withGroupId:(NSNumber*)groupId;

/// This will be called once the conversation read by same user login in different devices or platforms.
/// @param userId If conversation read for user then userId will be there else groupId will be their.
/// @param groupId If conversation raad for channel/group then channelKey will be there and userId will be nil.
- (void)conversationReadByCurrentUser:(NSString *)userId withGroupId:(NSNumber *)groupId;

/// This method will be called for typing events.
/// @param userId Will have user's userId who is typing.
/// @param status If status flag is YES or true then user started typing, if status is NO or false then user stop the typing.
- (void)onUpdateTypingStatus:(NSString *)userId status:(BOOL)status;

/// This method will be called once the user comes online or goes offline.
/// @param alUserDetail Will have ALUserDetail object of user.
- (void)onUpdateLastSeenAtStatus:(ALUserDetail *)alUserDetail;

/// This method will be called once the user is blocked or unblocked.
/// @param userId Will have the user's userId blocked or unblocked.
/// @param flag If true or YES then user is blocked else false or NO then unblocked.
- (void)onUserBlockedOrUnBlocked:(NSString *)userId andBlockFlag:(BOOL)flag;

/// This method will be called once their is any change in Channel.
/// @param channel It will have ALChannel object.
- (void)onChannelUpdated:(ALChannel *)channel;

/// This will be called once the receiver read the message conversation.
/// @param userId Will have receiver userId who has read the conversation.
- (void)onAllMessagesRead:(NSString *)userId;

/// This method will be called if the MQTT is disconnected you can resubscribe to conversation.
- (void)onMqttConnectionClosed;

/// This method will be called once the MQTT is connected
- (void)onMqttConnected;

/// This method will be called once the user muted.
/// @param userDetail Will have ALUserDetail object.
- (void)onUserMuteStatus:(ALUserDetail *)userDetail;

/// This method will be called after a group has been muted/unmuted.
/// @param channelKey You will get the channelKey by using this channel key you can get channel and check isNotificationMuted from ALChannel object.
- (void)onChannelMute:(NSNumber *)channelKey;

@end

@interface ALRealTimeUpdate : NSObject

@end
