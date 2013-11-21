//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Michael Mendoza on 11/4/13.
//  Copyright (c) 2013 Dangerous Panda. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@end

@implementation CardGameViewController


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
   } else {
      [sender setBackgroundImage:[UIImage imageNamed:@"cardFront"]
                        forState:UIControlStateNormal];
      [sender setTitle:@"A♣️" forState:UIControlStateNormal];
   }
   self.flipCount++;
}

@end
