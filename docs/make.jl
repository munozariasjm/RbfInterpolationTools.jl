using RbfInterpolationTools
using Documenter

DocMeta.setdocmeta!(RbfInterpolationTools, :DocTestSetup, :(using RbfInterpolationTools); recursive=true)

makedocs(;
    modules=[RbfInterpolationTools],
    authors="munozariasjm <munozariasjm@hotmail.com> and contributors",
    repo="https://github.com/munozariasjm/RbfInterpolationTools.jl/blob/{commit}{path}#{line}",
    sitename="RbfInterpolationTools.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://munozariasjm.github.io/RbfInterpolationTools.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/munozariasjm/RbfInterpolationTools.jl",
    devbranch="main",
)
