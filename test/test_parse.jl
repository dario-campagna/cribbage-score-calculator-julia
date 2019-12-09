include("../src/parse.jl")
include("../src/Card.jl")

using Test

@testset "Parse" begin
    @testset "Parse card rank" begin
        @test parsecard("5H") == Card("5")
        @test parsecard("AH") == Card("A")
        @test parsecard("0H") == Card("10")
    end
end
