//
//  ViewController.m
//  LaunchScreenDemo
//
//  Created by Kevin on 2020/5/19.
//  Copyright © 2020 Kevin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIImage*)mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage {
    CGImageRef firstImageRef = firstImage.CGImage;
    CGFloat firstWidth = CGImageGetWidth(firstImageRef);
    CGFloat firstHeight = CGImageGetHeight(firstImageRef);
    CGImageRef secondImageRef = secondImage.CGImage;
    CGFloat secondWidth = CGImageGetWidth(secondImageRef);
    CGFloat secondHeight = CGImageGetHeight(secondImageRef);
    CGSize mergedSize = CGSizeMake(MAX(firstWidth, secondWidth), MAX(firstHeight, secondHeight));
    UIGraphicsBeginImageContext(mergedSize);
    [firstImage drawInRect:CGRectMake(0, 0, firstWidth, firstHeight) blendMode:kCGBlendModeNormal alpha:1];
    [secondImage drawInRect:CGRectMake(0, 0, secondWidth, secondHeight) blendMode:kCGBlendModeNormal alpha:1];

//    [firstImage drawInRect:CGRectMake(0, 0, firstWidth, firstHeight)];
//    [secondImage drawInRect:CGRectMake(0, 0, secondWidth, secondHeight)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
