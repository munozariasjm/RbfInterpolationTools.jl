```@meta
CurrentModule = RbfInterpolationTools
```

# RbfInterpolationTools

## Introduction
Documentation for [RbfInterpolationTools](https://github.com/munozariasjm/RbfInterpolationTools.jl).

*A simple package to perform interpolations using RadialBasisFunctions (RBF).*

Note that the package was developed to teach basic computational methods and palying around with Julia.

## Context
There are several ways to use mathematical propieties of functions to estimate value of functions without actually having to compute the function, but actually using a set of observed points.

The RBF apporach uses real functions such as Gussian, Multiquadratic, Inverse Multiquadratic and Quadratic to construct a basis to estimate escalar valued functions. Thus, to estimate a desired value at some coordinates, a weighted sum of terms coming from each of the known points and using a function of the distance between them.  

It has been shown that using RBF tools yields a good method for the solution of Differential Equations (including PDE) [see this work](https://www.sciencedirect.com/science/article/pii/S0021999112003452?casa_token=yaVWK6TnWhQAAAAA:7hR7lH7jEvOJcbQ3aE_C1s2-1lmTJnjmJuxqH3V9zNFnIx3X89aGLBO-iI3MePy8jrvv6fLFgv9b), it is also heavily used in areas such as geographical tools [for example](https://link.springer.com/chapter/10.1007/978-3-030-39081-5_12), image processing, physical simulations, and many other fields.

## First steps
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

```@autodocs
Modules = [RbfInterpolationTools]
```
