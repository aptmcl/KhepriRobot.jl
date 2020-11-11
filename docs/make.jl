using KhepriRobot
using Documenter

makedocs(;
    modules=[KhepriRobot],
    authors="António Menezes Leitão <antonio.menezes.leitao@gmail.com>",
    repo="https://github.com/aptmcl/KhepriRobot.jl/blob/{commit}{path}#L{line}",
    sitename="KhepriRobot.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://aptmcl.github.io/KhepriRobot.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/aptmcl/KhepriRobot.jl",
)
