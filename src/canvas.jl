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

 const DEFAULT_PSTYLE = PrintStyle()

 @inline function charprint(io::IO, c::Char, ps::PrintStyle = DEFAULT_PSTYLE)
    printstyled(io, c; ps.style...)
 end

struct Canvas
    chars
    pstyles
end

function Canvas(; width, height)
    Canvas(_emptychars(width, height), _emptypstyles(width, height))
end

function reset!(canvas)
    width, height = size(canvas.chars)
    width = width - 1
    copyto!(canvas.chars, _emptychars(width, height))
    fill!(canvas.crayons, Crayon())
    canvas
end

@inline function _emptychars(width, height)
    line = vcat(repeat([' '], width), '\n')
    reshape(repeat(line, height), width + 1, height)
end

@inline function _emptypstyles(width, height)
    fill(DEFAULT_PSTYLE, width + 1, height)
end

function Base.print(io::IO, canvas::Canvas)
    for (ch, ps) in zip(canvas.chars, canvas.pstyles)
        charprint(io, ch, ps)
    end
end

function Base.show(io::IO, canvas::Canvas)
    print(io, canvas)
end
