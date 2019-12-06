using Test

const testdir = dirname(@__FILE__)

tests = filter(f -> startswith(f, "test_"), readdir(testdir))

@testset "All tests" begin
    for test in tests
        test_path = joinpath(testdir, test)
        include(test_path)
    end
end
