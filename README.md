# Fortran task 2 - FFT

## Source files:
There are 2 source files, they are both in ```src``` folder:
- ```signals_sum.F90``` - file responsible for changing given function into the sum of signals
- ```noise_deleting.F90``` - file responsible for second part of the task

There is also a Makefile in ```src``` folder

### Running instruction
In order to run the project, you need to have Intel Fortran Compiler (ifort) installed.

1. Clone the repository
2. Go to src directory and enter following command in terminal:
```make build```.
This command allows you to build project - both signals_sum and noise_delete files will be built.

3. To run first part of the task, enter following command in terminal: ```make run_sum```.

4. To run second part of the task, enter following command in terminal: ```make run_filter```.

5. If you type either ```make run_sum``` command or ```make run_filter``` command, results for both of them will
be stored in ```res``` directory


## Results and conclusions

### Results for the first part of the task:
Changing signal into the sum of signals.

Following function: 
```x = sin(2 ∗ π ∗ t ∗ 200) + 2 ∗ sin(2 ∗ π ∗ t ∗ 400)```

Following image represents the result of this task:





