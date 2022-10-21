#using Leonardo: LineEnd
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

#@test_call Leonardo.draw_line!(c, (1,1), Horizontal, 10; lsize = Double)
#@test_opt Leonardo.draw_line!(c, (1,1), Horizontal, 10; ltype = Dashed1)

#1 = Leonardo.Line2((1,1), 10, Horizontal)
#l2 = Leonardo.Line((1,1), 10, Horizontal)
#@test_opt Leonardo.Line2((1,1), 10, Horizontal)
#@test_opt Leonardo._lines([l1, l2], 2)

#c = Canvas(80, 20)
#@test_opt draw!(c, Leonardo.Line2((1,1), 10, Horizontal))
#@test_opt draw!(c, Leonardo._lines([l1, l2], 1))

#=l1 = Leonardo.Line2((1,1), 10, Horizontal)
l2 = Leonardo.Line2((1,1), 10, Horizontal)
@test_call  Leonardo.Lines([l1, l2])
@test_opt Leonardo.Lines([l1, l2])
ls = Leonardo.Lines([l1, l2])
@test_opt draw!(c, ls)=#

#=@test_call Leonardo.Line2((1,1), 10, Horizontal; lsize = Heavy, ltype = Dashed3)
@test_opt Leonardo.Line2((1,1), 10, Horizontal)

c = Canvas(80, 20)
l = Leonardo.Line2((1,1), 10, Vertical)
@test_call draw!(c, l)
@test_opt draw!(c, l)



l1 = Leonardo.Line2((1,1), 10, Horizontal)
l2 = Leonardo.Line2((1,1), 10, Vertical)


@test_call  Leonardo.Lines([l1, l2])
@test_opt Leonardo.Lines([l1, l2])

ls = Leonardo.Lines([l1, l2])=#
#@test_opt draw!(c, ls)

#=@test_call Line((1,1), 10, Horizontal; lsize = Heavy, ltype = Dashed3)
@test_opt Line((1,1), 10, Horizontal)

c = Canvas(80, 20)
l = Line((1,1), 10, Vertical)
@test_call draw!(c, l)
@test_opt draw!(c, l)

@test_call LineEnd((1,1), BlackArrow, Up)
@test_opt LineEnd((1,1), BlackArrow, Up)

le = LineEnd((1,1), BlackArrow, Up)
@test_call draw!(c, le)
@test_opt draw!(c, le)

le = LineEnd((1,1), Bar, Up, Heavy)
@test_call draw!(c, le)
@test_opt draw!(c, le)

le = LineEnd((1,1), Lozenge)
@test_call draw!(c, le)
@test_opt draw!(c, le)

l1 = Line((1,1), 10, Horizontal)
l2 = Line((1,1), 10, Vertical)
@test_call Leonardo._connect(l1, l2, Heavy, Light)
@test_opt Leonardo._connect(l1, l2, Heavy, Light)

l1 = Line((1,1), 10, Vertical)
l2 = Line((1,10), 10, Horizontal)
@test_call Leonardo._connect(l1, l2, Heavy, Light)
@test_opt Leonardo._connect(l1, l2, Heavy, Light)

#@test_opt Leonardo.lines([l1, l2])
@test_call  Leonardo.Lines([l1, l2])
@test_opt Leonardo.Lines([l1, l2])

ls = Leonardo.Lines([l1, l2])
#@test_opt draw!(c, ls)

#=@test_call Path((1,1), (5,5), Horizontal)
@test_opt Path((1,1), (5,5), Horizontal)

p = Path((1,1), (5,5), Horizontal)
@test_call draw!(c, p)
@test_opt draw!(c, p)

@test_call Path((5,5), (1,1), Vertical)
@test_opt Path((5,5), (1,1), Vertical)

@test_call Path((5,5), 10, Vertical)
@test_opt Path((5,5), 10, Vertical)

@test_call Path((5,5), 10, Horizontal)
@test_opt Path((5,5), 10, Horizontal)=#

#=
@test_call Path([(1, 1), (5,5), (8,10), (12, 6)], Vertical)
@test_opt Path([(1, 1), (5,5), (8,10), (12, 6)], Vertical)

@test_call Path([(1, 1), (5,5), (8,10), (12, 6)], Horizontal)
#@test_opt Path([(1, 1), (5,5), (8,10), (12, 6)], Horizontal)


=#
=#
