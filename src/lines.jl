struct LineStyle{S,T} end

LineStyle(::Type{S}, ::Type{T}) where {S,T} = LineStyle{S,T}

LineStyle() = LineStyle(Light, Solid)

LineStyle(::Type{S}) where S<:AbstractLineSize = LineStyle(S, Solid)

LineStyle(::Type{T}) where T<:AbstractLineType = LineStyle(Light, T)

function drawline!(canvas, P, length, ::Type{O}, ::Type{LineStyle{S,T}} = LineStyle(),
                   prstyle = DEFAULT_PRSTYLE) where {O,S,T}
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
        x:(x + length - 1), y:y
    else
        (x + length + 1):x, y:y
    end
end

function _line_cart_idx(::Type{Vertical}, P, length)
    x, y = P
    if length > 0
        x:x, y:(y + length - 1)
    else
        x:x, (y + length + 1):y
    end
end
