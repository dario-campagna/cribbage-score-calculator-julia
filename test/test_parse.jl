include("../src/parse.jl")

using Test

@testset "Parse card" begin
    @testset "From card string to internal representation" begin
        @test parse_card("5H") == Card(Rank("5"), HEARTS)
        @test parse_card("AD") == Card(Rank("A"), DIAMONDS)
        @test parse_card("0C") == Card(Rank("10"), CLUBS)
        @test parse_card("KS") == Card(Rank("K"), SPADES)
    end

    @testset "Invalid rank" begin
        @test_throws ErrorException("Unrecognized rank X in card XC") parse_card("XC")
    end

    @testset "Invalid suite" begin
        @test_throws ErrorException("Unrecognized suite Y in card 5Y") parse_card("5Y")
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
    actual = parse_hand("5H7D4CAS8C")
    @test actual.cards_in_hand == expected.cards_in_hand
    @test actual.starter_card == expected.starter_card
end
