//
//  PlayingCard.m
//  Matchismo
//
//  Created by Michael Mendoza on 11/18/13.
//  Copyright (c) 2013 Dangerous Panda. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

+ (NSArray *)validSuits {
   return @[@"♥️", @"♦️", @"♠️", @"♣️"];
}

+ (NSArray *)rankStrings {
   return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10",
            @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank {
   return [[self rankStrings] count] - 1;
}

- (int)match:(NSArray *)otherCards {
   int score = 0;
   
   if ([otherCards count] == 1) {
      PlayingCard *otherCard = [otherCards firstObject];
      
      if (otherCard.rank == self.rank) {
         score = 4;
      } else if ([otherCard.suit isEqualToString:self.suit]) {
         score = 1;
      }
   } else if ([otherCards count] == 2) {
      PlayingCard *firstCard = [otherCards firstObject];
      PlayingCard *secondCard = [otherCards lastObject];
      
      if (firstCard.rank == secondCard.rank && secondCard.rank == self.rank) {
         score = 16;
      } else if ([firstCard.suit isEqualToString:secondCard.suit] &&
                 [secondCard.suit isEqualToString:self.suit]) {
         score = 4;
      } else if (firstCard.rank == secondCard.rank || secondCard.rank == self.rank) {
         score = 4;
      } else if ([firstCard.suit isEqualToString:secondCard.suit] ||
                 [secondCard.suit isEqualToString:self.suit]) {
         score = 1;
      }
   }
   
   return score;
}

- (NSString *)contents {
   NSArray *rankStrings = [PlayingCard rankStrings];
   return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

- (void)setSuit:(NSString *)suit {
   if ([[PlayingCard validSuits] containsObject:suit]) {
      _suit = suit;
   }
}

- (void)setRank:(NSUInteger)rank {
   if (rank <= [PlayingCard maxRank]) {
      _rank = rank;
   }
}

- (NSString *)suit {
   return _suit ? _suit : @"?";
}



@end
