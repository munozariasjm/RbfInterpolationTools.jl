import Pkg
Pkg.activate("RbfInterpolationTools")
using RbfInterpolationTools
using Plots

# Lets generate some observed points
xx = rand(500)
xy = rand(500)
X = hcat(xx, xy)
# The hidden function will be:
z_func(x, y) = (x + y) * exp(-6.0 * (x^2 + y^2))
# Taking the values in the points of
z_obs = [z_func(x, y) for (x, y) in zip(xx, xy)]
# To visualize it:
Plots.scatter(X[:, 1], X[:, 2], zcolor = z_obs)


# For example, lets generate a interpolation environment using the observed points.
# We will be using as a basis fuction the ThinPlate [https://en.wikipedia.org/wiki/Thin_plate_spline]
inter = RbfInterpolationTools.Interpolator(X = X, y = z_obs, basis_name = "ThinPlate")

# Now, lets generate a 10 times denser mesh to generate the points
new_domain = (hcat(rand(100000), rand(100000)))
# And we can actually see the it generates an interpolated value for each new coordinate
z_interpolated = RbfInterpolationTools.interpolateMesh(inter, new_domain)
# It can be easilly visualized using Plots and a scatter
Plots.scatter(new_domain[:, 1], new_domain[:, 2], zcolor = z_interpolated)