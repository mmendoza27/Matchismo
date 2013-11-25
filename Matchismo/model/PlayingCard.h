//
//  PlayingCard.h
//  Matchismo
//
//  Created by Michael Mendoza on 11/18/13.
//  Copyright (c) 2013 Dangerous Panda. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic, strong) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
