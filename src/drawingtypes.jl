"""
Abstract type defining the drawing size of a line. Subtypes are:
* NoLine
* Light
* Heavy
* Double
"""
abstract type AbstractLineSize end

"""
Type defining a missing line, mainly used by
['ConnectorStyle'](@see Leonardo.ConnectorStyle).
"""
struct NoLine <: AbstractLineSize end

"""
Type defining a light sized line.

```julia
julia> c = Canvas(10, 1);

julia> drawline!(c, (1,1), 10, Horizontal, LineStyle(Light))
──────────

```
"""
struct Light <: AbstractLineSize end

"""
Type defining a heavy sized line.

```julia
ulia> c = Canvas(10, 1);

julia> drawline!(c, (1,1), 10, Horizontal, LineStyle(Heavy))
━━━━━━━━━━

```
"""
struct Heavy <: AbstractLineSize end

"""
Type defining a double sized line.

```julia
julia> c = Canvas(10, 1);

julia> drawline!(c, (1,1), 10, Horizontal, LineStyle(Double))
══════════

```
"""
struct Double <: AbstractLineSize end

"""
Abstract type defining the type of line. Subtypes are:
* Solid
* Dashed1
* Dashed2
* Dashed3
* Half1
* Half2
"""
abstract type AbstractLineType end

"""
Type defining a solid line.

```julia
julia> c = Canvas(10, 1);

julia> drawline!(c, (1,1), 10, Horizontal, LineStyle(Light, Solid))
──────────

```
"""
struct Solid <: AbstractLineType end

"""
Type defining a dashed line.

```julia
julia> c = Canvas(10, 1);

julia> drawline!(c, (1,1), 10, Horizontal, LineStyle(Light, Dashed1))
┄┄┄┄┄┄┄┄┄┄

```
"""
struct Dashed1 <: AbstractLineType end

"""
Type defining a dashed line.

```julia
julia> c = Canvas(10, 1);

julia> drawline!(c, (1,1), 10, Horizontal, LineStyle(Light, Dashed2))
┈┈┈┈┈┈┈┈┈┈

```
"""
struct Dashed2 <: AbstractLineType end

"""
Type defining a dashed line.

```julia
julia> c = Canvas(10, 1);

julia> drawline!(c, (1,1), 10, Horizontal, LineStyle(Light, Dashed3))
╌╌╌╌╌╌╌╌╌╌

```
"""
struct Dashed3 <: AbstractLineType end

"""
Type defining a half line type at the left for horizontal lines, or at the top for vertical
lines.

```julia
julia> c = Canvas(10, 1);

julia> drawline!(c, (1,1), 10, Horizontal, LineStyle(Light, Half1))
╴╴╴╴╴╴╴╴╴╴

```
"""
struct Half1 <: AbstractLineType end

"""
Type defining a half line type at right left for horizontal lines, or at the bottom for
vertical lines.

```julia
julia> c = Canvas(10, 1);

julia> drawline!(c, (1,1), 10, Horizontal, LineStyle(Light, Half2))
╶╶╶╶╶╶╶╶╶╶

```
"""
struct Half2 <: AbstractLineType end




struct Horizontal end #<: AbstractOrientation #abstract type AbstractOrientation end

struct Vertical end



abstract type AbstractDirection end

struct NoDirection <: AbstractDirection end #

struct Left <: AbstractDirection end

struct Up <: AbstractDirection end

struct Right <: AbstractDirection end

struct Down <: AbstractDirection end


abstract type AbstractEnd end

struct NoEnd <: AbstractEnd end #<: AbstractEnd

abstract type AbstractArrow <: AbstractEnd end

struct BlackArrow <:AbstractArrow end #{O<:AbstractOrientation} <: AbstractEnd

#BlackArrow(::Type{O}) where O = BlackArrow{O}

struct WhiteArrow <:AbstractArrow end #{O<:AbstractOrientation} <: AbstractEnd

#WhiteArrow(::Type{O}) where O = WhiteArrow{O}

struct Bar <: AbstractEnd end #{S<:AbstractLineSize,O<:AbstractOrientation} <: AbstractEnd

#Bar(::Type{S}, ::Type{O}) where {S,O} = Bar{S,O}


abstract type AbstractFreeChar end #<:AbstractLineEnd

struct BlackRectangle <: AbstractFreeChar end

struct WhiteRectangle <: AbstractFreeChar end

struct Lozenge <: AbstractFreeChar end

struct LargeDot <: AbstractFreeChar end

struct SmallDot <: AbstractFreeChar end
