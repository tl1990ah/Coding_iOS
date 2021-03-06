//
//  TLTweetCell.h
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/23.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TLTweetFrame;

@interface TLTweetCell : UITableViewCell

@property (nonatomic, strong) TLTweetFrame *tweetFrame;

+ (instancetype)createTweetCellWithTableView:(UITableView *)tableView;

@end
