for ldir in LDIRS, lsize in LSIZES
    @test_call drawend!(c, (5,5), EndStyle(NoEnd, ldir, LineStyle(lsize)))
    @test_opt drawend!(c, (5,5), EndStyle(NoEnd, ldir, LineStyle(lsize)))
    @test_call drawend!(c, (5,5), EndStyle(ldir, LineStyle(lsize)))
    @test_opt drawend!(c, (5,5), EndStyle(ldir, LineStyle(lsize)))
end
for lend in ARROWS, ldir in LDIRS
    @test_call drawend!(c, (5,5), EndStyle(lend, ldir, LineStyle()))
    @test_opt drawend!(c, (5,5), EndStyle(lend, ldir, LineStyle()))
    @test_call drawend!(c, (5,5), EndStyle(lend, ldir))
    @test_opt drawend!(c, (5,5), EndStyle(lend, ldir))
end
for ldir in LDIRS, lsize in LSIZES
    @test_call drawend!(c, (5,5), EndStyle(Bar, ldir, LineStyle(lsize)))
    @test_opt drawend!(c, (5,5), EndStyle(Bar, ldir, LineStyle(lsize)))
end
for fchar in FREECHARS
    @test_call drawend!(c, (5,5), EndStyle(fchar, NoDirection, LineStyle()))
    @test_opt drawend!(c, (5,5), EndStyle(fchar, NoDirection, LineStyle()))
    @test_call drawend!(c, (5,5), EndStyle(fchar))
    @test_opt drawend!(c, (5,5), EndStyle(fchar))
end

paths = (
    ((1,1), (5,1), Vertical),
    ((1,5), (1,1), Vertical),
    ((1,1), (1,5), Vertical),
    ((5,5), (1,1), Vertical),
    ((1,1), (5,5), Vertical),
    ((1,5), (5,1), Vertical),
    ((5,1), (1,5), Vertical),
    ((1,1), (1,5), Horizontal),
    ((5,1), (1,1), Horizontal),
    ((1,1), (5,1), Horizontal),
    ((5,5), (1,1), Horizontal),
    ((1,1), (5,5), Horizontal),
    ((1,5), (5,1), Horizontal),
    ((5,1), (1,5), Horizontal),
    ((1,1), 10, Vertical),
    ((1,1), 10, Horizontal),
    ([(1, 1), (5,5), (8,10), (12, 6)], Vertical),
    ([(10, 10), (10,5), (1,5)], Vertical),
    ([(10, 10), (10,5), (20,5)], Vertical),
    ([(1, 1), (5,5), (8,10), (12, 6)], Horizontal),
    ([(10, 10), (10,5), (1,5)], Horizontal),
    ([(10, 10), (10,5), (20,5)], Horizontal),
)

for p in paths
    lsize1, lsize2 = rand(LSIZES), rand(LSIZES)
    ltype1, ltype2 = rand(LTYPES), rand(LTYPES)
    lend1, lend2 = rand(LENDS), rand(LENDS)
    pstyle = PathStyle(LineStyle(lsize1, ltype1), LineStyle(lsize2, ltype2), lend1, lend2)
    @test_call drawpath!(CANVAS, p..., pstyle)
    @test_opt drawpath!(CANVAS, p..., pstyle)
end
