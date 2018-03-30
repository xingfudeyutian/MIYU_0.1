//
//  NSObject+extend.m
//  MIYU
//
//  Created by hanyutong on 2018/1/22.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "NSObject+extend.h"

@implementation NSObject (extend)

@end

@implementation BaseTableViewCell

-(void)setModel:(id)model{
    _model = model;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        [self initSubViews];

        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;

}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {

        self.selectionStyle = UITableViewCellSelectionStyleNone;

    }

    return self;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //1.创建子控件
        [self initSubViews];

    }
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    NSString * identifier =NSStringFromClass(self);
    BaseTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell==nil){
        cell=[[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
+(instancetype)xibCellWithTableView:(UITableView *)tableView
{
    NSString * identifier =NSStringFromClass(self);
    BaseTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:identifier];

    if(cell==nil){
        //        cell = [[[NSBundle mainBundle]loadNibNamed:identifier owner:nil options:nil]firstObject];
        [tableView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellReuseIdentifier:identifier];
        cell=[tableView dequeueReusableCellWithIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    return cell;
}
//+(instancetype)xibCellAddLineWithTableView:(UITableView *)tableView
//{
//    NSString * identifier =NSStringFromClass(self);
//    BaseTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:identifier ];
//
//    if(cell==nil){
//        //        cell = [[[NSBundle mainBundle]loadNibNamed:identifier owner:nil options:nil]firstObject];
//        [tableView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellReuseIdentifier:identifier];
//        cell=[tableView dequeueReusableCellWithIdentifier:identifier];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//
//    }
//    if (![cell.contentView viewWithTag:999 ]) {
//        UIView * line =[[UIView alloc]init];
//        line.tag =999;
//        line.backgroundColor =ColorHex(AAAAAA);
//        [cell.contentView addSubview:line];
//        [line mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(@(10));
//            make.right.equalTo(@(-10));
//            make.bottom.equalTo(@(0));
//            make.height.equalTo(@(0.5));
//        }];
//    }
//    return cell;
//}


-(void)initSubViews
{
}

@end
@implementation UIView (extend)


-(void)setHeight:(CGFloat)height {
    CGRect rect = [self frame];
    rect.size.height = height;
    [self setFrame:rect];
}
-(CGFloat)height {
    return self.frame.size.height;
}
-(void)setWidth:(CGFloat)width {
    CGRect rect = [self frame];
    rect.size.width = width;
    [self setFrame:rect];
}
-(CGFloat)width {
    return self.frame.size.width;
}
-(void)setX:(CGFloat)x {
    CGRect rect = [self frame];
    rect.origin.x = x;
    [self setFrame:rect];
}
-(CGFloat)X {
    return self.frame.origin.x;
}
-(void)setY:(CGFloat)y {
    CGRect rect = [self frame];
    rect.origin.y = y;
    [self setFrame:rect];
}
-(CGFloat)Y {
    return self.frame.origin.y;
}
-(CGFloat)centerX
{
    return self.center.x;
}
-(void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x =centerX;
    self.center = center;
}

-(CGFloat)centerY
{
    return self.center.y;
}
-(void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y =centerY;
    self.center = center;
}

-(CGFloat)maxX
{
    return (CGRectGetMaxX(self.frame));

}
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}


-(void)setMaxX:(CGFloat)maxX
{
    if (self.X && !self.width) {
        self.width = maxX - self.X;
    }else if (!self.X && self.width){
        self.X = maxX - self.width;
    }
}
-(CGFloat)maxY
{
    return (CGRectGetMaxY(self.frame));

}

-(void)setMaxY:(CGFloat)maxY
{
    if (self.Y && !self.height) {
        self.height = maxY - self.Y;
    }else if (!self.Y && self.height){
        self.Y = maxY - self.height;
    }

}

-(UITableViewCell *)tableviewCell {
    Class vcc = [UITableViewCell class];
    UIResponder *responder = self;
    while ((responder = [responder nextResponder]))
        if ([responder isKindOfClass: vcc])
            return (UITableViewCell *)responder;
    return nil;
}
-(UIViewController *)controller {
    Class vcc = [UIViewController class];
    UIResponder *responder = self;
    while ((responder = [responder nextResponder]))
        if ([responder isKindOfClass: vcc])
            return (UIViewController *)responder;
    return nil;
}

-(void)setTapBlock:(void(^)(id view ))block{

    self.TapAction = [block copy];
    if (![self gestureRecognizers]) {
        self.userInteractionEnabled = YES;
        // hy:添加单击事件
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [self addGestureRecognizer:tap];
    }
}
-(void)setTapWithTarget:(id)target action:( SEL)action {

    if (![self gestureRecognizers]) {
        self.userInteractionEnabled = YES;
        // hy:添加单击事件
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
        [self addGestureRecognizer:tap];
    }

}


-(void)tap{
    if (self.TapAction) {
        self.TapAction(self);
    }
}

-(void)setTapAction:(void (^)(id ))TapAction
{
    objc_setAssociatedObject(self, @"TapActionKey", TapAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(void (^)(id ))TapAction
{
    return  objc_getAssociatedObject(self, @"TapActionKey");
}
-(void)removeAllSubViews{
    for (UIView * v in self.subviews) {
        [v removeFromSuperview];
    }
}
/**
 *  圆角
 */
-(void)setRadius:(CGFloat)r{

    if(r< 0) r=self.frame.size.width * .5f;

    //圆角半径
    self.layer.cornerRadius=r;

    //强制
    self.layer.masksToBounds=YES;
}



-(void)setShadowWithShadowRadius:(CGFloat)shadowr Radius:(CGFloat)r alpha:(CGFloat)alpha Offset:(CGSize)offset{
    if (alpha>1) {
        alpha = 1;
    }
    //强制
    self.layer.masksToBounds=NO;

    self.layer.shadowColor=[UIColor blackColor].CGColor;
    self.layer.shadowOffset = offset;//偏移距离
    self.layer.shadowOpacity = alpha;//不透明度
    self.layer.shadowRadius = shadowr;//半径
    self.layer.cornerRadius=r;


}

/**
 *  自动从xib创建视图
 */


+(instancetype)viewFromXIB{

    NSString *name=NSStringFromClass(self);

    UIView *xibView=[[[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil] firstObject];

    if(xibView==nil){
        NSLog(@"CoreXibView：从xib创建视图失败，当前类是：%@",name);
    }

    return xibView;
}
/**
 *  添加边框
 */
-(void)setBorder:(UIColor *)color width:(CGFloat)width{
    CALayer *layer=self.layer;
    layer.borderColor=color.CGColor;
    layer.borderWidth=width;
}

- (void)setImaginaryLineBorder:(UIColor *)color width:(CGFloat)width lineDashPattern:(NSArray *)lineDash
{

    CAShapeLayer *border = [CAShapeLayer layer];
    //  线条颜色
    border.strokeColor = color.CGColor;

    border.fillColor = nil;

    border.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;

    border.frame = self.bounds;

    // 不要设太大 不然看不出效果
    border.lineWidth = width;

    border.lineCap = @"square";

    //  第一个是 线条长度   第二个是间距    nil时为实线
    //    border.lineDashPattern = @[@9, @4];
    border.lineDashPattern = lineDash;

    [self.layer addSublayer:border];
}
//- (void)addBottomLine{
//
//    UIView * line =[[UIView alloc]init];
//    line.backgroundColor =ColorHex(f4f4f4);
//    [self addSubview:line];
//    [line mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.equalTo(@(0));
//        make.height.equalTo(@(0.5));
//    }];
//
//}
@end
