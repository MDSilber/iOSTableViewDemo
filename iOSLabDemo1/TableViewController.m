//
//  TableViewController.m
//  iOSLabDemo1
//
//  Created by Mason Silber on 2/6/13.
//  Copyright (c) 2013 Mason Silber. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        _strings= [[NSMutableArray alloc] initWithObjects:@"String0",@"String1",@"String2",@"String3",@"String4",@"String5",@"String6",@"String7",@"String8",@"String9",@"String10", nil];    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self tableView] registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [[self tableView] setEditing:YES animated:YES];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//mds2161@columbia.edu

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_strings count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSLog(@"TEST");
    // Configure the cell...
    [[cell textLabel] setText:[_strings objectAtIndex:[indexPath row]]];
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


//// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSLog(@"move from:%d to:%d", fromIndexPath.row, toIndexPath.row);
    // fetch the object at the row being moved
    NSString *r = [_strings objectAtIndex:fromIndexPath.row];
    
    // checks to make sure we add and remove the right rows
    if (fromIndexPath.row > toIndexPath.row) {
        
    	// insert the object at the target row
    	[_strings insertObject:r atIndex:toIndexPath.row];
        
    	// remove the original from the data structure
    	[_strings removeObjectAtIndex:(fromIndexPath.row + 1)];
    }
    else if (fromIndexPath.row < toIndexPath.row) {
        
    	// insert the object at the target row
    	[_strings insertObject:r atIndex:(toIndexPath.row + 1)];
        
    	// remove the original from the data structure
    	[_strings removeObjectAtIndex:(fromIndexPath.row)];
    }
}



//// Override to support conditional rearranging of the table view.
//- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Return NO if you do not want the item to be re-orderable.
//    return YES;
//}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    [[[self tableView] cellForRowAtIndexPath:indexPath] setSelected:NO];
}

@end
