for lori in (Horizontal, Vertical)
    @test_call drawline!(CANVAS, (1,1), 10, lori)
    @test_opt drawline!(CANVAS, (1,1), 10, lori)
    for lsize in LSIZES, ltype in LTYPES
        lstyle = LineStyle(lsize, ltype)
        @test_call drawline!(CANVAS, (1,1), 10, lori, lstyle)
        @test_opt drawline!(CANVAS, (1,1), 10, lori, lstyle)
    end
end

c = Canvas(10, 1)
drawline!(c, (1, 1), 10, Horizontal)
res = """
──────────
"""
test_canvas_output(c, res)

c = Canvas(1, 10)
drawline!(c, (1, 1), 10, Vertical)
res = """
│
│
│
│
│
│
│
│
│
│
"""
test_canvas_output(c, res)
