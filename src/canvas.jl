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

function Base.print(io::IO, canvas::Canvas)
    for (ch, ps) in zip(canvas.chars, canvas.pstyles)
        charprint(io, ch, ps)
    end
end

function Base.show(io::IO, canvas::Canvas)
    print(io, canvas)
end

struct CanvasPoint
    x
    y
end

function print!(canvas::Canvas, char, pstyle, x, y)
    isin(canvas, x, y)
    @inbounds canvas.chars[x, y] = char
    @inbounds canvas.pstyles[x, y] = pstyle
end

function print!(canvas::Canvas, char, pstyle, P)
    @inbounds canvas.chars[P.x, P.y] = char
    @inbounds canvas.pstyles[P.x, P.y] = pstyle
end

@inline function isin(canvas, x, y)
     0 < x ≤ canvas.width && 0 < y ≤ canvas.height || error(
        "Drawing outside Canvas")
end

@inline function isin(canvas, P)
    #x, y = I.I
    0 < P.x ≤ canvas.width && 0 < P.y ≤ canvas.height
end

@inline function _empty_chars(width, height)
    line = vcat(repeat([BLANK_CHAR], width), '\n')
    reshape(repeat(line, height), width + 1, height)
end

@inline function _empty_pstyles(width, height)
    fill(DEFAULT_PSTYLE, width + 1, height)
end
