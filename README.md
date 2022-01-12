# RbfInterpolationTools

[![Documents](https://img.shields.io/badge/docs-stable-blue.svg)](https://munozariasjm.github.io/RbfInterpolationTools.jl/stable)
[![Build Status](https://github.com/munozariasjm/RbfInterpolationTools.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/munozariasjm/RbfInterpolationTools.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/munozariasjm/RbfInterpolationTools.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/munozariasjm/RbfInterpolationTools.jl)

*A simple package to perform interpolations using RadialBasisFunctions (RBF).*

Note that the package was developed to teach basic computational methods and palying around with Julia.
## Context
There are several ways to use mathematical propieties of functions to estimate value of functions without actually having to compute the function, but actually using few observed points.

The RBF apporach uses real functions such as Gussian, Multiquadratic, Inverse Multiquadratic and Quadratic to construct a basis to estimate escalar valued functions.  

# Usage
## Installation
```julia
julia> ]add RbfInterpolationTools
```

The closing square bracket switches to the package manager interface and the ```add``` command installs the package and any missing dependencies. To return to the Julia REPL hit the ```delete``` key.

To load the package run

```julia
julia> using RbfInterpolationTools
```
## Quick-start
Suppose we have observed some points at random times:
```julia
julia> t=hcat(rand(30) .* 6.28)
```
And the observables (for example, of speed) are:
```julia
julia> v_observed = vec(map(x -> sin(x), X))
```
To estimate the values at those points we are going to create a interpolation environment with: 
```julia
julia> using RbfInterpolationTools

```
The sintax for the interpolation environment is simple:
```julia
julia> inter = RbfInterpolationTools.Interpolator(X = t, y = y)

```
Now, we just have to get a Matrix with the points where we want to know the values
```julia
julia> new_ts = hcat(0:6.28/(999):6.28)

```
And simply we get the desired values with:
```julia
julia> new_vs = RbfInterpolationTools.interpolateMesh(inter, new_ts)

```
## Available methods:

For all of the methods, it is necesary to create an environment using:
```Interpolator(X::Matrix, y::vector::, ϵ::Float64 (Default to 1), basis_name::String (Default to "MQ"))```

And then, some functionalities implemened are:

* ```interpolatePoint(inter::Interpolator,p::Vector)```: It returns the interpolated values of the functions at the coordinated vector p.
* ```interpolateMesh(inter::Interpolator,M::Matrix)```: 
It retuns N scalars of interpolated values of points with d dimensions given the matrix M of dimensions (N,d).
* ```gradientPoint(inter::Interpolator,p::Vector)```: Gradient at the vector point p from Forwad differentiation. 

## Other packages
For more complex and usefull Modules, please check:
* [Interpolations.jl](https://github.com/JuliaMath/Interpolations.jl)
* [Dierckx.jl](https://github.com/kbarbary/Dierckx.jl)
* [BasisFunctionExpansions.jl](https://github.com/baggepinnen/BasisFunctionExpansions.jl)
