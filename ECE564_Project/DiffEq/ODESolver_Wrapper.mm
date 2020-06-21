//
//  ODESolver_Wrapper.m
//  ECE564_Project
//
//  Created by Achintya Kumar on 6/18/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

#import "ODESolver_Wrapper.h"
#import "ODESolver.hpp"

@implementation ODESolver_Wrapper

-(void) HelloFromCPP_Wrapper
{
    ODESolver odeSolver;
    odeSolver.HelloFromCPP();
}

-(NSString*) ODESolver_Solve: (double) start end: (double) end
{
    ODESolver odeSolver;
    odeSolver.dowork(start, end);
    return @(odeSolver.getOutput().c_str());
}

@end
