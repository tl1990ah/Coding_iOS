//
//  TLInputCell.m
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/22.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import "TLInputCell.h"

@implementation TLInputCell

+ (instancetype)inputCellWithTableView:(UITableView *)tableView
{
    static NSString *Id = @"login";
    TLInputCell *cell = [tableView dequeueReusableCellWithIdentifier:Id];
    if(!cell){
        cell = [[TLInputCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Id];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        [self addSubViews];
    }
    return self;
}

- (void)addSubViews
{
    UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = @"手机号码/电子邮箱/个性后缀";
    textField.frame = CGRectMake(20, 0, TLScreenW - 40, 44);
    [self.contentView addSubview:textField];
    [textField addTarget:self action:@selector(textValueChange:) forControlEvents:UIControlEventEditingChanged];
    [textField addTarget:self action:@selector(textValueEndEditing:) forControlEvents:UIControlEventEditingDidEnd];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor colorWithHexString:@"0xffffff"];
    line.frame = CGRectMake(20, 44 - 0.5, TLScreenW - 40, 0.5);
    [self.contentView addSubview:line];
    
}

/**
 * 监听文本框停止编辑的事件
 */
- (void)textValueEndEditing:(UITextField *)textField
{
    if(self.textValueEndEditBlock){
        
        self.textValueEndEditBlock(textField.text);
    }
}

- (void)textValueChange:(UITextField *)textField
{
    if(self.textValueChangeBlock){
        
        self.textValueChangeBlock(textField.text);
    }
}

@end
