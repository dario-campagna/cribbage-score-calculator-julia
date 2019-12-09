include("../src/parse.jl")
include("../src/Card.jl")

using Test

@testset "Parse" begin
    @testset "Parse card rank" begin
        @test parsecard("5H") == Card(Rank("5"))
        @test parsecard("AH") == Card(Rank("A"))
        @test parsecard("0H") == Card(Rank("10"))
    end

    @testset "Invalid rank" begin
        @test_throws ErrorException("Unrecognized rank X in card XC") parsecard("XC")
    end
end
