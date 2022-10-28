for ldir in LDIRS, lsize in LSIZES
    es = EndStyle(NoEnd, ldir, LineStyle(lsize))
    @test_call drawend!(CANVAS, (5, 5), es)
    @test_opt drawend!(CANVAS, (5, 5), es)
    #@test_call drawend!(c, (5,5), EndStyle(ldir, LineStyle(lsize)))
    #@test_opt drawend!(c, (5,5), EndStyle(ldir, LineStyle(lsize)))
end
for lend in ARROWS, ldir in LDIRS
    es = EndStyle(lend, ldir, LineStyle())
    @test_call drawend!(CANVAS, (5, 5), es)
    @test_opt drawend!(CANVAS, (5, 5), es)
    #@test_call drawend!(c, (5,5), EndStyle(lend, ldir))
    #@test_opt drawend!(c, (5,5), EndStyle(lend, ldir))
end
for ldir in LDIRS, lsize in LSIZES
    es = EndStyle(Bar, ldir, LineStyle(lsize))
    @test_call drawend!(CANVAS, (5, 5), es)
    @test_opt drawend!(CANVAS, (5, 5), es)
end
for fchar in FREECHARS
    es = EndStyle(fchar, NoDirection, LineStyle())
    @test_call drawend!(CANVAS, (5, 5), es)
    @test_opt drawend!(CANVAS, (5, 5), es)
    #@test_call drawend!(c, (5,5), EndStyle(fchar))
    #@test_opt drawend!(c, (5,5), EndStyle(fchar))
end

paths = (
    ((1, 1), (5, 1), Vertical),
    ((1, 5), (1, 1), Vertical),
    ((1, 1), (1, 5), Vertical),
    ((5, 5), (1, 1), Vertical),
    ((1, 1), (5, 5), Vertical),
    ((1, 5), (5, 1), Vertical),
    ((5, 1), (1, 5), Vertical),
    ((1, 1), (1, 5), Horizontal),
    ((5, 1), (1, 1), Horizontal),
    ((1, 1), (5, 1), Horizontal),
    ((5, 5), (1, 1), Horizontal),
    ((1, 1), (5, 5), Horizontal),
    ((1, 5), (5, 1), Horizontal),
    ((5, 1), (1, 5), Horizontal),
    ((1, 1), 10, Vertical),
    ((1, 1), 10, Horizontal),
    ([(1, 1), (5, 5), (8, 10), (12, 6)], Vertical),
    ([(10, 10), (10, 5), (1, 5)], Vertical),
    ([(10, 10), (10, 5), (20, 5)], Vertical),
    ([(1, 1), (5, 5), (8, 10), (12, 6)], Horizontal),
    ([(10, 10), (10, 5), (1, 5)], Horizontal),
    ([(10, 10), (10, 5), (20, 5)], Horizontal),
)

for p in paths
    lsize1, lsize2 = rand(LSIZES), rand(LSIZES)
    ltype1, ltype2 = rand(LTYPES), rand(LTYPES)
    lend1, lend2 = rand(LENDS), rand(LENDS)
    pstyle = PathStyle(LineStyle(lsize1, ltype1), LineStyle(lsize2, ltype2), lend1, lend2)
    @test_call drawpath!(CANVAS, p..., pstyle)
    @test_opt drawpath!(CANVAS, p..., pstyle)
end

