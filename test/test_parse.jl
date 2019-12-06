include("../src/parse.jl")

using Test

@testset "Parse" begin
    @test parse_card("5H") == Card("5")
end
