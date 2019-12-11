include("../src/Rank.jl")

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

@testset "Rank value" begin
    @test Rank("A").value == 1
    @test Rank("2").value == 2
    @test Rank("3").value == 3
    @test Rank("4").value == 4
    @test Rank("5").value == 5
    @test Rank("6").value == 6
    @test Rank("7").value == 7
    @test Rank("8").value == 8
    @test Rank("9").value == 9
    @test Rank("10").value == 10
    @test Rank("J").value == 10
    @test Rank("Q").value == 10
    @test Rank("K").value == 10
end

@testset "Rank ordinal" begin
    @test Rank("A").ordinal == 1
    @test Rank("2").ordinal == 2
    @test Rank("3").ordinal == 3
    @test Rank("4").ordinal == 4
    @test Rank("5").ordinal == 5
    @test Rank("6").ordinal == 6
    @test Rank("7").ordinal == 7
    @test Rank("8").ordinal == 8
    @test Rank("9").ordinal == 9
    @test Rank("10").ordinal == 10
    @test Rank("J").ordinal == 11
    @test Rank("Q").ordinal == 12
    @test Rank("K").ordinal == 13
end
