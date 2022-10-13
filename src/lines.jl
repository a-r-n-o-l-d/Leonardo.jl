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

function draw!(canvas::Canvas, lend::LineEnd{Bar,S,O}) where {S,O}
    print!(canvas, char(Bar(S, O)), lend.pstyle, lend.x, lend.y)
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

struct Path
    lines
    corners
    lends
end

function Path(P1::Tuple, P2::Tuple, ::Type{D};
        style1::Type{LineStyle{S1,T1}} = LineStyle(Light, Solid),
        style2::Type{LineStyle{S2,T2}} = style1,
        lend1::Type{L1} = NoLineEnd,
        lend2::Type{L2} = NoLineEnd,
        pstyle = DEFAULT_PSTYLE) where {D,S1,T1,S2,T2,L1,L2}
    lines, corners, lends = _path(P1, P2, style1, style2, D, L1, L2, pstyle)
    Path(lines, corners, lends)
end

function Path(P::Tuple, length::Int, ::Type{D};
              style::Type{LineStyle{S,T}} = LineStyle(Light, Solid),
              lend1::Type{L1} = NoLineEnd,
              lend2::Type{L2} = NoLineEnd,
              pstyle = DEFAULT_PSTYLE) where {D<:Vertical,S,T,L1,L2}
    x1, y1 = P
    y2 = y1 + length
    Path(P, (x1, y2), D; style1 = style, lend1 = lend1, lend2 = lend2, pstyle = pstyle)
end

function Path(P::Tuple, length::Int, ::Type{D};
            style::Type{LineStyle{S,T}} = LineStyle(Light, Solid),
            lend1::Type{L1} = NoLineEnd,
            lend2::Type{L2} = NoLineEnd,
            pstyle = DEFAULT_PSTYLE) where {D<:Horizontal,S,T,L1,L2}
    x1, y1 = P
    x2 = x1 + length
    Path(P, (x2, y1), D; style1 = style, lend1 = lend1, lend2 = lend2, pstyle = pstyle)
end

function Leonardo.draw!(canvas::Canvas, path::Path)
    for l in path.lines
        draw!(canvas, l)
    end
    for c in path.corners
        draw!(canvas, c)
    end
    for e in path.lends
        draw!(canvas, e)
    end
    canvas
end

function _path(P1, P2,
        style1::Type{LineStyle{S1,T1}},
        style2::Type{LineStyle{S2,T2}},
        ::Type{Vertical},
        ::Type{L1},
        ::Type{L2},
        pstyle) where {S1,T1,S2,T2,L1,L2}
    x1, y1 = P1
    x2, y2 = P2
    Δx = x2 - x1
    Δy = y2 - y1
    Δy == 0 && error("Impossible to define a Vertical line from ($x1,$y1) to ($x2,$y2).")
    lines = []
    corners = []
    lends = []
    if Δx == 0
        push!(lines, Line((x1, y1), Δy + 1, Vertical; style = style1, pstyle = pstyle))
        if Δy < 0
            push!(lends, LineEnd((x1, y1), L1, Down, S1))
            push!(lends, LineEnd((x2, y2), L2, Up, S2))
        else
            push!(lends, LineEnd((x1, y1), L1, Up, S1))
            push!(lends, LineEnd((x2, y2), L2, Down, S2))
        end
    else
        push!(lines, Line((x1, y1), Δy, Vertical; style = style1, pstyle = pstyle))
        if Δx < 0 && Δy < 0
            push!(lines, Line((x1 - 1, y2), Δx, Horizontal; style = style2, pstyle = pstyle))
            push!(corners, UpperRightCorner((x1, y2), S2, S1; pstyle = pstyle))
            push!(lends, LineEnd((x1, y1), L1, Down, S1))
            push!(lends, LineEnd((x2, y2), L2, Left, S2))
        elseif Δx > 0 && Δy > 0
            push!(lines, Line((x1 + 1, y2), Δx, Horizontal; style = style2, pstyle = pstyle))
            push!(corners, BottomLeftCorner((x1, y2), S1, S2; pstyle = pstyle))
            push!(lends, LineEnd((x1, y1), L1, Up, S1))
            push!(lends, LineEnd((x2, y2), L2, Right, S2))
        elseif Δx > 0 && Δy < 0
            push!(lines, Line((x1 + 1, y2), Δx, Horizontal; style = style1, pstyle = pstyle))
            push!(corners, UpperLeftCorner((x1, y2), S2, S1; pstyle = pstyle))
            push!(lends, LineEnd((x1, y1), L1, Down, S1))
            push!(lends, LineEnd((x2, y2), L2, Right, S2))
        elseif Δx < 0 && Δy > 0
            push!(lines, Line((x1 - 1, y2), Δx, Horizontal; style = style2, pstyle = pstyle))
            push!(corners, BottomRightCorner((x1, y2), S1, S2; pstyle = pstyle))
            push!(lends, LineEnd((x1, y1), L1, Up, S1))
            push!(lends, LineEnd((x2, y2), L2, Left, S2))
        end
    end
    lines, corners, lends
