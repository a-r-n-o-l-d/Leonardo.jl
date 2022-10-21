#=
ToDo
- essayer de supprimer PrintStyle
- definitions du style drawline!(canvas, P, length, lori, lstyle = LineStyle(); kwargs...)
=#


struct LineStyle{S,T} end

LineStyle(::Type{S}, ::Type{T}) where {S,T} = LineStyle{S,T}

LineStyle() = LineStyle(Light, Solid)

LineStyle(::Type{S}) where S<:AbstractLineSize = LineStyle(S, Solid)

LineStyle(::Type{T}) where T<:AbstractLineType = LineStyle(Light, T)

function drawline!(canvas, P, length, ::Type{O}, ::Type{LineStyle{S,T}} = LineStyle(), prstyle = DEFAULT_PSTYLE) where {O,S,T}
    xr, yr = _line_cart_idx(O, P, length)
    c = char(O, S, T)
    for y in yr, x in xr
        drawchar!(canvas, (x, y), c, prstyle)
    end
    canvas
end

############################################################################################
#                                   INTERNAL FUNCTIONS                                     #
############################################################################################

function _line_cart_idx(::Type{Horizontal}, P, length)
    x, y = P
    if length > 0
        #x, y, x + length - 1, y
        x:(x + length - 1), y:y
    else
        #x + length + 1, y, x , y
        (x + length + 1):x, y:y
    end
end

function _line_cart_idx(::Type{Vertical}, P, length)
    x, y = P
    if length > 0
        #x, y, x, y + length - 1
        x:x, y:(y + length - 1)
    else
        #x, y + length + 1, x, y
        x:x, (y + length + 1):y
    end
end

#=function _connect(line1::Line{Horizontal},
                  line2::Line{Vertical}, lsize1, lsize2)
    # connect at l1.P2, l2.P2
    if line1.y2 == line2.y2
        return bottom_right_corner((line1.x2, line1.y2), lsize2, lsize1; pstyle = line1.pstyle)
    # connect at l1.P2, l2.P1
    elseif line1.y2 == line2.y1
        return upper_right_corner((line1.x2, line1.y2), lsize1, lsize2; pstyle = line1.pstyle)
    # connect at l1.P1, l2.P2
    elseif line1.y1 == line2.y2
        return bottom_left_corner((line1.x1, line1.y1), lsize2, lsize1; pstyle = line1.pstyle)
    # connect at l1.P1, l2.P1
    elseif line1.y1 == line2.y1
        return upper_left_corner((line1.x1, line1.y1), lsize1, lsize2; pstyle = line1.pstyle)
    else
        error()
    end
end

function _connect(line1::Line{Vertical},
                  line2::Line{Horizontal}, lsize1, lsize2) #where {S1,S2,T1,T2}
    # connect at l1.P2, l2.P1
    if line1.y2 == line2.y1
        return bottom_left_corner((line1.x2, line1.y2), lsize1, lsize2; pstyle = line1.pstyle)
    # connect at l1.P1, l2.P1
    elseif line1.y1 == line2.y1
        return upper_left_corner((line1.x1, line1.y1), lsize2, lsize1; pstyle = line1.pstyle)
    # connect at l1.P2, l2.P2
    elseif line1.y2 == line2.y2
        return bottom_right_corner((line1.x2, line1.y2), lsize1, lsize2; pstyle = line1.pstyle)
    # connect at l1.P1, l2.P2
    elseif line1.y1 == line2.y2
        return upper_right_corner((line1.x1, line1.y1), lsize2, lsize1; pstyle = line1.pstyle)
    else
        error()
    end
end
=#
