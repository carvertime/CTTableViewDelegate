//
//  CTTableActionProtocol.h
//  CTBase
//
//  Created by wenjie on 2017/10/18.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CTTableViewRow;

@protocol CTTableActionProtocol <NSObject>

- (void)tableView:(UITableView *)tableView didSelectRow:(CTTableViewRow *)item;

@end
