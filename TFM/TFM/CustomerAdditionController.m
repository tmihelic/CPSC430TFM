//
//  CustomerAdditionController.m
//  TFM
//
//  Created by Michael Wang on 2/24/14.
//  Copyright (c) 2014 Michael Wang. All rights reserved.
//

#import "CustomerAdditionController.h"
#import "MarketDayController.h"

@interface CustomerAdditionController ()

@end

@implementation CustomerAdditionController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIToolbar *toolbar1 = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIToolbar *toolbar2 = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];

    toolbar1.barStyle = UIBarStyleDefault;
    toolbar2.barStyle = UIBarStyleDefault;

    UIBarButtonItem *itemDone1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:zipText action:@selector(resignFirstResponder)];
    UIBarButtonItem *itemDone2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:ageText action:@selector(resignFirstResponder)];
    
    UIBarButtonItem *itemSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    toolbar1.items = @[itemSpace,itemDone1];
    toolbar2.items = @[itemSpace,itemDone2];

    zipText.inputAccessoryView = toolbar1;
    ageText.inputAccessoryView = toolbar2;

    [zipText becomeFirstResponder];
    [ageText becomeFirstResponder];

    zipText.delegate = self;
    ageText.delegate = self;

    freqNames = @[@"Australia (AUD)", @"China (CNY)",
                     @"France (EUR)", @"Great Britain (GBP)", @"Japan (JPY)"];
    
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
    return freqNames.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return freqNames[row];
}

#pragma mark -
#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    
    NSString *resultString = [[NSString alloc] initWithFormat:
                              @"%@",
                              freqNames[row]];
    ethNamesLabel.text = resultString;
}

- (IBAction)submitCust:(id)sender {
    NSString *dayOutString = @"";
    dayOutString = [dayOutString stringByAppendingFormat:@"%@, %@, %@, %@, %@\n", zipText.text, [gender titleForSegmentAtIndex:gender.selectedSegmentIndex],[freq titleForSegmentAtIndex:freq.selectedSegmentIndex],ageText.text,[snapVSCredit titleForSegmentAtIndex:snapVSCredit.selectedSegmentIndex]];
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docDirectory = [paths objectAtIndex:0];
    NSString *filename = @"";
//    filename = [ stringByReplacingOccurrencesOfString:@"/" withString:@"."];
    filename = [filename stringByAppendingString:(@".csv")];
    outputFileName = [docDirectory stringByAppendingPathComponent:@"cust.csv"];
    NSFileHandle *myHandle = [NSFileHandle fileHandleForUpdatingAtPath:outputFileName ];
    [myHandle seekToEndOfFile];
    [myHandle writeData:  [dayOutString dataUsingEncoding:NSUTF8StringEncoding]];
    [myHandle closeFile];


}

@end
