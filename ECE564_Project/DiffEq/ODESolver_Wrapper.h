//
//  ODESolver_Wrapper.h
//  ECE564_Project
//
//  Created by Achintya Kumar on 6/18/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

#ifndef ODESolver_Wrapper_h
#define ODESolver_Wrapper_h

#import <Foundation/Foundation.h>

@interface ODESolver_Wrapper : NSObject

-(void) HelloFromCPP_Wrapper;

-(NSString*) ODESolver_Solve: (double) start end: (double) end;

@end

#endif /* ODESolver_Wrapper_h */
