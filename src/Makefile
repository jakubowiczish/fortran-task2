IFORT=ifort -std08 -O3
SRC_SUM=signals_sum.F90
OUT_SUM=signals_sum
LIB=lfftw3

build: $(SRC_SUM)
	$(IFORT) $(SRC_SUM) -o $(OUT_SUM) -$(LIB)

run_sum: $(SRC_SUM)
	./$(OUT_SUM)

clean: $(OUT_SUM)
	rm -f $(OUT_SUM)