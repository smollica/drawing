//
//  ViewController.m
//  Drawing
//
//  Created by Monica Mollica on 2016-03-18.
//  Copyright © 2016 Sergio Mollica. All rights reserved.
//

#import "ViewController.h"
#import "Drawing.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet Drawing *DrawingView;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGesture;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.DrawingView.taps = [NSMutableArray new];
    self.DrawingView.arrays = [NSMutableArray new];
    self.DrawingView.colorHistory = [NSMutableArray new];
    self.DrawingView.currentColor = [UIColor blackColor];
    self.DrawingView.widthHistory = [NSMutableArray new];
    self.DrawingView.width = 3;
    
    self.panGesture = [[UIPanGestureRecognizer alloc]
                                initWithTarget:self
                                        action:@selector(drawMe:)];
    
    [self.DrawingView addGestureRecognizer:self.panGesture];
    
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)drawMe:(UIPanGestureRecognizer*)sender {
    CGPoint tapPoint = [sender locationInView:self.DrawingView];
    NSValue *tapValue = [NSValue valueWithCGPoint:tapPoint];
    [self.DrawingView.taps addObject:tapValue];
    if(self.panGesture.state == UIGestureRecognizerStateChanged) {
        [self.DrawingView setNeedsDisplay];
    }
    
    if(self.panGesture.state == UIGestureRecognizerStateEnded) {
        [self.DrawingView.arrays addObject:self.DrawingView.taps.copy];
        [self.DrawingView setNeedsDisplay];
        [self.DrawingView.taps removeAllObjects];
        [self.DrawingView.colorHistory addObject:self.DrawingView.currentColor];
        NSNumber *widthNumber = [NSNumber numberWithInt:self.DrawingView.width];
        [self.DrawingView.widthHistory addObject:widthNumber];
    }
}

- (IBAction)blueButtonPressed:(id)sender {
    self.DrawingView.currentColor = [UIColor blueColor];
    self.DrawingView.width = 3;
}

- (IBAction)redButtonPressed:(id)sender {
    self.DrawingView.currentColor = [UIColor redColor];
    self.DrawingView.width = 3;
}

- (IBAction)greenButtonPressed:(id)sender {
    self.DrawingView.currentColor = [UIColor greenColor];
    self.DrawingView.width = 3;
}

- (IBAction)blackButtonPressed:(id)sender {
    self.DrawingView.currentColor = [UIColor blackColor];
    self.DrawingView.width = 3;
}

- (IBAction)eraserButtonPressed:(id)sender {
    [self.DrawingView.arrays removeAllObjects];
    [self.DrawingView.taps removeAllObjects];
    [self.DrawingView setNeedsDisplay];
}

- (IBAction)fingerEraser:(id)sender {
    self.DrawingView.currentColor = self.DrawingView.backgroundColor;
    self.DrawingView.width = 15;
}

@end
