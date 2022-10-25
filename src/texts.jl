struct SingleLineText{D<:AbstractDirection}#pas utile
    x1
    y1
    x2
    y2
    text
    pstyle
end

function SingleLineText(P, text, ::Type{D}; pstyle = PrintStyle()) where D
    contains(text, '\n') && error(
        "text supplied to `SingleLineText` contains some carriage returns.") #replace(text, '\n', '\U240D')
    x, y = P
    x1, y1, x2, y2 = _line_cart_idx(D, x, y, length(text))
    SingleLineText{D}(x1, y1, x2, y2, text, pstyle)
end

function draw!(canvas::Canvas, text::SingleLineText)
    for (P, c) in zip(Iterators.product(text.x1:text.x2, text.y1:text.y2), text.text)
        print!(canvas, c, text.pstyle, P...)
    end
    canvas
end
