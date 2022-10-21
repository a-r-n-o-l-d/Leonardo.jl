abstract type AbstractLineSize end

struct NoLine <: AbstractLineSize end #<: AbstractLineSize

struct Light <: AbstractLineSize end

struct Heavy <: AbstractLineSize end

struct Double <: AbstractLineSize end

abstract type AbstractLineType end

struct Solid <: AbstractLineType end #<: AbstractLineType

struct Dashed1 <: AbstractLineType end

struct Dashed2 <: AbstractLineType end

struct Dashed3 <: AbstractLineType end

struct Half1 <: AbstractLineType end

struct Half2 <: AbstractLineType end

abstract type AbstractOrientation end

struct Horizontal end #<: AbstractOrientation

struct Vertical end

#struct LineStyle{S<:AbstractLineSize,T<:AbstractLineType} end

#LineStyle(::Type{S}, ::Type{T}) where {S,T} = LineStyle{S,T}

#linesize(::Type{LineStyle{S,T}}) where {S,T} = S

abstract type AbstractDirection end

struct NoDirection <: AbstractDirection end #

struct Left <: AbstractDirection end

struct Up <: AbstractDirection end

struct Right <: AbstractDirection end

struct Down <: AbstractDirection end

abstract type AbstractEnd end

struct NoEnd end #<: AbstractEnd

abstract type AbstractArrow <: AbstractEnd end

struct BlackArrow <:AbstractArrow end #{O<:AbstractOrientation} <: AbstractEnd

#BlackArrow(::Type{O}) where O = BlackArrow{O}

struct WhiteArrow <:AbstractArrow end #{O<:AbstractOrientation} <: AbstractEnd

#WhiteArrow(::Type{O}) where O = WhiteArrow{O}

struct Bar end #{S<:AbstractLineSize,O<:AbstractOrientation} <: AbstractEnd

#Bar(::Type{S}, ::Type{O}) where {S,O} = Bar{S,O}

abstract type AbstractFreeChar end #<:AbstractLineEnd

struct BackRectangle <: AbstractFreeChar end

struct WhiteRectangle <: AbstractFreeChar end

struct Lozenge <: AbstractFreeChar end

struct LargeDot <: AbstractFreeChar end

struct SmallDot <: AbstractFreeChar end
