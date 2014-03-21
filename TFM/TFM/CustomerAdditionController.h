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
    IBOutlet UILabel *freqNamesLabel;
    IBOutlet UITextView *questionText;
}
    
@end