c = Canvas(20, 10; bgchar = '.')
drawpath!(c, paths[1]..., PathStyle(Bar, BlackArrow))
res = """
├───▸...............
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
test_canvas_output(c, res)

reset!(c)
drawpath!(c, paths[2]..., PathStyle(LineStyle(Heavy), BlackArrow))
res = """
▴...................
┃...................
┃...................
┃...................
▾...................
....................
....................
....................
....................
....................
"""
test_canvas_output(c, res)

reset!(c)
drawpath!(c, paths[3]..., PathStyle(LineStyle(Heavy), BlackRectangle, Lozenge))
res = """
▮...................
┃...................
┃...................
┃...................
◊...................
....................
....................
....................
....................
....................
"""
test_canvas_output(c, res)

reset!(c)
drawpath!(c, paths[4]..., PathStyle())
res = """
────┐...............
....│...............
....│...............
....│...............
....│...............
....................
....................
....................
....................
....................
"""
test_canvas_output(c, res)

reset!(c)
drawpath!(c, paths[5]..., PathStyle(LineStyle(Light), LineStyle(Heavy), Bar, BlackArrow))
res = """
┬...................
│...................
│...................
│...................
┕━━━▸...............
....................
....................
....................
....................
....................
"""
test_canvas_output(c, res)

reset!(c)
drawpath!(c, paths[6]..., PathStyle(Bar, BlackArrow))
res = """
┌───▸...............
│...................
│...................
│...................
┴...................
....................
....................
....................
....................
....................
"""
test_canvas_output(c, res)

reset!(c)
drawpath!(c, paths[7]..., PathStyle(Bar, BlackArrow))
res = """
....┬...............
....│...............
....│...............
....│...............
◂───┘...............
....................
....................
....................
....................
....................
"""
test_canvas_output(c, res)

reset!(c)
drawpath!(c, paths[8]..., PathStyle(Bar, BlackArrow))
res = """
┬...................
│...................
│...................
│...................
▾...................
....................
....................
....................
....................
....................
"""
test_canvas_output(c, res)

reset!(c)
drawpath!(c, paths[9]..., PathStyle(Bar, BlackArrow))
res = """
◂───┤...............
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
test_canvas_output(c, res)

reset!(c)
drawpath!(c, paths[10]..., PathStyle(Bar, BlackArrow))
res = """
├───▸...............
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
test_canvas_output(c, res)

reset!(c)
drawpath!(c, paths[11]..., PathStyle(Bar, BlackArrow))
res = """
▴...................
│...................
│...................
│...................
└───┤...............
....................
....................
....................
....................
....................
"""
test_canvas_output(c, res)

reset!(c)
drawpath!(c, paths[12]..., PathStyle(Bar, BlackArrow))
res = """
├───┐...............
....│...............
....│...............
....│...............
....▾...............
....................
....................
....................
....................
....................
"""
test_canvas_output(c, res)

reset!(c)
drawpath!(c, paths[13]..., PathStyle(Bar, BlackArrow))
res = """
....▴...............
....│...............
....│...............
....│...............
├───┘...............
....................
....................
....................
....................
....................
"""
test_canvas_output(c, res)

reset!(c)
drawpath!(c, paths[14]..., PathStyle(Bar, BlackArrow))
res = """
┌───┤...............
│...................
│...................
│...................
▾...................
....................
....................
....................
....................
....................
"""
test_canvas_output(c, res)

reset!(c)
drawpath!(c, paths[15]..., PathStyle(Bar, BlackArrow))
res = """
┬...................
│...................
│...................
│...................
│...................
│...................
│...................
│...................
│...................
▾...................
"""
test_canvas_output(c, res)

reset!(c)
drawpath!(c, paths[16]..., PathStyle(Bar, BlackArrow))
res = """
├────────▸..........
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
test_canvas_output(c, res)

reset!(c)
drawpath!(c, paths[17]..., PathStyle(Bar, BlackArrow))
res = """
┬...................
│...................
│...................
│...................
└───┐...............
....│..┌───▸........
....│..│............
....│..│............
....│..│............
....└──┘............
"""
test_canvas_output(c, res)

reset!(c)
drawpath!(c, paths[18]..., PathStyle(Bar, BlackArrow))
res = """
....................
....................
....................
....................
◂────────┐..........
.........│..........
.........│..........
.........│..........
.........│..........
.........┴..........
"""
test_canvas_output(c, res)

