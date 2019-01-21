//
//  LayerLabel.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/21.
//  Copyright © 2019年 KN. All rights reserved.
//

#import "LayerLabel.h"

@implementation LayerLabel

+ (Class)layerClass
{
    return [CATextLayer class];
}

- (CATextLayer *)textLayer
{
    return (CATextLayer *)self.layer;
}

- (void)setUp
{
    self.text = self.text;
    self.textColor = self.textColor;
    self.font = self.font;
    
    [[self textLayer] setAlignmentMode:kCAAlignmentJustified];
    
    [[self textLayer] setWrapped:true];
    [self.layer display];
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}

- (void)setText:(NSString *)text
{
    super.text = text;
    [[self textLayer] setString:text];
}

- (void)setTextColor:(UIColor *)textColor
{
    [super setTextColor:textColor];
    [self textLayer].foregroundColor = textColor.CGColor;
}

- (void)setFont:(UIFont *)font
{
    super.font = font;
    //set layer font
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    [self textLayer].font = fontRef;
    [self textLayer].fontSize = font.pointSize;
    CGFontRelease(fontRef);
}
@end
