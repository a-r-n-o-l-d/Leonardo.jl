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
