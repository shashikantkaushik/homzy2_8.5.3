//
//  ALUploadTask.h
//  Applozic
//
//  Created by apple on 25/03/19.
//  Copyright © 2019 applozic Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALMessage.h"

@interface ALUploadTask : NSObject

@property (nonatomic, copy) NSString *filePath;

@property (nonatomic, copy) NSString *fileName;

@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, strong) ALMessage *message;

@property (nonatomic, strong) NSString *videoThumbnailName;

@end
