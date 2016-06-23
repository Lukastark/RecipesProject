//
//  DetailViewController.h
//  LemonApp
//
//  Created by Luka Jashiashvili on 03.04.16.
//  Copyright © 2016 Luka Jashiashvili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "MyTextView.h"


@interface DetailViewController : UIViewController

@property (nonatomic) NSMutableDictionary* details;

@property (strong, nonatomic) IBOutlet UIImageView *foodImageView;
@property (strong, nonatomic) IBOutlet MyTextView *descriptionTextView;

@end
