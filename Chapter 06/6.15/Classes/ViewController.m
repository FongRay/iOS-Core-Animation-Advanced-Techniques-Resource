//
//  ViewController.m
//
//  Created by Nick Lockwood on 03/02/2013.
//  Copyright (c) 2013 Charcoal Design. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>

@interface ViewController () {
    AVPlayer *_player;
}

@property (nonatomic, weak) IBOutlet UIView *containerView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //get video URL
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"Ship"
                                         withExtension:@"mp4"];
    
    //create player and player layer
    _player = [AVPlayer playerWithURL:URL];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:_player.currentItem];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
    
    //set player layer frame and attach it to our view
    playerLayer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:playerLayer];

    [_player play];
}

- (void)playbackFinished:(NSNotification *)notification {
    NSLog(@"Play Finished!");
    [_player seekToTime:CMTimeMake(0, 1)];
    [_player play];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
