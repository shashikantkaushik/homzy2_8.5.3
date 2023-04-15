//
//  ALUserService.h
//  Applozic
//
//  Created by Divjyot Singh on 05/11/15.
//  Copyright © 2015 applozic Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALConstant.h"
#import "ALSyncMessageFeed.h"
#import "ALMessageList.h"
#import "ALMessage.h"
#import "DB_FileMetaInfo.h"
#import "ALLastSeenSyncFeed.h"
#import "ALUserClientService.h"
#import "ALAPIResponse.h"
#import "ALUserBlockResponse.h"
#import "ALRealTimeUpdate.h"
#import "ALMuteRequest.h"
#import "ALChannelService.h"
#import "ALContactService.h"
#import "ALContactDBService.h"

@interface ALUserService : NSObject

+ (ALUserService *)sharedInstance;

@property (nonatomic, strong) ALUserClientService *userClientService;
@property (nonatomic, strong) ALChannelService *channelService;
@property (nonatomic, strong) ALContactDBService *contactDBService;
@property (nonatomic, strong) ALContactService *contactService;

- (void)processContactFromMessages:(NSArray *)messagesArr withCompletion:(void(^)(void))completionMark;

/// This method is used for fetching users whose last seen is updated recently.
/// @param lastSeenAt Pass the last getLastSeenSyncTime from ALUserDefaultsHandler.
/// @param completionMark In case of a successful fetch, it will have a list of ALUserDetail array. Otherwise, in case of failure, the error will not be nil.
- (void)getLastSeenUpdateForUsers:(NSNumber *)lastSeenAt withCompletion:(void(^)(NSMutableArray *))completionMark;

- (void)userDetailServerCall:(NSString *)contactId withCompletion:(void(^)(ALUserDetail *))completionMark;

- (void)updateUserDisplayName:(ALContact *)alContact;

/// This method is used for marking a conversation as read in a one-to-one chat.
/// @param contactId Pass the userId for marking conversation read.
/// @param completion In case of a successful conversation marked as read, the error will be nil. Otherwise, in case of failure, the error will not be nil.
- (void)markConversationAsRead:(NSString *)contactId withCompletion:(void (^)(NSString *, NSError *))completion;

/// This method is used for marking a single message as read using paired message key from the ALMessage object.
/// @param alMessage Pass the ALMessage object for marking the message as read.
/// @param pairedkeyValue Pass the paired message key from the ALMessage object.
/// @param completion In case of a successful message marked as read, the error will be nil. Otherwise, in case of failure, the error will not be nil.
- (void)markMessageAsRead:(ALMessage *)alMessage
       withPairedkeyValue:(NSString *)pairedkeyValue
           withCompletion:(void (^)(NSString *, NSError *))completion;

/// This method is used for blocking the user.
/// @param userId Pass the userId for blocking the user.
/// @param completion In case of any error in blocking, it will have an error in completion. Otherwise, if the block is successful it will have YES or true in userBlock.
- (void)blockUser:(NSString *)userId withCompletionHandler:(void(^)(NSError *error, BOOL userBlock))completion;

- (void)blockUserSync:(NSNumber *)lastSyncTime;

/// This method is used for unblocking the user.
/// @param userId Pass the userId that for unblocking the user.
/// @param completion In case of any error in unblocking it will have an error in completion. Otherwise, if unblock is successful, it will have YES or true in userUnblock.
- (void)unblockUser:(NSString *)userId withCompletionHandler:(void(^)(NSError *error, BOOL userUnblock))completion;

- (void)updateBlockUserStatusToLocalDB:(ALUserBlockResponse *)userblock;

- (NSMutableArray *)getListOfBlockedUserByCurrentUser;

- (void)setUnreadCountZeroForContactId:(NSString *)contactId;

- (void)getListOfRegisteredUsersWithCompletion:(void(^)(NSError *error))completion;

/// This method is used for fetching a list of top online users based on the onlineContactLimit from ALApplozicSettings
/// @param completion Array of an AL ALUserDetail object in case of successful fetch, else error in the failure of fetching.
- (void)fetchOnlineContactFromServer:(void(^)(NSMutableArray *array, NSError *error))completion;

- (NSNumber *)getTotalUnreadCount;

- (void)resettingUnreadCountWithCompletion:(void (^)(NSString *json, NSError *error))completion;

