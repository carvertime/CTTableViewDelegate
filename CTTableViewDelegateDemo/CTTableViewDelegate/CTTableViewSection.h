//
//  CTTableViewSection.h
//  CTTableViewDelegateDemo
//
//  Created by wenjie on 2017/9/13.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CTTableViewRow;

@interface CTTableViewSection : NSObject

@property (nonatomic, strong) CTTableViewRow *header;
@property (nonatomic, strong) NSMutableArray <CTTableViewRow *>*rows;
@property (nonatomic, strong) CTTableViewRow *footer;

@end
