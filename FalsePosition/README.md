As Homework 9 in the course Mech 105, the assignment was to create an algorithm that estimates the root of a given function. This function is to determine the root of a function (where the function equals 0) using the false position method. 

## Inputs

### func - The function inputed by the user in the form:
      @(x) (inputed function)
      Example: @(x) x^2-5
### xl: The lower bound for the brackets containing the root
### xu: The upper bound for the brackets containing the root
### es: The desired relative error in estimation
### maxiter: The maximum iterations that can be performed

## Outputs:

### root: The final estimated root location
### fx: The inputed function evaluated at final root
### ea: The approximate relative error in percent
### iter: How many iterations were actually performed

## Error Tests

This function tests for things that could create conflict within the program. 

Error messages are displayed if:
1. There are too many inputs
2. There are not enough inputs
3. If the initial root is not within the bound

## Defaults

This function sets default values for some of the inputs if they are not initially entered. 

Inputs set to default:
1. If no value for es is inputed, set the default to 0.0001%
2. If no value for maxiter is inputed, set the default to 200


