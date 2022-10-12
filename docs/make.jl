using Leonardo
using Documenter

DocMeta.setdocmeta!(Leonardo, :DocTestSetup, :(using Leonardo); recursive=true)

makedocs(;
    modules=[Leonardo],
    authors="Arnold",
    repo="https://github.com/a-r-n-o-l-d/Leonardo.jl/blob/{commit}{path}#{line}",
    sitename="Leonardo.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://a-r-n-o-l-d.github.io/Leonardo.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/a-r-n-o-l-d/Leonardo.jl",
    devbranch="main",
)
