//
//  dataSourceModel.m
//  MVP-interfaceDemo
//
//  Created by CHUXIANWANG on 2019/6/27.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "dataSourceModel.h"

@interface dataSourceModel()

@property(nonatomic,strong)IBInspectable NSString* cellIdentifier;

@property(nonatomic, copy) CellConfigureBefore cellConfigBefore;

@end

@implementation dataSourceModel

-(id)initWithIdentifier:(NSString *)identifier configureBlock:(CellConfigureBefore)before{
    if(self = [super init]){
        _cellIdentifier = identifier;
        _cellConfigBefore = [before copy];
    }
    return self;
}

-(void)addMyDataArray:(NSArray *)datas{
    if(!datas) return;
    if(self.myDataArray.count > 0){
        [self.myDataArray removeAllObjects];
    }
    [self.myDataArray addObjectsFromArray:datas];
}

-(id)modelsAtIndexPath:(NSIndexPath *)indexPath{
    return self.myDataArray.count > indexPath.row ? self.myDataArray[indexPath.row]: nil;
}

#pragma mark UITableViewdataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ! self.myDataArray ? 0: self.myDataArray.count;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    id model = [self modelsAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if(self.cellConfigBefore){
        self.cellConfigBefore(cell, model, indexPath);
    }
    return cell;
}

-(NSMutableArray*) myDataArray{
    if(!_myDataArray){
        _myDataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _myDataArray;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 250.f;
}






@end
