//
//  MyTextView.m
//  LemonApp
//
//  Created by Luka Jashiashvili on 5/14/16.
//  Copyright © 2016 Luka Jashiashvili. All rights reserved.
//

#import "MyTextView.h"
#import "VoiceOverHelper.h"

@implementation MyTextView

- (void)accessibilityElementDidBecomeFocused {
    [self.voiceHelper playSoundWithName:self.itemVoiceName];
}


- (void)accessibilityElementDidLoseFocus {
    [self.voiceHelper stopSound];
}






@end