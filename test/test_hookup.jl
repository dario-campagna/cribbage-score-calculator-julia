include("../src/hookup.jl")

using Test

@testset "Hookup test" begin
    @test do_something() == 1
end