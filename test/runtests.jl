using Leonardo
using Test
using Aqua
using JET

@testset verbose = true "Leonardo.jl" begin
    @testset verbose = true "Code quality" begin
        @testset verbose = true "Aqua" begin
            Aqua.test_all(Leonardo)
        end
    end
    @testset verbose = true "charset" begin
        include("charset.jl")
    end
end
