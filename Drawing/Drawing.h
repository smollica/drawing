//
//  Drawing.h
//  Drawing
//
//  Created by Monica Mollica on 2016-03-18.
//  Copyright © 2016 Sergio Mollica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Drawing : UIView
@property (nonatomic) NSMutableArray *taps;
@property (nonatomic) NSMutableArray *colorHistory;
@property (nonatomic) NSMutableArray *arrays;
@property (nonatomic) UIColor *currentColor;
@property (nonatomic) int width;
@property (nonatomic) NSMutableArray *widthHistory;

@end
