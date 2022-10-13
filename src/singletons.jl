abstract type AbstractLineSize end

struct NoLine <: AbstractLineSize end

struct Light <: AbstractLineSize end

struct Heavy <: AbstractLineSize end

struct Double <: AbstractLineSize end

abstract type AbstractLineType end

struct Solid <: AbstractLineType end

struct Dashed1 <: AbstractLineType end

struct Dashed2 <: AbstractLineType end

struct Dashed3 <: AbstractLineType end

struct Half1 <: AbstractLineType end

struct Half2 <: AbstractLineType end

abstract type AbstractDirection end

struct Horizontal <: AbstractDirection end

struct Vertical <: AbstractDirection end

struct LineStyle{S<:AbstractLineSize,T<:AbstractLineType} end

LineStyle(::Type{S}, ::Type{T}) where {S,T} = LineStyle{S,T}

abstract type AbstractOrientation end

struct NoOrientation <: AbstractOrientation end

struct Left <: AbstractOrientation end

struct Up <: AbstractOrientation end

struct Right <: AbstractOrientation end

struct Down <: AbstractOrientation end

abstract type AbstractLineEnd end

struct NoLineEnd <: AbstractLineEnd end

struct BlackArrow{O<:AbstractOrientation} <: AbstractLineEnd end

BlackArrow(::Type{O}) where O = BlackArrow{O}

struct WhiteArrow{O<:AbstractOrientation} <: AbstractLineEnd end

WhiteArrow(::Type{O}) where O = WhiteArrow{O}

struct Bar{S<:AbstractLineSize,O<:AbstractOrientation} <: AbstractLineEnd end

Bar(::Type{S}, ::Type{O}) where {S,O} = Bar{S,O}

abstract type FreeChar end #<:AbstractLineEnd

struct BackRectangle <: FreeChar end

struct WhiteRectangle <: FreeChar end

struct Lozenge <: FreeChar end

struct LargeDot <: FreeChar end

struct SmallDot <: FreeChar end
