//
//  ViewController.m
//
//  Created by Nick Lockwood on 03/02/2013.
//  Copyright (c) 2013 Charcoal Design. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController () <CALayerDelegate>

@property (nonatomic, weak) IBOutlet UIView *layerView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    /* Use CoreGraphics
    //create sublayer
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    //set controller as layer delegate
    blueLayer.delegate = self;
    
    //ensure that layer backing image uses correct scale
    blueLayer.contentsScale = [UIScreen mainScreen].scale;
    */

    // CASharpLayer - 可以在边界之外绘制
    UIBezierPath *path = [[UIBezierPath alloc] init];
    CGFloat width = CGRectGetWidth(self.layerView.frame);
    [path moveToPoint:CGPointMake(width, width / 2)];
    [path addArcWithCenter:CGPointMake(width / 2, width / 2) radius:width / 2 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    CAShapeLayer *blueLayer = [CAShapeLayer layer];
    blueLayer.strokeColor = [UIColor blueColor].CGColor;
    blueLayer.fillColor = [UIColor clearColor].CGColor;
    blueLayer.lineWidth = 10;
    blueLayer.path = path.CGPath;
    
    //add layer to our view
    [self.layerView.layer addSublayer:blueLayer];
    
    //force layer to redraw
//    [blueLayer display];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    //draw a thick red circle
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

@end
