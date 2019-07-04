//
//  ViewController.m
//  MVP-interfaceDemo
//
//  Created by CHUXIANWANG on 2019/6/21.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import "ViewController.h"
#import "dataSourceModel.h"
#import "MvpCell.h"
#import "MvpModel.h"
#import "MvpPresenter.h"
#import <SDWebImage/SDWebImage.h>

static NSString * const reuserId = @"reuserId";

@interface ViewController ()<UITableViewDelegate, MvpInterfaceProtocol>

@property(nonatomic, strong) UITableView * tableView;

@property(nonatomic, strong) NSMutableArray * myDataArray;

@property(nonatomic, strong) MvpPresenter * presenter;

@property(nonatomic, strong) dataSourceModel * dataSource;

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.presenter = [[MvpPresenter alloc]init];
//    __weak typeof (self)weakSelf = self;
    self.dataSource = [[dataSourceModel alloc]initWithIdentifier:reuserId configureBlock:^(MvpCell * cell, MvpModel* model, NSIndexPath * indexPath){
        cell.filmNameLabel.text = model.title;
        
        
        //Original titles
        
        bool kanji = NO;
        for (int i=0; i<model.original_title.length; i++) {
            NSRange range =NSMakeRange(i, 1);
            NSString * strFromSubStr=[model.original_title substringWithRange:range];
            const char * cStringFromstr=[strFromSubStr UTF8String];
            
            if (strlen(cStringFromstr)==3) {
                kanji = YES;
            }
        }
        
        if(kanji == YES){
            if(model.title != model.original_title && model.original_title.length <= 15){
                cell.filmNameEnLabel.text =model.original_title;
            }
            else{
                cell.filmNameEnLabel.text = @" ";
            }
        }
        else{
            if(model.title != model.original_title && model.original_title.length <= 35){
                cell.filmNameEnLabel.text =model.original_title;
            }
            else{
                cell.filmNameEnLabel.text = @" ";
            }
        }

        

        
        NSDictionary * imageURLs = model.images;
         NSString * imageURL =[imageURLs objectForKey:@"small"];
        [cell.filmIconLabel sd_setImageWithURL:[NSURL URLWithString:imageURL]];

      //  NSURL * imagurl = [NSURL URLWithString:imageURL];
        //  UIImage * image =[UIImage imageWithData: [NSData dataWithContentsOfURL:imagurl]];
          // cell.filmIconLabel.image = image;
    }];
    [self.dataSource addMyDataArray:self.presenter.myDataArray];
    self.view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
}


-(UITableView*) tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[MvpCell class] forCellReuseIdentifier:reuserId];
    }
    return _tableView;
}


-(void)reloadDataFromUI{
    [self.dataSource addMyDataArray:self.presenter.myDataArray];
    [self.tableView reloadData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}






@end


