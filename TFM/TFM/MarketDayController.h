//
//  MarketdayController.h
//  TFM
//
//  Created by Michael Wang on 2/24/14.
//  Copyright (c) 2014 Michael Wang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MarketDayController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>{
    IBOutlet UITextField *dateText;
    NSString *todaysDate;
    IBOutlet UITextField *startTimeText;
    NSString *startTime;
    IBOutlet UITextField *snapVendorsText;
    IBOutlet UITextField *regVendorsText;
    IBOutlet UITextField *marketStaffText;
    IBOutlet UITextView *notesText;
    IBOutlet UILabel *marketNamesLabel;
    NSArray *marketNames;
    IBOutlet UIPickerView *picker;
    NSDateFormatter *formatter;
    IBOutlet UIButton *submit;
}

@end
