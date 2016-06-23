//
//  MyTextView.h
//  LemonApp
//
//  Created by Luka Jashiashvili on 5/14/16.
//  Copyright © 2016 Luka Jashiashvili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VoiceOverHelper.h"

@interface MyTextView : UITextView

@property (nonatomic)NSString* itemVoiceName;
@property (nonatomic) VoiceOverHelper* voiceHelper;



@end
