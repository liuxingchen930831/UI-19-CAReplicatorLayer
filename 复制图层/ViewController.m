//
//  ViewController.m
//  复制图层
//
//  Created by liuxingchen on 16/10/27.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *lightView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CALayer *layer = [CALayer layer];
    //设置锚点位置
    layer.anchorPoint = CGPointMake(0.5, 1);
    layer.position = CGPointMake(15, self.lightView.bounds.size.height);
    layer.bounds = CGRectMake(0, 0, 30, 150);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    
    //创建复制层
    CAReplicatorLayer *repLayer = [CAReplicatorLayer layer];
    
    repLayer.frame = self.lightView.bounds;
    [self.lightView.layer addSublayer:repLayer];
    
    //注意复制层可以把图层里面的所有子层复制,需要把layer放到上复制层上
    [repLayer addSublayer:layer];
    
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale.y";
    anim.toValue = @0.1;
    anim.duration = 2;
    anim.repeatCount = MAXFLOAT;
    // 设置动画反转
    anim.autoreverses = YES;
    [layer addAnimation:anim forKey:nil];
    
    // 复制层中子层总数,包括源图层
    repLayer.instanceCount = 4;
    // 设置复制子层偏移量，不包括原始层,相对于原始层x偏移。就是源图层+源图层到复制图层的第一个偏移量
    repLayer.instanceTransform = CATransform3DMakeTranslation(30, 0, 0);
    // 设置复制层动画延迟时间
    repLayer.instanceDelay = 0.4;
    // 如果设置了原始层背景色，就不需要设置这个属性
    repLayer.instanceColor = [UIColor greenColor].CGColor;
    
    repLayer.instanceRedOffset=  0.4;
    
}
@end
