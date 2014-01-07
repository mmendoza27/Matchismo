//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Michael Mendoza on 11/25/13.
//  Copyright (c) 2013 Dangerous Panda. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (strong, nonatomic) NSMutableArray *cards; // Array of "Card" objects
@property (strong, nonatomic) NSMutableArray *selectedCards; // of "Card" objects where "isChosen" == TRUE
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards {
   if (!_cards) {
      _cards = [[NSMutableArray alloc]init];
   }
   return _cards;
}

- (NSMutableArray *)selectedCards {
   if (!_selectedCards) {
      _selectedCards = [[NSMutableArray alloc]init];
   }
   return _selectedCards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
   self = [super init];
   
   if (self) {
      self.score = 0;
      self.simpleCardMatchGame = YES;
      
      for (int i = 0; i < count; i++) {
         Card *card = [deck drawRandomCard];
         if (card) {
            [self.cards addObject:card];
         } else {
            self = nil;
            break;
         }
      }
   }
   
   return self;
}

static const int COST_TO_CHOOSE = 1;
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;

- (void)chooseCardAtIndex:(NSUInteger)index {
   Card *card = [self cardAtIndex:index];
   
   if (self.simpleCardMatchGame) {
      
      // Logic for Two-Card Matching Game
      if (!card.isMatched) {
         if (card.isChosen) {
            card.chosen = NO;
         } else {
            for (Card *otherCard in self.cards) {
               
               if (otherCard.isChosen && !otherCard.isMatched) {
                  int matchScore = [card match:@[otherCard]];
                  
                  if (matchScore) {
                     self.score += matchScore * MATCH_BONUS;
                     otherCard.matched = YES;
                     card.matched = YES;
                  } else {
                     self.score -= MISMATCH_PENALTY;
                     otherCard.chosen = NO;
                  }
                  
                  break;
               }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
         }
      }
   } else {
      
      // Logic for Three-Card Matching Game
      if (!card.isMatched) {
         if (card.isChosen) {
            card.chosen = NO;
         } else {
            
         }
      }
   }

   
}

- (Card *)cardAtIndex:(NSUInteger)index {
   return (index < [self.cards count]) ? self.cards[index] : nil;
}

@end
