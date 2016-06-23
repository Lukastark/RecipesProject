//
//  MyLabel.m
//  LemonApp
//
//  Created by Luka Jashiashvili on 5/12/16.
//  Copyright © 2016 Luka Jashiashvili. All rights reserved.
//

#import "MyLabel.h"
#import "VoiceOverHelper.h"

@interface MyLabel() {
}

@end

@implementation MyLabel

- (void)accessibilityElementDidBecomeFocused {
    [self.voiceHelper playSoundWithName:self.itemVoiceName];
    
}

@end
