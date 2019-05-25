IFORT=ifort -std08 -check bounds
SRC=main.F90
OUT=fft

build: main.F90
	$(IFORT) $(SRC) -o $(OUT)

run: main.F90
	make build
	./$(OUT)


clean: $(OUT)
	rm -f $(OUT)