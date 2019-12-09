include("../src/parse.jl")
include("../src/Card.jl")

using Test

@testset "Parse" begin
    @testset "Parse card" begin
        @test parsecard("5H") == Card(Rank("5"), HEARTS)
        @test parsecard("AH") == Card(Rank("A"), HEARTS)
        @test parsecard("0H") == Card(Rank("10"), HEARTS)
    end

    @testset "Invalid rank" begin
        @test_throws ErrorException("Unrecognized rank X in card XC") parsecard("XC")
    end

    @testset "Invalid suite" begin
        @test_throws ErrorException("Unrecognized suite Y in card 5Y") parsecard("5Y")
    end
end
