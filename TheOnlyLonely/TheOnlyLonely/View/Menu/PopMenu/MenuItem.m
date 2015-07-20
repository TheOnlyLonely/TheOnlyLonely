//
//  MenuItem.m
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/19.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem

- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName {
    return [self initWithTitle:title iconName:iconName glowColor:nil];
}

- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    glowColor:(UIColor *)glowColor {
    return [self initWithTitle:title iconName:iconName glowColor:glowColor index:-1];
}

- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                        index:(NSInteger)index {
    return [self initWithTitle:title iconName:iconName glowColor:nil index:index];
}

- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    glowColor:(UIColor *)glowColor
                        index:(NSInteger)index {
    if (self = [super init]) {
        self.title = title;
        self.iconImage = [UIImage imageNamed:iconName];
        self.glowColor = glowColor;
        self.index = index;
    }
    return self;
}

+ (instancetype)itemWithTitle:(NSString *)title
                     iconName:(NSString *)iconName {
    return [self initWithTitle:title iconName:iconName glowColor:nil index:-1];
}

+ (instancetype)itemWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    glowColor:(UIColor *)glowColor {
    return [self initWithTitle:title iconName:iconName glowColor:glowColor index:-1];
}

+ (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                        index:(NSInteger)index {
    return [self initWithTitle:title iconName:iconName glowColor:nil index:index];
}

+ (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    glowColor:(UIColor *)glowColor
                        index:(NSInteger)index {
    MenuItem *item = [[self alloc ] initWithTitle:title iconName:iconName glowColor:glowColor index:index];
    return item;
}



@end
