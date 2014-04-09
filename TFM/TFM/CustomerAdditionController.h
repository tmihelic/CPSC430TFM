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
    NSArray *freqNames;
    IBOutlet UILabel *ethNamesLabel;
    IBOutlet UITextView *questionText;
    IBOutlet UIButton *submit;
    IBOutlet UISegmentedControl *gender;
    IBOutlet UISegmentedControl *freq;
    IBOutlet UISegmentedControl *snapVSCredit;
    NSArray *paths;// = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory;// = [paths objectAtIndex:0];
    NSString *outputFileName;// = [docDirectory stringByAppendingPathComponent:@"cust.csv"];
}

@end
