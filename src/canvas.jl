"""
    PrintStyle(; kwargs...)

Store keyword arguments paased to the [`printstyled`](@ref printstyled) function:
* bold: `false` by default
* color: `:normal` by default
* blink: `false` by default
* reverse: `false` by default
* hidden: `false` by default
* underline: `false` by default

For further details see [`printstyled`](@ref printstyled) documentation.
"""
struct PrintStyle
    style
end

function PrintStyle(; bold = false, color = :normal, blink = false, reverse = false,
                      hidden = false, underline = false)
    style = (
        bold = bold, color = color, blink = blink, reverse = reverse, hidden = hidden,
        underline = underline
    )
    PrintStyle(style)
end

"""
    Canvas(width, height; [bgchar = ' '], [defstyle = PrintStyle()])

Define a drawing area of size `width`x`height`, where width (resp. height) is the number of
characters along the X (resp. Y) axis. `bgchar` is the background character by default it is
a space. `defstyle` is the default `PrintStyle` used to print this `Canvas`.
The origin of coordinate system is the upper left character:
```julia-repl
┌─────────────────────────────────────────────────────────────────────────────▸X
│∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙
│∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙
│∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙
│∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙
│∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙
│∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙
│∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙
│∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙
│∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙
│∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙
│∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙
│∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙
│∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙
│∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙
│∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙
│∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙
│∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙
▾
Y
```
"""
struct Canvas
    chars::Matrix{Char}
    prstyles::Matrix{PrintStyle}
    width::Int
    height::Int
    bgchar::Char
    defstyle::PrintStyle
end

@inline chars(canvas) = canvas.chars

@inline prstyles(canvas) = canvas.prstyles

@inline width(canvas) = canvas.width

@inline height(canvas) = canvas.height

@inline bgchar(canvas) = canvas.bgchar

@inline defstyle(canvas) = canvas.defstyle

@inline coordinates(canvas) = Iterators.product(1:height(canvas), 1:width(canvas))

@inline function coordinates(P, width, height)
    x, y = P
    Iterators.product(y:(y + height - 1), x:(x + width - 1))
end

function Canvas(width, height; bgchar = ' ', defstyle = PrintStyle())
    chars = Matrix{Char}(undef, width + 1, height)
    chars[1:width,1:height] .= bgchar
    chars[width + 1, 1:height] .= '\n'
    prstyles = fill(defstyle, width + 1, height)
    Canvas(chars, prstyles, width, height, bgchar, defstyle)
end

function Base.print(io::IO, canvas::Canvas)
    for (ch, ps) in zip(canvas.chars, canvas.prstyles)
        printstyled(io, ch; ps.style...)
    end
end

function Base.show(io::IO, canvas::Canvas)
    print(io, canvas)
end

function drawchar!(canvas::Canvas, P, c::Char, prstyle = defstyle(canvas))
    x, y = P
    0 < x ≤ canvas.width && 0 < y ≤ canvas.height || error("Attempting to draw outside the canvas frame.")
    @inbounds canvas.chars[x, y] = c
    @inbounds canvas.prstyles[x, y] = prstyle
    canvas
end

function drawchar!(canvas::Canvas, P, c::Type{C},
                   prstyle = defstyle(canvas)) where C<:AbstractFreeChar
    drawchar!(canvas::Canvas, P, char(c), prstyle)
    canvas
end

function reset!(canvas)
    for (y,x) in coordinates(canvas) #Iterators.product(1:canvas.height, 1:canvas.width) #y in 1:canvas.height, x in 1:canvas.width
        @inbounds chars(canvas)[x,y] = bgchar(canvas)
        @inbounds prstyles(canvas)[x,y] = defstyle(canvas)
    end
    canvas
end

function Base.fill!(canvas, char, prstyle = defstyle(canvas))
    for (y,x) in coordinates(canvas) #y in 1:canvas.height, x in 1:canvas.width #OneTo(canvas.height)
        drawchar!(canvas::Canvas, (x,y), char, prstyle)
    end
    canvas
end

function Base.fill!(canvas, P, width, height, char, prstyle = defstyle(canvas))
    for (y,x) in coordinates(P, width, height) #y in y1:height, x in x1:width #OneTo(canvas.height)
        drawchar!(canvas::Canvas, (x,y), char, prstyle)
    end
    canvas
end

############################################################################################
#                                   INTERNAL FUNCTIONS                                     #
############################################################################################

@inline function _empty_chars(width, height)
    chars = Matrix{Char}(undef, width + 1, height)
    chars[1:width,1:height] .= BLANK_CHAR
    chars[width + 1, 1:height] .= '\n'
    chars
end

@inline function _empty_pstyles(width, height)
    fill(DEFAULT_PRSTYLE, width + 1, height)
end

function _canvas_doc()
    c = Canvas(80, 20)
    fill!(c, (2,2), 77, 17, SmallDot)
    pstyle = PathStyle(NoEnd, BlackArrow)
    drawpath!(c, (1,1), 78, Horizontal, pstyle)
    drawpath!(c, (1,1), 18, Vertical, pstyle)
    bc = biconnector(Down, LineStyle(), Right, LineStyle())
    drawconnector!(c, (1,1), bc)
    drawchar!(c, (1,20), 'Y', PrintStyle())
    drawchar!(c, (80,1), 'X', PrintStyle())
end
