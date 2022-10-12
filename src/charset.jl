@inline char(::Type{Horizontal}, ::Type{LineStyle{Light,Solid}}) = '─'
@inline char(::Type{Horizontal}, ::Type{LineStyle{Light,Dashed1}}) = '┄'
@inline char(::Type{Horizontal}, ::Type{LineStyle{Light,Dashed2}}) = '┈'
@inline char(::Type{Horizontal}, ::Type{LineStyle{Light,Dashed3}}) = '╌'
@inline char(::Type{Horizontal}, ::Type{LineStyle{Light,Half1}}) = '╴'
@inline char(::Type{Horizontal}, ::Type{LineStyle{Light,Half2}}) = '╶'
@inline char(::Type{Horizontal}, ::Type{LineStyle{Heavy,Solid}}) = '━'
@inline char(::Type{Horizontal}, ::Type{LineStyle{Heavy,Dashed1}}) = '┅'
@inline char(::Type{Horizontal}, ::Type{LineStyle{Heavy,Dashed2}}) = '┉'
@inline char(::Type{Horizontal}, ::Type{LineStyle{Heavy,Dashed3}}) = '╍'
@inline char(::Type{Horizontal}, ::Type{LineStyle{Heavy,Half1}}) = '╸'
@inline char(::Type{Horizontal}, ::Type{LineStyle{Heavy,Half2}}) = '╺'
@inline char(::Type{Horizontal}, ::Type{LineStyle{Double,T}}) where T = '═'
@inline char(::Type{Vertical}, ::Type{LineStyle{Light,Solid}}) = '│'
@inline char(::Type{Vertical}, ::Type{LineStyle{Light,Dashed1}}) = '┆'
@inline char(::Type{Vertical}, ::Type{LineStyle{Light,Dashed2}}) = '┊'
@inline char(::Type{Vertical}, ::Type{LineStyle{Light,Dashed3}}) = '╎'
@inline char(::Type{Vertical}, ::Type{LineStyle{Light,Half1}}) = '╵'
@inline char(::Type{Vertical}, ::Type{LineStyle{Light,Half2}}) = '╷'
@inline char(::Type{Vertical}, ::Type{LineStyle{Heavy,Solid}}) = '┃'
@inline char(::Type{Vertical}, ::Type{LineStyle{Heavy,Dashed1}}) = '┇'
@inline char(::Type{Vertical}, ::Type{LineStyle{Heavy,Dashed2}}) = '┋'
@inline char(::Type{Vertical}, ::Type{LineStyle{Heavy,Dashed3}}) = '╏'
@inline char(::Type{Vertical}, ::Type{LineStyle{Heavy,Half1}}) = '╹'
@inline char(::Type{Vertical}, ::Type{LineStyle{Heavy,Half2}}) = '╻'
@inline char(::Type{Vertical}, ::Type{LineStyle{Double,T}}) where T = '║'
@inline char(::Type{Light}, ::Type{NoLine}, ::Type{Heavy}, ::Type{NoLine}) = '╼'
@inline char(::Type{Heavy}, ::Type{NoLine}, ::Type{Light}, ::Type{NoLine}) = '╾'
@inline char(::Type{NoLine}, ::Type{Light}, ::Type{NoLine}, ::Type{Heavy}) = '╽'
@inline char(::Type{NoLine}, ::Type{Heavy}, ::Type{NoLine}, ::Type{Light}) = '╿'
@inline char(::Type{NoLine}, ::Type{NoLine}, ::Type{Light}, ::Type{Light}) = '┌'
@inline char(::Type{Light}, ::Type{NoLine}, ::Type{NoLine}, ::Type{Light}) = '┐'
@inline char(::Type{Light}, ::Type{Light}, ::Type{NoLine}, ::Type{NoLine}) = '┘'
@inline char(::Type{NoLine}, ::Type{Light}, ::Type{Light}, ::Type{NoLine}) = '└'
@inline char(::Type{NoLine}, ::Type{NoLine}, ::Type{Heavy}, ::Type{Light}) = '┍'
@inline char(::Type{Heavy}, ::Type{NoLine}, ::Type{NoLine}, ::Type{Light}) = '┑'
@inline char(::Type{Heavy}, ::Type{Light}, ::Type{NoLine}, ::Type{NoLine}) = '┙'
@inline char(::Type{NoLine}, ::Type{Light}, ::Type{Heavy}, ::Type{NoLine}) = '┕'
@inline char(::Type{NoLine}, ::Type{NoLine}, ::Type{Double}, ::Type{Light}) = '╒'
@inline char(::Type{Double}, ::Type{NoLine}, ::Type{NoLine}, ::Type{Light}) = '╕'
@inline char(::Type{Double}, ::Type{Light}, ::Type{NoLine}, ::Type{NoLine}) = '╛'
@inline char(::Type{NoLine}, ::Type{Light}, ::Type{Double}, ::Type{NoLine}) = '╘'
@inline char(::Type{NoLine}, ::Type{NoLine}, ::Type{Light}, ::Type{Heavy}) = '┎'
@inline char(::Type{Light}, ::Type{NoLine}, ::Type{NoLine}, ::Type{Heavy}) = '┒'
@inline char(::Type{Light}, ::Type{Heavy}, ::Type{NoLine}, ::Type{NoLine}) = '┚'
@inline char(::Type{NoLine}, ::Type{Heavy}, ::Type{Light}, ::Type{NoLine}) = '┖'
@inline char(::Type{NoLine}, ::Type{NoLine}, ::Type{Heavy}, ::Type{Heavy}) = '┏'
@inline char(::Type{Heavy}, ::Type{NoLine}, ::Type{NoLine}, ::Type{Heavy}) = '┓'
@inline char(::Type{Heavy}, ::Type{Heavy}, ::Type{NoLine}, ::Type{NoLine}) = '┛'
@inline char(::Type{NoLine}, ::Type{Heavy}, ::Type{Heavy}, ::Type{NoLine}) = '┗'
@inline char(::Type{NoLine}, ::Type{NoLine}, ::Type{Double}, ::Type{Heavy}) = '╒'
@inline char(::Type{Double}, ::Type{NoLine}, ::Type{NoLine}, ::Type{Heavy}) = '╕'
@inline char(::Type{Double}, ::Type{Heavy}, ::Type{NoLine}, ::Type{NoLine}) = '╛'
@inline char(::Type{NoLine}, ::Type{Heavy}, ::Type{Double}, ::Type{NoLine}) = '╘'
@inline char(::Type{NoLine}, ::Type{NoLine}, ::Type{Light}, ::Type{Double}) = '╓'
@inline char(::Type{Light}, ::Type{NoLine}, ::Type{NoLine}, ::Type{Double}) = '╖'
@inline char(::Type{Light}, ::Type{Double}, ::Type{NoLine}, ::Type{NoLine}) = '╜'
@inline char(::Type{NoLine}, ::Type{Double}, ::Type{Light}, ::Type{NoLine}) = '╙'
@inline char(::Type{NoLine}, ::Type{NoLine}, ::Type{Double}, ::Type{Double}) = '╔'
@inline char(::Type{Double}, ::Type{NoLine}, ::Type{NoLine}, ::Type{Double}) = '╗'
@inline char(::Type{Double}, ::Type{Double}, ::Type{NoLine}, ::Type{NoLine}) = '╝'
@inline char(::Type{NoLine}, ::Type{Double}, ::Type{Double}, ::Type{NoLine}) = '╚'
@inline char(::Type{NoLine}, ::Type{Light}, ::Type{Light}, ::Type{Light}) = '├'
@inline char(::Type{NoLine}, ::Type{Light}, ::Type{Heavy}, ::Type{Light}) = '┝'
@inline char(::Type{NoLine}, ::Type{Heavy}, ::Type{Light}, ::Type{Light}) = '┞'
@inline char(::Type{NoLine}, ::Type{Light}, ::Type{Light}, ::Type{Heavy}) = '┟'
@inline char(::Type{NoLine}, ::Type{Heavy}, ::Type{Light}, ::Type{Heavy}) = '┠'
@inline char(::Type{NoLine}, ::Type{Heavy}, ::Type{Heavy}, ::Type{Light}) = '┡'
@inline char(::Type{NoLine}, ::Type{Light}, ::Type{Heavy}, ::Type{Heavy}) = '┢'
@inline char(::Type{NoLine}, ::Type{Heavy}, ::Type{Heavy}, ::Type{Heavy}) = '┣'
@inline char(::Type{NoLine}, ::Type{Double}, ::Type{Double}, ::Type{Double}) = '╠'
@inline char(::Type{NoLine}, ::Type{Light}, ::Type{Double}, ::Type{Light}) = '╞'
@inline char(::Type{NoLine}, ::Type{Double}, ::Type{Light}, ::Type{Double}) = '╟'
@inline char(::Type{Light}, ::Type{Light}, ::Type{NoLine}, ::Type{Light}) = '┤'
@inline char(::Type{Heavy}, ::Type{Light}, ::Type{NoLine}, ::Type{Light}) = '┥'
@inline char(::Type{Light}, ::Type{Heavy}, ::Type{NoLine}, ::Type{Light}) = '┦'
@inline char(::Type{Light}, ::Type{Light}, ::Type{NoLine}, ::Type{Heavy}) = '┧'
@inline char(::Type{Light}, ::Type{Heavy}, ::Type{NoLine}, ::Type{Heavy}) = '┨'
@inline char(::Type{Heavy}, ::Type{Heavy}, ::Type{NoLine}, ::Type{Light}) = '┩'
@inline char(::Type{Heavy}, ::Type{Light}, ::Type{NoLine}, ::Type{Heavy}) = '┪'
@inline char(::Type{Heavy}, ::Type{Heavy}, ::Type{NoLine}, ::Type{Heavy}) = '┫'
@inline char(::Type{Double}, ::Type{Double}, ::Type{NoLine}, ::Type{Double}) = '╣'
@inline char(::Type{Double}, ::Type{Light}, ::Type{NoLine}, ::Type{Light}) = '╡'
@inline char(::Type{Light}, ::Type{Double}, ::Type{NoLine}, ::Type{Double}) = '╢'
@inline char(::Type{Light}, ::Type{NoLine}, ::Type{Light}, ::Type{Light}) = '┬'
@inline char(::Type{Heavy}, ::Type{NoLine}, ::Type{Light}, ::Type{Light}) = '┭'
@inline char(::Type{Light}, ::Type{NoLine}, ::Type{Heavy}, ::Type{Light}) = '┮'
@inline char(::Type{Heavy}, ::Type{NoLine}, ::Type{Heavy}, ::Type{Light}) = '┯'
@inline char(::Type{Light}, ::Type{NoLine}, ::Type{Light}, ::Type{Heavy}) = '┰'
@inline char(::Type{Heavy}, ::Type{NoLine}, ::Type{Light}, ::Type{Heavy}) = '┱'
@inline char(::Type{Light}, ::Type{NoLine}, ::Type{Heavy}, ::Type{Heavy}) = '┲'
@inline char(::Type{Heavy}, ::Type{NoLine}, ::Type{Heavy}, ::Type{Heavy}) = '┳'
@inline char(::Type{Double}, ::Type{NoLine}, ::Type{Double}, ::Type{Light}) = '╤'
@inline char(::Type{Light}, ::Type{NoLine}, ::Type{Light}, ::Type{Double}) = '╥'
@inline char(::Type{Double}, ::Type{NoLine}, ::Type{Double}, ::Type{Double}) = '╦'
@inline char(::Type{Light}, ::Type{Light}, ::Type{Light}, ::Type{NoLine}) = '┴'
@inline char(::Type{Heavy}, ::Type{Light}, ::Type{Light}, ::Type{NoLine}) = '┵'
@inline char(::Type{Light}, ::Type{Light}, ::Type{Heavy}, ::Type{NoLine}) = '┶'
@inline char(::Type{Heavy}, ::Type{Light}, ::Type{Heavy}, ::Type{NoLine}) = '┷'
@inline char(::Type{Light}, ::Type{Heavy}, ::Type{Light}, ::Type{NoLine}) = '┸'
@inline char(::Type{Heavy}, ::Type{Heavy}, ::Type{Light}, ::Type{NoLine}) = '┹'
@inline char(::Type{Light}, ::Type{Heavy}, ::Type{Heavy}, ::Type{NoLine}) = '┺'
@inline char(::Type{Heavy}, ::Type{Heavy}, ::Type{Heavy}, ::Type{NoLine}) = '┻'
@inline char(::Type{Double}, ::Type{Light}, ::Type{Double}, ::Type{NoLine}) = '╧'
@inline char(::Type{Light}, ::Type{Double}, ::Type{Light}, ::Type{NoLine}) = '╨'
@inline char(::Type{Double}, ::Type{Double}, ::Type{Double}, ::Type{NoLine}) = '╩'
@inline char(::Type{NoLine}, ::Type{Double}, ::Type{Heavy}, ::Type{Double}) = '┣'
@inline char(::Type{NoLine}, ::Type{Double}, ::Type{Light}, ::Type{Light}) = '┞'
@inline char(::Type{NoLine}, ::Type{Light}, ::Type{Light}, ::Type{Double}) = '┟'
@inline char(::Type{NoLine}, ::Type{Double}, ::Type{Double}, ::Type{Light}) = '┡'
@inline char(::Type{NoLine}, ::Type{Light}, ::Type{Double}, ::Type{Double}) = '┢'
@inline char(::Type{NoLine}, ::Type{Double}, ::Type{Heavy}, ::Type{Heavy}) = '┣'
@inline char(::Type{NoLine}, ::Type{Heavy}, ::Type{Heavy}, ::Type{Double}) = '┣'
@inline char(::Type{NoLine}, ::Type{Double}, ::Type{Double}, ::Type{Heavy}) = '┣'
@inline char(::Type{NoLine}, ::Type{Heavy}, ::Type{Double}, ::Type{Double}) = '┣'
@inline char(::Type{NoLine}, ::Type{Light}, ::Type{Heavy}, ::Type{Double}) = '┢'
@inline char(::Type{NoLine}, ::Type{Light}, ::Type{Double}, ::Type{Heavy}) = '┢'
@inline char(::Type{NoLine}, ::Type{Heavy}, ::Type{Light}, ::Type{Double}) = '┠'
@inline char(::Type{NoLine}, ::Type{Heavy}, ::Type{Double}, ::Type{Light}) = '┡'
@inline char(::Type{NoLine}, ::Type{Heavy}, ::Type{Double}, ::Type{Heavy}) = '┣'
@inline char(::Type{NoLine}, ::Type{Double}, ::Type{Heavy}, ::Type{Light}) = '┣'
@inline char(::Type{NoLine}, ::Type{Double}, ::Type{Light}, ::Type{Heavy}) = '┠'
@inline char(::Type{Double}, ::Type{Heavy}, ::Type{NoLine}, ::Type{Double}) = '┫'
@inline char(::Type{Light}, ::Type{Double}, ::Type{NoLine}, ::Type{Light}) = '┦'
@inline char(::Type{Light}, ::Type{Light}, ::Type{NoLine}, ::Type{Double}) = '┧'
@inline char(::Type{Double}, ::Type{Double}, ::Type{NoLine}, ::Type{Light}) = '┩'
@inline char(::Type{Double}, ::Type{Light}, ::Type{NoLine}, ::Type{Double}) = '┪'
@inline char(::Type{Double}, ::Type{Heavy}, ::Type{NoLine}, ::Type{Heavy}) = '┫'
@inline char(::Type{Heavy}, ::Type{Heavy}, ::Type{NoLine}, ::Type{Double}) = '┫'
@inline char(::Type{Double}, ::Type{Double}, ::Type{NoLine}, ::Type{Heavy}) = '┫'
@inline char(::Type{Heavy}, ::Type{Double}, ::Type{NoLine}, ::Type{Double}) = '┫'
@inline char(::Type{Light}, ::Type{Heavy}, ::Type{NoLine}, ::Type{Double}) = '┨'
@inline char(::Type{Light}, ::Type{Double}, ::Type{NoLine}, ::Type{Heavy}) = '┨'
@inline char(::Type{Heavy}, ::Type{Light}, ::Type{NoLine}, ::Type{Double}) = '┪'
@inline char(::Type{Heavy}, ::Type{Double}, ::Type{NoLine}, ::Type{Light}) = '┩'
@inline char(::Type{Heavy}, ::Type{Double}, ::Type{NoLine}, ::Type{Heavy}) = '┫'
@inline char(::Type{Double}, ::Type{Light}, ::Type{NoLine}, ::Type{Heavy}) = '┪'
@inline char(::Type{Double}, ::Type{Heavy}, ::Type{NoLine}, ::Type{Light}) = '┩'
@inline char(::Type{Double}, ::Type{NoLine}, ::Type{Light}, ::Type{Light}) = '┭'
@inline char(::Type{Light}, ::Type{NoLine}, ::Type{Double}, ::Type{Light}) = '┮'
@inline char(::Type{Light}, ::Type{NoLine}, ::Type{Double}, ::Type{Double}) = '┲'
@inline char(::Type{Double}, ::Type{NoLine}, ::Type{Light}, ::Type{Double}) = '┱'
@inline char(::Type{Double}, ::Type{NoLine}, ::Type{Heavy}, ::Type{Heavy}) = '┳'
@inline char(::Type{Heavy}, ::Type{NoLine}, ::Type{Double}, ::Type{Heavy}) = '┳'
@inline char(::Type{Heavy}, ::Type{NoLine}, ::Type{Double}, ::Type{Double}) = '┳'
@inline char(::Type{Double}, ::Type{NoLine}, ::Type{Heavy}, ::Type{Double}) = '┳'
@inline char(::Type{Light}, ::Type{NoLine}, ::Type{Heavy}, ::Type{Double}) = '┲'
@inline char(::Type{Light}, ::Type{NoLine}, ::Type{Double}, ::Type{Heavy}) = '┲'
@inline char(::Type{Heavy}, ::Type{NoLine}, ::Type{Light}, ::Type{Double}) = '┱'
@inline char(::Type{Heavy}, ::Type{NoLine}, ::Type{Heavy}, ::Type{Double}) = '┳'
@inline char(::Type{Heavy}, ::Type{NoLine}, ::Type{Double}, ::Type{Light}) = '┯'
@inline char(::Type{Double}, ::Type{NoLine}, ::Type{Light}, ::Type{Heavy}) = '┱'
@inline char(::Type{Double}, ::Type{NoLine}, ::Type{Heavy}, ::Type{Light}) = '┯'
@inline char(::Type{Double}, ::Type{NoLine}, ::Type{Double}, ::Type{Heavy}) = '┳'
@inline char(::Type{Light}, ::Type{Light}, ::Type{Double}, ::Type{NoLine}) = '┶'
@inline char(::Type{Light}, ::Type{Heavy}, ::Type{Double}, ::Type{NoLine}) = '┺'
@inline char(::Type{Light}, ::Type{Double}, ::Type{Heavy}, ::Type{NoLine}) = '┺'
@inline char(::Type{Light}, ::Type{Double}, ::Type{Double}, ::Type{NoLine}) = '┺'
@inline char(::Type{Heavy}, ::Type{Light}, ::Type{Double}, ::Type{NoLine}) = '┷'
@inline char(::Type{Heavy}, ::Type{Heavy}, ::Type{Double}, ::Type{NoLine}) = '┻'
@inline char(::Type{Heavy}, ::Type{Double}, ::Type{Light}, ::Type{NoLine}) = '┹'
@inline char(::Type{Heavy}, ::Type{Double}, ::Type{Heavy}, ::Type{NoLine}) = '┻'
@inline char(::Type{Heavy}, ::Type{Double}, ::Type{Double}, ::Type{NoLine}) = '┻'
@inline char(::Type{Double}, ::Type{Light}, ::Type{Light}, ::Type{NoLine}) = '┹'
@inline char(::Type{Double}, ::Type{Light}, ::Type{Heavy}, ::Type{NoLine}) = '┵'
@inline char(::Type{Double}, ::Type{Heavy}, ::Type{Light}, ::Type{NoLine}) = '┹'
@inline char(::Type{Double}, ::Type{Heavy}, ::Type{Heavy}, ::Type{NoLine}) = '┻'
@inline char(::Type{Double}, ::Type{Heavy}, ::Type{Double}, ::Type{NoLine}) = '┻'
@inline char(::Type{Double}, ::Type{Double}, ::Type{Light}, ::Type{NoLine}) = '┹'
@inline char(::Type{Double}, ::Type{Double}, ::Type{Heavy}, ::Type{NoLine}) = '┻'
@inline char(::Type{Light}, ::Type{Light}, ::Type{Light}, ::Type{Light}) = '┼'
@inline char(::Type{Heavy}, ::Type{Light}, ::Type{Light}, ::Type{Light}) = '┽'
@inline char(::Type{Light}, ::Type{Light}, ::Type{Heavy}, ::Type{Light}) = '┾'
@inline char(::Type{Heavy}, ::Type{Light}, ::Type{Heavy}, ::Type{Light}) = '┿'
@inline char(::Type{Light}, ::Type{Heavy}, ::Type{Light}, ::Type{Light}) = '╀'
@inline char(::Type{Light}, ::Type{Light}, ::Type{Light}, ::Type{Heavy}) = '╁'
@inline char(::Type{Light}, ::Type{Heavy}, ::Type{Light}, ::Type{Heavy}) = '╂'
@inline char(::Type{Heavy}, ::Type{Heavy}, ::Type{Light}, ::Type{Light}) = '╃'
@inline char(::Type{Light}, ::Type{Heavy}, ::Type{Heavy}, ::Type{Light}) = '╄'
@inline char(::Type{Heavy}, ::Type{Light}, ::Type{Light}, ::Type{Heavy}) = '╅'
@inline char(::Type{Light}, ::Type{Light}, ::Type{Heavy}, ::Type{Heavy}) = '╆'
@inline char(::Type{Heavy}, ::Type{Heavy}, ::Type{Heavy}, ::Type{Light}) = '╇'
@inline char(::Type{Heavy}, ::Type{Light}, ::Type{Heavy}, ::Type{Heavy}) = '╈'
@inline char(::Type{Heavy}, ::Type{Heavy}, ::Type{Light}, ::Type{Heavy}) = '╉'
@inline char(::Type{Light}, ::Type{Heavy}, ::Type{Heavy}, ::Type{Heavy}) = '╊'
@inline char(::Type{Heavy}, ::Type{Heavy}, ::Type{Heavy}, ::Type{Heavy}) = '╋'
@inline char(::Type{Double}, ::Type{Light}, ::Type{Double}, ::Type{Light}) = '╪'
@inline char(::Type{Light}, ::Type{Double}, ::Type{Light}, ::Type{Double}) = '╫'
@inline char(::Type{Double}, ::Type{Double}, ::Type{Double}, ::Type{Double}) = '╬'
@inline char(::Type{Light}, ::Type{Light}, ::Type{Light}, ::Type{Double}) = '╁'
@inline char(::Type{Light}, ::Type{Light}, ::Type{Heavy}, ::Type{Double}) = '╆'
@inline char(::Type{Light}, ::Type{Light}, ::Type{Double}, ::Type{Light}) = '┾'
@inline char(::Type{Light}, ::Type{Light}, ::Type{Double}, ::Type{Heavy}) = '╆'
@inline char(::Type{Light}, ::Type{Light}, ::Type{Double}, ::Type{Double}) = '╆'
@inline char(::Type{Light}, ::Type{Heavy}, ::Type{Light}, ::Type{Double}) = '╂'
@inline char(::Type{Light}, ::Type{Heavy}, ::Type{Heavy}, ::Type{Double}) = '╊'
@inline char(::Type{Light}, ::Type{Heavy}, ::Type{Double}, ::Type{Light}) = '╄'
@inline char(::Type{Light}, ::Type{Heavy}, ::Type{Double}, ::Type{Heavy}) = '╊'
@inline char(::Type{Light}, ::Type{Heavy}, ::Type{Double}, ::Type{Double}) = '╊'
@inline char(::Type{Light}, ::Type{Double}, ::Type{Light}, ::Type{Light}) = '╀'
@inline char(::Type{Light}, ::Type{Double}, ::Type{Light}, ::Type{Heavy}) = '╂'
@inline char(::Type{Light}, ::Type{Double}, ::Type{Heavy}, ::Type{Light}) = '╄'
@inline char(::Type{Light}, ::Type{Double}, ::Type{Heavy}, ::Type{Heavy}) = '╊'
@inline char(::Type{Light}, ::Type{Double}, ::Type{Heavy}, ::Type{Double}) = '╊'
@inline char(::Type{Light}, ::Type{Double}, ::Type{Double}, ::Type{Light}) = '╄'
@inline char(::Type{Light}, ::Type{Double}, ::Type{Double}, ::Type{Heavy}) = '╊'
@inline char(::Type{Light}, ::Type{Double}, ::Type{Double}, ::Type{Double}) = '╊'
@inline char(::Type{Heavy}, ::Type{Light}, ::Type{Light}, ::Type{Double}) = '╅'
@inline char(::Type{Heavy}, ::Type{Light}, ::Type{Heavy}, ::Type{Double}) = '╈'
@inline char(::Type{Heavy}, ::Type{Light}, ::Type{Double}, ::Type{Light}) = '┿'
@inline char(::Type{Heavy}, ::Type{Light}, ::Type{Double}, ::Type{Heavy}) = '╈'
@inline char(::Type{Heavy}, ::Type{Light}, ::Type{Double}, ::Type{Double}) = '╈'
@inline char(::Type{Heavy}, ::Type{Heavy}, ::Type{Light}, ::Type{Double}) = '╉'
@inline char(::Type{Heavy}, ::Type{Heavy}, ::Type{Heavy}, ::Type{Double}) = '╋'
@inline char(::Type{Heavy}, ::Type{Heavy}, ::Type{Double}, ::Type{Light}) = '╇'
@inline char(::Type{Heavy}, ::Type{Heavy}, ::Type{Double}, ::Type{Heavy}) = '╋'
@inline char(::Type{Heavy}, ::Type{Heavy}, ::Type{Double}, ::Type{Double}) = '╋'
@inline char(::Type{Heavy}, ::Type{Double}, ::Type{Light}, ::Type{Light}) = '╃'
@inline char(::Type{Heavy}, ::Type{Double}, ::Type{Light}, ::Type{Heavy}) = '╉'
@inline char(::Type{Heavy}, ::Type{Double}, ::Type{Light}, ::Type{Double}) = '╉'
@inline char(::Type{Heavy}, ::Type{Double}, ::Type{Heavy}, ::Type{Light}) = '╇'
@inline char(::Type{Heavy}, ::Type{Double}, ::Type{Heavy}, ::Type{Heavy}) = '╋'
@inline char(::Type{Heavy}, ::Type{Double}, ::Type{Heavy}, ::Type{Double}) = '╋'
@inline char(::Type{Heavy}, ::Type{Double}, ::Type{Double}, ::Type{Light}) = '╇'
@inline char(::Type{Heavy}, ::Type{Double}, ::Type{Double}, ::Type{Heavy}) = '╋'
@inline char(::Type{Heavy}, ::Type{Double}, ::Type{Double}, ::Type{Double}) = '╋'
@inline char(::Type{Double}, ::Type{Light}, ::Type{Light}, ::Type{Light}) = '┽'
@inline char(::Type{Double}, ::Type{Light}, ::Type{Light}, ::Type{Heavy}) = '╅'
@inline char(::Type{Double}, ::Type{Light}, ::Type{Light}, ::Type{Double}) = '╅'
@inline char(::Type{Double}, ::Type{Light}, ::Type{Heavy}, ::Type{Light}) = '┿'
@inline char(::Type{Double}, ::Type{Light}, ::Type{Heavy}, ::Type{Heavy}) = '╈'
@inline char(::Type{Double}, ::Type{Light}, ::Type{Heavy}, ::Type{Double}) = '╈'
@inline char(::Type{Double}, ::Type{Light}, ::Type{Double}, ::Type{Heavy}) = '╈'
@inline char(::Type{Double}, ::Type{Light}, ::Type{Double}, ::Type{Double}) = '╈'
@inline char(::Type{Double}, ::Type{Heavy}, ::Type{Light}, ::Type{Light}) = '╃'
@inline char(::Type{Double}, ::Type{Heavy}, ::Type{Light}, ::Type{Heavy}) = '╉'
@inline char(::Type{Double}, ::Type{Heavy}, ::Type{Light}, ::Type{Double}) = '╉'
@inline char(::Type{Double}, ::Type{Heavy}, ::Type{Heavy}, ::Type{Light}) = '╇'
@inline char(::Type{Double}, ::Type{Heavy}, ::Type{Heavy}, ::Type{Heavy}) = '╋'
@inline char(::Type{Double}, ::Type{Heavy}, ::Type{Heavy}, ::Type{Double}) = '╋'
@inline char(::Type{Double}, ::Type{Heavy}, ::Type{Double}, ::Type{Light}) = '╇'
@inline char(::Type{Double}, ::Type{Heavy}, ::Type{Double}, ::Type{Heavy}) = '╋'
@inline char(::Type{Double}, ::Type{Heavy}, ::Type{Double}, ::Type{Double}) = '╋'
@inline char(::Type{Double}, ::Type{Double}, ::Type{Light}, ::Type{Light}) = '╃'
@inline char(::Type{Double}, ::Type{Double}, ::Type{Light}, ::Type{Heavy}) = '╉'
@inline char(::Type{Double}, ::Type{Double}, ::Type{Light}, ::Type{Double}) = '╉'
@inline char(::Type{Double}, ::Type{Double}, ::Type{Heavy}, ::Type{Light}) = '╇'
@inline char(::Type{Double}, ::Type{Double}, ::Type{Heavy}, ::Type{Heavy}) = '╋'
@inline char(::Type{Double}, ::Type{Double}, ::Type{Heavy}, ::Type{Double}) = '╋'
@inline char(::Type{Double}, ::Type{Double}, ::Type{Double}, ::Type{Light}) = '╇'
@inline char(::Type{Double}, ::Type{Double}, ::Type{Double}, ::Type{Heavy}) = '╋'
@inline char(::Type{BlackArrow{Left}}) = '◂'
@inline char(::Type{BlackArrow{Up}}) = '▴'
@inline char(::Type{BlackArrow{Right}}) = '▸'
@inline char(::Type{BlackArrow{Down}}) = '▾'
@inline char(::Type{WhiteArrow{Left}}) = '◃'
@inline char(::Type{WhiteArrow{Up}}) = '▵'
@inline char(::Type{WhiteArrow{Right}}) = '▹'
@inline char(::Type{WhiteArrow{Down}}) = '▿'
@inline char(::Type{Bar{Light,Left}}) = char(NoLine, Ligth, Light, Light)
@inline char(::Type{Bar{Light,Up}}) = char(Light, NoLine, Light, Light)
@inline char(::Type{Bar{Light,Right}}) = char(Light, Light, NoLine, Light)
@inline char(::Type{Bar{Light,Down}}) = char(Ligth, Light, Light, NoLine)
@inline char(::Type{Bar{Heavy,Left}}) = char(NoLine, Heavy, Heavy, Heavy)
@inline char(::Type{Bar{Heavy,Up}}) = char(Heavy, NoLine, Heavy, Heavy)
@inline char(::Type{Bar{Heavy,Right}}) = char(Heavy, Heavy, NoLine, Heavy)
@inline char(::Type{Bar{Heavy,Down}}) = char(Heavy, Heavy, Heavy, NoLine)
@inline char(::Type{Bar{Double,Left}}) = char(NoLine, Double, Double, Double)
@inline char(::Type{Bar{Double,Up}}) = char(Double, NoLine, Double, Double)
@inline char(::Type{Bar{Double,Right}}) = char(Double, Double, NoLine, Double)
@inline char(::Type{Bar{Double,Down}}) = char(Double, Double, Double, NoLine)
@inline char(::Type{BackRectangle}) = '▮'
@inline char(::Type{WhiteRectangle}) = '▯'
@inline char(::Type{Lozenge}) = '◊'
@inline char(::Type{LargeDot}) = '•'
@inline char(::Type{SmallDot}) = '∙'