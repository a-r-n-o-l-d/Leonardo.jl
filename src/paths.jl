"""
    EndStyle(etype, edir, lstyle)

Create a type defining a line ending character, mostly used in internal to draw path.
`etype` is one of `NoEnd`, `BlackArrow`, `WhiteArrow` or any subtypes o f
`AbstractFreeChar`. `edir` gives the direction of ending character. `lstyle` is the style
of the line for which ending character must be drawn.

See [`drawend!`](@ref) for usage.
"""
struct EndStyle{E,D,L} end

EndStyle(::Type{E}, ::Type{D}, ::Type{L}) where {E,D,L} = EndStyle{E,D,L}

#EndStyle(::Type{E}, ::Type{D}) where {E<:AbstractArrow,D} = EndStyle(E, D, LineStyle()) #NoLineStyle

#EndStyle(::Type{E}, ::Type{D}) where {E<:Bar,D} = EndStyle(E, D, LineStyle())

#EndStyle(::Type{D}, ::Type{L}) where {D<:AbstractDirection,L} = EndStyle(NoEnd, D, L)

#EndStyle(::Type{C}) where C<:AbstractFreeChar = EndStyle(C, NoDirection, LineStyle())

"""
    drawend!(canvas, (x, y), estyle, prstyle = defstyle(canvas)

Draw an end character for a line defined by `estyle` a `EndStyle` type.

# Example

```julia-repl
julia> c = Canvas(10, 1);

julia> es = EndStyle(NoEnd, Left, LineStyle());

julia> drawend!(c, (1, 1), es)
─


julia> es = EndStyle(BlackArrow, Left, LineStyle());

julia> drawend!(c, (1, 1), es)
◂


julia> es = EndStyle(Bar, Left, LineStyle());

julia> drawend!(c, (1, 1), es)
├


julia> es = EndStyle(Lozenge, NoDirection, LineStyle(NoLine));

julia> drawend!(c, (1, 1), es)
◊


```
"""
function drawend!(canvas, P, ::Type{EndStyle{NoEnd,D,L}},
                  prstyle = defstyle(canvas)) where {D,S,T,L<:LineStyle{S,T}}
    c = char(_dir2ori(D), S, T)
    drawchar!(canvas, P, c, prstyle)
    canvas
end

function drawend!(canvas, P, ::Type{EndStyle{Bar,D,L}},
                  prstyle = defstyle(canvas)) where {D,S,T,L<:LineStyle{S,T}}
    c = char(Bar, D, S)
    drawchar!(canvas, P, c, prstyle)
    canvas
end

function drawend!(canvas, P, ::Type{EndStyle{E,D,L}},
                  prstyle = defstyle(canvas)) where {E<:AbstractArrow,D,L}
    c = char(E, D)
    drawchar!(canvas, P, c, prstyle)
    canvas
end

function drawend!(canvas, P, ::Type{EndStyle{E,D,L}},
                  prstyle = defstyle(canvas)) where {E<:AbstractFreeChar,D,L}
    c = char(E)
    drawchar!(canvas, P, c, prstyle)
    canvas
end

struct PathStyle{L1,L2,E1,E2} end

"""
    PathStyle(lstyle1, lstyle2, etype1, etype2)

Create a `PathStyle` type used by [`drawpath!`](@ref) to draw paths.
"""
function PathStyle(::Type{L1}, ::Type{L2}, ::Type{E1}, ::Type{E2}) where {L1,L2,E1,E2}
    PathStyle{L1,L2,E1,E2}
end

"""
    PathStyle(lstyle, etype1, etype2)

Create a `PathStyle` type used by [`drawpath!`](@ref) to draw paths.
"""
function PathStyle(::Type{L}, ::Type{E1}, ::Type{E2}) where {L,E1,E2}
    PathStyle(L, L, E1, E2)
end

