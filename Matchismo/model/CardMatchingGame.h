//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Michael Mendoza on 11/25/13.
//  Copyright (c) 2013 Dangerous Panda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

// Our "designated" initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic) BOOL simpleCardMatchGame;

@end
