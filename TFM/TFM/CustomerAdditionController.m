//
//  CustomerAdditionController.m
//  TFM
//
//  Created by Michael Wang on 2/24/14.
//  Copyright (c) 2014 Michael Wang. All rights reserved.
//

#import "CustomerAdditionController.h"


@interface CustomerAdditionController ()

@end

@implementation CustomerAdditionController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIToolbar *toolbar1 = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIToolbar *toolbar2 = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIToolbar *toolbar3 = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIToolbar *toolbar4 = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];

    toolbar1.barStyle = UIBarStyleDefault;
    toolbar2.barStyle = UIBarStyleDefault;
    toolbar3.barStyle = UIBarStyleDefault;
    toolbar4.barStyle = UIBarStyleDefault;

    UIBarButtonItem *itemDone1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:zipText action:@selector(resignFirstResponder)];
    UIBarButtonItem *itemDone2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:ageText action:@selector(resignFirstResponder)];
    UIBarButtonItem *itemDone3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:tokensText action:@selector(resignFirstResponder)];
    UIBarButtonItem *itemDone4 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:bonusTokensText action:@selector(resignFirstResponder)];
    
    UIBarButtonItem *itemSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    toolbar1.items = @[itemSpace,itemDone1];
    toolbar2.items = @[itemSpace,itemDone2];
    toolbar3.items = @[itemSpace,itemDone3];
    toolbar4.items = @[itemSpace,itemDone4];

    zipText.inputAccessoryView = toolbar1;
    ageText.inputAccessoryView = toolbar2;
    tokensText.inputAccessoryView = toolbar3;
    bonusTokensText.inputAccessoryView = toolbar4;

    [zipText becomeFirstResponder];
    [ageText becomeFirstResponder];
    [tokensText becomeFirstResponder];
    [bonusTokensText becomeFirstResponder];

    zipText.delegate = self;
    ageText.delegate = self;
    tokensText.delegate = self;
    bonusTokensText.delegate = self;

    ethNames = @[@"Australia (AUD)", @"China (CNY)",
                     @"France (EUR)", @"Great Britain (GBP)", @"Japan (JPY)"];
    
    [tokensText setHidden:true];
    [tokens setHidden:true];
    [bonusTokensText setHidden:true];
    [bonusTokens setHidden:true];

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
    return ethNames.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return ethNames[row];
}

#pragma mark -
#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    
    NSString *resultString = [[NSString alloc] initWithFormat:
                              @"%@",
                              ethNames[row]];
    ethNamesLabel.text = resultString;
}

- (IBAction)submitCust:(id)sender {
    /*    NSString *dayOutString = @"";
     dayOutString = [dayOutString stringByAppendingFormat:@"%@, %@, %@, %@, %@\n", zipText.text, [gender titleForSegmentAtIndex:gender.selectedSegmentIndex],[freq titleForSegmentAtIndex:freq.selectedSegmentIndex],ageText.text,[snapVSCredit titleForSegmentAtIndex:snapVSCredit.selectedSegmentIndex]];
     NSLog(@"%@", dayOutString);
     //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
     //NSString *docDirectory = [paths objectAtIndex:0];
     //NSString *filename = @"";
     //filename = [ stringByReplacingOccurrencesOfString:@"/" withString:@"."];
     //filename = [filename stringByAppendingString:(@".csv")];
     //NSString *outputFileName = [docDirectory stringByAppendingPathComponent:@"cust.csv"];
     //NSFileHandle *myHandle = [NSFileHandle fileHandleForUpdatingAtPath:outputFileName ];
     //[myHandle seekToEndOfFile];
     //[myHandle writeData:  [dayOutString dataUsingEncoding:NSUTF8StringEncoding]];
     //[myHandle closeFile];
     */
    NSLog(@"Cust: %@", _fname);
}

- (IBAction)onSelect:(id)sender {
    NSString *test = @"";
    test = [test stringByAppendingFormat:@"%@", [snapVSCredit titleForSegmentAtIndex:snapVSCredit.selectedSegmentIndex]];

    if ([test isEqual: @"SNAP"]) {
        [tokensText setHidden:false];
        [tokens setHidden:false];
        [bonusTokensText setHidden:false];
        [bonusTokens setHidden:false];
    } else if ([test isEqual: @"Credit Card"]){
        [tokensText setHidden:false];
        [tokens setHidden:false];
        [bonusTokensText setHidden:true];
        [bonusTokens setHidden:true];
    } else{
        [tokensText setHidden:true];
        [tokens setHidden:true];
        [bonusTokensText setHidden:true];
        [bonusTokens setHidden:true];
    }
}



@end
