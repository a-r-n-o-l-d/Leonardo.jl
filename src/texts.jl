struct SingleLineText{D<:AbstractDirection}
    x1
    y1
    x2
    y2
    text
    pstyle
end

function SingleLineText(x, y, text, ::Type{D}; pstyle = PrintStyle()) where D
    contains(text, '\n') && error(
        "text supplied to `SingleLineText` contains some carriage returns.")
    x1, y1, x2, y2 = _line_cart_idx(D, x, y, length(text))
    SingleLineText{D}(x1, y1, x2, y2, text, pstyle)
end

function draw!(canvas::Canvas, text::SingleLineText)
    #=for (I, c) in zip(text.from:text.to, text.text)
        @inbounds canvas.chars[I] = c
        @inbounds canvas.pstyles[I] = text.pstyle
    end    =#
    i = 1
    for y in text.y1:text.y2, x in text.x1:text.x2
        print!(canvas, text.text[i], text.pstyle, x, y)
        i = i + 1
    end
    canvas
end
