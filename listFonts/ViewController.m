//
//  ViewController.m
//  listFonts
//
//  Created by Ryan Spencer on 5/07/12.
//  Copyright (c) 2012 Just Another App. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *fontFamilyNames = [[NSMutableArray alloc] initWithArray:[UIFont familyNames]];
    
    NSSortDescriptor *sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"self" ascending: YES];
    data = [[NSMutableArray alloc] initWithArray:[fontFamilyNames sortedArrayUsingDescriptors:[NSArray arrayWithObject: sortOrder]]];
    
    tb = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    tb.delegate = self;
    tb.dataSource = self;
    
    [self.view addSubview:tb];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [data count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSArray *names = [UIFont fontNamesForFamilyName:[data objectAtIndex:section]];
    
    return [names count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if ( cell == nil ) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSArray *names = [UIFont fontNamesForFamilyName:[data objectAtIndex:indexPath.section]];
    
    // Configure the cell...
    cell.textLabel.text = [names objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:[names objectAtIndex:indexPath.row] size:14];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.textLabel.minimumFontSize = 11;
    
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [data objectAtIndex:section];
}

/*
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView 
{
    //---create the index---
    NSMutableArray *index = [[NSMutableArray alloc] init];
    
    for (NSString *font in data)
    {

        char alphabet = [font characterAtIndex:0];
        NSString *uniChar = [NSString stringWithFormat:@"%C", alphabet];
        
        if (![index containsObject:uniChar])
        {
            [index addObject:uniChar];
        }
    }
    
    NSLog(@"%@", index);
    
    return index;
}
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
