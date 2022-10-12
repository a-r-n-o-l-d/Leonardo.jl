struct SingleLineText{D<:AbstractDirection}
    from
    to
    text
    pstyle
end

function SingleLineText(x, y, text, ::Type{D}; pstyle = PrintStyle()) where D
    contains(text, '\n') && error(
        "text supplied to `SingleLineText` contains some carriage returns.")
    from, to = _line_cart_idx(D, x, y, length(text))
    SingleLineText{D}(from, to, text, pstyle)
end

function draw!(canvas::Canvas, text::SingleLineText)
    for (I, c) in zip(text.from:text.to, text.text)
        canvas.chars[I] = c
        canvas.pstyles[I] = text.pstyle
    end
    canvas
end
