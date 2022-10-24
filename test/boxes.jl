@test_call BoxStyle(LineStyle(Heavy), LineStyle(Light, Dashed1))
@test_opt BoxStyle(LineStyle(Heavy), LineStyle(Light, Dashed1))

bs = BoxStyle(LineStyle(Heavy), LineStyle(Light, Dashed1))
@test_call drawbox!(CANVAS, (5,5), 10, 5, bs)
@test_opt drawbox!(CANVAS, (5,5), 10, 5, bs)
