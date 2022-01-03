
export _build, _get_kernel, funcs, r
using Statistics
using LinearAlgebra
using StaticArrays
#########################################################
#             Radial Basis functions                    #
#########################################################

phi_MQ(r, e) = sqrt(1 + (e .* r) .^ 2)
phi_InvMQ(r, e) = phi_MQ(r, e)^-1
phi_Q(r, e) = phi_MQ(r, e)^-2
phi_Gauss(r, e) = exp(-(e .* r)^2)
phi_Multiquadric(r, e) = -sqrt(1 + r .^ 2)
phi_InvMultiquadric(r, e) = 1 / (-sqrt(1 + r .^ 2))
phi_thin_plate_spline(r, e) = r .^ 2 .* log(r + 1e-5)
phi_cubic(r, e) = (r + 1) .^ -3
phi_quintic(r, e) = (r + 1) .^ -5
funcs = Dict([("MQ", phi_MQ),
    ("InvMQ", phi_InvMQ),
    ("Quadratic", phi_Q),
    ("Gaussian", phi_Gauss),
    ("minusMQ", phi_Multiquadric),
    ("minusInvMQ", phi_InvMultiquadric),
    ("Cubic", phi_cubic),
    ("Quintic", phi_quintic),
    ("ThinPlate", phi_thin_plate_spline)
])

"""
The function to retrive the basis for interpolation
    -> Input:
        :basis: String with the name of the function
                being selected. The available options are:
                ["MQ" , "InvMQ" , "Quadratic , "Gaussian"]
    ->Output:
        :basis function: two float parameters=> e (the epsilopn of the fuction)
                                                r (Distance form center)

"""
function _get_kernel(basis::String = "MQ"; func_dict = funcs)
    if basis ∉ keys(func_dict)
        throw(DomainError(basis, "Basis function not implemented\n If you want your own function set it using φ parameter"))
    end
    func_dict[basis]
end

# Distance calculation function 
r(x, xi) = norm(x .- xi)

"""
build the onterpolation matrix

-> Input:
        :basis: ::Matrix with data to be interpolated
->Output:
        :Weights vector: Vector containing the weights of the interpolation
"""
function _build(X, y; φ = _get_kernel["QM"], ϵ = 1.0)
    A = ones((size(X)[1], size(X)[1]))
    for i = 1:size(X)[1], j = 1:size(X)[1]
        A[i, j] = φ(r(X[i, :], X[j, :]), ϵ)
    end
    sigm_y = std(y)
    if std(y) != 0
        newy = (y .- mean(y)) / std(y)
        w = (pinv(A) * newy)
    else
        w = (pinv(A) * y)
    end
    w
end