include("../src/parse.jl")
include("../src/Card.jl")

using Test

@testset "Parse" begin
    @testset "Parse card rank" begin
        @test parsecard("5H") == Card("5")
    end
end
