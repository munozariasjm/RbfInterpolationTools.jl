var documenterSearchIndex = {"docs":
[{"location":"kernels/#Available-kernels:","page":"Available Kernels","title":"Available kernels:","text":"","category":"section"},{"location":"kernels/","page":"Available Kernels","title":"Available Kernels","text":"The RBF tools allows several deployed kernels which are available setting the interpolation Kernel. Their names are: ","category":"page"},{"location":"kernels/","page":"Available Kernels","title":"Available Kernels","text":"'MQ': sqrt((r/epsilon)^2 + 1) # MultiQuadratic Kernel\n'inv_MQ': 1.0/sqrt((r/epsilon)^2 + 1) # Inverse MultiQuadratic\n'gaussian': exp(-(r/epsilon)^2) # Guassian functional kernel\n'linear': r # Lineal combinations\n'cubic': r^3 # Cubic combinations\n'quintic': r^5 # Quintic combitations\n'thin_plate': r^2 * log(r)","category":"page"},{"location":"kernels/#Setting-your-own-Kernel:","page":"Available Kernels","title":"Setting your own Kernel:","text":"","category":"section"},{"location":"kernels/","page":"Available Kernels","title":"Available Kernels","text":"By several reasons (such as noise blurring for example), one could need to set an appropiated kernel that fits to your needs. To do so:","category":"page"},{"location":"kernels/","page":"Available Kernels","title":"Available Kernels","text":"inter = RbfInterpolationTools.Interpolator(X = X, y = y, φ = f(r,e): ...  )","category":"page"},{"location":"kernels/","page":"Available Kernels","title":"Available Kernels","text":"In this way, the setting of the weights will occurr using only the function f(r,e).","category":"page"},{"location":"references/#Other-references","page":"Useful References","title":"Other references","text":"","category":"section"},{"location":"references/#For-some-useful-packages:","page":"Useful References","title":"For some useful packages:","text":"","category":"section"},{"location":"references/","page":"Useful References","title":"Useful References","text":"For more complex and usefull Modules, please check:","category":"page"},{"location":"references/","page":"Useful References","title":"Useful References","text":"Interpolations.jl\nDierckx.jl\nBasisFunctionExpansions.jl\nSciPy Package","category":"page"},{"location":"references/#For-useful-theoretical-resources:","page":"Useful References","title":"For useful theoretical resources:","text":"","category":"section"},{"location":"references/","page":"Useful References","title":"Useful References","text":"Wikipedia Article\nKansa Method article","category":"page"},{"location":"","page":"Home","title":"Home","text":"CurrentModule = RbfInterpolationTools","category":"page"},{"location":"#RbfInterpolationTools","page":"Home","title":"RbfInterpolationTools","text":"","category":"section"},{"location":"#Introduction","page":"Home","title":"Introduction","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for RbfInterpolationTools.","category":"page"},{"location":"","page":"Home","title":"Home","text":"A simple package to perform interpolations using RadialBasisFunctions (RBF).","category":"page"},{"location":"","page":"Home","title":"Home","text":"Note that the package was developed to teach basic computational methods and palying around with Julia.","category":"page"},{"location":"#Context","page":"Home","title":"Context","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"There are several ways to use mathematical propieties of functions to estimate value of functions without actually having to compute the function, but actually using a set of observed points.","category":"page"},{"location":"","page":"Home","title":"Home","text":"The RBF apporach uses real functions such as Gussian, Multiquadratic, Inverse Multiquadratic and Quadratic to construct a basis to estimate escalar valued functions. Thus, to estimate a desired value at some coordinates, a weighted sum of terms coming from each of the known points and using a function of the distance between them.  ","category":"page"},{"location":"","page":"Home","title":"Home","text":"It has been shown that using RBF tools yields a good method for the solution of Differential Equations (including PDE) see this work, it is also heavily used in areas such as geographical tools for example, image processing, physical simulations, and many other fields.","category":"page"},{"location":"#First-steps","page":"Home","title":"First steps","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The closing square bracket switches to the package manager interface and the add command installs the package and any missing dependencies. To return to the Julia REPL hit the delete key.","category":"page"},{"location":"","page":"Home","title":"Home","text":"To load the package run","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> using RbfInterpolationTools","category":"page"},{"location":"#Quick-start","page":"Home","title":"Quick-start","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Suppose we have observed some points at random times:","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> t=hcat(rand(30) .* 6.28)","category":"page"},{"location":"","page":"Home","title":"Home","text":"And the observables (for example, of speed) are:","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> v_observed = vec(map(x -> sin(x), X))","category":"page"},{"location":"","page":"Home","title":"Home","text":"To estimate the values at those points we are going to create a interpolation environment with: ","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> using RbfInterpolationTools\n","category":"page"},{"location":"","page":"Home","title":"Home","text":"The sintax for the interpolation environment is simple:","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> inter = RbfInterpolationTools.Interpolator(X = t, y = y)\n","category":"page"},{"location":"","page":"Home","title":"Home","text":"Now, we just have to get a Matrix with the points where we want to know the values","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> new_ts = hcat(0:6.28/(999):6.28)\n","category":"page"},{"location":"","page":"Home","title":"Home","text":"And simply we get the desired values with:","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> new_vs = RbfInterpolationTools.interpolateMesh(inter, new_ts)\n","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [RbfInterpolationTools]","category":"page"},{"location":"#RbfInterpolationTools.Interpolator","page":"Home","title":"RbfInterpolationTools.Interpolator","text":"Interpolator environment setup :: mutable struct Interpolator __________________________________________________________________________________________________ Parameters:                                                                                       |     X::Matrix           Matrix to set interpolation                                               |     y::Vector           Vector with interpolate ready variables.                                  |     ϵ::Float64          Epsilon to set basis function                    => Default : 1.          |     basisname::Strin   Selected for user ready basis                                             |     φ::Function         Function of (distance between points ,  epsilon) => Default : phiMQ(r,ϵ) |     w::SVector          Static Vector containing the weights                                      | __________________________________________________________________________________________________|\n\n\n\n\n\n","category":"type"},{"location":"#RbfInterpolationTools._build-Tuple{Any, Any}","page":"Home","title":"RbfInterpolationTools._build","text":"build the onterpolation matrix\n\n-> Input:         :basis: ::Matrix with data to be interpolated ->Output:         :Weights vector: Vector containing the weights of the interpolation\n\n\n\n\n\n","category":"method"},{"location":"#RbfInterpolationTools._get_kernel","page":"Home","title":"RbfInterpolationTools._get_kernel","text":"The function to retrive the basis for interpolation     -> Input:         :basis: String with the name of the function                 being selected. The available options are:                 [\"MQ\" , \"InvMQ\" , \"Quadratic , \"Gaussian\"]     ->Output:         :basis function: two float parameters=> e (the epsilopn of the fuction)                                                 r (Distance form center)\n\n\n\n\n\n","category":"function"},{"location":"#RbfInterpolationTools.gradientPoint-Tuple{Any, Any}","page":"Home","title":"RbfInterpolationTools.gradientPoint","text":"Function to interpolate one point's gradient __________________________________________________________________________________________________ Parameters:                                                                                       |     inter::Interpolator         An interpolation environment already setted up                    |     p::Vector                   Coordinates of the point to interpolate                           | Output:                                                                                           |     Interpolation results setted by y on Interpolator and using ForwardDiff                       | __________________________________________________________________________________________________|\n\n\n\n\n\n","category":"method"},{"location":"#RbfInterpolationTools.interpolatePoint-Tuple{Interpolator, Vector}","page":"Home","title":"RbfInterpolationTools.interpolatePoint","text":"Function to interpolate one point __________________________________________________________________________________________________ Parameters:                                                                                       |     inter::Interpolator         An interpolation environment already setted up                    |     p::Vector                   Coordinates of the point to interpolate                           | Output:                                                                                           |     Interpolation results setted by y on Interpolator                                             | __________________________________________________________________________________________________|\n\n\n\n\n\n","category":"method"}]
}
