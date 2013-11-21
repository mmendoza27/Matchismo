//
//  Deck.h
//  Matchismo
//
//  Created by Michael Mendoza on 11/15/13.
//  Copyright (c) 2013 Dangerous Panda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card;
- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (Card *)drawRandomCard;

@end
