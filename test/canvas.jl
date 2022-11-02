@test_call PrintStyle(; color = :red)
@test_opt PrintStyle(; color = :red)

@test_call Canvas(80, 20)
@test_opt Canvas(80, 20)

@test_call reset!(CANVAS1)
@test_opt reset!(CANVAS1)

@test_call drawchar!(CANVAS1, (1, 1), 'a')
@test_opt drawchar!(CANVAS1, (1, 1), 'a')

@test_call drawchar!(CANVAS1, (1, 1), 'a', PrintStyle(color = :red))
@test_opt drawchar!(CANVAS1, (1, 1), 'a', PrintStyle(color = :red))

@test_call drawchar!(CANVAS1, (1, 1), Lozenge)
@test_opt drawchar!(CANVAS1, (1, 1), Lozenge)

@test_call fill!(CANVAS1, SmallDot)
@test_opt fill!(CANVAS1,  SmallDot)

@test_call fill!(CANVAS1, (2,2), 77, 17, SmallDot)
@test_opt fill!(CANVAS1, (2,2), 77, 17, SmallDot)

reset!(CANVAS2)
res = """
....................
....................
....................
....................
....................
....................
....................
....................
....................
....................
"""
test_canvas_output(CANVAS2, res)

fill!(CANVAS2, Lozenge)
res = """
◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊
◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊
◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊
◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊
◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊
◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊
◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊
◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊
◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊
◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊
"""
test_canvas_output(CANVAS2, res)
