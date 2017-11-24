//
//  TLLoginViewController.m
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/22.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import "TLLoginViewController.h"
#import "TLVerifyViewController.h"
#import "TLInputCell.h"
#import "TLLogin.h"
#import "TLHttpTool.h"

@interface TLLoginViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UIImageView *bgBlurredView;

@property (nonatomic, strong) TLLogin *login;

@end

@implementation TLLoginViewController

- (TLLogin *)login
{
    if(!_login){
        
        _login = [[TLLogin alloc] init];
    }
    return _login;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addSubViews];
    
    [self refreshCaptchaNeeded];
}

- (void)refreshCaptchaNeeded
{
    [TLHttpTool get:@"https://coding.net/api/captcha/login" params:nil success:^(id responseObj) {
        
        TLLog(@"%@", responseObj);
    } failure:^(NSError *error) {
        
    }];
}


- (void)addSubViews
{
    self.hide = YES;

    // 添加背景图
    UIImageView *bgBlurredView = [[UIImageView alloc] init];
    bgBlurredView.frame = CGRectMake(0, 0, TLScreenW, TLScreenH);
    [self.view addSubview:bgBlurredView];
    UIImage *bgImage = [UIImage originImageWithName:@"STARTIMAGE"];
    bgImage = [bgImage applyLightEffectAtFrame:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    bgBlurredView.image = bgImage;
    self.bgBlurredView = bgBlurredView;
    
    UITableView *loginTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    loginTableView.delegate = self;
    loginTableView.dataSource = self;
    loginTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    loginTableView.backgroundView = self.bgBlurredView;
    [self.view addSubview:loginTableView];
    loginTableView.tableHeaderView = [self customHeaderView];
    loginTableView.tableFooterView = [self customFooterView];
    
    // 添加两步验证按钮
    UIButton *buttonFor2FA = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonFor2FA.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [buttonFor2FA setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonFor2FA setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateHighlighted];
    [buttonFor2FA setTitle:@"  两步验证" forState:UIControlStateNormal];
    [buttonFor2FA setImage:[UIImage imageNamed:@"twoFABtn_Nav"] forState:UIControlStateNormal];
    [self.view addSubview:buttonFor2FA];
    buttonFor2FA.frame = CGRectMake(TLScreenW - 100, 20, 90, 50);
    [buttonFor2FA addTarget:self action:@selector(goTo2FAVC) forControlEvents:UIControlEventTouchUpInside];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLInputCell *cell = [TLInputCell inputCellWithTableView:tableView];
    if(indexPath.row == 0){
        
        cell.textValueChangeBlock = ^(NSString *value){
            
            self.login.email = [value stringByReplacingOccurrencesOfString:@" " withString:@""];
        };
    }else{
        
        cell.textValueChangeBlock = ^(NSString *value){
            
            self.login.password = [value stringByReplacingOccurrencesOfString:@" " withString:@""];
        };
    }
    return cell;
}

- (void)goTo2FAVC
{
    TLVerifyViewController *vc = [TLVerifyViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UIView *)customHeaderView
{
    UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, TLScreenW, TLScreenH/3)];
    
    UIImageView *iconUserView = [[UIImageView alloc] init];
    iconUserView.contentMode = UIViewContentModeScaleAspectFit;
    iconUserView.layer.masksToBounds = YES;
    iconUserView.layer.cornerRadius = iconUserView.frame.size.width / 2;
    [headerV addSubview:iconUserView];
    [iconUserView setImage:[UIImage imageNamed:@"icon_user_monkey"]];
    iconUserView.size = iconUserView.image.size;
    iconUserView.x = (TLScreenW - iconUserView.width) * 0.5;
    iconUserView.y = headerV.height - iconUserView.height - 50;
    
    return headerV;
}

- (UIView *)customFooterView
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, TLScreenW, 150)];
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [loginButton setBackgroundImage:[UIImage createImageWithColor:TLColor(0, 190, 121, 1.0) size:CGSizeMake(10, 10)] forState:UIControlStateNormal];
    [loginButton setBackgroundImage:[UIImage createImageWithColor:TLColor(97, 153, 121, 1.0) size:CGSizeMake(10, 10)] forState:UIControlStateDisabled];
    loginButton.frame = CGRectMake(20, 25, TLScreenW - 40, 44);
    loginButton.layer.cornerRadius = 22.0;
    loginButton.layer.masksToBounds = YES;
    [loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:loginButton];
    
    UIButton *resetPwd = [UIButton buttonWithType:UIButtonTypeCustom];
    [resetPwd setTitle:@"找回密码" forState:UIControlStateNormal];
    resetPwd.titleLabel.font = [UIFont systemFontOfSize:16];
    [resetPwd setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    resetPwd.frame = CGRectMake((TLScreenW - 200) * 0.5, CGRectGetMaxY(loginButton.frame) + 20, 200, 20);
    [footerView addSubview:resetPwd];
    return footerView;
}

- (void)loginAction
{
    NSString *email = self.login.email;
    NSString *password = self.login.password;
    
    TLLog(@"%@---%@", email, password);
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:3];
    params[@"account"] = email;
    params[@"password "] = [password sha1Str];
   // params[@"remember_me"] = @"true";
    
    [TLHttpTool post:@"https://coding.net/api/v2/account/login" params:params success:^(id responseObj) {
        
        TLLog(@"%@", responseObj);
    } failure:^(NSError *error) {
        
        
    }];
}


@end
