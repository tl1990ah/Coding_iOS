//
//  TLInputCell.h
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/22.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLInputCell : UITableViewCell

@property (nonatomic, copy) void (^textValueChangeBlock)(NSString *);

@property (nonatomic, copy) void (^textValueEndEditBlock)(NSString *);

/**
 *   根据tableView创建一个cell的类方法
 */
+ (instancetype)inputCellWithTableView:(UITableView *)tableView;

@end
