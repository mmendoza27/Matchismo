//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Michael Mendoza on 11/4/13.
//  Copyright (c) 2013 Dangerous Panda. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController () <UIAlertViewDelegate>
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *selectedCardsLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *cardGameSelector;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game {
   if (!_game) {
      _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                usingDeck:[self createDeck]];
   }
   return _game;
}

- (Deck *)createDeck {
   return [[PlayingCardDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender {
   NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
   [self.game chooseCardAtIndex:chosenButtonIndex];
   [self.cardGameSelector setEnabled:NO];
   [self updateUI];
}

- (void)updateUI {
   for (UIButton *cardButton in self.cardButtons) {
      NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
      Card *card = [self.game cardAtIndex:cardButtonIndex];
      
      [cardButton setTitle:[self titleForCard:card]
                  forState:UIControlStateNormal];
      [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                            forState:UIControlStateNormal];
      
      cardButton.enabled = !card.isMatched;
      self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld",
                              (long)self.game.score];
   }
}

- (void)resetUI {
   self.game = nil;
   [self.cardGameSelector setEnabled:YES];
   [self updateUI];
}


- (NSString *)titleForCard:(Card *)card {
   return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card {
   return [UIImage imageNamed:card.isChosen ? @"cardFront" : @"cardBack"];
}

- (IBAction)startNewGame:(id)sender {
   UIAlertView *newGameDialog = [[UIAlertView alloc] initWithTitle:@"Redeal Cards"
                                                           message:@"Would you like to start a new game?"
                                                          delegate:self
                                                 cancelButtonTitle:@"No"
                                                 otherButtonTitles:@"Yes", nil];
   [newGameDialog show];
}

- (IBAction)selectCardGame:(UISegmentedControl *)sender {
   if (sender.selectedSegmentIndex == 0) {
      NSLog(@"Selected 2-Card Match Game");
   } else {
      NSLog(@"Selected 3-Card Match Game");
   }
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
   if (buttonIndex == 1) {
      [self resetUI];
      [self createDeck];
   }
}

@end
