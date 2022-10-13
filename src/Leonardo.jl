# TODO:
#  - add bounds checks before drawing to canvas
#  - remplacer CartesianIndex par Point?
#  - passer les coord en tuple c est plus lisible
module Leonardo

export NoLine, Light, Heavy, Double, Solid, Dashed1, Dashed2, Dashed3, Half1, Half2,
       Horizontal, Vertical, LineStyle, NoOrientation, Left, Up, Right, Down, NoLineEnd, BlackArrow, WhiteArrow, Bar,
       BackRectangle, WhiteRectangle, Lozenge, LargeDot, SmallDot
export Canvas, draw!, Line, Box, SingleLineText

include("singletons.jl")
include("charset.jl")
include("printstyle.jl")
include("canvas.jl")
include("lines.jl")
include("connectors.jl")
include("boxes.jl")
include("texts.jl")

end
