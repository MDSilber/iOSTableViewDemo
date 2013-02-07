//
//  TableViewController.h
//  iOSLabDemo1
//
//  Created by Mason Silber on 2/6/13.
//  Copyright (c) 2013 Mason Silber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *strings;

@end
