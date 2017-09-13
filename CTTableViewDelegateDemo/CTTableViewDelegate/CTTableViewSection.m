//
//  CTTableViewSection.m
//  CTTableViewDelegateDemo
//
//  Created by wenjie on 2017/9/13.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import "CTTableViewSection.h"

@implementation CTTableViewSection

- (NSMutableArray<CTTableViewRow *> *)rows{
    if (_rows == nil) {
        _rows = [NSMutableArray array];
    }
    return _rows;
}

@end
