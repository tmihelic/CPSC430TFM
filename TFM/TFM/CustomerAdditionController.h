//
//  CustomerAdditionController.h
//  TFM
//
//  Created by Michael Wang on 2/24/14.
//  Copyright (c) 2014 Michael Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomerAdditionController : UIViewController <UITextFieldDelegate>{
    IBOutlet UITextField *zipText;
    IBOutlet UITextField *ageText;
    IBOutlet UIPickerView *picker;
    NSArray *ethNames;
    IBOutlet UILabel *ethNamesLabel;
    IBOutlet UITextView *questionText;
    IBOutlet UIButton *submitCust;
    IBOutlet UISegmentedControl *gender;
    IBOutlet UISegmentedControl *freq;
    IBOutlet UISegmentedControl *snapVSCredit;
    IBOutlet UILabel *tokens;
    IBOutlet UILabel *bonusTokens;
    IBOutlet UITextField *tokensText;
    IBOutlet UITextField *bonusTokensText;
}
@property (nonatomic, retain)NSString *fname;

@end
