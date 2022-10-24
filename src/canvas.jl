const BLANK_CHAR = ' '

struct PrintStyle
    style
end

function PrintStyle(; bold = false, color = :normal, blink = false, reverse = false,
                      hidden = false, underline = false)
    style = (
        bold = bold, color = color, blink = blink, reverse = reverse, hidden = hidden,
        underline = underline
    )
    PrintStyle(style)
end

@inline function charprint(io::IO, c::Char, ps::PrintStyle = DEFAULT_PSTYLE)
    printstyled(io, c; ps.style...)
end

const DEFAULT_PSTYLE = PrintStyle()

struct Canvas
    chars::Matrix{Char}
    prstyles::Matrix{PrintStyle}
    width::Int
    height::Int
end

function Canvas(width, height)
    chars = Matrix{Char}(undef, width + 1, height)
    chars[1:width,1:height] .= BLANK_CHAR
    chars[width + 1, 1:height] .= '\n'
    prstyles = fill(DEFAULT_PSTYLE, width + 1, height)
    Canvas(chars, prstyles, width, height)
end

function reset!(canvas)
    for y in 1:canvas.height, x in 1:canvas.width
        @inbounds canvas.chars[x,y] = BLANK_CHAR
        @inbounds canvas.prstyles[x,y] = DEFAULT_PSTYLE
    end
    canvas
end

function Base.print(io::IO, canvas::Canvas)
    for (ch, ps) in zip(canvas.chars, canvas.prstyles)
        printstyled(io, ch; ps.style...)
    end
end

function Base.show(io::IO, canvas::Canvas)
    print(io, canvas)
end

function drawchar!(canvas::Canvas, P, char, prstyle)
    x, y = P
    if 0 < x ≤ canvas.width && 0 < y ≤ canvas.height #|| error("Attempting to draw outside the canvas frame.")
        @inbounds canvas.chars[x, y] = char
        @inbounds canvas.prstyles[x, y] = prstyle
    end
end

############################################################################################
#                                   INTERNAL FUNCTIONS                                     #
############################################################################################

@inline function _empty_chars(width, height)
    chars = Matrix{Char}(undef, width + 1, height)
    chars[1:width,1:height] .= BLANK_CHAR
    chars[width + 1, 1:height] .= '\n'
    chars
end

@inline function _empty_pstyles(width, height)
    fill(DEFAULT_PSTYLE, width + 1, height)
end
