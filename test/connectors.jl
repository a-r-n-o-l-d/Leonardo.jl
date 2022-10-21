
for dir1 in (Up, Down), dir2 in (Left, Right)
    @test_call drawcorner!(c, (1, 1), CornerStyle(dir1, dir2))
    @test_opt drawcorner!(c, (1, 1), CornerStyle(dir1, dir2))
end

#=@test_call Connector((1,1), Heavy, Light, Light, Light)
@test_opt Connector((1,1), Heavy, Light, Light, Light)

@test_call Leonardo.upper_left_corner((1,1), Heavy, Light)
@test_opt Leonardo.upper_left_corner((1,1), Heavy, Light)

c = Canvas(80, 20)
@test_call draw!(c, Connector((1,1), Heavy, Light, Light, Light))
@test_opt draw!(c, Connector((1,1), Heavy, Light, Light, Light))=#
