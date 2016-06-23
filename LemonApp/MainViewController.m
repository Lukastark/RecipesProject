//
//  MainViewController.m
//  LemonApp
//
//  Created by Luka Jashiashvili on 4/1/16.
//  Copyright © 2016 Luka Jashiashvili. All rights reserved.
//

#import "MainViewController.h"
#import "DetailViewController.h"
#import "ItemCollectionViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import "VoiceOverHelper.h"


@interface MainViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>{
    BOOL isOpened;
    UITapGestureRecognizer *closeGesture;
    NSMutableArray<NSDictionary*> *selectedCategory;
    NSArray *dishesArray;
    NSArray *desertsArray;
    NSArray *drinkArray;
    NSMutableArray *allArray;
    NSMutableDictionary *selectedItem;
    AVAudioPlayer *audioPlayer1;
}

@property (nonatomic, weak) IBOutlet UIView *myContentView;
@property (nonatomic, weak) IBOutlet UICollectionView *itemsCollectionView;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *choiceButton;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeGesture;
//@property(nonatomic,strong) IBOutlet UITapGestureRecognizer *recognizerGesture;
@property (nonatomic, strong) IBOutlet UIButton *chooseAllItems;
@property (nonatomic, strong) IBOutlet UIButton *chooseDishes;
@property (nonatomic, strong) IBOutlet UIButton *chooseDesert;
@property (nonatomic, strong) IBOutlet UIButton *chooseDrinks;

@property (nonatomic) VoiceOverHelper* voiceHelper;

@end

@implementation MainViewController


- (void)viewDidLoad {
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
    [super viewDidLoad];
    self.view.isAccessibilityElement = false;
    _closeButton.soundName = @"Gamortva";
    _chooseButton.soundName = @"Archeva";
    _allButton.soundName = @"yvela-s";
    _dishButton.soundName = @"kerdzebi-s";
    _desertsButton.soundName = @"deserti-s";
    _drinksButton.soundName = @"sasmelebi-s";
    _playButton.soundName = @"Instruqcia";
    







    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    closeGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(choose:)];
    isOpened = NO;
    selectedItem = [NSMutableDictionary dictionary];
    dishesArray = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Dishes" ofType:@"plist"]];
    desertsArray = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Deserts" ofType:@"plist"]];
    drinkArray = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Drinks" ofType:@"plist"]];
    allArray = [[NSMutableArray alloc] initWithArray:dishesArray.mutableCopy];
    [allArray addObjectsFromArray:desertsArray];
    [allArray addObjectsFromArray:drinkArray];
    selectedCategory = allArray.mutableCopy;
    
    [self setCollectionAccessibilityEnabled:YES];
    
    
    self.voiceHelper = [[VoiceOverHelper alloc] init];
    
    if(![[[NSUserDefaults standardUserDefaults] valueForKey:@"firstTime"] isEqualToString:@"Yes"]) {
        [[NSUserDefaults standardUserDefaults] setValue:@"Yes" forKey:@"firstTime"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [self.voiceHelper playSoundWithName:@"Reciept1"];
    }
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.voiceHelper stopSound];
}





- (IBAction)choose:(id)sender {
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
    float centerX;
    [self.chooseAllItems setEnabled:YES];
    [self.chooseDishes setEnabled:YES];
    [self.chooseDesert setEnabled:YES];
    [self.chooseDrinks setEnabled:YES];
    
    
    if (isOpened) {
        self.swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
        isOpened = NO;
        self.itemsCollectionView.userInteractionEnabled = YES;
        [self.myContentView removeGestureRecognizer:closeGesture];
        
        
        [UIView animateWithDuration:1.0f animations:^{
        [self.itemsCollectionView setAlpha:1.0f];
        } completion:^(BOOL finished) {}];
        
        centerX = self.view.frame.size.width / 2;
        
    } else {
        
        self.swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
        isOpened = YES;
        self.itemsCollectionView.userInteractionEnabled = NO;
        [self.myContentView addGestureRecognizer:closeGesture];
        
        [UIView animateWithDuration:0.9f animations:^{
            [self.itemsCollectionView setAlpha:0.3f];
        }];
        
        centerX = self.myContentView.frame.size.width/2 - 140;
    }
    
    [self setCollectionAccessibilityEnabled:!isOpened];

    [UIView animateWithDuration:0.6 animations:^{
        self.myContentView.center = CGPointMake(centerX, self.myContentView.center.y);
        
    }];
    
}


