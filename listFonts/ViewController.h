//
//  ViewController.h
//  listFonts
//
//  Created by Ryan Spencer on 5/07/12.
//  Copyright (c) 2012 Just Another App. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tb;
    
    NSMutableArray *data;
}



@end
