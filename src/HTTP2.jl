module HTTP2

const Headers = Vector{Tuple{String,String}}
const Maybe{T} = Union{Nothing, T} where {T}

Base.convert(::Type{Headers}, d::Dict) = [(a,b) for (a,b) in d]

bytearr(a::Vector{UInt8}) = a
bytearr(cs::Base.CodeUnits{UInt8,String}) = convert(Vector{UInt8}, cs)
bytearr(s::String) = bytearr(codeunits(s))

include("Frame.jl")
include("Session.jl")

end # module HTTP2
