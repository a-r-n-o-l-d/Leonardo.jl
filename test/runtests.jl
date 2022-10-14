using Leonardo
using Test
using Aqua

@testset verbose = true "Leonardo.jl" begin
    @testset verbose = true "Code quality" begin
        @testset verbose = true "Aqua" begin
            Aqua.test_all(Leonardo)
        end
    end
end
