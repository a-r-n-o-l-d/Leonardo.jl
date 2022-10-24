struct BoxStyle{L,U,R,D} end

function BoxStyle(left::Type{L} = LineStyle(), up::Type{U} = LineStyle(), ::Type{R} = left,
                  ::Type{D} = up) where {L,U,R,D}
    BoxStyle{L,U,R,D}
end

function drawbox!(canvas, P, width, height, ::Type{BoxStyle{L,U,R,D}} = BoxStyle(),
                  prstyle = defstyle(canvas)) where {L,U,R,D}
    x1, y1 = P
    x2, y2 = x1, y1 + height - 1
    x3, y3 = x1 + width - 1, y1
    x4, y4 = x3, y2
    h = height - 2
    w = width - 2

    c1 = biconnector(Down, L, Right, U)
    drawconnector!(canvas, (x1, y1), c1, prstyle)
    drawline!(canvas, (x1,y1 + 1), h, Vertical, L, prstyle)
    c2 = biconnector(Up, L, Right, D)
    drawconnector!(canvas, (x2,y2), c2, prstyle)

    c3 = biconnector(Down, R, Left, U)
    drawconnector!(canvas, (x3,y3), c3, prstyle)
    drawline!(canvas, (x3,y3 + 1), h, Vertical, R, prstyle)
    c4 = biconnector(Up, R, Left, D)
    drawconnector!(canvas, (x4,y4), c4, prstyle)

    drawline!(canvas, (x1 + 1, y1), w, Horizontal, U, prstyle)
    drawline!(canvas, (x2 + 1, y2), w, Horizontal, D, prstyle)
end