/// The method is used for updating the display name, image URL, or status of a logged-in user in user.
/// @param displayName Pass the display name of a user.
/// @param imageLink Pass the image URL link of the user.
/// @param status Pass the status of the user.
/// @param completion If an error is not nil, the user detail will be fetched successfully, else error in the failure of fetching.
- (void)updateUserDisplayName:(NSString *)displayName
                 andUserImage:(NSString *)imageLink
                   userStatus:(NSString *)status
               withCompletion:(void (^)(id theJson, NSError *error))completion;

/// This method is used for fetching updated user details from the server.
/// @param userId Pass the userId for which the latest user detail is needed.
/// @param completionMark ALUserDetail in case of a successful fetch or else it will return nil in case of failure.
- (void)updateUserDetail:(NSString *)userId withCompletion:(void(^)(ALUserDetail *userDetail))completionMark;

- (void)updateUser:(NSString *)phoneNumber
             email:(NSString *)email
            ofUser:(NSString *)userId
    withCompletion:(void (^)(BOOL))completion;

/// This method is used for fetching user details by passing an array of userIds.
/// @param userArray Add the userIds and pass it an array for user details.
/// @param completion Array of ALUserDetail in case of a successful fetch or else it will return NSError in case of failure.
- (void)fetchAndupdateUserDetails:(NSMutableArray *)userArray withCompletion:(void (^)(NSMutableArray *array, NSError *error))completion;

/// This method is used for fetching contact or user details. If a contact exists in the database, it will return from a database, or else it will fetch details from the server and return it.
/// @param userId Pass the userId for fetching user details.
/// @param completion ALContact on fetch completion.
- (void)getUserDetail:(NSString*)userId withCompletion:(void(^)(ALContact *contact))completion;

- (void)updatePassword:(NSString *)oldPassword
       withNewPassword:(NSString *)newPassword
        withCompletion:(void(^)(ALAPIResponse *alAPIResponse, NSError *theError))completion;

- (void)processResettingUnreadCount;

- (void)getListOfUsersWithUserName:(NSString *)userName withCompletion:(void(^)(ALAPIResponse *response, NSError *error))completion;

- (void)updateConversationReadWithUserId:(NSString *)userId withDelegate:(id<ApplozicUpdatesDelegate>)delegate;

/// This method will fetch the muted users from an applozic server.
/// @param delegate  If ApplozicUpdatesDelegate is passed, the event for onUserMuteStatus will be called.
/// @param completion Array of ALUserDetail in case of a successful fetch or else it will return NSError in case of failure.
- (void)getMutedUserListWithDelegate:(id<ApplozicUpdatesDelegate>)delegate
                      withCompletion:(void(^)(NSMutableArray *userDetailArray, NSError *error))completion;

/// This method is used for to mute a user in one to one chat.
/// @param alMuteRequest Pass the ALMuteRequest object for the userId and notificationAfterTime.
/// @param completion ALAPIResponse in case of a successful update or else it will return NSError in case of failure.
- (void)muteUser:(ALMuteRequest *)alMuteRequest withCompletion:(void(^)(ALAPIResponse *response, NSError *error))completion;

/// This method used for reporting the message to the admin of the account
/// @param messageKey Pass message key of message object
/// @param completion ALAPIResponse repoonse callback if success or error and NSError if any error occurs
- (void)reportUserWithMessageKey:(NSString *)messageKey withCompletion:(void (^)(ALAPIResponse *apiResponse, NSError *error))completion;

- (void)disableChat:(BOOL)disable withCompletion:(void(^)(BOOL response, NSError *error)) completion;

/// This method is used for updating the display name of a user who is not registered or does not log in to an applozic server.
/// @param userId Pass the receiver userId.
/// @param displayName Pass the user display name of the receiver.
/// @param completion ALAPIResponse in case of a successful update or else it will return NSError in case of failure.
- (void)updateDisplayNameWith:(NSString *)userId
              withDisplayName:(NSString *)displayName
               withCompletion:(void (^)(ALAPIResponse *apiResponse, NSError *error))completion;

/// This method will give registered contacts and contacts from local DB.
/// @param nextPage If nextPage is NO or false, it will get contacts from starting and return the array of contact.
/// If nextPage The flag is YES or true, it will return the next older contacts.
/// @param completion Array of ALContact in case of successfully fetched, else it will return NSError.
- (void)getListOfRegisteredContactsWithNextPage:(BOOL)nextPage
                                 withCompletion:(void(^)(NSMutableArray *contactArray, NSError *error))completion;

- (void)markConversationReadInDataBaseWithMessage:(ALMessage *)alMessage;

@end
