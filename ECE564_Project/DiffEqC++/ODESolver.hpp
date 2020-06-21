//
//  ODESolver.hpp
//  ECE564_Project
//
//  Created by Achintya Kumar on 6/18/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

#ifndef ODESolver_hpp
#define ODESolver_hpp

#include <stdio.h>
#include <string>

using namespace std;

class ODESolver {
public:
    void HelloFromCPP();
    
    static void rhs(const double x, double &dxdt, const double t);
        
    static void write_cout(const double &x , const double t);
    
    static void dowork(double start, double end, double initialVal);
        
    static string getOutput();
};

#endif /* ODESolver_hpp */
