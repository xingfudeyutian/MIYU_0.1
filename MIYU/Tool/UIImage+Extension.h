//
//  UIImage+Extension.h
//  openBridge
//
//  Created by doubin on 15/9/1.
//  Copyright (c) 2015年 harmazing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

+ (instancetype)imageOriginalWithName:(NSString *)imageName;
//+ (UIImage *)circleImageWithSize:(CGSize )size phoneNo:(NSString *)phoneNo text:(NSString *)text;
- (UIImage *) imageWithWaterMask:(UIImage*)mask inRect:(CGRect)rect;
- (UIImage *) watermarkWithName:(NSString *)name;

@end
