struct Box{L<:LineStyle,U<:LineStyle,R<:LineStyle,D<:LineStyle} #pas utile
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
    x, y = P
    x_, _y, l = x, y + 1, height - 2
    lborder = Line((x_, _y), l, Vertical; style = left, pstyle = pstyle)
    _x, _y, l = x + 1, y, width - 2
    uborder = Line((_x, _y), l, Horizontal; style = upper, pstyle = pstyle)
    _x, _y, l = x + width - 1, y + 1, height - 2
    rborder = Line((_x, _y), l, Vertical; style = right, pstyle = pstyle)
    _x, _y, l = x + 1, y + height - 1, width - 2
    bborder = Line((_x, _y), l, Horizontal; style = bottom, pstyle = pstyle)
    corners = [
        UpperLeftCorner((x, y), U, L; pstyle = pstyle), #UpperLeftCorner{R,D}
        BottomLeftCorner((x, y + height - 1), L, B; pstyle = pstyle), #BottomLeftCorner{U,R}
        UpperRightCorner((x + width - 1, y), U, R; pstyle = pstyle), #UpperRightCorner{L,D}
        BottomRightCorner((x + width - 1, y + height - 1), R, B; pstyle = pstyle) #BottomRightCorner{U,L}
    ]
    Box{left,upper,right,bottom}(lborder, uborder, rborder, bborder, corners)
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
