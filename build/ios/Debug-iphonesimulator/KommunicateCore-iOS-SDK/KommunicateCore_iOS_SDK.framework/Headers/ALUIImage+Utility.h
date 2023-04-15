//
//  UIImage+Utility.h
//  ChatApp
//
//  Created by shaik riyaz on 22/08/15.
//  Copyright (c) 2015 AppLogic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utility)

- (double)getImageSizeInMb;
- (UIImage *)getCompressedImageLessThanSize:(double)sizeInMb;
- (NSData *)getCompressedImageData;

@end