reset!(c)
drawpath!(c, paths[19]..., PathStyle(Bar, BlackArrow))
res = """
....................
....................
....................
....................
.........┌─────────▸
.........│..........
.........│..........
.........│..........
.........│..........
.........┴..........
"""
test_canvas_output(c, res)

reset!(c)
drawpath!(c, paths[20]..., PathStyle(Bar, BlackArrow))
res = """
├───┐...............
....│...............
....│...............
....│...............
....└──┐............
.......│...▴........
.......│...│........
.......│...│........
.......│...│........
.......└───┘........
"""
test_canvas_output(c, res)

reset!(c)
drawpath!(c, paths[21]..., PathStyle(Bar, BlackArrow))
res = """
....................
....................
....................
....................
◂────────┐..........
.........│..........
.........│..........
.........│..........
.........│..........
.........┴..........
"""
test_canvas_output(c, res)

reset!(c)
drawpath!(c, paths[22]..., PathStyle(Bar, BlackArrow))
res = """
....................
....................
....................
....................
.........┌─────────▸
.........│..........
.........│..........
.........│..........
.........│..........
.........┴..........
"""
test_canvas_output(c, res)

Ps = [(8, 9), (12, 6), (2, 2), (8, 10)]
reset!(c)
drawpath!(c, Ps, Vertical, PathStyle(Bar, BlackArrow))
res = """
....................
.┌─────────┐........
.│.........│........
.│.........│........
.│.........│........
.│.....┌───┘........
.│.....│............
.│.....│............
.│.....┴............
.└─────▸............
"""
test_canvas_output(c, res)

Ps = [(1, 1), (1, 3), (1, 7), (1, 10)]
reset!(c)
drawpath!(c, Ps, Vertical, PathStyle(Bar, BlackArrow))
res = """
┬...................
│...................
│...................
│...................
│...................
│...................
│...................
│...................
│...................
▾...................
"""
test_canvas_output(c, res)

Ps = [(19, 10), (15, 2), (8, 6), (11, 10)]
reset!(c)
drawpath!(c, Ps, Horizontal, PathStyle(Bar, BlackArrow))
res = """
....................
.......┌──────┐.....
.......│......│.....
.......│......│.....
.......│......│.....
.......└──┐...│.....
..........│...│.....
..........│...│.....
..........│...│.....
..........▾...└───┤.
"""
test_canvas_output(c, res)

Ps = [(10, 2), (20, 4), (17, 10), (9, 7)]
reset!(c)
drawpath!(c, Ps, Horizontal, PathStyle(Bar, BlackArrow))
res = """
....................
.........├─────────┐
...................│
................┌──┘
................│...
................│...
........▴.......│...
........│.......│...
........│.......│...
........└───────┘...
"""
test_canvas_output(c, res)

Ps = [(7, 1), (10, 2), (18, 5), (19, 4)]
reset!(c)
drawpath!(c, Ps, Horizontal, PathStyle(Bar, BlackArrow))
res = """
......├──┐..........
.........└───────┐..
.................│..
.................│▴.
.................└┘.
....................
....................
....................
....................
....................
"""
test_canvas_output(c, res)

Ps = [(1, 1), (5, 1), (8, 1), (15, 1)]
reset!(c)
drawpath!(c, Ps, Horizontal, PathStyle(Bar, BlackArrow))
res = """
├─────────────▸.....
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
test_canvas_output(c, res)



function foo()
    Ps = [(rand(1:20), rand(1:10)), (rand(1:20), rand(1:10)), (rand(1:20), rand(1:10)), (rand(1:20), rand(1:10))]
    println(Ps)
    reset!(c)
    drawpath!(c, Ps, Vertical, PathStyle(Bar, BlackArrow))
end

function bar()
    Ps = [(rand(1:20), rand(1:10)), (rand(1:20), rand(1:10)), (rand(1:20), rand(1:10)), (rand(1:20), rand(1:10))]
    println(Ps)
    reset!(c)
    drawpath!(c, Ps, Horizontal, PathStyle(Bar, BlackArrow))
end
