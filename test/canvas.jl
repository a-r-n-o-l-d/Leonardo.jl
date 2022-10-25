@test_call PrintStyle(; color = :red)
@test_opt PrintStyle(; color = :red)

@test_call Canvas(80, 20)
@test_opt Canvas(80, 20)

c = Canvas(80, 20)
@test_call reset!(CANVAS)
@test_opt reset!(CANVAS)


@test_call drawchar!(CANVAS, (1, 1), 'a')
@test_opt drawchar!(CANVAS, (1, 1), 'a')

@test_call drawchar!(CANVAS, (1, 1), 'a', PrintStyle(color = :red))
@test_opt drawchar!(CANVAS, (1, 1), 'a', PrintStyle(color = :red))

@test_call drawchar!(CANVAS, (1, 1), Lozenge)
@test_opt drawchar!(CANVAS, (1, 1), Lozenge)

@test_call fill!(CANVAS, SmallDot)
@test_opt fill!(CANVAS,  SmallDot)

@test_call fill!(CANVAS, (2,2), 77, 17, SmallDot)
@test_opt fill!(CANVAS, (2,2), 77, 17, SmallDot)
