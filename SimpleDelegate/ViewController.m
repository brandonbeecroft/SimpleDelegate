//
//  ViewController.m
//  SimpleDelegate
//
//  Created by Joshua Howland on 10/15/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () 

@property (nonatomic, assign) NSInteger value;
@property (nonatomic, strong) CustomTableViewCell *customCell;
@property (nonatomic, strong) UITableViewCell *cell;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Simple Delegate Cell";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    switch (indexPath.row) {
        case 0: {
            self.cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
            if (!self.cell) {
                self.cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
            }
            self.cell.textLabel.text = [@(self.value) stringValue];
            return self.cell;
            break;
        }
        case 1: {
            self.customCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CustomTableViewCell class])];
            if (!self.customCell) {
                self.customCell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([CustomTableViewCell class])];
            }
            self.customCell.delegate = self;
            return self.customCell;
            break;
        }
    }
    
    return nil;
}

-(void)incrementRowValue {

    // function here to show value incremented by 1
    NSLog(@"row incremented");
    self.cell.textLabel.text = [@(self.value++) stringValue];


}

@end
