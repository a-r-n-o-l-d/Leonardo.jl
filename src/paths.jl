"""
    EndStyle([EndType], [DirectionType], [LineStyleType = LineStyle(LightSolid)])
"""
struct EndStyle{E,D,L} end

EndStyle(::Type{E}, ::Type{D}, ::Type{L}) where {E,D,L} = EndStyle{E,D,L}

EndStyle(::Type{E}, ::Type{D}) where {E<:AbstractArrow,D} = EndStyle(E, D, LineStyle()) #NoLineStyle

EndStyle(::Type{D}, ::Type{L}) where {D<:AbstractDirection,L} = EndStyle(NoEnd, D, L)

EndStyle(::Type{C}) where C<:AbstractFreeChar = EndStyle(C, NoDirection, LineStyle())

function drawend!(canvas, P, ::Type{EndStyle{NoEnd,D,L}},
                  prstyle = DEFAULT_PSTYLE) where {D,S,T,L<:LineStyle{S,T}}
    c = char(_dir2ori(D), S, T)
    drawchar!(canvas, P, c, prstyle)
    canvas
end

function drawend!(canvas, P, ::Type{EndStyle{Bar,D,L}},
                  prstyle = DEFAULT_PSTYLE) where {D,S,T,L<:LineStyle{S,T}}
    c = char(Bar, D, S)
    drawchar!(canvas, P, c, prstyle)
    canvas
end

function drawend!(canvas, P, ::Type{EndStyle{E,D,L}},
                  prstyle = DEFAULT_PSTYLE) where {E<:AbstractArrow,D,L}
    c = char(E, D)
    drawchar!(canvas, P, c, prstyle)
    canvas
end

function drawend!(canvas, P, ::Type{EndStyle{E,D,L}},
                  prstyle = DEFAULT_PSTYLE) where {E<:AbstractFreeChar,D,L}
    c = char(E)
    drawchar!(canvas, P, c, prstyle)
    canvas
end

struct PathStyle{L1,L2,E1,E2} end

function PathStyle(::Type{L1}, ::Type{L2}, ::Type{E1}, ::Type{E2}) where {L1,L2,E1,E2}
    PathStyle{L1,L2,E1,E2}
end

function PathStyle(::Type{L}, ::Type{E1}, ::Type{E2}) where {L,E1,E2}
    PathStyle(L, L, E1, E2)
end

function PathStyle(::Type{E1}, ::Type{E2}) where {E1,E2}
    PathStyle(LineStyle(), LineStyle(), E1, E2)
end

PathStyle() = PathStyle(LineStyle(), LineStyle(), NoEnd, NoEnd)

function drawpath!(canvas, P1::Tuple, P2::Tuple, ::Type{Vertical},
                   pstyle::Type{PathStyle{L1,L2,E1,E2}},
                   prstyle = DEFAULT_PSTYLE) where {L1,L2,E1,E2}
    x1, y1 = P1
    x2, y2 = P2
    Δx = x2 - x1
    Δy = y2 - y1
    if Δy == 0
        drawpath!(canvas, P1, P2, Horizontal, pstyle, prstyle)
    elseif Δx == 0
        if Δy < 0
            l1 = (Δy + 2) ÷ 2
            l2 = (Δy + 2) - l1
            yi = y1 + l1 - 1
            drawline!(canvas, (x1, y1 - 1), l1, Vertical, L1, prstyle)
            drawline!(canvas, (x1, yi - 1), l2, Vertical, L2, prstyle)
            drawend!(canvas, P1, EndStyle(E1, Down, L1), prstyle)
            drawend!(canvas, P2, EndStyle(E2, Up, L2), prstyle)
            conn = biconnector(Down, L1, Up, L2)
            drawconnector!(canvas, (x1, y2), conn, prstyle)
        else
            l1 = (Δy - 2) ÷ 2
            l2 = (Δy - 2) - l1
            yi = y1 + l1 + 1
            drawline!(canvas, (x1, y1 + 1), l1, Vertical, L1, prstyle)
            drawline!(canvas, (x1, yi + 1), l2, Vertical, L2, prstyle)
            drawend!(canvas, P1, EndStyle(E1, Up, L1), prstyle)
            drawend!(canvas, P2, EndStyle(E2, Down, L2), prstyle)
            conn = biconnector(Up, L1, Down, L2)
            drawconnector!(canvas, (x1, y2), conn, prstyle)
        end
        drawconnector!(canvas, (x1, yi), conn, prstyle)
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
                   prstyle = DEFAULT_PSTYLE) where {L1,L2,E1,E2}
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
            drawconnector!(canvas, (x2, y1), conn, prstyle)
        else
            l1 = (Δx - 2) ÷ 2
            l2 = (Δx - 2) - l1
            xi = x1 + l1 + 1
            drawline!(canvas, (x1 + 1, y1), l1, Horizontal, L1, prstyle)
            drawline!(canvas, (xi + 1, y1), l2, Horizontal, L2, prstyle)
            drawend!(canvas, P1, EndStyle(E1, Left, L1), prstyle)
            drawend!(canvas, P2, EndStyle(E2, Right, L2), prstyle)
            conn = biconnector(Left, L1, Right, L2)
            drawconnector!(canvas, (x2, y1), conn, prstyle)
        end
        drawconnector!(canvas, (xi, y1), conn, prstyle)
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
                   pstyle, prstyle = DEFAULT_PSTYLE)
    x1, y1 = P
    y2 = y1 + length
    drawpath!(canvas, P, (x1, y2), lori, pstyle, prstyle)
