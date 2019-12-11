include("../src/Card.jl")

using Test

@testset "Valid rank" begin
    @test is_valid_suite('H') == true
    @test is_valid_suite('C') == true
    @test is_valid_suite('S') == true
    @test is_valid_suite('D') == true
end

@testset "Invalid suite" begin
    @test is_valid_suite('F') == false
    @test is_valid_suite('1') == false
end
