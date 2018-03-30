//
//  NSObject+extend.h
//  MIYU
//
//  Created by hanyutong on 2018/1/22.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (extend)

@end
@interface BaseTableViewCell : UITableViewCell

/**
 简易block
 */
@property(nonatomic,copy)void(^baseBlock)(void);

@property(nonatomic,strong)id model;
+(instancetype)cellWithTableView:(UITableView *)tableView;
+(instancetype)xibCellWithTableView:(UITableView *)tableView;
//+(instancetype)xibCellAddLineWithTableView:(UITableView *)tableView;
-(void)initSubViews;

@end
@interface UIView(extend)
@property void (^TapAction)(id);
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat Y;
@property (nonatomic, assign) CGFloat X;
@property (assign, nonatomic) CGFloat centerX;
@property (assign, nonatomic) CGFloat centerY;
@property (assign, nonatomic) CGFloat maxY;
@property (assign, nonatomic) CGFloat maxX;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;


/**
 *  所在控制器
 */

@property(nonatomic,strong,readonly)id  controller;

/**
 *  所在tableviewcell
 */

@property(nonatomic,strong,readonly)id  tableviewCell;
+(instancetype)viewFromXIB;
-(void)setTapBlock:(void(^)(id view ))block;
-(void)setTapWithTarget:(id)target action:( SEL)action ;


-(void)removeAllSubViews;
/**
 *  圆角
 */
-(void)setRadius:(CGFloat)r;
/**
 *  阴影
 */
-(void)setShadowWithShadowRadius:(CGFloat)shadowr Radius:(CGFloat)r alpha:(CGFloat)alpha Offset:(CGSize)offset;


/**
 *  添加边框
 */
-(void)setBorder:(UIColor *)color width:(CGFloat)width;

/**
 *  添加虚线边框
 */
- (void)setImaginaryLineBorder:(UIColor *)color width:(CGFloat)width lineDashPattern:(NSArray *)lineDash;



/**
 *  添加底部分割线
 */
- (void)addBottomLine;


@end