"""
    PathStyle(etype1, etype2)

Create a `PathStyle` type used by [`drawpath!`](@ref) to draw paths.
"""
function PathStyle(::Type{E1}, ::Type{E2}) where {E1<:AbstractEnd,E2<:AbstractEnd}
    PathStyle(LineStyle(), LineStyle(), E1, E2)
end

"""
    PathStyle(lstyle, etype)

Create a `PathStyle` type used by [`drawpath!`](@ref) to draw paths.
"""
function PathStyle(::Type{L}, ::Type{E}) where {L<:LineStyle,E<:AbstractEnd}
    PathStyle(L, L, E, E)
end


PathStyle() = PathStyle(LineStyle(), LineStyle(), NoEnd, NoEnd)


function drawpath!(canvas, P1::Tuple, P2::Tuple, ::Type{Vertical},
                   pstyle::Type{PathStyle{L1,L2,E1,E2}},
                   prstyle = defstyle(canvas)) where {L1,L2,E1,E2}
    x1, y1 = P1
    x2, y2 = P2
    Δx = x2 - x1
    Δy = y2 - y1
    if Δy == 0
        drawpath!(canvas, P1, P2, Horizontal, pstyle, prstyle)
    elseif Δx == 0
        if Δy < 0
            l1 = (Δy + 2) ÷ 2 # To do: handle the case if l1 == -1
            l2 = (Δy + 2) - l1
            yi = y1 + l1 - 1
            drawline!(canvas, (x1, y1 - 1), l1, Vertical, L1, prstyle)
            drawline!(canvas, (x1, yi - 1), l2, Vertical, L2, prstyle)
            drawend!(canvas, P1, EndStyle(E1, Down, L1), prstyle)
            drawend!(canvas, P2, EndStyle(E2, Up, L2), prstyle)
            conn = biconnector(Down, L1, Up, L2)
            drawconnector!(canvas, (x1, yi), conn, prstyle)
        else
            l1 = (Δy - 2) ÷ 2 # To do: handle the case if l1 == 1
            l2 = (Δy - 2) - l1
            yi = y1 + l1 + 1
            drawline!(canvas, (x1, y1 + 1), l1, Vertical, L1, prstyle)
            drawline!(canvas, (x1, yi + 1), l2, Vertical, L2, prstyle)
            drawend!(canvas, P1, EndStyle(E1, Up, L1), prstyle)
            drawend!(canvas, P2, EndStyle(E2, Down, L2), prstyle)
            conn = biconnector(Up, L1, Down, L2)
            drawconnector!(canvas, (x1, yi), conn, prstyle)
        end
    else
        if Δx < 0 && Δy < 0
            drawline!(canvas, (x1, y1 - 1), Δy + 1, Vertical, L1, prstyle)
            drawend!(canvas, P1, EndStyle(E1, Down, L1), prstyle)
            conn = biconnector(Down, L1, Left, L2)
            drawconnector!(canvas, (x1, y2), conn, prstyle)
            drawline!(canvas, (x1 - 1, y2), Δx + 1, Horizontal, L2, prstyle)
            drawend!(canvas, P2, EndStyle(E2, Left, L2), prstyle)
        elseif Δx > 0 && Δy > 0
            drawline!(canvas, (x1, y1 + 1), Δy - 1, Vertical, L1, prstyle)
            drawend!(canvas, P1, EndStyle(E1, Up, L1), prstyle)
            conn = biconnector(Up, L1, Right, L2)
            drawconnector!(canvas, (x1, y2), conn, prstyle)
            drawline!(canvas, (x1 + 1, y2), Δx - 1, Horizontal, L2, prstyle)
            drawend!(canvas, P2, EndStyle(E2, Right, L2), prstyle)
        elseif Δx > 0 && Δy < 0
            drawline!(canvas, (x1, y1 - 1), Δy + 1, Vertical, L1, prstyle)
            drawend!(canvas, P1, EndStyle(E1, Down, L1), prstyle)
            conn = biconnector(Down, L1, Right, L2)
            drawconnector!(canvas, (x1, y2), conn, prstyle)
            drawline!(canvas, (x1 + 1, y2), Δx - 1, Horizontal, L2, prstyle)
            drawend!(canvas, P2, EndStyle(E2, Right, L2), prstyle)
        elseif Δx < 0 && Δy > 0
            drawline!(canvas, (x1, y1 + 1), Δy - 1, Vertical, L1, prstyle)
            drawend!(canvas, P1, EndStyle(E1, Up, L1), prstyle)
            conn = biconnector(Up, L1, Left, L2)
            drawconnector!(canvas, (x1, y2), conn, prstyle)
            drawline!(canvas, (x1 - 1, y2), Δx + 1, Horizontal, L2, prstyle)
            drawend!(canvas, P2, EndStyle(E2, Left, L2), prstyle)
        end
    end
    canvas
