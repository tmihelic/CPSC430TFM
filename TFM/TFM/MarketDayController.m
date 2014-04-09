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
    
    UIDatePicker *dp = [[UIDatePicker alloc]init];
    [dp setDatePickerMode:UIDatePickerModeDate];
    dateText.inputView = dp;
    [formatter setDateFormat:@"MM/dd/yyyy"];
    todaysDate = [formatter stringFromDate:[NSDate date]];
    dateText.text = todaysDate;
//    [dp addTarget:self
//               action:@selector(datePickerValueChanged:)
//     forControlEvents:UIControlEventValueChanged];
    
    UIDatePicker *dp2 = [[UIDatePicker alloc]init];
    [dp2 setDatePickerMode:UIDatePickerModeTime];
    startTimeText.inputView = dp2;
    [formatter setDateFormat:@"h:mm"];
    startTime = [formatter stringFromDate:[NSDate date]];
    startTimeText.text = startTime;
//    [dp2 addTarget:self
//           action:@selector(datePickerValueChanged2:)
//    forControlEvents:UIControlEventValueChanged];
    
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

//    [dp resignFirstResponder];
//    [dp2 resignFirstResponder];
    [dateText becomeFirstResponder];
    [startTimeText becomeFirstResponder];
    [snapVendorsText becomeFirstResponder];
    [regVendorsText becomeFirstResponder];
    [marketStaffText becomeFirstResponder];
    [notesText becomeFirstResponder];
    
    marketNames = @[@"Australia (AUD)", @"China (CNY)",
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
    return marketNames.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return marketNames[row];
}

#pragma mark -
#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    
    NSString *resultString = [[NSString alloc] initWithFormat:
                              @"%@",
                              marketNames[row]];
    marketNamesLabel.text = resultString;
}

- (IBAction)datePickerValueChanged:(id)sender {
    NSString *holder = [NSDateFormatter localizedStringFromDate:[sender date]dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
    [dateText setText:holder];
}
- (IBAction)datePickerValueChanged2:(id)sender {
    NSString *holder = [NSDateFormatter localizedStringFromDate:[sender date]dateStyle:NSDateFormatterNoStyle timeStyle:NSTimeZoneNameStyleShortStandard];
    [startTimeText setText:holder];
}
- (IBAction)submitMarketDay:(id)sender {
    NSString *dayOutString = @"";
    dayOutString = [dayOutString stringByAppendingFormat:@"%@, %@, %@, %@, %@, %@, %@\n", marketNamesLabel.text, dateText.text, startTimeText.text, snapVendorsText.text, regVendorsText.text, marketStaffText.text, notesText.text];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory = [paths objectAtIndex:0];
    NSString *filename = @"";
    filename = [dateText.text stringByReplacingOccurrencesOfString:@"/" withString:@"."];
    filename = [filename stringByAppendingString:(@".csv")];
    NSLog(@"HEREHEREHERE=%@",filename);
    NSString *outputFileName = [docDirectory stringByAppendingPathComponent:filename];
    //Create an error incase something goes wrong
    NSError *csvError = NULL;
    
    //We write the string to a file and assign it's return to a boolean
    BOOL written = [dayOutString writeToFile:outputFileName atomically:YES encoding:NSUTF8StringEncoding error:&csvError];
    
    //If there was a problem saving we show the error if not show success and file path
    if (!written)
        NSLog(@"write failed, error=%@", csvError);
    else
        NSLog(@"Saved! File path =%@",
              outputFileName);
}


@end
