# a function that enquires the database and use the data returned to do something

# suppose we are gonna select from table mtcars and return a list of mean for each column
# note that execSQL is called
get.mean.mtcars <- function() {
    s <- "SELECT * from mtcars";
    res.df <- execSQL(s);
    lapply(res.df, mean);
}