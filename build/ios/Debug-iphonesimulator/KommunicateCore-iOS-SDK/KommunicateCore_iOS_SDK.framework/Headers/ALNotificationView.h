//
//  ALNotificationView.h
//  ChatApp
//
//  Created by Devashish on 06/10/15.
//  Copyright © 2015 AppLogic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApplozicCore.h"

@interface ALNotificationView : UILabel

@property (retain ,nonatomic) NSString *contactId;

@property (retain ,nonatomic) NSString *checkContactId;

@property (retain, nonatomic) NSNumber *groupId;

@property (retain, nonatomic) NSNumber *conversationId;

@property (retain, nonatomic) ALMessage *alMessageObject;

- (instancetype)initWithAlMessage:(ALMessage *)alMessage withAlertMessage: (NSString *)alertMessage;

- (void)showNativeNotificationWithcompletionHandler:(void (^)(BOOL))handler;

- (void)showGroupLeftMessage;

+ (void)showLocalNotification:(NSString *)text;

- (void)noDataConnectionNotificationView;

+ (void)showNotification:(NSString *)message;
+ (void)showPromotionalNotifications:(NSString *)text;


@end