end

function drawpath!(canvas, P::Tuple, length::Int, lori::Type{Horizontal},
                   pstyle, prstyle = DEFAULT_PSTYLE)
    x1, y1 = P
    x2 = x1 + length
    drawpath!(canvas, P, (x2, y1), lori, pstyle, prstyle)
end

function drawpath!(canvas, Ps::Vector, lori::Type{O}, pstyle::Type{PathStyle{L1,L2,E1,E2}},
                   prstyle = DEFAULT_PSTYLE) where {O,L1,L2,E1,E2}
    if length(Ps) < 2
        error()
    elseif length(Ps) == 2
        drawpath!(canvas, Ps..., lori, pstyle, prstyle)
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
            drawpath!(canvas, Ps[i], Ps[i + 1], lori, ps, prstyle)
            if i > 1
                _connect!(canvas, Ps[i - 1], Ps[i], Ps[i + 1], lori, L1, L2, prstyle)
            end
        end
    end
    canvas
end

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
            else
                conn = biconnector(Right, lstyle1, Up, lstyle2)
                drawconnector!(canvas, P2, conn, prstyle)
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
                conn = biconnector(Down, lstyle1, Right, lstyle2)
                drawconnector!(canvas, P2, conn, prstyle)
            elseif y2 > y3
                conn = biconnector(Up, lstyle1, Right, lstyle2)
                drawconnector!(canvas, P2, conn, prstyle)
            else
                conn = biconnector(Down, lstyle1, Left, lstyle2)
                drawconnector!(canvas, P2, conn, prstyle)
            end
        end
    end
end

#= For visual check
function test()
    reset!(c);
    P1 = (rand(1:c.width), rand(1:c.height))
    P2 = (rand(1:c.width), rand(1:c.height))
    P3 = (rand(1:c.width), rand(1:c.height))
    P4 = (rand(1:c.width), rand(1:c.height))
    println("$P1 $P2 $P3, $P4")
    drawpath!(c, [P1, P2, P3, P4], Vertical, PathStyle(LineStyle(Dashed1), LineStyle(Heavy), Bar, BlackArrow))
end

function test()
    reset!(c);
    P1 = (rand(1:c.width), rand(1:c.height))
    P2 = (rand(1:c.width), rand(1:c.height))
    println("$P1 $P2")
    drawpath!(c, [P1, P2], Vertical, PathStyle(LineStyle(Half2), LineStyle(Heavy), Bar, BlackArrow))
end

function test()
    reset!(c);
    P1 = (rand(1:c.width), rand(1:c.height))
    P2 = (rand(1:c.width), rand(1:c.height))
    P3 = (rand(1:c.width), rand(1:c.height))
    P4 = (rand(1:c.width), rand(1:c.height))
    println("$P1 $P2 $P3, $P4")
    drawpath!(c, [P1, P2, P3, P4], Horizontal, PathStyle(LineStyle(Dashed1), LineStyle(Heavy), Bar, BlackArrow))
end
=#
