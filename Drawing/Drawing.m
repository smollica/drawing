//
//  Drawing.m
//  Drawing
//
//  Created by Monica Mollica on 2016-03-18.
//  Copyright © 2016 Sergio Mollica. All rights reserved.
//

#import "Drawing.h"

@implementation Drawing

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    NSInteger numberOfArrays = [self.arrays count];
    NSInteger numberOfPoints = 0;
    
        for (NSInteger j = 0; j < numberOfArrays; j++) {
            NSMutableArray *arrayToDraw = [self.arrays objectAtIndex:j];
            UIBezierPath *path = [UIBezierPath bezierPath];
            NSValue *firstValue = [arrayToDraw firstObject];
            CGPoint firstPoint = [firstValue CGPointValue];
            [path moveToPoint:firstPoint];
            numberOfPoints = [arrayToDraw count];
            for (int i = 0; i < numberOfPoints; i++) {
                NSValue *value = [arrayToDraw objectAtIndex:i];
                CGPoint point = [value CGPointValue];
                [path addLineToPoint:point];
            }
            [[self.colorHistory objectAtIndex:j] setStroke];
            NSNumber *widthNumber = [self.widthHistory objectAtIndex:j];
            path.lineWidth = widthNumber.intValue;
            [path stroke];
        }

        if([self.taps count] > 0) {
            UIBezierPath *path = [UIBezierPath bezierPath];
            NSValue *firstValue = [self.taps firstObject];
            CGPoint firstPoint = [firstValue CGPointValue];
            [path moveToPoint:firstPoint];
            NSInteger numberOfPoints =  [self.taps count];
            for (int i = 0; i < numberOfPoints; i++) {
                NSValue *value = [self.taps objectAtIndex:i];
                CGPoint point = [value CGPointValue];
                [path addLineToPoint:point];
            }
            [self.currentColor setStroke];
            path.lineWidth = self.width;
            [path stroke];
        }
}

@end
