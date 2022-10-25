"""
    drawtext!(canvas, (x,y), text, ori, [prstyle = defstyle(canvas)])

Draw a string `text` string at location `(x,y)`. `ori` indicates the text orientation,
either `Horizontal` or `Vertical`. `prstyle` defines the print style for REPL rendering.

# Example

```julia-repl
julia> c = Canvas(80, 15);

julia> drawtext!(c, (5,10), "So Long,\nand Thanks for All the Fish", Horizontal);

julia> ps = PrintStyle(color = :red, blink = true);

julia> drawtext!(c, (60,1), "Mostly Harmless", Vertical, ps);

julia> c
                                                           M
                                                           o
                                                           s
                                                           t
                                                           l
                                                           y

                                                           H
                                                           a
    So Long,                                               r
    and Thanks for All the Fish                            m
                                                           l
                                                           e
                                                           s
                                                           s


```
"""
function drawtext!(canvas, P, text, ::Type{O}, prstyle = defstyle(canvas)) where O
    lines = split(text, '\n')
    _drawtextlines!(canvas, P, lines, O, prstyle)
end

"""

drawboxtext!(canvas, (x,y), text, ori, bstyle, [prstyle = defstyle(canvas)])

Similar to [`drawtext!`], but with a bounding box defined by the boxstyle `bstyle`.

See also [`drawtext!`](@ref) and [`BoxStyle`](@ref).

# Example

```julia-repl
julia> c = Canvas(80, 8);

julia> bs = BoxStyle(LineStyle(Heavy))
BoxStyle{LineStyle{Heavy, Solid}, LineStyle{Light, Solid}, LineStyle{Heavy, Solid}, LineStyle{Light, Solid}}

julia> drawboxtext!(c, (5,5), "The Hitchhiker's Guide\nto the Galaxy", Horizontal, bs)



   ┎──────────────────────┒
   ┃The Hitchhiker's Guide┃
   ┃to the Galaxy         ┃
   ┖──────────────────────┚



```
"""
function drawboxtext!(canvas, P, text, ::Type{O}, ::Type{B} = BoxStyle(),
                    prstyle = defstyle(canvas)) where {O,B}
    lines = split(text, '\n')
    Pb, w, h = _boxtext(P, lines, O)
    drawbox!(canvas, Pb, w, h, B, prstyle)
    _drawtextlines!(canvas, P, lines, O, prstyle)
end

############################################################################################
#                                   INTERNAL FUNCTIONS                                     #
############################################################################################

function _drawtextlines!(canvas, P, lines, ::Type{O}, prstyle) where O
    for l in lines
        xr, yr = _line_cart_idx(O, P, length(l))
        for ((y, x), c) in zip(Iterators.product(yr, xr), l)
            drawchar!(canvas, (x, y), c, prstyle)
        end
        P = _inc_position(P, O)
    end
    canvas
end

function _inc_position(P, ::Type{Horizontal})
    x, y = P
    x, y + 1
end

function _inc_position(P, ::Type{Vertical})
    x, y = P
    x + 1, y
end

function _boxtext(P, lines, ::Type{Horizontal})
    w = maximum(length.(lines)) + 2
    h = length(lines) + 2
    x, y = P
    (x - 1, y - 1), w, h
end

function _boxtext(P, lines, ::Type{Vertical})
    w = length(lines) + 2
    h = maximum(length.(lines)) + 2
    x, y = P
    (x - 1, y - 1), w, h
end
