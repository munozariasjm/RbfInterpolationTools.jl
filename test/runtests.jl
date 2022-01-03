using RbfInterpolationTools
using Test

X = hcat(rand(100), rand(100))

@testset "Basic Propieties" begin
    z_obs = [1 for (x, y) in zip(rand(100), rand(100))]
    inter = RbfInterpolationTools.Interpolator(X = X, y = z_obs, basis_name = "InvMQ", ϵ = 0.01)
    new_domain = (hcat(rand(1000), rand(1000)))
    @test isapprox(RbfInterpolationTools.interpolatePoint(inter, [rand(), rand()]), 1.0; atol = 0.1)
    inter = RbfInterpolationTools.Interpolator(X = X, y = z_obs .* 0, basis_name = "Cubic")
    app_z = RbfInterpolationTools.interpolateMesh(inter, new_domain)
    for i = 1:1000
        @test isapprox(app_z[i], 0.0; atol = 0.1)
    end
    z_obs = [x for x in 0:1/999:1]
    inter = RbfInterpolationTools.Interpolator(X = hcat(0:1/999:1), y = z_obs, basis_name = "ThinPlate")
    @test isapprox(RbfInterpolationTools.gradientPoint(inter, [0.5])[1], 1.0; atol = 0.1)

end
