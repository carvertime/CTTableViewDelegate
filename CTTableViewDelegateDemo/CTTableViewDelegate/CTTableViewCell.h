//
//  CTTableViewCell.h
//  CTTableViewDelegateDemo
//
//  Created by wenjie on 2017/9/13.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTTableViewCell : UITableViewCell

@property (nonatomic, weak) id delegate;
- (void)updateWithCellData:(id)data atIndexPath:(NSIndexPath *)indexPath;
+ (CGFloat)getHeightWithCellData:(id)data;
@end
