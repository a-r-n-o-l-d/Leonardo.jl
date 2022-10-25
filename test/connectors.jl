ls = LineStyle()

for ldir1 in LDIRS, ldir2 in LDIRS
    if ldir1 != ldir2
        @test_call biconnector(ldir1, ls, ldir2, ls)
        @test_opt biconnector(ldir1, ls, ldir2, ls)
        bc = biconnector(ldir1, ls, ldir2, ls)
        @test_call drawconnector!(CANVAS, (1,1), bc)
        @test_opt drawconnector!(CANVAS, (1,1), bc)
    end
end

for ldir1 in LDIRS, ldir2 in LDIRS, ldir3 in LDIRS
    if ldir1 != ldir2 && ldir1 != ldir3 && ldir2 != ldir3
        @test_call triconnector(ldir1, ls, ldir2, ls, ldir3, ls)
        @test_opt triconnector(ldir1, ls, ldir2, ls, ldir3, ls)
        bc = triconnector(ldir1, ls, ldir2, ls, ldir3, ls)
        @test_call drawconnector!(CANVAS, (1,1), bc)
        @test_opt drawconnector!(CANVAS, (1,1), bc)
    end
end

for ldir1 in LDIRS, ldir2 in LDIRS, ldir3 in LDIRS, ldir4 in LDIRS
    if ldir1 != ldir2 && ldir1 != ldir3 && ldir2 != ldir3 && ldir1 != ldir4 &&
        ldir2 != ldir4 && ldir2 != ldir4 && ldir3 != ldir4
        @test_call quadriconnector(ldir1, ls, ldir2, ls, ldir3, ls, ldir4, ls)
        @test_opt quadriconnector(ldir1, ls, ldir2, ls, ldir3, ls, ldir4, ls)
        bc = quadriconnector(ldir1, ls, ldir2, ls, ldir3, ls, ldir4, ls)
        @test_call drawconnector!(CANVAS, (1,1), bc)
        @test_opt drawconnector!(CANVAS, (1,1), bc)
    end
end
