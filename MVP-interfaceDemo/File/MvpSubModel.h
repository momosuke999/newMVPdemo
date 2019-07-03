//
//  MvpSubModel.h
//  MVP-interfaceDemo
//
//  Created by CHUXIANWANG on 2019/6/24.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

//#ifndef MvpSubModel_h
//#define MvpSubModel_h
#import <UIKit/UIKit.h>
@class data_rating, data_casts, data_directors;



@interface MvpSubModel : NSObject

@end


@interface  data_rating : NSObject

@property(nonatomic,assign) NSInteger max;

@property(nonatomic,assign) double average;

@property(nonatomic, strong) NSDictionary * details;

@property(nonatomic,assign) NSInteger stars;

@property(nonatomic, assign) NSInteger min;

@end


@interface data_casts : NSObject

@property(nonatomic, strong) NSDictionary * avatars;

@property(nonatomic, copy) NSString * name_en;

@property(nonatomic,copy)NSString * name;

@property(nonatomic, copy)NSString * alt;

@property(nonatomic, copy) NSString * idm;

@end


@interface data_directors : NSObject

@property(nonatomic, strong) NSDictionary * avartas;

@property(nonatomic, copy) NSString * name_en;

@property(nonatomic, copy) NSString * name;

@property(nonatomic, copy)NSString * alt;

@property(nonatomic, copy) NSString * idm;


@end

//#endif /* MvpSubModel_h */
