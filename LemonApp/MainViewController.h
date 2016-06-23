//
//  MainViewController.h
//  LemonApp
//
//  Created by Luka Jashiashvili on 4/1/16.
//  Copyright © 2016 Luka Jashiashvili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mybutton.h"

@interface MainViewController : UIViewController <UIGestureRecognizerDelegate>
@property (nonatomic, weak) IBOutlet Mybutton *closeButton;
@property (nonatomic, weak) IBOutlet Mybutton *chooseButton;
@property (nonatomic, weak) IBOutlet Mybutton *allButton;
@property (nonatomic, weak) IBOutlet Mybutton *dishButton;
@property (nonatomic, weak) IBOutlet Mybutton *desertsButton;
@property (nonatomic, weak) IBOutlet Mybutton *drinksButton;
@property (nonatomic, weak) IBOutlet Mybutton *playButton;

@end
