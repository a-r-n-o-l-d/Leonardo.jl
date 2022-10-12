const BLANK_CHAR = ' '
const DEFAULT_PSTYLE = PrintStyle()

struct Canvas
    chars
    pstyles
    width
    height
end

function Canvas(; width, height)
    Canvas(_empty_chars(width, height), _empty_pstyles(width, height), width, height)
end

function reset!(canvas)
    copyto!(canvas.chars, _empty_chars(canvas.width, canvas.height))
    copyto!(canvas.pstyles, _empty_pstyles(canvas.width, canvas.height))
    canvas
end

@inline function _empty_chars(width, height)
    line = vcat(repeat([BLANK_CHAR], width), '\n')
    reshape(repeat(line, height), width + 1, height)
end

@inline function _empty_pstyles(width, height)
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