end

function drawpath!(canvas, P1::Tuple, P2::Tuple, ::Type{Horizontal},
                   pstyle::Type{PathStyle{L1,L2,E1,E2}},
                   prstyle = defstyle(canvas)) where {L1,L2,E1,E2}
    x1, y1 = P1
    x2, y2 = P2
    Δx = x2 - x1
    Δy = y2 - y1
    if Δx == 0
        drawpath!(canvas, P1, P2, Vertical, pstyle, prstyle)
    elseif Δy == 0
        if Δx < 0
            l1 = (Δx + 2) ÷ 2
            l2 = (Δx + 2) - l1
            xi = x1 + l1 - 1
            drawline!(canvas, (x1 - 1, y1), l1, Horizontal, L1, prstyle)
            drawline!(canvas, (xi - 1, y1), l2, Horizontal, L2, prstyle)
            drawend!(canvas, P1, EndStyle(E1, Right, L1), prstyle)
            drawend!(canvas, P2, EndStyle(E2, Left, L2), prstyle)
            conn = biconnector(Right, L1, Left, L2)
            drawconnector!(canvas, (xi, y1), conn, prstyle)
        else
            l1 = (Δx - 2) ÷ 2
            l2 = (Δx - 2) - l1
            xi = x1 + l1 + 1
            drawline!(canvas, (x1 + 1, y1), l1, Horizontal, L1, prstyle)
            drawline!(canvas, (xi + 1, y1), l2, Horizontal, L2, prstyle)
            drawend!(canvas, P1, EndStyle(E1, Left, L1), prstyle)
            drawend!(canvas, P2, EndStyle(E2, Right, L2), prstyle)
            conn = biconnector(Left, L1, Right, L2)
            drawconnector!(canvas, (xi, y1), conn, prstyle)
        end
    else
        if Δx < 0 && Δy < 0
            drawline!(canvas, (x1 - 1, y1), Δx + 1, Horizontal, L1, prstyle)
            drawend!(canvas, P1, EndStyle(E1, Right, L1), prstyle)
            conn = biconnector(Right, L1, Up, L2)
            drawconnector!(canvas, (x2, y1), conn, prstyle)
            drawline!(canvas, (x2, y1 - 1), Δy + 1, Vertical, L2, prstyle)
            drawend!(canvas, P2, EndStyle(E2, Up, L2), prstyle)
        elseif Δx > 0 && Δy > 0
            drawline!(canvas, (x1 + 1, y1), Δx - 1, Horizontal, L1, prstyle)
            drawend!(canvas, P1, EndStyle(E1, Left, L1), prstyle)
            conn = biconnector(Left, L1, Down, L2)
            drawconnector!(canvas, (x2, y1), conn, prstyle)
            drawline!(canvas, (x2, y1 + 1), Δy - 1, Vertical, L2, prstyle)
            drawend!(canvas, P2, EndStyle(E2, Down, L2), prstyle)
        elseif Δx > 0 && Δy < 0
            drawline!(canvas, (x1 + 1, y1), Δx - 1, Horizontal, L1, prstyle)
            drawend!(canvas, P1, EndStyle(E1, Left, L1), prstyle)
            conn = biconnector(Left, L1, Up, L2)
            drawconnector!(canvas, (x2, y1), conn, prstyle)
            drawline!(canvas, (x2, y1 - 1), Δy + 1, Vertical, L2, prstyle)
            drawend!(canvas, P2, EndStyle(E2, Up, L2), prstyle)
        elseif Δx < 0 && Δy > 0
            drawline!(canvas, (x1 - 1, y1), Δx + 1, Horizontal, L1, prstyle)
            drawend!(canvas, P1, EndStyle(E1, Right, L1), prstyle)
            conn = biconnector(Right, L1, Down, L2)
            drawconnector!(canvas, (x2, y1), conn, prstyle)
            drawline!(canvas, (x2, y1 + 1), Δy - 1, Vertical, L2, prstyle)
            drawend!(canvas, P2, EndStyle(E2, Down, L2), prstyle)
        end
    end
    canvas
