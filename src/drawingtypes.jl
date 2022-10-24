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

"""
Type defining a line with a horizontal orientation. See [`drawline!`](@ref drawline!) or
[`drawpath!`](@ref drawpath!) for usage.
"""
struct Horizontal end

"""
Type defining a line with a vertical orientation. See [`drawline!`](@ref drawline!) or
[`drawpath!`](@ref drawpath!) for usage.
"""
struct Vertical end


"""
Abstract type defining a direction, used to define the surroundings of a `ConnectorStyle`,
to define the `EndStyle` to draw paths, and to define the `BoxStyle` to draw boxes.
"""
abstract type AbstractDirection end

"""
Type defining no specific direction, only used by `EndStyle` for mutiple dispatch
convenience.
"""
struct NoDirection <: AbstractDirection end

"""
Type defining a left direction, used to define the surroundings of a `ConnectorStyle`, to
define the `EndStyle` to draw paths, and to define the `BoxStyle` to draw boxes.
"""
struct Left <: AbstractDirection end

"""
Type defining an up direction, used to define the surroundings of a `ConnectorStyle`, to
define the `EndStyle` to draw paths, and to define the `BoxStyle` to draw boxes.
"""
struct Up <: AbstractDirection end

"""
Type defining a right direction, used to define the surroundings of a `ConnectorStyle`, to
define the `EndStyle` to draw paths, and to define the `BoxStyle` to draw boxes.
"""
struct Right <: AbstractDirection end

"""
Type defining a down direction, used to define the surroundings of a `ConnectorStyle`, to
define the `EndStyle` to draw paths, and to define the `BoxStyle` to draw boxes.
"""
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
