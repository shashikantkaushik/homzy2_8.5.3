//
//  ALAppLocalNotifications.h
//  Applozic
//
//  Created by devashish on 07/01/2016.
//  Copyright © 2016 applozic Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALReachability.h"
#import "ALMessageService.h"

@interface ALAppLocalNotifications : NSObject

@property(strong) ALReachability *googleReach;
@property(strong) ALReachability *localWiFiReach;
@property(strong) ALReachability *internetConnectionReach;
@property (nonatomic) BOOL flag;

+ (ALAppLocalNotifications *)appLocalNotificationHandler;
- (void)dataConnectionNotificationHandler;
- (void)reachabilityChanged:(NSNotification *)note;
- (void)proactivelyConnectMQTT;
- (void)proactivelyDisconnectMQTT;

@end
