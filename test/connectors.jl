for ldir1 in LDIRS, ldir2 in LDIRS
    if ldir1 != ldir2
        @test_call biconnector(ldir1, LineStyle(), ldir2, LineStyle())
        @test_opt biconnector(ldir1, LineStyle(), ldir2, LineStyle())
        bc = biconnector(ldir1, LineStyle(), ldir2, LineStyle())
        @test_call drawconnector!(c, (1,1), bc)
        @test_opt drawconnector!(c, (1,1), bc)
    end
end


#=for dir1 in (Up, Down), dir2 in (Left, Right)
    @test_call drawcorner!(c, (1, 1), CornerStyle(dir1, dir2))
    @test_opt drawcorner!(c, (1, 1), CornerStyle(dir1, dir2))
end
=#
#=@test_call Connector((1,1), Heavy, Light, Light, Light)
@test_opt Connector((1,1), Heavy, Light, Light, Light)

@test_call Leonardo.upper_left_corner((1,1), Heavy, Light)
@test_opt Leonardo.upper_left_corner((1,1), Heavy, Light)

c = Canvas(80, 20)
@test_call draw!(c, Connector((1,1), Heavy, Light, Light, Light))
@test_opt draw!(c, Connector((1,1), Heavy, Light, Light, Light))=#
