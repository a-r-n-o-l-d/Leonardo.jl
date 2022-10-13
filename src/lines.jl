"""
    Line(x, y, length, D; style = LineStyle(Light, Solid), crayon = Crayon())
"""
struct Line{D<:AbstractDirection,S<:LineStyle}
    x1
    y1
    x2
    y2
    pstyle
end

function Line(P, length, ::Type{D}; style::Type{S} = LineStyle(Light, Solid),
              pstyle = DEFAULT_PSTYLE) where {D,S}
    x, y = P
    x1, y1, x2, y2 = _line_cart_idx(D, x, y, length)
    Line{D,S}(x1, y1, x2, y2, pstyle)
end

@inline function _line_cart_idx(::Type{Horizontal}, x, y, length)
    if length > 0
        x, y, x + length - 1, y
    else
        x + length + 1, y, x , y
    end
end

function _line_cart_idx(::Type{Vertical}, x, y, length)
    if length > 0
        x, y, x, y + length - 1
    else
        x, y + length + 1, x, y
    end
end

function draw!(canvas::Canvas, line::Line{D,S}) where {D,S}
    #isin(canvas, line.x1, line.y1)
    #isin(canvas, line.x2, line.y2)
    c = char(D, S)
    for y in line.y1:line.y2, x in line.x1:line.x2
        print!(canvas, c, line.pstyle, x, y)
    end
    canvas
end

#=
struct Path{S<:LineStyle,L<:AbstractLineEnd}
    lines
    corners
    bchar
    echar
    pstyle
end

Path([(x1,y1), (x2,y2)], ::Type{S}; style::Type{S} = LineStyle(Light, Solid), pstyle = DEFAULT_PSTYLE)
=#
struct LineEnd{L<:Union{AbstractLineEnd,FreeChar},
               S<:AbstractLineSize,O<:AbstractOrientation}
    x
    y
    pstyle
end

function LineEnd(P, ::Type{L}, ::Type{O} = NoOrientation, ::Type{S} = NoLine;
        pstyle = DEFAULT_PSTYLE) where {L,S,O}
    LineEnd{L,S,O}(P..., pstyle)
end

function draw!(canvas::Canvas, lend::LineEnd{L,S,O}
    ) where {L<:Union{BlackArrow,WhiteArrow},S,O}
    print!(canvas, char(L(O)), lend.pstyle, lend.x, lend.y)
    canvas
end

function draw!(canvas::Canvas, lend::LineEnd{L,S,O}
        ) where {L<:Bar,S,O}
    print!(canvas, char(L(S, O)), lend.pstyle, lend.x, lend.y)
    canvas
end

function draw!(canvas::Canvas, lend::LineEnd{L,S,O}
        ) where {L<:Bar,S,O}
    print!(canvas, char(L(S, O)), lend.pstyle, lend.x, lend.y)
    canvas
end

function draw!(canvas::Canvas, lend::LineEnd{L,S,O}
        ) where {L<:FreeChar,S,O}
    print!(canvas, char(L), lend.pstyle, lend.x, lend.y)
    canvas
end

function draw!(canvas::Canvas, ::LineEnd{NoLineEnd})
    canvas
end
