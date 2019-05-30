IFORT=ifort -std08 -O3
SRC=main.F90
OUT=fft
LIB=lfftw3

build: main.F90
	$(IFORT) $(SRC) -o $(OUT) -$(LIB)

run: main.F90
	./$(OUT)

clean: $(OUT)
	rm -f $(OUT)