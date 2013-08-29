//
//  FadeSeque.m
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/27/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import "FadeSeque.h"

@implementation FadeSeque


- (void)perform
{
    /*
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.type = kCATransitionFade;
    
    
    [[[[[self sourceViewController] view] window] layer] addAnimation:transition forKey:kCATransitionFade];
    [[self sourceViewController] presentViewController:[self destinationViewController] animated:NO completion:NULL];
     */
    
    
    CATransition* transition = [CATransition animation];
    
    transition.duration = 0.3;
    transition.type = kCATransitionFade;
    
    [[self.sourceViewController navigationController].view.layer addAnimation:transition forKey:kCATransition];
    [[self.sourceViewController navigationController] pushViewController:[self destinationViewController] animated:NO];
    
}


@end
