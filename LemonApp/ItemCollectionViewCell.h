//
//  ItemCollectionViewCell.h
//  LemonApp
//
//  Created by Luka Jashiashvili on 4/2/16.
//  Copyright © 2016 Luka Jashiashvili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import "MyLabel.h"

@interface ItemCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet MyLabel *itemLabel;
@property (nonatomic, weak) IBOutlet UIImageView *itemImageView;

@end
