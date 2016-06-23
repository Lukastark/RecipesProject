//
//  VoiceOverHelper.h
//  LemonApp
//
//  Created by Luka Jashiashvili on 5/14/16.
//  Copyright © 2016 Luka Jashiashvili. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VoiceOverHelper : NSObject

- (void)playSoundWithName:(NSString*)soundName;

- (void)pauseSound;
- (void)resumeSound;
- (void)stopSound;

- (BOOL)isPlaying;
- (BOOL)isPaused;


@end
