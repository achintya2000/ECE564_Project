//
//  ODESolver.cpp
//  ECE564_Project
//
//  Created by Achintya Kumar on 6/18/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

#include "ODESolver.hpp"
#include <iostream>
#include <boost/numeric/odeint.hpp>
#include <string>

using namespace std;
using namespace boost::numeric::odeint;

string output = "";

void ODESolver::HelloFromCPP(){
    cout << "Hello from CPP" << endl;
}

void ODESolver::rhs(const double x, double &dxdt, const double t) {
    dxdt = 3.0/(2.0*t*t) + x/(2.0*t);
}

void ODESolver::write_cout(const double &x , const double t) {
    //cout << t << '\t' << x << endl;
    output = output + std::to_string(t) + ":" + std::to_string(x) + ",";
}

typedef runge_kutta_dopri5< double > stepper_type;

void ODESolver::dowork(double start, double end) {
    double x = 0.0;
    integrate_adaptive(make_controlled(1E-12 , 1E-12 , stepper_type()), rhs, x, start, end, 0.1, write_cout);
}

string ODESolver::getOutput() {
    return output;
}
