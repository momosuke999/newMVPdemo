//
//  MvpPresenter.m
//  MVP-interfaceDemo
//
//  Created by CHUXIANWANG on 2019/6/21.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MvpPresenter.h"
#import "MvpModel.h"
#import "ViewController.h"
#import "MvpViewProtcol.h"

//#import "dataSourceModel.h"

//isolated for data Source

@implementation MvpPresenter




-(instancetype) init{

    if(self = [super init]){
    [self loadData];
        NSLog(@"----%@------", self.myDataArray);
    //  [self present];
        
    }
    return self;
}



-(void)loadData{
    
    NSString * url = @"https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%B1%B1%BE%A9&start=0&count=100&client=&udid=";
    
    NSURL* Dataurl = [NSURL URLWithString:url];
    
    NSString * Datastring = [NSString stringWithContentsOfURL:Dataurl encoding:NSUTF8StringEncoding error:nil];
    
    NSData * data = [Datastring dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary * jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    NSArray *  subjectsArray = jsonData[@"subjects"];
    
    
    for (NSDictionary * tempDict in subjectsArray) {
        MvpModel* model = [MvpModel mvpModelWithDict:tempDict];

        [self.myDataArray addObject:model];
    }
    

}



-(NSMutableArray*) myDataArray{
    if  (!_myDataArray){
        _myDataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _myDataArray;
}





@end
