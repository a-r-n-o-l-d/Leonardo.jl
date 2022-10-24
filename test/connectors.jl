for ldir1 in LDIRS, ldir2 in LDIRS
    if ldir1 != ldir2
        @test_call biconnector(ldir1, LineStyle(), ldir2, LineStyle())
        @test_opt biconnector(ldir1, LineStyle(), ldir2, LineStyle())
        bc = biconnector(ldir1, LineStyle(), ldir2, LineStyle())
        @test_call drawconnector!(CANVAS, (1,1), bc)
        @test_opt drawconnector!(CANVAS, (1,1), bc)
    end
end
