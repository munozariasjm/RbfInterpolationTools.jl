# Available kernels:

The RBF tools allows several deployed kernels which are available setting the interpolation Kernel. Their names are: 
```
'MQ': sqrt((r/epsilon)^2 + 1) # MultiQuadratic Kernel
'inv_MQ': 1.0/sqrt((r/epsilon)^2 + 1) # Inverse MultiQuadratic
'gaussian': exp(-(r/epsilon)^2) # Guassian functional kernel
'linear': r # Lineal combinations
'cubic': r^3 # Cubic combinations
'quintic': r^5 # Quintic combitations
'thin_plate': r^2 * log(r)
```

## Setting your own Kernel:

By several reasons (such as noise blurring for example), one could need to set an appropiated kernel that fits to your needs. To do so:

```julia
inter = RbfInterpolationTools.Interpolator(X = X, y = y, φ = f(r,e): ...  )
```
 In this way, the setting of the weights will occurr using only the function f(r,e).