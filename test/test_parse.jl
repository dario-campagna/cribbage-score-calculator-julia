include("../src/parse.jl")

using Test

@testset "Parse card" begin
    @testset "From card string to internal representation" begin
        @test parsecard("5H") == Card(Rank("5"), HEARTS)
         @test parsecard("AD") == Card(Rank("A"), DIAMONDS)
         @test parsecard("0C") == Card(Rank("10"), CLUBS)
         @test parsecard("KS") == Card(Rank("K"), SPADES)
    end

    @testset "Invalid rank" begin
        @test_throws ErrorException("Unrecognized rank X in card XC") parsecard("XC")
    end

    @testset "Invalid suite" begin
        @test_throws ErrorException("Unrecognized suite Y in card 5Y") parsecard("5Y")
    end
end

@testset "Parse hand" begin
    expected = CribbageHand(
        [
            Card(Rank("5"), HEARTS),
            Card(Rank("7"), DIAMONDS),
            Card(Rank("4"), CLUBS),
            Card(Rank("A"), SPADES),
        ],
        Card(Rank("8"), CLUBS)
    )
    actual = parsehand("5H7D4CAS8C")
    @test actual.cards_in_hand == expected.cards_in_hand
    @test actual.starter_card == expected.starter_card
end
