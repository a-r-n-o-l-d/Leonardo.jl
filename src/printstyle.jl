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
