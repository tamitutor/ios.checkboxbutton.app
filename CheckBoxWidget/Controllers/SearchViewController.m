//
//  SearchViewController.m
//  CheckBoxWidget
//
//  Created by Tami Wright on 9/16/13.
//  Copyright (c) 2013 twright. All rights reserved.
//

#import "SearchViewController.h"
#import "TableViewSummaryCell.h"
#import "TableViewResultCell.h"

@interface SearchViewController ()

@end

@implementation SearchViewController
{
    
    NSArray *tableData;
    NSArray *thumbnails;
    NSArray *prepTime;
}

#pragma mark - Initialize
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    if (self && self.barTitle)
        self.navigationItem.title = self.barTitle;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.searchResults = [[NSMutableArray alloc] init];
    self.imageSearchResults = [[NSMutableArray alloc] init];
    self.prepTimeSearchResults = [[NSMutableArray alloc] init];
    
    // Find out the path of recipes.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"recipes" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    tableData = [dict objectForKey:@"RecipeName"];
    thumbnails = [dict objectForKey:@"Thumbnail"];
    prepTime = [dict objectForKey:@"PrepTime"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"@numberOfSectionsInTableView");
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"@tableView numberOfRowsInSection");
    // Return the number of rows in the section.
    return [self.searchResults count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"@tableView cellForRowAtIndexPath");
    if (indexPath.row == 0)
    {
        static NSString *CellIdentifier = @"TableViewSummaryCell";
        TableViewSummaryCell *cell = (TableViewSummaryCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableViewSummaryCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        cell.resultsCountLabel.text = [@([self.searchResults count] - 1) stringValue];
        NSMutableString *searchTermLabelText = [[NSMutableString alloc] init];
        [searchTermLabelText appendString: @"'"];
        [searchTermLabelText appendString:self.searchBar.text];
        [searchTermLabelText appendString: @"'"];
        cell.searchTermLabel.text = searchTermLabelText;
        cell.checkBoxButton.editable = true;
        cell.checkBoxButton.tag = indexPath.row;
        cell.checkBoxButton.delegate = self;
        
        return cell;
    }
    else
    {
        static NSString *simpleTableIdentifier = @"TableViewResultCell";
        
        TableViewResultCell *cell = (TableViewResultCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableViewResultCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        cell.descriptionLabel.text = [self.searchResults objectAtIndex:indexPath.row];
        cell.thumbNailImageView.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
        cell.preparationTimeValueLabel.text = [prepTime objectAtIndex:indexPath.row];
        cell.checkBoxButton.editable = true;
        cell.checkBoxButton.tag = indexPath.row;
        cell.checkBoxButton.delegate = self;
        
        return cell;        
    }
}

- (NSMutableArray *)getTableViewCells
{
    NSMutableArray *cells = [[NSMutableArray alloc] init];
    for (NSInteger j = 0; j < [self.tableView numberOfSections]; ++j)
    {
        for (NSInteger i = 0; i < [self.tableView numberOfRowsInSection:j]; ++i)
        {
            [cells addObject:[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:j]]];
        }
    }
    return cells;
}

#pragma mark - Search
- (void)searchBarSearchButtonClicked:(UISearchBar *) aSearchBar
{
    NSLog(@"@searchBarSearchButtonClicked");
    [self.searchBar resignFirstResponder];
    
    [self.searchResults removeAllObjects];
    self.searchResults = [[NSMutableArray alloc]init];
    [self.searchResults addObject:@"placeholder"];
    [self.imageSearchResults removeAllObjects];
    self.imageSearchResults = [[NSMutableArray alloc]init];
    [self.imageSearchResults addObject:@"placeholder"];
    [self.prepTimeSearchResults removeAllObjects];
    self.prepTimeSearchResults = [[NSMutableArray alloc]init];
    [self.prepTimeSearchResults addObject:@"placeholder"];

    int count = 0;
    NSString *searchText = self.searchBar.text;
    for (NSString *recipe in tableData) {
        if([recipe rangeOfString: searchText options: NSCaseInsensitiveSearch].location != NSNotFound)
        {
            NSMutableString *foundMatchString = [[NSMutableString alloc] init];
            [foundMatchString appendString: @"Found match in "];
            [foundMatchString appendString:recipe];
            NSLog(foundMatchString);
            [self.searchResults addObject:recipe];
            [self.imageSearchResults addObject: [thumbnails objectAtIndex:count]];
            [self.prepTimeSearchResults addObject: [prepTime objectAtIndex:count]];
        }
        count++;
    }
    [self.tableView reloadData];
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
}

#pragma mark - Checkbox Buttons
- (void)checkBoxButton:(CheckBoxButton *)checkBoxButton checkBoxButtonDidChange:(BOOL)checkBoxSelected
{
    NSLog(@"@checkBoxButton checkBoxButtonDidChange");

    TableViewSummaryCell *summaryCell = (TableViewSummaryCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    if (summaryCell)
    {
        BOOL checkBoxButtonAllSelected = summaryCell.checkBoxButton.checkBoxSelected;
        NSMutableArray *cells = [self getTableViewCells];
        if ( checkBoxButton.tag == summaryCell.checkBoxButton.tag )
        {
            for (TableViewResultCell *cell in cells) {
                if (cell.checkBoxButton.tag != summaryCell.checkBoxButton.tag)
                    [cell.checkBoxButton setCheckBoxSelection:                checkBoxButtonAllSelected];
            }
        }
        else
        {
            for (TableViewResultCell *cell in cells) {
                if (!cell.checkBoxButton.checkBoxSelected && cell.checkBoxButton.tag != summaryCell.checkBoxButton.tag) {
                    checkBoxButtonAllSelected = cell.checkBoxButton.checkBoxSelected;
                    break;
                }
                checkBoxButtonAllSelected = YES;
            }
            [summaryCell.checkBoxButton setCheckBoxSelection:checkBoxButtonAllSelected];
        }
    }
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

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

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
}

@end
