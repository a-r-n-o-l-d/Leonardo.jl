for lori in (Horizontal, Vertical)
    @test_call drawline!(CANVAS, (1,1), 10, lori)
    @test_opt drawline!(CANVAS, (1,1), 10, lori)
    for lsize in LSIZES, ltype in LTYPES
        lstyle = LineStyle(lsize, ltype)
        @test_call drawline!(CANVAS, (1,1), 10, lori, lstyle)
        @test_opt drawline!(CANVAS, (1,1), 10, lori, lstyle)
        #@test_opt Leonardo.drawline2!(CANVAS, (1,1), 10, lori = lori, lstyle = lstyle)
    end
end
