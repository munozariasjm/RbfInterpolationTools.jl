using RbfInterpolationTools
using Documenter

DocMeta.setdocmeta!(RbfInterpolationTools, :DocTestSetup, :(using RbfInterpolationTools); recursive = true)

makedocs(;
    modules = [RbfInterpolationTools],
    authors = "munozariasjm <munozariasjm@hotmail.com> and contributors",
    repo = "https://github.com/munozariasjm/RbfInterpolationTools.jl",
    sitename = "RbfInterpolationTools.jl",
    format = Documenter.HTML(;
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://munozariasjm.github.io/RbfInterpolationTools.jl",
        assets = String[]
    ),
    pages = [
        "Home" => "index.md",
        "Examples" => "examples.md",
        "Available Kernels" => "kernels.md",
        "Useful References" => "references.md"
    ]
)

deploydocs(;
    repo = "github.com/munozariasjm/RbfInterpolationTools.jl",
    devbranch = "main"
)
