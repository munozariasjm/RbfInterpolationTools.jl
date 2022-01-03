export Interpolator, interpolatePoint, interpolateMesh, gradientPoint, gradientPoint, gradientMesh
using Parameters
using StaticArrays
using ForwardDiff
include("./utils/RBFutils.jl")
#######################################################
#               Interpolate environment
#######################################################
"""
Interpolator environment setup :: mutable struct Interpolator
__________________________________________________________________________________________________
Parameters:                                                                                       |
    X::Matrix           Matrix to set interpolation                                               |
    y::Vector           Vector with interpolate ready variables.                                  |
    ϵ::Float64          Epsilon to set basis function                    => Default : 1.          |
    basis_name::Strin   Selected for user ready basis                                             |
    φ::Function         Function of (distance between points ,  epsilon) => Default : phi_MQ(r,ϵ) |
    w::SVector          Static Vector containing the weights                                      |
__________________________________________________________________________________________________|
"""
@with_kw mutable struct Interpolator
    X::Matrix # Matrix to set interpolation
    y::Vector # Vector with interpolate ready variables
    ϵ::Float64 = 1.0 # Epsilon to set basis function
    basis_name::String = "MQ" #Selected for user ready basis
    φ::Function = _get_kernel(basis_name) # Function of (distance between points ,  epsilon)
    w::Vector = _build(X, y; φ = φ, ϵ = ϵ) # To setup the interpolation environment
end
#######################################################
#               Interpolate point
#######################################################
"""
Function to interpolate one point
__________________________________________________________________________________________________
Parameters:                                                                                       |
    inter::Interpolator         An interpolation environment already setted up                    |
    p::Vector                   Coordinates of the point to interpolate                           |
Output:                                                                                           |
    Interpolation results setted by y on Interpolator                                             |
__________________________________________________________________________________________________|
"""
function interpolatePoint(inter::Interpolator, p::Vector)
    ((dot(inter.w, [inter.φ(r(p, inter.X[i]), inter.ϵ) for i = 1:size(inter.X)[1]]) * std(inter.y))) + mean(inter.y)
end

#######################################################
#               Interpolate mesh
#######################################################

"""
Function to interpolate one point
__________________________________________________________________________________________________
Parameters:                                                                                       |
    inter::Interpolator         An interpolation environment already setted up                    |
    ps::Matrix                  Matrix with the mesh to interpolate                               |
Output:                                                                                           |
    Interpolation results setted by y on Interpolator                                             |
__________________________________________________________________________________________________|
"""

function interpolateMesh(inter::Interpolator, ps::Matrix)
    [interpolatePoint(inter, p[:]) for p in eachrow(ps)]
end
#######################################################
#               Interpolate gradient
#######################################################
"""
Function to interpolate one point's gradient
__________________________________________________________________________________________________
Parameters:                                                                                       |
    inter::Interpolator         An interpolation environment already setted up                    |
    p::Vector                   Coordinates of the point to interpolate                           |
Output:                                                                                           |
    Interpolation results setted by y on Interpolator and using ForwardDiff                       |
__________________________________________________________________________________________________|
"""
function gradientPoint(inter, p; N = 10000)
    f(r) = interpolatePoint(inter, r)
    ForwardDiff.gradient(f, p)
end

