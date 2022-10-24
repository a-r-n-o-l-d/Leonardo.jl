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

"""
Abstract type defining an ending character for `EndStyle` and `PathStyle`.
"""
abstract type AbstractEnd end

"""
Type used to define an `EndStyle` that will draw a normal line character.
"""
struct NoEnd <: AbstractEnd end

"""
Abstract type defining an arrow head character.
"""
abstract type AbstractArrow <: AbstractEnd end

"""
Type defining a black arrow head character for an `EndStyle`.

```julia
julia> Leonardo.char(BlackArrow, Left)
'◂': Unicode U+25C2 (category So: Symbol, other)
```
"""
struct BlackArrow <:AbstractArrow end

"""
Type defining a white arrow head character for an `EndStyle`.

```julia
julia> Leonardo.char(WhiteArrow, Left)
'◃': Unicode U+25C3 (category So: Symbol, other)
```
"""
struct WhiteArrow <:AbstractArrow end

"""
Type defining a bar character for an `EndStyle`.

```julia
julia> Leonardo.char(Bar, Left, Heavy)
'┣': Unicode U+2523 (category So: Symbol, other)
```
"""
struct Bar <: AbstractEnd end

"""
Abstract type defining a free character, i.e. a character without any surrounding
informations (no line size, no direction).
"""
abstract type AbstractFreeChar end

"""
Type defining a black rectangle character.

```julia
julia> Leonardo.char(BlackRectangle)
'▮': Unicode U+25AE (category So: Symbol, other)
```
"""
struct BlackRectangle <: AbstractFreeChar end

"""
Type defining a white rectangle character.

```julia
julia> Leonardo.char(WhiteRectangle)
'▯': Unicode U+25AF (category So: Symbol, other)
```
"""
struct WhiteRectangle <: AbstractFreeChar end

"""
Type defining a lozenge character.

```julia
julia> Leonardo.char(Lozenge)
'◊': Unicode U+25CA (category So: Symbol, other)
```
"""
struct Lozenge <: AbstractFreeChar end

"""
Type defining a large dot character.

```julia
julia> Leonardo.char(LargeDot)
'•': Unicode U+2022 (category Po: Punctuation, other)
```
"""
struct LargeDot <: AbstractFreeChar end

"""
Type defining a small dot character.

```julia
julia> Leonardo.char(SmallDot)
'∙': Unicode U+2219 (category Sm: Symbol, math)
```
"""
struct SmallDot <: AbstractFreeChar end
