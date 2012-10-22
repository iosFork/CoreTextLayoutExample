//
//  ZSTextLayoutView.m
//  CoreTextLayoutExample
//
//  Created by Zac Siegel on 10/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <CoreText/CoreText.h>
#import "ZSTextLayoutView.h"

@implementation ZSTextLayoutView

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)drawRect:(CGRect)rect {

    /* Define some defaults */
    float padding = 10.0f;
    CTFontRef font = CTFontCreateWithName((__bridge CFStringRef) [UIFont systemFontOfSize:12].fontName, [UIFont systemFontOfSize:12].lineHeight, NULL);

    /* Get the graphics context for drawing */
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    /* Core Text Coordinate System is OSX style */
    CGContextSetTextMatrix(ctx, CGAffineTransformIdentity);
    CGContextTranslateCTM(ctx, 0, self.bounds.size.height);
    CGContextScaleCTM(ctx, 1.0, -1.0);

    CGRect textRect = CGRectMake(padding, padding, self.frame.size.width - padding*2, self.frame.size.height - padding*2);

    /* Create a path to draw in and add our text path */
    CGMutablePathRef pathToRenderIn = CGPathCreateMutable();
    CGPathAddRect(pathToRenderIn, NULL, textRect);

    /* Add a image path to clip around */
    CGRect clipRect = CGRectMake(padding, padding, 100, 100);
    CGPathAddRect(pathToRenderIn, NULL, clipRect);

    /* Build up an attributed string with the correct font */
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"TEXT", @"")];
    CFAttributedStringSetAttribute((__bridge CFMutableAttributedStringRef) attrString, CFRangeMake(0, attrString.length), kCTFontAttributeName, font);

    /* Get a framesetter to draw the actual text */
    CTFramesetterRef fs = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef) attrString);
    CTFrameRef frame = CTFramesetterCreateFrame(fs, CFRangeMake(0, attrString.length), pathToRenderIn, NULL);

    /* Draw the text */
    CTFrameDraw(frame, ctx);

    /* Release the stuff we used */
    CFRelease(frame);
    CFRelease(pathToRenderIn);
    CFRelease(fs);

}

@end
