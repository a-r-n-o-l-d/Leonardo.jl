"""
    Line(x, y, length, D; style = LineStyle(Light, Solid), crayon = Crayon())
"""
struct Line{D<:AbstractDirection,S<:LineStyle}
    from
    to
    pstyle
end

function Line(x, y, length, ::Type{D}; ::Type{S} = LineStyle(Light, Solid),
              pstyle = DEFAULT_PSTYLE) where {D,S}
    from, to = _line_cart_idx(D, x, y, length)
    Line{D,S}(from, to, pstyle)
end

function _line_cart_idx(::Type{Horizontal}, x, y, length)
    from = CartesianIndex(x, y)
    to = from + CartesianIndex(length - 1, 0)
    from, to
end

function _line_cart_idx(::Type{Vertical}, x, y, length)
    from = CartesianIndex(x, y)
    if length > 0
        to = from + CartesianIndex(0, length - 1)
    else
        # pour si sens inverse
        #=
        to = CartesianIndex(col, row)
        from = to - CartesianIndex(0, length + 1)
        =#
        to = from + CartesianIndex(0, length - 1)
    end
    from, to
end

style = LineStyle(Heavy, Solid)
Line(1, 1, 5, Horizontal; style = style)

function draw!(canvas::Canvas, line::Line{D,S}) where {D,S}
    c = char(D, S)
    for I in line.from:line.to
        canvas.chars[I] = c
        canvas.pstyles[I] = line.pstyle
    end
    canvas
end
