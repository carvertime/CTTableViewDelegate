//
//  CTTableViewDelegate.m
//  CTTableViewDelegateDemo
//
//  Created by wenjie on 2017/9/13.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import "CTTableViewDelegate.h"
#import "CTTableViewRow.h"
#import "CTTableViewSection.h"
#import "CTTableViewCell.h"
#import "CTTableViewHeaderFooterView.h"

@implementation CTTableViewDelegate

- (CTTableViewRow *)getHeaderAtIndex:(NSInteger)index{
    return [self getSectionAtIndex:index].header;
}
- (CTTableViewRow *)getRowAtIndexPath:(NSIndexPath *)indexPath{
    CTTableViewSection *section = [self getSectionAtIndex:indexPath.section];
    if (indexPath.row >= section.rows.count) {
        return nil;
    }
    return section.rows[indexPath.row];
}
- (CTTableViewRow *)getFooterAtIndex:(NSInteger)index{
    return [self getSectionAtIndex:index].footer;
}

- (CTTableViewSection *)getSectionAtIndex:(NSInteger)index{
    if (index >= self.sections.count) {
        return nil;
    }
    return self.sections[index];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self getSectionAtIndex:section].rows.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CTTableViewRow *row = [self getHeaderAtIndex:section];
    if (row == nil) {
        return [UIView new];
    }
    CTTableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:row.identifier];
    NSAssert(header != nil, @"cell should not be nil, identifier=%@",row.identifier);
    header.delegate = self;
    [header updateWithCellData:row];
    return header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CTTableViewRow *row = [self getRowAtIndexPath:indexPath];
    NSAssert([row isKindOfClass:CTTableViewRow.class], @"row=%@", row);
    CTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:row.identifier forIndexPath:indexPath];
    NSAssert(cell != nil, @"cell should not be nil, identifier=%@",row.identifier);
    cell.delegate = self;
    [cell updateWithCellData:row atIndexPath:indexPath];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    CTTableViewRow *row = [self getFooterAtIndex:section];
    if (row == nil) {
        return [UIView new];
    }
    CTTableViewHeaderFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:row.identifier];
    NSAssert(footer != nil, @"cell should not be nil, identifier=%@",row.identifier);
    footer.delegate = self;
    [footer updateWithCellData:row];
    return footer;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return [self getHeaderAtIndex:section].height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self getRowAtIndexPath:indexPath].height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return [self getFooterAtIndex:section].height;
}


- (BOOL)respondsToSelector:(SEL)aSelector
{
    BOOL response = [super respondsToSelector:aSelector];
    if (!response) {
        response = [self.owner respondsToSelector:aSelector];
    }
    return response;
}
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    __strong id forwardingTarget = self.owner;
    if (forwardingTarget && [forwardingTarget respondsToSelector:aSelector]) {
        return forwardingTarget;
    }
    return [super forwardingTargetForSelector:aSelector];
}






@end
