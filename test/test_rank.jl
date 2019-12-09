include("../src/Card.jl")

using Test

@testset "Valid rank" begin
    @test isvalidrank("A") == true
    @test isvalidrank("2") == true
    @test isvalidrank("3") == true
    @test isvalidrank("4") == true
    @test isvalidrank("5") == true
    @test isvalidrank("6") == true
    @test isvalidrank("7") == true
    @test isvalidrank("8") == true
    @test isvalidrank("9") == true
    @test isvalidrank("10") == true
    @test isvalidrank("J") == true
    @test isvalidrank("Q") == true
    @test isvalidrank("K") == true
end

@testset "Invalid rank" begin
    @test isvalidrank("X") == false
    @test isvalidrank("1") == false
end
