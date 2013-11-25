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
@property (strong  , nonatomic) Deck *cards;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@end

@implementation CardGameViewController

- (Deck *)cards {
   if (!_cards) {
      _cards = [self createDeck];
   }
   return _cards;
}

- (Deck *)createDeck {
   return [[PlayingCardDeck alloc] init];
}

- (void)setFlipCount:(int)flipCount {
   _flipCount = flipCount;
   self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
   NSLog(@"flipCount changed to %d", flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender {
   if ([sender.currentTitle length]) {
      [sender setBackgroundImage:[UIImage imageNamed:@"cardBack"]
                        forState:UIControlStateNormal];
      [sender setTitle:@"" forState:UIControlStateNormal];
      self.flipCount++;
   } else {
      Card *randomCard = [self.cards drawRandomCard];
      
      if (randomCard) {
         [sender setBackgroundImage:[UIImage imageNamed:@"cardFront"]
                           forState:UIControlStateNormal];
         [sender setTitle:randomCard.contents forState:UIControlStateNormal];
         self.flipCount++;
      }
   }
}

@end
