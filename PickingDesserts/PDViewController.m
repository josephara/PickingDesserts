//
//  PDViewController.m
//  PickingDesserts
//
//  Created by Joseph Aranda on 9/27/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "PDViewController.h"

@interface PDViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong)UILabel *picked;

@end

@implementation PDViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    UILabel *picked = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 30)];
    picked.textAlignment = NSTextAlignmentCenter;
    picked.font = [UIFont boldSystemFontOfSize:20];
    picked.textColor = [UIColor redColor];
    [self.view addSubview:picked];
    
    self.picked =picked;
    
    
    
    UIPickerView *picker = [UIPickerView new];
    picker.frame = CGRectMake(0, (self.view.frame.size.height - picker.frame.size.height) / 2, picker.frame.size.width, picker.frame.size.height);
    picker.delegate = self;
    picker.dataSource = self;
    [self.view addSubview:picker];
    

    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    self.picked.text = [NSString stringWithFormat:@"%@ %@ %@", [self data][0][[pickerView selectedRowInComponent:0]], [self data][1][[pickerView selectedRowInComponent:1]], [self data][2][[pickerView selectedRowInComponent:2]]];
}
#pragma mark - pickerView Delegate Methods

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [[self data][component]count];
    
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return [[self data]count];
    
}



- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.data[component][row];
    
}


#pragma mark - picker view data Arrays

- (NSArray *)data {
    
    return @[
             [self fruits],
             [self liquids],
             [self desserts]
             ];
    
}

- (NSArray *)fruits {
    
    return @[@"banana",
             @"orange",
             @"apple"];
}

- (NSArray *)liquids {
    return @[@"milk",
             @"soda",
             @"coffee"];
}

- (NSArray *)desserts {
    return @[@"shake",
             @"sundae",
             @"cookie"];
}

@end
