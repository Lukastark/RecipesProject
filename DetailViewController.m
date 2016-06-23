//
//  DetailViewController.m
//  LemonApp
//
//  Created by Luka Jashiashvili on 03.04.16.
//  Copyright © 2016 Luka Jashiashvili. All rights reserved.
//

#import "DetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "VoiceOverHelper.h"


@interface DetailViewController ()

@property (nonatomic) VoiceOverHelper* voiceHelper;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.voiceHelper = [[VoiceOverHelper alloc] init];
    
    
    [self.foodImageView setImage:[UIImage imageNamed:self.details[@"ItemImage"]]];
    self.descriptionTextView.text = self.details[@"ItemDescription"];
    
    
    
    self.navigationItem.title = self.details[@"ItemName"];
    
    [self.descriptionTextView setIsAccessibilityElement:YES];
    [self.descriptionTextView setAccessibilityTraits:UIAccessibilityTraitNone];
    [self.descriptionTextView setAccessibilityLabel:@""];
    [self.descriptionTextView setAccessibilityHint:@""];
    [self.descriptionTextView setAccessibilityValue:@""];


self.descriptionTextView.itemVoiceName = self.details[@"ItemDescriptionVoice"];
    //self.descriptionTextView.itemVoiceName = @"blinebi_m";
    
    self.descriptionTextView.voiceHelper = self.voiceHelper;
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.voiceHelper stopSound];
}


- (IBAction)backAction:(id)sender {
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewDidLayoutSubviews {
    [self.descriptionTextView setContentOffset:CGPointZero animated:NO];
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if(event.type == UIEventSubtypeMotionShake) {
        
        if ([self.voiceHelper isPlaying]) {
            [self.voiceHelper pauseSound];
        } else if ([self.voiceHelper isPaused]) {
            [self.voiceHelper resumeSound];
        }
    }
}

@end
