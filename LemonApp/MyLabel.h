//
//  MyLabel.h
//  LemonApp
//
//  Created by Luka Jashiashvili on 5/12/16.
//  Copyright © 2016 Luka Jashiashvili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VoiceOverHelper.h"

@interface MyLabel : UILabel

@property (nonatomic) VoiceOverHelper* voiceHelper;
@property (nonatomic)NSString* itemVoiceName;


@end
