@testitem "Simple Stateful Tests" setup=[SharedTestSetup] tags=[:helpers] begin
    rng = get_stable_rng(12345)

    struct NotFixedStateModel <: Lux.AbstractExplicitLayer end

    (m::NotFixedStateModel)(x, ps, st) = (x, (; s=1))

    model = NotFixedStateModel()
    ps, st = Lux.setup(rng, model)

    @test st isa NamedTuple{()}

    smodel = StatefulLuxLayer{false}(model, ps, st)
    __display(smodel)
    @test_nowarn smodel(1)

    smodel = StatefulLuxLayer{true}(model, ps, st)
    __display(smodel)
    @test_throws ArgumentError smodel(1)
end
