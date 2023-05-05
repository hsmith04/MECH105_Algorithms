Purpose: <br>
This code serves to estimate the root of a given function.<br>


Inputs:<br>
• func - the function being evaluated<br>
•  xl - the lower guess<br>
•  xu - the upper guess<br>
• es - the desired relative error (should default to 0.0001%)<br>
• maxit - the maximum number of iterations to use (should default to 200)<br>
• varargin, . . . - any additional parameters used by the function<br>


Outputs:<br>
• root - the estimated root location<br>
• fx - the function evaluated at the root location<br>
• ea - the approximate relative error (%)<br>
• iter - how many iterations were performed<br>


Example:<br>