end

function _path(P1, P2, style1::Type{LineStyle{S1,T1}}, style2::Type{LineStyle{S2,T2}},
        ::Type{Horizontal}, ::Type{L1}, ::Type{L2}, pstyle) where {S1,T1,S2,T2,L1,L2}
    x1, y1 = P1
    x2, y2 = P2
    Δx = x2 - x1
    Δy = y2 - y1
    Δx == 0 && error("Impossible to define a Horizontal line from ($x1,$y1) to ($x2,$y2).")
    lines = []
    corners = []
    lends = []
    if Δy == 0
        push!(lines, Line((x1, y1), Δx + 1, Horizontal; style = style1, pstyle = pstyle))
        if Δx < 0
            push!(lends, LineEnd((x1, y1), L1, Right, S1))
            push!(lends, LineEnd((x2, y2), L2, Left))
        else
            push!(lends, LineEnd((x1, y1), L1, Left, S1))
            push!(lends, LineEnd((x2, y2), L2, Right, S2))
        end
    else
        push!(lines, Line((x1, y1), Δx, Horizontal; style = style1, pstyle = pstyle))
        if Δx < 0 && Δy < 0
            push!(lines, Line((x2, y1 - 1), Δy, Vertical; style = style2, pstyle = pstyle))
            push!(corners, BottomLeftCorner((x2, y1), S2, S1; pstyle = pstyle))
            push!(lends, LineEnd((x1, y1), L1, Right, S1))
            push!(lends, LineEnd((x2, y2), L2, Up, S2))
        elseif Δx > 0 && Δy > 0
            push!(lines, Line((x2, y1 + 1), Δy, Vertical; style = style2, pstyle = pstyle))
            push!(corners, UpperRightCorner((x2, y1), S1, S2; pstyle = pstyle))
            push!(lends, LineEnd((x1, y1), L1, Left, S1))
            push!(lends, LineEnd((x2, y2), L2, Down, S2))
        elseif Δx > 0 && Δy < 0
            push!(lines, Line((x2, y1 - 1), Δy, Vertical; style = style1, pstyle = pstyle))
            push!(corners, BottomRightCorner((x2, y1), S2, S1; pstyle = pstyle))
            push!(lends, LineEnd((x1, y1), L1, Left, S1))
            push!(lends, LineEnd((x2, y2), L2, Up, S2))
        elseif Δx < 0 && Δy > 0
            push!(lines, Line((x2, y1 + 1), Δy, Vertical; style = style2, pstyle = pstyle))
            push!(corners, UpperLeftCorner((x2, y1), S1, S2; pstyle = pstyle))
            push!(lends, LineEnd((x1, y1), L1, Right, S1))
            push!(lends, LineEnd((x2, y2), L2, Down, S2))
        end
    end
    lines, corners, lends
end
