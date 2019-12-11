include("../src/score.jl")

using Test

@testset "Points for pairs" begin
    one_pair = CribbageHand(
        [
            Card(Rank("10"), HEARTS),
            Card(Rank("4"), HEARTS),
            Card(Rank("10"), CLUBS),
            Card(Rank("2"), SPADES)
        ],
        Card(Rank("A"), HEARTS))
    @test points_for_pairs(one_pair) == 2

    two_pairs = CribbageHand(
        [
            Card(Rank("10"), HEARTS),
            Card(Rank("2"), HEARTS),
            Card(Rank("10"), CLUBS),
            Card(Rank("2"), SPADES)
        ],
        Card(Rank("A"), HEARTS))
    @test points_for_pairs(two_pairs) == 4

    three_cards_of_a_kind = CribbageHand(
        [
            Card(Rank("10"), HEARTS),
            Card(Rank("2"), HEARTS),
            Card(Rank("10"), CLUBS),
            Card(Rank("10"), SPADES)
        ],
        Card(Rank("A"), HEARTS))
    @test points_for_pairs(three_cards_of_a_kind) == 6
end

@testset "Points for flush" begin
    flush_hand = CribbageHand(
        [
            Card(Rank("2"), DIAMONDS),
            Card(Rank("4"), DIAMONDS),
            Card(Rank("10"), DIAMONDS),
            Card(Rank("8"), DIAMONDS)
        ],
        Card(Rank("A"), HEARTS)
    )
    @test points_for_flush(flush_hand) == 4

    all_same_suite = CribbageHand(
        [
            Card(Rank("2"), DIAMONDS),
            Card(Rank("4"), DIAMONDS),
            Card(Rank("10"), DIAMONDS),
            Card(Rank("8"), DIAMONDS)
        ],
        Card(Rank("A"), DIAMONDS)
    )
    @test points_for_flush(all_same_suite) == 5

    has_is_nib = CribbageHand(
        [
            Card(Rank("2"), DIAMONDS),
            Card(Rank("4"), CLUBS),
            Card(Rank("J"), DIAMONDS),
            Card(Rank("8"), DIAMONDS)
        ],
        Card(Rank("A"), DIAMONDS)
    )
    @test points_for_flush(has_is_nib) == 1
end

@testset "Points for fifteen-twos" begin
    one_fifteen_two = CribbageHand(
        [
            Card(Rank("10"), DIAMONDS),
            Card(Rank("5"), CLUBS),
            Card(Rank("3"), DIAMONDS),
            Card(Rank("A"), DIAMONDS)
        ],
        Card(Rank("8"), DIAMONDS)
    )
    @test points_for_fifteen_twos(one_fifteen_two) == 2
end

@testset "Points for runs" begin
    run_of_five = CribbageHand(
        [
            Card(Rank("9"), DIAMONDS),
            Card(Rank("10"), CLUBS),
            Card(Rank("J"), SPADES),
            Card(Rank("Q"), DIAMONDS)
        ],
        Card(Rank("K"), DIAMONDS)
    )
    @test points_for_runs(run_of_five) == 5

    run_of_four = CribbageHand(
        [
            Card(Rank("2"), DIAMONDS),
            Card(Rank("10"), CLUBS),
            Card(Rank("J"), SPADES),
            Card(Rank("Q"), DIAMONDS)
        ],
        Card(Rank("K"), DIAMONDS)
    )
    @test points_for_runs(run_of_four) == 4

    run_of_three = CribbageHand(
        [
            Card(Rank("5"), DIAMONDS),
            Card(Rank("3"), CLUBS),
            Card(Rank("6"), SPADES),
            Card(Rank("A"), DIAMONDS)
        ],
        Card(Rank("7"), DIAMONDS)
    )
    @test points_for_runs(run_of_three) == 3

    runs_of_three = CribbageHand(
        [
            Card(Rank("5"), DIAMONDS),
            Card(Rank("5"), CLUBS),
            Card(Rank("6"), SPADES),
            Card(Rank("A"), DIAMONDS)
        ],
        Card(Rank("7"), DIAMONDS)
    )
    @test points_for_runs(runs_of_three) == 6
end

@testset "Score" begin
    fifteen_sixteen_and_six_pairs = CribbageHand(
        [
            Card(Rank("5"), DIAMONDS),
            Card(Rank("5"), CLUBS),
            Card(Rank("5"), DIAMONDS),
            Card(Rank("10"), DIAMONDS)
        ],
        Card(Rank("5"), DIAMONDS)
    )
    @test score(fifteen_sixteen_and_six_pairs) == 28

    double_run = CribbageHand(
        [
            Card(Rank("5"), DIAMONDS),
            Card(Rank("5"), CLUBS),
            Card(Rank("6"), DIAMONDS),
            Card(Rank("A"), DIAMONDS)
        ],
        Card(Rank("7"), DIAMONDS)
    )
    @test score(double_run) == 8

    triple_run = CribbageHand(
        [
            Card(Rank("2"), DIAMONDS),
            Card(Rank("2"), CLUBS),
            Card(Rank("3"), DIAMONDS),
            Card(Rank("4"), DIAMONDS)
        ],
        Card(Rank("2"), DIAMONDS)
    )
    @test score(triple_run) == 15

    double_double_run = CribbageHand(
        [
            Card(Rank("4"), DIAMONDS),
            Card(Rank("2"), CLUBS),
            Card(Rank("3"), DIAMONDS),
            Card(Rank("4"), DIAMONDS)
        ],
        Card(Rank("3"), DIAMONDS)
    )
    @test score(double_double_run) == 16

    highest = CribbageHand(
        [
            Card(Rank("5"), DIAMONDS),
            Card(Rank("5"), CLUBS),
            Card(Rank("5"), DIAMONDS),
            Card(Rank("J"), DIAMONDS)
        ],
        Card(Rank("5"), DIAMONDS)
    )
    @test score(highest) == 29
end
