As Homework 21 in the course Mech 105, the assignment was to create an algorithm that used Simpson's 1/3 rule for integration of experimental data.

** Note: This algorithm is still being worked on and does not accurately produce the correct output. **

## Inputs

All inputs should be in the form of a single line of experimental data. The function checks to see if it is entered as a vertical or horizontal matrix and changes it to be a vertical matrix. If the number of points entered was even, then the trapezoidal rule was used alongside the Simpson 1/3 rule for the last segment. 

### x - The variable that is being integrated with respect to. Most likely this will be time. 

Also, the data points entered in x, the variable that is being integrated with respect to, should have equally sized steps between them. 

### y - The experimental data points that are being collected. For example, the temperature of a gas.

The entered data in both the variables x and y should be of the same length, therefore having one value directly correspond to the correct step in the controlled variable. 

## Error Tests

This function tests for things that could create conflict within the program. 

Error messages are displayed if:
1. The inputs (x,y) are not the same length
2. The x values are not equally spaced
3. If the trapezoidal rule was used on the last interval

## Outputs:

### I - the integral of the experimental data 
