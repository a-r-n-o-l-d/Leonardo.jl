struct BoxStyle{L,U,R,D} end

function BoxStyle(::Type{L}, ::Type{U}, ::Type{R}, ::Type{D}) where {L,U,R,D}
    BoxStyle{L,U,R,D}
end

BoxStyle() = BoxStyle(LineStyle(), LineStyle(), LineStyle(), LineStyle())

function drawbox!(canvas, P, width, height, ::Type{BoxStyle{L,U,R,D}} = BoxStyle(),
                  prstyle = DEFAULT_PSTYLE) where {L,U,R,D}
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
    drawline!(canvas, (x2 + 1, y2), w, Horizontal, R, prstyle)
end

#=
struct Box
    lborder
    uborder
    rborder
    bborder
    corners
end

function Box(P, width, height; left::Type{LineStyle{L,T1}} = LineStyle(Light, Solid),
             right::Type{LineStyle{R,T2}} = left, upper::Type{LineStyle{U,T3}} = right,
             bottom::Type{LineStyle{B,T4}} = upper,
             pstyle = PrintStyle()) where {L,U,R,B,T1,T2,T3,T4}
    xp, yp = P

    x, y, l = xp, yp + 1, height - 2
    lborder = Line((x, y), l, Vertical; style = left, pstyle = pstyle)

    x, y, l = xp + 1, yp, width - 2
    uborder = Line((x, y), l, Horizontal; style = upper, pstyle = pstyle)

    x, y, l = xp + width - 1, yp + 1, height - 2
    rborder = Line((x, y), l, Vertical; style = right, pstyle = pstyle)

    x, y, l = xp + 1, yp + height - 1, width - 2
    bborder = Line((x, y), l, Horizontal; style = bottom, pstyle = pstyle)

    corners = [
        upper_left_corner((xp, yp), U, L; pstyle = pstyle),
        bottom_left_corner((xp, yp + height - 1), L, B; pstyle = pstyle),
        upper_right_corner((xp + width - 1, yp), U, R; pstyle = pstyle),
        bottom_right_corner((xp + width - 1, yp + height - 1), R, B; pstyle = pstyle)
    ]

    Box(lborder, uborder, rborder, bborder, corners)
end

function draw!(canvas::Canvas, box::Box)
    draw!(canvas, box.corners[1])
    draw!(canvas, box.lborder)
    draw!(canvas, box.corners[2])

    draw!(canvas, box.corners[3])
    draw!(canvas, box.rborder)
    draw!(canvas, box.corners[4])

    draw!(canvas, box.uborder)
    draw!(canvas, box.bborder)
end
=#
