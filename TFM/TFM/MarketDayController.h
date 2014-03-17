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
}

@property (weak, nonatomic) IBOutlet UILabel *marketNamesLabel;
@property (strong, nonatomic) NSArray *marketNames;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@end
