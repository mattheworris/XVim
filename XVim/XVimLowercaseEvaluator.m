//
//  XVimLowercaseEvaluator.m
//  XVim
//
//  Created by Tomas Lundell on 6/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XVimLowercaseEvaluator.h"
#import "XVimSourceView.h"
#import "XVimSourceView+Vim.h"
#import "XVimWindow.h"

@implementation XVimLowercaseEvaluator

- (XVimEvaluator*)u:(XVimWindow*)window {
    if ([self numericArg] < 1) 
        return nil;
    
    XVimMotion* m = XVIM_MAKE_MOTION(MOTION_LINE_FORWARD, LINEWISE, MOTION_OPTION_NONE, [self numericArg]-1);
    return [self _motionFixed:m inWindow:window];
}

-(XVimEvaluator*)motionFixed:(XVimMotion*)motion inWindow:(XVimWindow*)window {
    [[window sourceView] makeLowerCase:motion];
    return nil;
}


@end

