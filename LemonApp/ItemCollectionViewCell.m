//
//  ItemCollectionViewCell.m
//  LemonApp
//
//  Created by Luka Jashiashvili on 4/2/16.
//  Copyright © 2016 Luka Jashiashvili. All rights reserved.
//

#import "ItemCollectionViewCell.h"

@interface ItemCollectionViewCell()

@end

@implementation ItemCollectionViewCell

-(void)awakeFromNib{
    [self.itemLabel setIsAccessibilityElement:YES];
    [self.itemLabel setAccessibilityTraits:UIAccessibilityTraitNone];
    [self.itemLabel setAccessibilityLabel:@""];
    [self.itemLabel setAccessibilityHint:@""];
    
}

@end
