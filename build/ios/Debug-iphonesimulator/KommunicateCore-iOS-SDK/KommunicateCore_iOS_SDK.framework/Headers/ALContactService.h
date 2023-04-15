//
//  ALContactService.h
//  ChatApp
//
//  Created by Devashish on 23/10/15.
//  Copyright © 2015 AppLogic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALContact.h"
#import "DB_CONTACT.h"
#import "ALUserDetail.h"
#import "ALContactDBService.h"

@interface ALContactService : NSObject

@property (nonatomic, strong) ALContactDBService *alContactDBService;

- (BOOL)purgeListOfContacts:(NSArray *)contacts;

- (BOOL)purgeContact:(ALContact *)contact;

- (BOOL)purgeAllContact;

/// This method is used for updating an array of contacts in the local database.
/// @param contacts Pass the array of ALContact objects.
- (BOOL)updateListOfContacts:(NSArray *)contacts;

/// This method is used for updating the contact in the local database.
/// @param contact Pass the ALContact object to update.
- (BOOL)updateContact:(ALContact *)contact;

/// This method is used for adding an array of contacts in a local database.
/// @param contacts Pass the array of ALContact to add.
- (BOOL)addListOfContacts:(NSArray *)contacts;

/// This method is used for adding the contact in the local database.
/// @param userContact Create a ALContact object and set up the details and pass it to the method.
- (BOOL)addContact:(ALContact *)userContact;

/// This method is used for loading the contact or user detail from the local database.
/// If the contact does not exist, it will create a contact object and return ALContact.
/// @param key Pass on which detail should be fetched on the bases.
/// Ex: to fetch based on the userId key, then pass the string as userId.
/// @param value Pass the value of the userId of the user to get the details.
- (ALContact *)loadContactByKey:(NSString *)key value:(NSString *)value;

- (ALContact *)loadOrAddContactByKeyWithDisplayName:(NSString *)contactId value:(NSString *)displayName;

- (BOOL)setUnreadCountInDB:(ALContact *)contact;

- (NSNumber *)getOverallUnreadCountForContact;

/// This method is used for checking if the contact or user exists in the locally stored database.
/// @param value Pass the userId of the user for checking if the contact exists in the database.
- (BOOL)isContactExist:(NSString *)value;

/// This method is used for updating local contact or adding a new contact if contact does not exist in the local database.
/// @param contact Pass the ALContact object with details to update or insert the contact.
- (BOOL)updateOrInsert:(ALContact *)contact;

/// This method is used for updating local contact or adding a new contact if contact does not exist in the local database.
/// @param contacts Pass the array of ALContact object with details to update or insert the contact.
- (void)updateOrInsertListOfContacts:(NSMutableArray *)contacts;

/// This method is used for checking if the user is deleted. This will check from the local database which is stored not from the server.
/// @param userId Pass the userId of the user to check whether the user is deleted or not.
- (BOOL)isUserDeleted:(NSString *)userId;

- (ALUserDetail *)updateMuteAfterTime:(NSNumber *)notificationAfterTime andUserId:(NSString *)userId;
@end
