import Pkg
Pkg.activate("RbfInterpolationTools")
using RbfInterpolationTools
using Plots

# Lets generate some observed points
X = hcat(rand(30) .* 6.28)
# We will try to interpolate the sin function
y = vec(map(x -> sin(x), X))

# Lets create our interpolation environment
inter = RbfInterpolationTools.Interpolator(X = X, y = (y))
# Lets regenerate our interpolation domain
X_new = hcat(0:6.28/(999):6.28)

# And we simply get our answer:
y_new = RbfInterpolationTools.interpolateMesh(inter, X_new)

# Lets plot the results
plot()
Plots.scatter!(X, y, label = "Shown points")
Plots.plot!(X_new, y_new, label = "Interpolation")

# The derivative shall be the cosine function. Lets verify it:

∂y = vec(map(x -> RbfInterpolationTools.gradientPoint(inter, [x])[1], X_new))
Plots.plot!(X_new, ∂y, label = "Interpolated Derivative")

# We can actually compare it with the real values
Plots.plot!(X_new, vec(map(x -> cos(x), X_new)), label = "Real Derivative")