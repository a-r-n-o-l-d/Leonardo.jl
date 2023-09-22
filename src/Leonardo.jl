# To do:
# - box with header
module Leonardo

export NoLine, Light, Heavy, Double, Solid, Dashed1, Dashed2, Dashed3, Half1, Half2,
       Horizontal, Vertical, LineStyle, NoDirection, Left, Up, Right, Down, NoEnd,
       BlackArrow, WhiteArrow, Bar, BlackRectangle, WhiteRectangle, Lozenge, LargeDot,
       SmallDot, PrintStyle, Canvas, reset!, drawchar!, fill!, LineStyle, drawline!,
       ConnectorStyle, drawconnector!, biconnector, triconnector, quadriconnector, EndStyle,
       drawend!, PathStyle, drawpath!, BoxStyle, drawbox!, drawtext!, #HBoxStyle, drawhbox!,
       drawtextbox!

include("drawingtypes.jl")
include("charset.jl")
include("canvas.jl")
include("lines.jl")
include("connectors.jl")
include("paths.jl")
include("boxes.jl")
include("texts.jl")

end
