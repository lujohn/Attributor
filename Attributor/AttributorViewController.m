//
//  AttributorViewController.m
//  Attributor
//
//  Created by John Lu on 8/26/15.
//  Copyright (c) 2015 voyager. All rights reserved.
//

#import "AttributorViewController.h"

@interface AttributorViewController ()

@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UIButton *outlineButton;


@end

@implementation AttributorViewController

- (void)viewDidLoad {
   [super viewDidLoad];
   NSMutableAttributedString *labelText = [[NSMutableAttributedString alloc] initWithString:self.outlineButton.currentTitle];
   [labelText addAttributes:@{NSStrokeWidthAttributeName : @3,
                              NSStrokeColorAttributeName : self.outlineButton.tintColor}
                      range:NSMakeRange(0, [labelText length])];
   [self.outlineButton setAttributedTitle:labelText forState:UIControlStateNormal];
}


- (IBAction)changeBodySelectionColorToMatchBackgroundOfButton:(UIButton *)sender
{
   [self.body.textStorage addAttribute:NSForegroundColorAttributeName
                                 value:sender.backgroundColor
                                 range:self.body.selectedRange];
}


- (IBAction)outlineBodySelection:(UIButton *)sender
{
   [self.body.textStorage addAttributes:@{NSStrokeWidthAttributeName : @3,
                                          NSStrokeColorAttributeName : [UIColor blackColor]}
                                  range:self.body.selectedRange];
}

- (IBAction)unoutlineBodySelection:(UIButton *)sender
{
   [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName range:self.body.selectedRange];
}



@end
