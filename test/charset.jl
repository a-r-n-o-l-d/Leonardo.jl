@test  '─' == Leonardo.char(Horizontal, LineStyle(Light,Solid))
@test  '┄' == Leonardo.char(Horizontal, LineStyle(Light,Dashed1))
@test  '┈' == Leonardo.char(Horizontal, LineStyle(Light,Dashed2))
@test  '╌' == Leonardo.char(Horizontal, LineStyle(Light,Dashed3))
@test  '╴' == Leonardo.char(Horizontal, LineStyle(Light,Half1))
@test  '╶' == Leonardo.char(Horizontal, LineStyle(Light,Half2))
@test  '━' == Leonardo.char(Horizontal, LineStyle(Heavy,Solid))
@test  '┅' == Leonardo.char(Horizontal, LineStyle(Heavy,Dashed1))
@test  '┉' == Leonardo.char(Horizontal, LineStyle(Heavy,Dashed2))
@test  '╍' == Leonardo.char(Horizontal, LineStyle(Heavy,Dashed3))
@test  '╸' == Leonardo.char(Horizontal, LineStyle(Heavy,Half1))
@test  '╺' == Leonardo.char(Horizontal, LineStyle(Heavy,Half2))
@test  '═' == Leonardo.char(Horizontal, LineStyle(Double,Dashed1))
@test  '│' == Leonardo.char(Vertical, LineStyle(Light,Solid))
@test  '┆' == Leonardo.char(Vertical, LineStyle(Light,Dashed1))
@test  '┊' == Leonardo.char(Vertical, LineStyle(Light,Dashed2))
@test  '╎' == Leonardo.char(Vertical, LineStyle(Light,Dashed3))
@test  '╵' == Leonardo.char(Vertical, LineStyle(Light,Half1))
@test  '╷' == Leonardo.char(Vertical, LineStyle(Light,Half2))
@test  '┃' == Leonardo.char(Vertical, LineStyle(Heavy,Solid))
@test  '┇' == Leonardo.char(Vertical, LineStyle(Heavy,Dashed1))
@test  '┋' == Leonardo.char(Vertical, LineStyle(Heavy,Dashed2))
@test  '╏' == Leonardo.char(Vertical, LineStyle(Heavy,Dashed3))
@test  '╹' == Leonardo.char(Vertical, LineStyle(Heavy,Half1))
@test  '╻' == Leonardo.char(Vertical, LineStyle(Heavy,Half2))
@test  '║' == Leonardo.char(Vertical, LineStyle(Double,Dashed1))
@test  '╼' == Leonardo.char(Light, NoLine, Heavy, NoLine)
@test  '╾' == Leonardo.char(Heavy, NoLine, Light, NoLine)
@test  '╽' == Leonardo.char(NoLine, Light, NoLine, Heavy)
@test  '╿' == Leonardo.char(NoLine, Heavy, NoLine, Light)
@test  '┌' == Leonardo.char(NoLine, NoLine, Light, Light)
@test  '┐' == Leonardo.char(Light, NoLine, NoLine, Light)
@test  '┘' == Leonardo.char(Light, Light, NoLine, NoLine)
@test  '└' == Leonardo.char(NoLine, Light, Light, NoLine)
@test  '┍' == Leonardo.char(NoLine, NoLine, Heavy, Light)
@test  '┑' == Leonardo.char(Heavy, NoLine, NoLine, Light)
@test  '┙' == Leonardo.char(Heavy, Light, NoLine, NoLine)
@test  '┕' == Leonardo.char(NoLine, Light, Heavy, NoLine)
@test  '╒' == Leonardo.char(NoLine, NoLine, Double, Light)
@test  '╕' == Leonardo.char(Double, NoLine, NoLine, Light)
@test  '╛' == Leonardo.char(Double, Light, NoLine, NoLine)
@test  '╘' == Leonardo.char(NoLine, Light, Double, NoLine)
@test  '┎' == Leonardo.char(NoLine, NoLine, Light, Heavy)
@test  '┒' == Leonardo.char(Light, NoLine, NoLine, Heavy)
@test  '┚' == Leonardo.char(Light, Heavy, NoLine, NoLine)
@test  '┖' == Leonardo.char(NoLine, Heavy, Light, NoLine)
@test  '┏' == Leonardo.char(NoLine, NoLine, Heavy, Heavy)
@test  '┓' == Leonardo.char(Heavy, NoLine, NoLine, Heavy)
@test  '┛' == Leonardo.char(Heavy, Heavy, NoLine, NoLine)
@test  '┗' == Leonardo.char(NoLine, Heavy, Heavy, NoLine)
@test  '╒' == Leonardo.char(NoLine, NoLine, Double, Heavy)
@test  '╕' == Leonardo.char(Double, NoLine, NoLine, Heavy)
@test  '╛' == Leonardo.char(Double, Heavy, NoLine, NoLine)
@test  '╘' == Leonardo.char(NoLine, Heavy, Double, NoLine)
@test  '╓' == Leonardo.char(NoLine, NoLine, Light, Double)
@test  '╖' == Leonardo.char(Light, NoLine, NoLine, Double)
@test  '╜' == Leonardo.char(Light, Double, NoLine, NoLine)
@test  '╙' == Leonardo.char(NoLine, Double, Light, NoLine)
@test  '╔' == Leonardo.char(NoLine, NoLine, Double, Double)
@test  '╗' == Leonardo.char(Double, NoLine, NoLine, Double)
@test  '╝' == Leonardo.char(Double, Double, NoLine, NoLine)
@test  '╚' == Leonardo.char(NoLine, Double, Double, NoLine)
@test  '├' == Leonardo.char(NoLine, Light, Light, Light)
@test  '┝' == Leonardo.char(NoLine, Light, Heavy, Light)
@test  '┞' == Leonardo.char(NoLine, Heavy, Light, Light)
@test  '┟' == Leonardo.char(NoLine, Light, Light, Heavy)
@test  '┠' == Leonardo.char(NoLine, Heavy, Light, Heavy)
@test  '┡' == Leonardo.char(NoLine, Heavy, Heavy, Light)
@test  '┢' == Leonardo.char(NoLine, Light, Heavy, Heavy)
@test  '┣' == Leonardo.char(NoLine, Heavy, Heavy, Heavy)
@test  '╠' == Leonardo.char(NoLine, Double, Double, Double)
@test  '╞' == Leonardo.char(NoLine, Light, Double, Light)
@test  '╟' == Leonardo.char(NoLine, Double, Light, Double)
@test  '┤' == Leonardo.char(Light, Light, NoLine, Light)
@test  '┥' == Leonardo.char(Heavy, Light, NoLine, Light)
@test  '┦' == Leonardo.char(Light, Heavy, NoLine, Light)
@test  '┧' == Leonardo.char(Light, Light, NoLine, Heavy)
@test  '┨' == Leonardo.char(Light, Heavy, NoLine, Heavy)
@test  '┩' == Leonardo.char(Heavy, Heavy, NoLine, Light)
@test  '┪' == Leonardo.char(Heavy, Light, NoLine, Heavy)
@test  '┫' == Leonardo.char(Heavy, Heavy, NoLine, Heavy)
@test  '╣' == Leonardo.char(Double, Double, NoLine, Double)
@test  '╡' == Leonardo.char(Double, Light, NoLine, Light)
@test  '╢' == Leonardo.char(Light, Double, NoLine, Double)
@test  '┬' == Leonardo.char(Light, NoLine, Light, Light)
@test  '┭' == Leonardo.char(Heavy, NoLine, Light, Light)
@test  '┮' == Leonardo.char(Light, NoLine, Heavy, Light)
@test  '┯' == Leonardo.char(Heavy, NoLine, Heavy, Light)
@test  '┰' == Leonardo.char(Light, NoLine, Light, Heavy)
@test  '┱' == Leonardo.char(Heavy, NoLine, Light, Heavy)
@test  '┲' == Leonardo.char(Light, NoLine, Heavy, Heavy)
@test  '┳' == Leonardo.char(Heavy, NoLine, Heavy, Heavy)
@test  '╤' == Leonardo.char(Double, NoLine, Double, Light)
@test  '╥' == Leonardo.char(Light, NoLine, Light, Double)
@test  '╦' == Leonardo.char(Double, NoLine, Double, Double)
@test  '┴' == Leonardo.char(Light, Light, Light, NoLine)
@test  '┵' == Leonardo.char(Heavy, Light, Light, NoLine)
@test  '┶' == Leonardo.char(Light, Light, Heavy, NoLine)
@test  '┷' == Leonardo.char(Heavy, Light, Heavy, NoLine)
@test  '┸' == Leonardo.char(Light, Heavy, Light, NoLine)
@test  '┹' == Leonardo.char(Heavy, Heavy, Light, NoLine)
@test  '┺' == Leonardo.char(Light, Heavy, Heavy, NoLine)
@test  '┻' == Leonardo.char(Heavy, Heavy, Heavy, NoLine)
@test  '╧' == Leonardo.char(Double, Light, Double, NoLine)
@test  '╨' == Leonardo.char(Light, Double, Light, NoLine)
@test  '╩' == Leonardo.char(Double, Double, Double, NoLine)
@test  '┣' == Leonardo.char(NoLine, Double, Heavy, Double)
@test  '┞' == Leonardo.char(NoLine, Double, Light, Light)
@test  '┟' == Leonardo.char(NoLine, Light, Light, Double)
@test  '┡' == Leonardo.char(NoLine, Double, Double, Light)
@test  '┢' == Leonardo.char(NoLine, Light, Double, Double)
@test  '┣' == Leonardo.char(NoLine, Double, Heavy, Heavy)
@test  '┣' == Leonardo.char(NoLine, Heavy, Heavy, Double)
@test  '┣' == Leonardo.char(NoLine, Double, Double, Heavy)
@test  '┣' == Leonardo.char(NoLine, Heavy, Double, Double)
@test  '┢' == Leonardo.char(NoLine, Light, Heavy, Double)
@test  '┢' == Leonardo.char(NoLine, Light, Double, Heavy)
@test  '┠' == Leonardo.char(NoLine, Heavy, Light, Double)
@test  '┡' == Leonardo.char(NoLine, Heavy, Double, Light)
@test  '┣' == Leonardo.char(NoLine, Heavy, Double, Heavy)
@test  '┣' == Leonardo.char(NoLine, Double, Heavy, Light)
@test  '┠' == Leonardo.char(NoLine, Double, Light, Heavy)
@test  '┫' == Leonardo.char(Double, Heavy, NoLine, Double)
@test  '┦' == Leonardo.char(Light, Double, NoLine, Light)
@test  '┧' == Leonardo.char(Light, Light, NoLine, Double)
@test  '┩' == Leonardo.char(Double, Double, NoLine, Light)
@test  '┪' == Leonardo.char(Double, Light, NoLine, Double)
@test  '┫' == Leonardo.char(Double, Heavy, NoLine, Heavy)
@test  '┫' == Leonardo.char(Heavy, Heavy, NoLine, Double)
@test  '┫' == Leonardo.char(Double, Double, NoLine, Heavy)
@test  '┫' == Leonardo.char(Heavy, Double, NoLine, Double)
@test  '┨' == Leonardo.char(Light, Heavy, NoLine, Double)
@test  '┨' == Leonardo.char(Light, Double, NoLine, Heavy)
@test  '┪' == Leonardo.char(Heavy, Light, NoLine, Double)
@test  '┩' == Leonardo.char(Heavy, Double, NoLine, Light)
@test  '┫' == Leonardo.char(Heavy, Double, NoLine, Heavy)
@test  '┪' == Leonardo.char(Double, Light, NoLine, Heavy)
@test  '┩' == Leonardo.char(Double, Heavy, NoLine, Light)
@test  '┭' == Leonardo.char(Double, NoLine, Light, Light)
@test  '┮' == Leonardo.char(Light, NoLine, Double, Light)
@test  '┲' == Leonardo.char(Light, NoLine, Double, Double)
@test  '┱' == Leonardo.char(Double, NoLine, Light, Double)
@test  '┳' == Leonardo.char(Double, NoLine, Heavy, Heavy)
@test  '┳' == Leonardo.char(Heavy, NoLine, Double, Heavy)
@test  '┳' == Leonardo.char(Heavy, NoLine, Double, Double)
@test  '┳' == Leonardo.char(Double, NoLine, Heavy, Double)
@test  '┲' == Leonardo.char(Light, NoLine, Heavy, Double)
@test  '┲' == Leonardo.char(Light, NoLine, Double, Heavy)
@test  '┱' == Leonardo.char(Heavy, NoLine, Light, Double)
@test  '┳' == Leonardo.char(Heavy, NoLine, Heavy, Double)
@test  '┯' == Leonardo.char(Heavy, NoLine, Double, Light)
@test  '┱' == Leonardo.char(Double, NoLine, Light, Heavy)
@test  '┯' == Leonardo.char(Double, NoLine, Heavy, Light)
@test  '┳' == Leonardo.char(Double, NoLine, Double, Heavy)
@test  '┶' == Leonardo.char(Light, Light, Double, NoLine)
@test  '┺' == Leonardo.char(Light, Heavy, Double, NoLine)
@test  '┺' == Leonardo.char(Light, Double, Heavy, NoLine)
@test  '┺' == Leonardo.char(Light, Double, Double, NoLine)
@test  '┷' == Leonardo.char(Heavy, Light, Double, NoLine)
@test  '┻' == Leonardo.char(Heavy, Heavy, Double, NoLine)
@test  '┹' == Leonardo.char(Heavy, Double, Light, NoLine)
@test  '┻' == Leonardo.char(Heavy, Double, Heavy, NoLine)
@test  '┻' == Leonardo.char(Heavy, Double, Double, NoLine)
@test  '┹' == Leonardo.char(Double, Light, Light, NoLine)
@test  '┵' == Leonardo.char(Double, Light, Heavy, NoLine)
@test  '┹' == Leonardo.char(Double, Heavy, Light, NoLine)
@test  '┻' == Leonardo.char(Double, Heavy, Heavy, NoLine)
@test  '┻' == Leonardo.char(Double, Heavy, Double, NoLine)
@test  '┹' == Leonardo.char(Double, Double, Light, NoLine)
@test  '┻' == Leonardo.char(Double, Double, Heavy, NoLine)
@test  '┼' == Leonardo.char(Light, Light, Light, Light)
@test  '┽' == Leonardo.char(Heavy, Light, Light, Light)
@test  '┾' == Leonardo.char(Light, Light, Heavy, Light)
@test  '┿' == Leonardo.char(Heavy, Light, Heavy, Light)
@test  '╀' == Leonardo.char(Light, Heavy, Light, Light)
@test  '╁' == Leonardo.char(Light, Light, Light, Heavy)
@test  '╂' == Leonardo.char(Light, Heavy, Light, Heavy)
@test  '╃' == Leonardo.char(Heavy, Heavy, Light, Light)
@test  '╄' == Leonardo.char(Light, Heavy, Heavy, Light)
@test  '╅' == Leonardo.char(Heavy, Light, Light, Heavy)
@test  '╆' == Leonardo.char(Light, Light, Heavy, Heavy)
@test  '╇' == Leonardo.char(Heavy, Heavy, Heavy, Light)
@test  '╈' == Leonardo.char(Heavy, Light, Heavy, Heavy)
@test  '╉' == Leonardo.char(Heavy, Heavy, Light, Heavy)
@test  '╊' == Leonardo.char(Light, Heavy, Heavy, Heavy)
@test  '╋' == Leonardo.char(Heavy, Heavy, Heavy, Heavy)
@test  '╪' == Leonardo.char(Double, Light, Double, Light)
@test  '╫' == Leonardo.char(Light, Double, Light, Double)
@test  '╬' == Leonardo.char(Double, Double, Double, Double)
@test  '╁' == Leonardo.char(Light, Light, Light, Double)
@test  '╆' == Leonardo.char(Light, Light, Heavy, Double)
@test  '┾' == Leonardo.char(Light, Light, Double, Light)
@test  '╆' == Leonardo.char(Light, Light, Double, Heavy)
@test  '╆' == Leonardo.char(Light, Light, Double, Double)
@test  '╂' == Leonardo.char(Light, Heavy, Light, Double)
@test  '╊' == Leonardo.char(Light, Heavy, Heavy, Double)
@test  '╄' == Leonardo.char(Light, Heavy, Double, Light)
@test  '╊' == Leonardo.char(Light, Heavy, Double, Heavy)
@test  '╊' == Leonardo.char(Light, Heavy, Double, Double)
@test  '╀' == Leonardo.char(Light, Double, Light, Light)
@test  '╂' == Leonardo.char(Light, Double, Light, Heavy)
@test  '╄' == Leonardo.char(Light, Double, Heavy, Light)
@test  '╊' == Leonardo.char(Light, Double, Heavy, Heavy)
@test  '╊' == Leonardo.char(Light, Double, Heavy, Double)
@test  '╄' == Leonardo.char(Light, Double, Double, Light)
@test  '╊' == Leonardo.char(Light, Double, Double, Heavy)
@test  '╊' == Leonardo.char(Light, Double, Double, Double)
@test  '╅' == Leonardo.char(Heavy, Light, Light, Double)
@test  '╈' == Leonardo.char(Heavy, Light, Heavy, Double)
@test  '┿' == Leonardo.char(Heavy, Light, Double, Light)
@test  '╈' == Leonardo.char(Heavy, Light, Double, Heavy)
@test  '╈' == Leonardo.char(Heavy, Light, Double, Double)
@test  '╉' == Leonardo.char(Heavy, Heavy, Light, Double)
@test  '╋' == Leonardo.char(Heavy, Heavy, Heavy, Double)
@test  '╇' == Leonardo.char(Heavy, Heavy, Double, Light)
@test  '╋' == Leonardo.char(Heavy, Heavy, Double, Heavy)
@test  '╋' == Leonardo.char(Heavy, Heavy, Double, Double)
@test  '╃' == Leonardo.char(Heavy, Double, Light, Light)
@test  '╉' == Leonardo.char(Heavy, Double, Light, Heavy)
@test  '╉' == Leonardo.char(Heavy, Double, Light, Double)
@test  '╇' == Leonardo.char(Heavy, Double, Heavy, Light)
@test  '╋' == Leonardo.char(Heavy, Double, Heavy, Heavy)
@test  '╋' == Leonardo.char(Heavy, Double, Heavy, Double)
@test  '╇' == Leonardo.char(Heavy, Double, Double, Light)
@test  '╋' == Leonardo.char(Heavy, Double, Double, Heavy)
@test  '╋' == Leonardo.char(Heavy, Double, Double, Double)
@test  '┽' == Leonardo.char(Double, Light, Light, Light)
@test  '╅' == Leonardo.char(Double, Light, Light, Heavy)
@test  '╅' == Leonardo.char(Double, Light, Light, Double)
@test  '┿' == Leonardo.char(Double, Light, Heavy, Light)
@test  '╈' == Leonardo.char(Double, Light, Heavy, Heavy)
@test  '╈' == Leonardo.char(Double, Light, Heavy, Double)
@test  '╈' == Leonardo.char(Double, Light, Double, Heavy)
@test  '╈' == Leonardo.char(Double, Light, Double, Double)
@test  '╃' == Leonardo.char(Double, Heavy, Light, Light)
@test  '╉' == Leonardo.char(Double, Heavy, Light, Heavy)
@test  '╉' == Leonardo.char(Double, Heavy, Light, Double)
@test  '╇' == Leonardo.char(Double, Heavy, Heavy, Light)
@test  '╋' == Leonardo.char(Double, Heavy, Heavy, Heavy)
@test  '╋' == Leonardo.char(Double, Heavy, Heavy, Double)
@test  '╇' == Leonardo.char(Double, Heavy, Double, Light)
@test  '╋' == Leonardo.char(Double, Heavy, Double, Heavy)
@test  '╋' == Leonardo.char(Double, Heavy, Double, Double)
@test  '╃' == Leonardo.char(Double, Double, Light, Light)
@test  '╉' == Leonardo.char(Double, Double, Light, Heavy)
@test  '╉' == Leonardo.char(Double, Double, Light, Double)
@test  '╇' == Leonardo.char(Double, Double, Heavy, Light)
@test  '╋' == Leonardo.char(Double, Double, Heavy, Heavy)
@test  '╋' == Leonardo.char(Double, Double, Heavy, Double)
@test  '╇' == Leonardo.char(Double, Double, Double, Light)
@test  '╋' == Leonardo.char(Double, Double, Double, Heavy)
@test  '◂' == Leonardo.char(BlackArrow(Left))
@test  '▴' == Leonardo.char(BlackArrow(Up))
@test  '▸' == Leonardo.char(BlackArrow(Right))
@test  '▾' == Leonardo.char(BlackArrow(Down))
@test  '◃' == Leonardo.char(WhiteArrow(Left))
@test  '▵' == Leonardo.char(WhiteArrow(Up))
@test  '▹' == Leonardo.char(WhiteArrow(Right))
@test  '▿' == Leonardo.char(WhiteArrow(Down))
@test  Leonardo.char(NoLine, Light, Light, Light) == Leonardo.char(Bar(Light,Left))
@test  Leonardo.char(Light, NoLine, Light, Light) == Leonardo.char(Bar(Light,Up))
@test  Leonardo.char(Light, Light, NoLine, Light) == Leonardo.char(Bar(Light,Right))
@test  Leonardo.char(Light, Light, Light, NoLine) == Leonardo.char(Bar(Light,Down))
@test  Leonardo.char(NoLine, Heavy, Heavy, Heavy) == Leonardo.char(Bar(Heavy,Left))
@test  Leonardo.char(Heavy, NoLine, Heavy, Heavy) == Leonardo.char(Bar(Heavy,Up))
@test  Leonardo.char(Heavy, Heavy, NoLine, Heavy) == Leonardo.char(Bar(Heavy,Right))
@test  Leonardo.char(Heavy, Heavy, Heavy, NoLine) == Leonardo.char(Bar(Heavy,Down))
@test  Leonardo.char(NoLine, Double, Double, Double) == Leonardo.char(Bar(Double,Left))
@test  Leonardo.char(Double, NoLine, Double, Double) == Leonardo.char(Bar(Double,Up))
@test  Leonardo.char(Double, Double, NoLine, Double) == Leonardo.char(Bar(Double,Right))
@test  Leonardo.char(Double, Double, Double, NoLine) == Leonardo.char(Bar(Double,Down))
@test  '▮' == Leonardo.char(BackRectangle)
@test  '▯' == Leonardo.char(WhiteRectangle)
@test  '◊' == Leonardo.char(Lozenge)
@test  '•' == Leonardo.char(LargeDot)
@test  '∙' == Leonardo.char(SmallDot)