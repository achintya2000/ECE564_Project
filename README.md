# ECE 564 - Mobile App Development

## Final Project
## Scientific calculator to help with ECE courses

### Authors: Achintya Kumar, Sebastian Williams

## IMPORTANT INSTALLATION INFORMATION

External Libraries User:
1. https://github.com/Jounce/Surge
2. http://headmyshoulder.github.io/odeint-v2/index.html
3. https://github.com/danielgindi/Charts

* Please make sure after cloning the repo you ensure that it builds. If you you can re-add the framework by going to  File->Swift Packages and pasting the link here: https://github.com/Jounce/Surge.git
* C++ -> Please "brew install boost" and then add it to the ECE564_Project Target under "Header Search Paths." For example I pasted in this: /usr/local/Cellar/boost/1.72.0_3/include/ to my header search path.
* Finally the Charts API. If it doesn't work straight away, please clone the repo and then in the ECE564_Project Target, click + under "Frameworks, libraries, and Embedded Content." Click the dropdown and click "Add Files." Then navigate to where you cloned the Charts repo and add the .xcodeproj files. After doing this click the + button again and you should be able to see the Charts.framework file. After adding that it should work.


Resources:
1. Wolfram Alpha API
2. http://boccelliengineering.altervista.org/junk/boost_integration/boost_odeint.html#integration_functions
3. http://headmyshoulder.github.io/odeint-v2/examples.html#simple1dexample

Key Features & Info

Basic Vector Math:
* Can Add, Sub, Mult, Div (element wise) vectors of dimension 3, 4, or 5.

More Vector Math:
* Compute dot and cross product of dimension 3 vectors

Basic Matrix Math:
* Find Determinant, Transpose, and Inverse of square matrices

Matrix Multiplication:
* Multiply two matrices.

Solve Systems of Equations:
* Solve a system of equations Ax = B. A matrix is coefficients of variables. B is the value.

1st Order ODE 
* Implementation of numerical solutions to defined ODE's. Utilized C++ library odeint to do this as there is not a swift implementation and iOS cannot run Python code. However this is limited
because we did not work to parse user defined ODEs.

Systems of Differential Equations
* Solve systems of differential equations through eigenvalue decomonpostions. Finds the eigenvalue and eigenvector.

Analytic solution 
* Utilizes wolfram alpha api to get image of analytic solution to input equation. Encountered bug with optionals not being able to unwrap a string passed to a URL. So currently limited to the hardcoded equation we have.


Bugs/Known Warnings:
* These warnings are unrelated to our project but rather the Surge library. We were not able to get rid of them as we needed Surge
to perform some of the more complicated parts of Accelerate, like solving systems of equations
* You HAVE to press enter when you enter a number into one of the TextFields. For whatever reason, SwiftUI doesn't require that for straight text but does for numbers