end

function drawpath!(canvas, P::Tuple, length::Int, lori::Type{Vertical},
                   pstyle, prstyle = defstyle(canvas))
    x1, y1 = P
    y2 = y1 + length - 1
    drawpath!(canvas, P, (x1, y2), lori, pstyle, prstyle)
end

function drawpath!(canvas, P::Tuple, length::Int, lori::Type{Horizontal},
                   pstyle, prstyle = defstyle(canvas))
    x1, y1 = P
    x2 = x1 + length - 1
    drawpath!(canvas, P, (x2, y1), lori, pstyle, prstyle)
end

function drawpath!(canvas, Ps::Vector, ::Type{O}, pstyle::Type{PathStyle{L1,L2,E1,E2}},
                   prstyle = defstyle(canvas)) where {O,L1,L2,E1,E2}
    if length(Ps) < 2
        error("Drawing a path requires at least two points.")
    elseif length(Ps) == 2
        drawpath!(canvas, Ps..., O, pstyle, prstyle)
    else
        n = length(Ps) - 1
        for i in 1:n
            if i == 1
                ps = PathStyle(L1, L2, E1, NoEnd)
            elseif i == n
                ps = PathStyle(L1, L2, NoEnd, E2)
            else
                ps = PathStyle(L1, L2, NoEnd, NoEnd)
            end
            drawpath!(canvas, Ps[i], Ps[i + 1], O, ps, prstyle)
            if i > 1
                _connect!(canvas, Ps[i - 1], Ps[i], Ps[i + 1], O, L1, L2, prstyle)
            end
        end
    end
    canvas
end

#=
function drawpath!(canvas, P1, width1, height1, ::Type{B1}, ::Type{D1},
    P2, width2, height2, ::Type{B2}, ::Type{D2}, pstyle) where {B1,D1,B2,D2}

end

function _boxpath(P, width, height, ::Type{B}, ::Type{Left}) where {L,U,R,D,B<:BoxStyle{L,U,R,D}}
    x, y = P
    (x, y + height ÷ 2), Horizontal
end

function _boxpath(P, width, height, ::Type{B}, ::Type{Right}) where {L,U,R,D,B<:BoxStyle{L,U,R,D}}
    x, y = P
    (x + width, y + height ÷ 2), Horizontal
end

function _boxpath(P, width, height, ::Type{B}, ::Type{Up}) where {L,U,R,D,B<:BoxStyle{L,U,R,D}}
    x, y = P
    (x + width ÷ 2, y), Vertical
end

function _boxpath(P, width, height, ::Type{B}, ::Type{Down}) where {L,U,R,D,B<:BoxStyle{L,U,R,D}}
    x, y = P
    (x + width ÷ 2, y + height), Vertical
end
=#

############################################################################################
#                                   INTERNAL FUNCTIONS                                     #
############################################################################################

_dir2ori(::Type{Left}) = Horizontal

_dir2ori(::Type{Up}) = Vertical

_dir2ori(::Type{Right}) = Horizontal

_dir2ori(::Type{Down}) = Vertical

