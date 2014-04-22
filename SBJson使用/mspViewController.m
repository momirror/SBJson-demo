//
//  mspViewController.m
//  SBJson使用
//
//  Created by mac on 14-4-18.
//  Copyright (c) 2014年 msp. All rights reserved.
//

#import "mspViewController.h"
#import "SBJson.h"

@interface mspViewController ()

@end

@implementation mspViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSDictionary *dictonary = [[NSMutableDictionary alloc] init];
    [dictonary setValue:@"MIle" forKey:@"name"];
    [dictonary setValue:@"19" forKey:@"age"];
    [dictonary setValue:@"male" forKey:@"sex"];
    NSDictionary *root = [[NSMutableDictionary alloc] init];
    [root setValue:dictonary forKey:@"player"];
    
    SBJsonWriter *writer = [[SBJsonWriter alloc] init];
    NSLog(@"Start Create JSON!");
    NSString *value = [writer stringWithObject:root];
    NSLog(@"%@",value);
    
    //解析JSON
    NSDictionary *dicRoot = [[[SBJsonParser alloc]init] objectWithString:value];
    for (int i=0; i<[dicRoot count]; i++) {
        NSDictionary *player = [dicRoot objectForKey:@"player"];
        NSString *name = [player objectForKey:@"name"];
        NSString *age = [player objectForKey:@"age"];
        NSString *sex = [player objectForKey:@"sex"];
        NSLog(@"Name = %@", name);
        NSLog(@"Age = %@", age);
        NSLog(@"Sex = %@", sex);
        
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
