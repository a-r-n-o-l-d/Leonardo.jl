using Leonardo
using Test
using Aqua
using JET

const LSIZES = (Light, Heavy, Double)

const LTYPES = (Dashed1, Dashed2, Dashed3, Half1, Half2)

const ARROWS = (BlackArrow, WhiteArrow)

const FREECHARS = (BlackRectangle, WhiteRectangle, Lozenge, LargeDot, SmallDot)

const LENDS = (Bar, ARROWS..., FREECHARS...)

const LDIRS = (Left, Up, Right, Down)

const CANVAS1 = Canvas(80, 20; bgchar = '.')

const CANVAS2 = Canvas(20, 10; bgchar = '.')

function test_canvas_output(canvas, expected)
    io = IOBuffer()
    print(io, canvas)
    cs = String(take!(io))
    @test cs == expected
end

@testset verbose = true "Leonardo.jl" begin
    @testset verbose = true "Code quality" begin
        @testset verbose = true "Aqua" begin
            Aqua.test_all(Leonardo)
        end
        @testset verbose = true "JET" begin
            JET.test_package(Leonardo; target_defined_modules=true)
        end
    end

    @testset verbose = true "charset" begin
        include("charset.jl")
    end

    @testset verbose = true "canvas" begin
        include("canvas.jl")
    end

    @testset verbose = true "lines" begin
        include("lines.jl")
    end

    @testset verbose = true "connectors" begin
        include("connectors.jl")
    end

    @testset verbose = true "boxes" begin
        include("boxes.jl")
    end

    @testset verbose = true "paths" begin
        include("paths.jl")
    end

    @testset verbose = true "texts" begin
        include("texts.jl")
    end
end
