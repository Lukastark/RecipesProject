//
//  Mybutton.m
//  LemonApp
//
//  Created by Luka Jashiashvili on 5/13/16.
//  Copyright © 2016 Luka Jashiashvili. All rights reserved.
//

#import "Mybutton.h"
#import <AudioToolbox/AudioToolbox.h>

@interface Mybutton() {
    SystemSoundID soundID;
}

@end

@implementation Mybutton

-(void)awakeFromNib{
    [self setIsAccessibilityElement:YES];
    [self setAccessibilityTraits:UIAccessibilityTraitNone];
    [self setAccessibilityLabel:@""];
    [self setAccessibilityHint:@""];
}
   - (void)accessibilityElementDidBecomeFocused {
       NSString *path = [[NSBundle mainBundle] pathForResource:_soundName ofType:@"mp3"];
       AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &soundID);
   
    AudioServicesPlaySystemSound(soundID);
}

@end



