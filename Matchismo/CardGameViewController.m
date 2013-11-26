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

@interface CardGameViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
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
   [self updateUI];
}

- (void)updateUI {
   
}

@end
