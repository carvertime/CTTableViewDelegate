//
//  CTTableViewHeaderFooterView.h
//  CTTableViewDelegateDemo
//
//  Created by wenjie on 2017/9/13.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTTableViewHeaderFooterView : UITableViewHeaderFooterView

@property (nonatomic, assign) id delegate;
- (void)updateWithCellData:(id)data;
+ (CGFloat)getHeightWithCellData:(id)data;
@end
