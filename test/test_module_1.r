# setup
setup({
    setwd("../src");
    source("module_1.r");
    source("setup.r");
    res.df <- data.frame(list(mpg=c(20.0, 10.0), cyl=c(4L, 3L), 
                              disp=c(200.0, 100.0), hp=c(150L, 100L),
                              wt=c(1.645, 2.000), qsec=c(20.11, 12.13),
                              vs=c(1L, 1L), am=c(1L, 0L),
                              gear=c(3, 1), carb=c(4, 2)),
                         stringsAsFactors=F);
    
    mean.df <- data.frame(list(mpg=15.0, cyl=3.5,
                               disp=150.0, hp=125.0,
                               wt=1.8225, qsec=16.12,
                               vs=1.0, am=0.5,
                               gear=2.0, carb=3.0),
                          stringsAsFactors=F);
    
    assign("res.df", res.df, envir=.GlobalEnv);
    assign("mean.df", mean.df, envir=.GlobalEnv);
});

teardown({
    rm(list=ls(), envir=.GlobalEnv);
    setwd("../test");
});

# we expect what get.mean.mtcars returns is a list
# but before that, we don't want to ask the real db
test_that("get.mean.mtcars returns a list", {
    with_mock(execSQL = function(s) {res.df}, expect_type(get.mean.mtcars(), "list"));
})

# we expect that what the function returns is actually a mean
test_that("get.mean.mtcars returns a mean list", {
    with_mock(execSQL = function(s) {res.df}, expect_equal(get.mean.mtcars(), as.list(mean.df)));
})