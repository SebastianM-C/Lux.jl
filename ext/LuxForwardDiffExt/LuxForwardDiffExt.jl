module LuxForwardDiffExt

using ArgCheck: @argcheck
using ADTypes: AutoForwardDiff
using ChainRulesCore: ChainRulesCore
using Lux: Lux, get_device
using FastClosures: @closure
using ForwardDiff: ForwardDiff
using Functors: fmap
using OhMyThreads: @tasks

const CRC = ChainRulesCore

@inline Lux._is_extension_loaded(::Val{:ForwardDiff}) = true

include("utils.jl")

include("jvp.jl")
include("nested_ad.jl")
include("batched_ad.jl")

end
