include("../src/Card.jl")

using Test

@testset "Valid rank" begin
    @test isvalidsuite('H') == true
    @test isvalidsuite('C') == true
    @test isvalidsuite('S') == true
    @test isvalidsuite('D') == true
end

@testset "Invalid suite" begin
    @test isvalidsuite('F') == false
    @test isvalidsuite('1') == false
end
