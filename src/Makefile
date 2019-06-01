IFORT=ifort -std08 -O3
SRC_SUM=signals_sum.F90
OUT_SUM=signals_sum
SRC_FILTERING=noise_deleting.F90
OUT_FILTERING=noise_delete
LIB=lfftw3

build: $(SRC_SUM) $(SRC_FILTERING)
	$(IFORT) $(SRC_SUM) -o $(OUT_SUM) -$(LIB)
	$(IFORT) $(SRC_FILTERING) -o $(OUT_FILTERING) -$(LIB)

run_sum: $(SRC_SUM)
	./$(OUT_SUM)

run_filter: $(SRC_FILTERING)
	./$(OUT_FILTERING)

clean: $(OUT_SUM) $(OUT_FILTERING)
	rm -f $(OUT_SUM)
	rm -f $(OUT_FILTERING)