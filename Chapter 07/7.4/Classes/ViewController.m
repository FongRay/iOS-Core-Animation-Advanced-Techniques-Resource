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

    //set the color of our layerView backing layer directly
    self.layerView.layer.backgroundColor = [UIColor blueColor].CGColor;
//    self.layerView.layer.delegate = self;
}

//- (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event {
//    if ([event isEqualToString:@"backgroundColor"]) {
//        CATransition *transition = [CATransition animation];
//        transition.type = kCATransitionPush;
//        transition.subtype =  kCATransitionFromLeft;
//        return transition;
//    }
//    return nil;
//}

- (IBAction)changeColor
{    
    //begin a new transaction
    [CATransaction begin];
        
    //set the animation duration to 1 second
//    [CATransaction setAnimationDuration:1.0];

    //randomize the layer background color
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    [UIView animateWithDuration:0.5 animations:^{
        NSLog(@"%f", [CATransaction animationDuration]);
        self.layerView.layer.backgroundColor = [UIColor colorWithRed:red
                                                               green:green
                                                                blue:blue
                                                               alpha:1.0].CGColor;
    }];
    
    //commit the transaction
    [CATransaction commit];
}

@end
