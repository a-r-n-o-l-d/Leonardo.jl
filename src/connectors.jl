struct Connector{L<:AbstractLineSize,U<:AbstractLineSize,R<:AbstractLineSize,
                 D<:AbstractLineSize}
    at
    pstyle
end

function Connector{L,U,R,D}(x, y; pstyle::PrintStyle = PrintStyle()) where {L,U,R,D}
    at = CartesianIndex(x, y)
    Connector{L,U,R,D}(at, pstyle)
end

function Connector(x, y, ::Type{L}, ::Type{U}, ::Type{R}, ::Type{D};
                   pstyle::PrintStyle = PrintStyle()) where {L,U,R,D}
    Connector{L,U,R,D}(x, y; pstyle = pstyle)
end

function draw!(canvas::Canvas, connector::Connector{L,U,R,D}) where {L,U,R,D}
    canvas.chars[connector.at] = char(L, U, R, D)
    canvas.pstyles[connector.at] = connector.pstyle
    canvas
end

const UpperLeftCorner{R,D} = Connector{NoLine,NoLine,R,D} where {R,D}

function UpperLeftCorner(x, y, ::Type{R}, ::Type{D}; pstyle = PrintStyle()) where {R,D}
     UpperLeftCorner{R,D}(x, y; pstyle = pstyle)
end

const UpperRightCorner{L,D} = Connector{L,NoLine,NoLine,D} where {L,D}

function UpperRightCorner(x, y, ::Type{L}, ::Type{D}; pstyle = PrintStyle()) where {L,D}
    UpperRightCorner{L,D}(x, y; pstyle = pstyle)
end

const BottomLeftCorner{U,R} = Connector{NoLine,U,R,NoLine} where {U,R}

function BottomLeftCorner(x, y, ::Type{U}, ::Type{R}; pstyle = PrintStyle()) where {U,R}
    BottomLeftCorner{U,R}(x, y; pstyle = pstyle)
end

const BottomRightCorner{U,L} = Connector{L,U,NoLine,NoLine} where {U,L}

function BottomRightCorner(x, y,::Type{U}, ::Type{L}; pstyle = PrintStyle()) where {U,L}
    BottomRightCorner{U,L}(x, y; pstyle = pstyle)
end