-(void)setCollectionAccessibilityEnabled:(BOOL)enabled {
    NSArray* cells = [self.itemsCollectionView visibleCells];
    for (ItemCollectionViewCell* cell in cells) {
        [cell.itemLabel setIsAccessibilityElement:enabled];
    }
    
    [self.allButton setIsAccessibilityElement:!enabled];
    [self.dishButton setIsAccessibilityElement:!enabled];
    [self.desertsButton setIsAccessibilityElement:!enabled];
    [self.drinksButton setIsAccessibilityElement:!enabled];
    [self.playButton setIsAccessibilityElement:!enabled];
    
}


- (IBAction)chooseAllItems:(id)sender {
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
    [self choose:sender];
    selectedCategory = allArray;
    
    [self.itemsCollectionView reloadData];
    
    
    [_itemsCollectionView setAlpha:1.0f];
    
    
    [UIView animateWithDuration:2.0f animations:^{
        
        [_itemsCollectionView setAlpha:1.0f];
        
    } completion:^(BOOL finished) {
        
        
    }];
    
    
    self.navigationItem.title = @"მენიუ";
    [self.itemsCollectionView reloadData];
    
    
}

- (IBAction)chooseDishes:(id)sender {
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
    selectedCategory = dishesArray.mutableCopy;
    [self.itemsCollectionView reloadData];
    [self choose:sender];
    
    [_itemsCollectionView setAlpha:1.0f];
    
    
    [UIView animateWithDuration:2.0f animations:^{
        
        [_itemsCollectionView setAlpha:1.0f];
        
    } completion:^(BOOL finished) {
        
        
    }];
    
    self.navigationItem.title = @"კერძები";
    [self.itemsCollectionView reloadData];
    
}

- (IBAction)chooseDeserts:(id)sender {
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
    selectedCategory = desertsArray.mutableCopy;
    [self.itemsCollectionView reloadData];
    [self choose:sender];
    
    [_itemsCollectionView setAlpha:1.0f];
    
    
    [UIView animateWithDuration:2.0f animations:^{
        
        [_itemsCollectionView setAlpha:1.0f];
        
    } completion:^(BOOL finished) {
        
        
    }];
    
 
    self.navigationItem.title = @"დესერტი";
    [self.itemsCollectionView reloadData];
    
}
- (IBAction)chooseDrinks:(id)sender {
    
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
    selectedCategory = drinkArray.mutableCopy;
    [self.itemsCollectionView reloadData];
    [self choose:sender];
    
    
    [_itemsCollectionView setAlpha:1.0f];
    
    
    [UIView animateWithDuration:2.0f animations:^{
        
        [_itemsCollectionView setAlpha:1.0f];
        
    } completion:^(BOOL finished) {
        
        
    }];
 
    self.navigationItem.title = @"სასმელი";
    [self.itemsCollectionView reloadData];
    
}

- (IBAction)swipedLeft:(id)sender {
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
    [self choose:sender];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    return selectedCategory.count;
    
    
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    
    ItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCellID" forIndexPath:indexPath];
     
    cell.itemImageView.image = [UIImage imageNamed:selectedCategory[indexPath.row][@"ItemImage"]];
    [cell.itemImageView setContentMode:UIViewContentModeScaleAspectFit];
    cell.backgroundColor = [UIColor whiteColor];
    
    

    cell.layer.cornerRadius = 20;
    cell.layer.borderWidth = 2.0;
    cell.layer.borderColor = [[UIColor darkGrayColor] CGColor];
    cell.itemLabel.text = selectedCategory[indexPath.row][@"ItemName"];

    cell.itemLabel.itemVoiceName = selectedCategory[indexPath.row][@"ItemVoice"];
    cell.itemLabel.voiceHelper = self.voiceHelper;
    [cell.itemLabel setIsAccessibilityElement:YES];

    CAGradientLayer *gradient = [CAGradientLayer layer];
    
    gradient.frame = self.itemsCollectionView.superview.bounds;
    gradient.colors = @[(id)[UIColor clearColor].CGColor, (id)[UIColor blackColor].CGColor];
    gradient.locations = @[@0.0, @(0)];
    
    self.itemsCollectionView.superview.layer.mask = gradient;
    

    return cell;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.myContentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.myContentView.translatesAutoresizingMaskIntoConstraints = YES;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    selectedItem = selectedCategory[indexPath.row].mutableCopy;
    [self performSegueWithIdentifier:@"enterItenSegue" sender:self];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"enterItenSegue"]) {
        DetailViewController* vc = (DetailViewController*)segue.destinationViewController;
        vc.details = selectedItem.mutableCopy;
    }
}

- (IBAction)exitAction:(id)sender {
    UIApplication *app = [UIApplication sharedApplication];
    [app performSelector:@selector(suspend)];}



@end
