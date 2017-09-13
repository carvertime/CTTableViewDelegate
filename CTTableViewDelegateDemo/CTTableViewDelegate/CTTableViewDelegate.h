//
//  CTTableViewDelegate.h
//  CTTableViewDelegateDemo
//
//  Created by wenjie on 2017/9/13.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CTTableViewRow;
@class CTTableViewSection;

@interface CTTableViewDelegate : NSObject

@property (nonatomic, strong) NSMutableArray <CTTableViewSection *>*sections;

@property (nonatomic, weak) id owner;

- (CTTableViewRow *)getHeaderAtIndex:(NSInteger)index;
- (CTTableViewRow *)getItemAtIndexPath:(NSIndexPath *)indexPath;
- (CTTableViewRow *)getFooterAtIndex:(NSInteger)index;
- (CTTableViewSection *)getSectionAtIndex:(NSInteger)index;

@end
