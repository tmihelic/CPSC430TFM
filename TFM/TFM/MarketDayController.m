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
    
    UIDatePicker *dp = [[UIDatePicker alloc]init];
    [dp setDatePickerMode:UIDatePickerModeDate];
    dateText.inputView = dp;
    [formatter setDateFormat:@"MM/dd/yy"];
    todaysDate = [formatter stringFromDate:[NSDate date]];
    dateText.text = todaysDate;
    
    UIDatePicker *dp2 = [[UIDatePicker alloc]init];
    [dp2 setDatePickerMode:UIDatePickerModeTime];
    startTimeText.inputView = dp2;
    [formatter setDateFormat:@"hh:mm"];
    startTime = [formatter stringFromDate:[NSDate date]];
    startTimeText.text = startTime;
    
    UIToolbar *toolbar1 = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIToolbar *toolbar2 = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIToolbar *toolbar3 = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIToolbar *toolbar4 = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIToolbar *toolbar5 = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIToolbar *toolbar6 = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    
    toolbar1.barStyle = UIBarStyleDefault;
    toolbar2.barStyle = UIBarStyleDefault;
    toolbar3.barStyle = UIBarStyleDefault;
    toolbar4.barStyle = UIBarStyleDefault;
    toolbar5.barStyle = UIBarStyleDefault;
    toolbar6.barStyle = UIBarStyleDefault;
    
    UIBarButtonItem *itemDone1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:startTimeText action:@selector(resignFirstResponder)];
    UIBarButtonItem *itemDone2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:dateText action:@selector(resignFirstResponder)];
    UIBarButtonItem *itemDone3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:snapVendorsText action:@selector(resignFirstResponder)];
    UIBarButtonItem *itemDone4 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:regVendorsText action:@selector(resignFirstResponder)];
    UIBarButtonItem *itemDone5 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:marketStaffText action:@selector(resignFirstResponder)];
    UIBarButtonItem *itemDone6 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:notesText action:@selector(resignFirstResponder)];

    UIBarButtonItem *itemSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    toolbar1.items = @[itemSpace,itemDone1];
    toolbar2.items = @[itemSpace,itemDone2];
    toolbar3.items = @[itemSpace,itemDone3];
    toolbar4.items = @[itemSpace,itemDone4];
    toolbar5.items = @[itemSpace,itemDone5];
    toolbar6.items = @[itemSpace,itemDone6];
    
    startTimeText.inputAccessoryView = toolbar1;
    dateText.inputAccessoryView = toolbar2;
    snapVendorsText.inputAccessoryView = toolbar3;
    regVendorsText.inputAccessoryView = toolbar4;
    marketStaffText.inputAccessoryView = toolbar5;
    notesText.inputAccessoryView = toolbar6;

    [dateText becomeFirstResponder];
    [startTimeText becomeFirstResponder];
    [snapVendorsText becomeFirstResponder];
    [regVendorsText becomeFirstResponder];
    [marketStaffText becomeFirstResponder];
    [notesText becomeFirstResponder];
    
    _marketNames = @[@"Australia (AUD)", @"China (CNY)",
                      @"France (EUR)", @"Great Britain (GBP)", @"Japan (JPY)"];
    
    dateText.delegate = self;
    startTimeText.delegate = self;
    snapVendorsText.delegate = self;
    regVendorsText.delegate = self;
    marketStaffText.delegate = self;
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

- (void)setItems:(NSArray *)items animated:(BOOL)animated {
    
    UIToolbar *mypickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    mypickerToolbar.barStyle = UIBarStyleBlackOpaque;
    [mypickerToolbar sizeToFit];
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:_picker action:nil];
    [barItems addObject:flexSpace];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:_picker action:@selector(resignFirstResponder)];
    [barItems addObject:doneBtn];
    
    [mypickerToolbar setItems:barItems animated:YES];
    
}
@end
