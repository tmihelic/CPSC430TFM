//
//  MarketDayController.m
//  TFM
//
//  Created by Michael Wang on 2/24/14.
//  Copyright (c) 2014 Michael Wang. All rights reserved.
//

#import "MarketDayController.h"

@interface MarketDayController ()

@end

@implementation MarketDayController


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    UIDatePicker *dp, *dp2 = [[UIDatePicker alloc]init];
    [dp setDatePickerMode:UIDatePickerModeDate];
    dateText.inputView = dp;
    [formatter setDateFormat:@"MM/dd/yy"];
    todaysDate = [formatter stringFromDate:[NSDate date]];
    dateText.text = todaysDate;
    
    [dp2 setDatePickerMode:UIDatePickerModeTime];
    startTimeText.inputView = dp2;
    [formatter setDateFormat:@"hh:mm"];
    startTime = [formatter stringFromDate:[NSDate date]];
    startTimeText.text = startTime;
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIToolbar *toolbar2 = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIToolbar *toolbar3 = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    
    toolbar.barStyle = UIBarStyleDefault;
    toolbar2.barStyle = UIBarStyleDefault;
    toolbar3.barStyle = UIBarStyleDefault;
    
    UIBarButtonItem *itemDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:startTimeText action:@selector(resignFirstResponder)];
    UIBarButtonItem *itemDone2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:dateText action:@selector(resignFirstResponder)];
    UIBarButtonItem *itemDone3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:_picker action:@selector(resignFirstResponder)];
    UIBarButtonItem *itemSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];

    
    toolbar.items = @[itemSpace,itemDone];
    toolbar2.items = @[itemSpace,itemDone2];
    toolbar3.items = @[itemSpace,itemDone3];
    
    startTimeText.inputAccessoryView = toolbar;
    dateText.inputAccessoryView = toolbar2;
    //_picker inputAccessoryView =toolbar3;
    
    [dateText becomeFirstResponder];
    [startTimeText becomeFirstResponder];
    [_picker becomeFirstResponder];
    
    _marketNames = @[@"Australia (AUD)", @"China (CNY)",
                      @"France (EUR)", @"Great Britain (GBP)", @"Japan (JPY)"];
    
    dateText.delegate = self;
    startTimeText.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return _marketNames.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return _marketNames[row];
}

#pragma mark -
#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    
    NSString *resultString = [[NSString alloc] initWithFormat:
                              @"%@",
                              _marketNames[row]];
    _marketNamesLabel.text = resultString;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