function _connect!(canvas, P1, P2, P3, ::Type{Vertical}, lstyle1, lstyle2, prstyle)
    x1, _ = P1
    x2, y2 = P2
    x3, y3 = P3
    if x2 < x1
        if y3 < y2
            conn = biconnector(Up, lstyle1, Right, lstyle2)
            drawconnector!(canvas, P2, conn, prstyle)
        elseif y3 > y2
            conn = biconnector(Down, lstyle1, Right, lstyle2)
            drawconnector!(canvas, P2, conn, prstyle)
        else
            conn = biconnector(Left, lstyle1, Right, lstyle2)
            drawconnector!(canvas, P2, conn, prstyle)
        end
    elseif x2 > x1
        if y3 < y2
            conn = biconnector(Up, lstyle1, Left, lstyle2)
            drawconnector!(canvas, P2, conn, prstyle)
        elseif y3 > y2
            conn = biconnector(Down, lstyle1, Left, lstyle2)
            drawconnector!(canvas, P2, conn, prstyle)
        else
            conn = biconnector(Left, lstyle1, Right, lstyle2)
            drawconnector!(canvas, P2, conn, prstyle)
        end
    else
        if y3 < y2
            conn = biconnector(Down, lstyle1, Up, lstyle2)
            drawconnector!(canvas, P2, conn, prstyle)
        elseif y3 > y2
            conn = biconnector(Up, lstyle1, Down, lstyle2)
            drawconnector!(canvas, P2, conn, prstyle)
        else
            if x2 < x3
                conn = biconnector(Right, lstyle1, Down, lstyle2)
                drawconnector!(canvas, P2, conn, prstyle)
            elseif x2 > x3
                conn = biconnector(Left, lstyle1, Down, lstyle2)
                drawconnector!(canvas, P2, conn, prstyle)
            #else
            #    conn = biconnector(Right, lstyle1, Up, lstyle2)
            #    drawconnector!(canvas, P2, conn, prstyle)
            end
        end
    end
end

function _connect!(canvas, P1, P2, P3, ::Type{Horizontal}, lstyle1, lstyle2, prstyle)
    _, y1 = P1
    x2, y2 = P2
    x3, y3 = P3
    if y2 < y1
        if x3 < x2
            conn = biconnector(Left, lstyle1, Down, lstyle2)
            drawconnector!(canvas, P2, conn, prstyle)
        elseif x3 > x2
            conn = biconnector(Right, lstyle1, Down, lstyle2)
            drawconnector!(canvas, P2, conn, prstyle)
        else
            conn = biconnector(Up, lstyle1, Down, lstyle2)
            drawconnector!(canvas, P2, conn, prstyle)
        end
    elseif y2 > y1
        if x3 < x2
            conn = biconnector(Left, lstyle1, Up, lstyle2)
            drawconnector!(canvas, P2, conn, prstyle)
        elseif x3 > x2
            conn = biconnector(Right, lstyle1, Up, lstyle2)
            drawconnector!(canvas, P2, conn, prstyle)
        else
            conn = biconnector(Up, lstyle1, Down, lstyle2)
            drawconnector!(canvas, P2, conn, prstyle)
        end
    else
        if x3 < x2
            conn = biconnector(Right, lstyle1, Left, lstyle2)
            drawconnector!(canvas, P2, conn, prstyle)
        elseif x3 > x2
            conn = biconnector(Left, lstyle1, Right, lstyle2)
            drawconnector!(canvas, P2, conn, prstyle)
        else
            if y2 < y3
                conn = biconnector(Down, lstyle1, Left, lstyle2)
                drawconnector!(canvas, P2, conn, prstyle)
            elseif y2 > y3
                conn = biconnector(Up, lstyle1, Left, lstyle2)
                drawconnector!(canvas, P2, conn, prstyle)
            #else P2 = P3 => not possible
            #    conn = biconnector(Down, lstyle1, Left, lstyle2)
            #    drawconnector!(canvas, P2, conn, prstyle)
            end
        end
    end
end
