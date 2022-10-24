@test_opt Leonardo.char(Horizontal, Heavy, Dashed1)

c = Canvas(80, 20)

for lori in (Horizontal, Vertical)
    @test_call drawline!(c, (1,1), 10, lori)
    @test_opt drawline!(c, (1,1), 10, lori)
    for lsize in LSIZES, ltype in (Dashed1, Dashed2, Dashed3, Half1, Half2)
        lstyle = LineStyle(lsize, ltype)
        @test_call drawline!(c, (1,1), 10, lori, lstyle)
        @test_opt drawline!(c, (1,1), 10, lori, lstyle)
    end
end
