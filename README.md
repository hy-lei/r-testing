# r-testing

## Getting started

### Prerequisites
1. Run
```R
require('testthat')
```
2. If there's a warning message, it means that you haven't installed `testthat` on the machine.
```R
install.packages('testthat')
```
3. Finally, do
```R
library(testthat)
```
to check the installation is successful.

### Running the demo

1. Clone the repo.
2. In terminal, go to folder `test`.  Start the R program.  Then, run
```R
library(testthat)
test_file('test_module_1.r')
```
and you will see the test cases generated.