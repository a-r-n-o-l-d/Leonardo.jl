# Leonardo

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://a-r-n-o-l-d.github.io/Leonardo.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://a-r-n-o-l-d.github.io/Leonardo.jl/dev/)
[![Build Status](https://github.com/a-r-n-o-l-d/Leonardo.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/a-r-n-o-l-d/Leonardo.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/a-r-n-o-l-d/Leonardo.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/a-r-n-o-l-d/Leonardo.jl)
[![Aqua QA](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

```julia
c = Canvas(80, 21);

ps = PathStyle(Bar, BlackArrow)

drawtextbox!(c, (1, 1), "Encoder 1", Horizontal)
drawtextbox!(c, (70, 1), "Decoder 1", Horizontal)
drawtextbox!(c, (11, 7), "Encoder 2", Horizontal)
drawtextbox!(c, (59, 7), "Decoder 2", Horizontal)
drawtextbox!(c, (22, 13), "Encoder 3", Horizontal)
drawtextbox!(c, (48, 13), "Decoder 3", Horizontal)
drawtextbox!(c, (35, 19), " Bridge  ", Horizontal)

drawpath!(c, (6, 3), (10, 8), Vertical, ps);
drawpath!(c, (69, 8), (75, 4), Horizontal, ps);
drawpath!(c, (16, 9), (21, 14), Vertical, ps);
drawpath!(c, (58, 14), (64, 10), Horizontal, ps);
drawpath!(c, (27, 15), (34, 20), Vertical, ps);
drawpath!(c, (45, 20), (53, 16), Horizontal, ps);

drawpath!(c, (6, 5), 68, Horizontal, ps);
drawpath!(c, (16, 11), 47, Horizontal, ps);
drawpath!(c, (27, 17), 25, Horizontal, ps);
```
```
┌─────────┐                                                          ┌─────────┐
│Encoder 1│                                                          │Decoder 1│
└────┬────┘                                                          └─────────┘
     │                                                                    ▴
     ├───────────────────────────────────────────────────────────────────▸│
     │                                                                    │
     │    ┌─────────┐                                     ┌─────────┐     │
     └───▸│Encoder 2│                                     │Decoder 2├─────┘
          └────┬────┘                                     └─────────┘
               │                                               ▴
               ├──────────────────────────────────────────────▸│
               │                                               │
               │     ┌─────────┐               ┌─────────┐     │
               └────▸│Encoder 3│               │Decoder 3├─────┘
                     └────┬────┘               └─────────┘
                          │                         ▴
                          ├────────────────────────▸│
                          │                         │
                          │       ┌─────────┐       │
                          └──────▸│ Bridge  ├───────┘
                                  └─────────┘

```
