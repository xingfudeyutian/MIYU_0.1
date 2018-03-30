//
//  UIImage+Extension.m
//  openBridge
//
//  Created by doubin on 15/9/1.
//  Copyright (c) 2015年 harmazing. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)



// 返回一张不需要渲染的图片
+ (instancetype)imageOriginalWithName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

//+ (UIImage *)circleImageWithSize:(CGSize )size phoneNo:(NSString *)phoneNo text:(NSString *)text
//{
//
//    if (text.length == 0)
//    {
//        text = @"";
//    }
//    else if (text.length == 1)
//    {
//        text = [text substringFromIndex:text.length - 1];
//    }
//    else
//    {
//        text = [text substringFromIndex:text.length - 2];
//    }
//
//    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//
//    int temp = [[phoneNo substringFromIndex:phoneNo.length - 1] intValue];
//    NSDictionary *dict = IconColor(temp);
//    CGContextSetRGBFillColor(context, [dict[@"r"] intValue]/255.0, [dict[@"g"] intValue]/255.0, [dict[@"b"] intValue]/255.0, 1.0);
//
//
////    CGContextSetRGBFillColor(context, 50/255.0, 109/255.0, 166/255.0, 1.0);
//    CGContextFillEllipseInRect(context, CGRectMake(0, 0, size.width, size.height));
//
//    CGContextDrawPath (context, kCGPathStroke);
//    CGSize textSize = [text sizeWithAttributes:@{NSFontAttributeName:[UIFont fontWithName: @"Arial-BoldMT" size:13], NSForegroundColorAttributeName:[ UIColor whiteColor]}];
//    [text drawAtPoint:CGPointMake((size.width - textSize.width)/2, (size.height - textSize.height)/2) withAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Arial-BoldMT" size:13], NSForegroundColorAttributeName :[UIColor whiteColor ]}];
//
//    //生成新的image
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    return newImage;
//}

// 画水印
- (UIImage *) imageWithWaterMask:(UIImage*)mask inRect:(CGRect)rect
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 4.0)
    {
        UIGraphicsBeginImageContextWithOptions([self size], NO, 0.0); // 0.0 for scale means "scale for device's main screen".
    }
#else
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 4.0)
    {
        UIGraphicsBeginImageContext([self size]);
    }
#endif
    //原图
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    //水印图
    [mask drawInRect:rect];
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newPic; 
}


-(UIImage *)watermarkWithName:(NSString *)name

{
    
    NSString * markName = name;
    
    int w = self.size.width;
    
    int h = self.size.height;
    
    UIGraphicsBeginImageContext(self.size);
    
    [self drawInRect:CGRectMake(0, 0, w, h)];
    
    NSDictionary *attr = @{
                           
                           NSFontAttributeName: [UIFont boldSystemFontOfSize:30],  //设置字体
                           
                           NSForegroundColorAttributeName : [UIColor redColor]   //设置字体颜色
                           
                           };
    
//    [markName drawInRect:CGRectMake(, , , ) withAttributes:attr];         //左上角
//    
//    [markName drawInRect:CGRectMake(w - , , , ) withAttributes:attr];      //右上角
    CGSize size = [markName boundingRectWithSize:CGSizeMake(w, h) options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
    [markName drawInRect:CGRectMake(w - size.width,h - size.height , size.width,size.height) withAttributes:attr];  //右下角
    
//    [markName drawInRect:CGRectMake(, h - - , , ) withAttributes:attr];    //左下角
    
    UIImage *aimg = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return aimg;
    
}


/*
 
 UIGraphicsBeginImageContextWithOptions(self.iconImgV.size, NO, 0);
 CGContextRef context = UIGraphicsGetCurrentContext();
 int temp = [self.userData.user_id intValue]%6;
 NSDictionary *dict = IconColor(temp);
 CGContextSetRGBFillColor(context, [dict[@"r"] intValue]/255.0, [dict[@"g"] intValue]/255.0, [dict[@"b"] intValue]/255.0, 1.0);
 CGContextFillEllipseInRect(context, CGRectMake(0, 0, self.iconImgV.size.width, self.iconImgV.size.height));
 
 CGContextDrawPath (context, kCGPathStroke);
 CGSize textSize = [self.userData.user_name sizeWithAttributes:@{NSFontAttributeName:[UIFont fontWithName: @"Arial-BoldMT" size:11], NSForegroundColorAttributeName:[ UIColor whiteColor]}];
 [self.userData.user_name drawAtPoint:CGPointMake((self.iconImgV.size.width - textSize.width)/2, (self.iconImgV.size.height - textSize.height)/2) withAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Arial-BoldMT" size:11], NSForegroundColorAttributeName :[UIColor whiteColor ]}];
 
 //生成新的image
 UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
 UIGraphicsEndImageContext();
 
 self.iconImgV.image = newImage;
 
 */
@end
