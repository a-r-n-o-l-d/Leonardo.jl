# TODO:
#  x add bounds checks before drawing to canvas
#  x remplacer CartesianIndex par Point?
#  x passer les coord en tuple c est plus lisible
module Leonardo

using Crayons

export NoLine, Light, Heavy, Double, Solid, Dashed1, Dashed2, Dashed3, Half1, Half2,
       Horizontal, Vertical, LineStyle, NoDirection, Left, Up, Right, Down, NoEnd, BlackArrow, WhiteArrow, Bar,
       BackRectangle, WhiteRectangle, Lozenge, LargeDot, SmallDot
export PrintStyle, Canvas, reset!, drawchar!#, Connector#, Line, LineEnd, Path#, Box, SingleLineText
export LineStyle, drawline!, EndStyle, drawend!, CornerStyle, drawcorner!, PathStyle, drawpath!

include("singletons.jl")
include("charset.jl")
include("printstyle.jl")
include("canvas.jl")
include("lines.jl")
include("connectors.jl")
include("paths.jl")
#include("boxes.jl")
#include("texts.jl")

end
