//
//  VoiceOverHelper.m
//  LemonApp
//
//  Created by Luka Jashiashvili on 5/14/16.
//  Copyright © 2016 Luka Jashiashvili. All rights reserved.
//

#import "VoiceOverHelper.h"
#import <AVFoundation/AVFoundation.h>

@interface VoiceOverHelper () <AVAudioPlayerDelegate>
@property (nonatomic)AVAudioPlayer* player;

@end

@implementation VoiceOverHelper


- (void)playSoundWithName:(NSString*)soundName {
    if (self.player.isPlaying) {
        [self.player stop];
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:soundName ofType:@"mp3"];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
    self.player.delegate = self;
    [self.player play];
}


- (void)pauseSound {
    [self.player pause];
}


- (void)resumeSound {
    [self.player play];
}


- (void)stopSound {
    [self.player stop];
    self.player = nil;
}


- (BOOL)isPlaying {
    return [self.player isPlaying];
}


- (BOOL)isPaused {
    return self.player && ![self.player isPlaying];
}


- (void)dealloc {
    [self.player stop];
}


-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSLog(@"DID FINISH !!!");
    
    self.player = nil;
}


@end
