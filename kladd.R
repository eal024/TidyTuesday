
library(tidyverse)


# cast_sparse -------------------------------------------------------------

dat <- data.frame(a = c("row1", "row1", "row2", "row2", "row2"),
                  b = c("col1", "col2", "col1", "col3", "col4"),
                  val = 1:5)

dat

cast_sparse(dat, a, b)

cast_sparse(dat, a, b, val)







str_view("(wolverine@xmen.com)", pattern = email)  


# Pattern from previous step
email <- capture(one_or_more(WRD)) %R% 
  "@" %R% capture(one_or_more(WRD)) %R% 
  DOT %R% capture(one_or_more(WRD))

# Pull out match and captures
email_parts <- str_match("(wolverine@xmen.com)", pattern = email) 


# Ex 2 pattern

pattern <-  "(" %R% capture(one_or_more(WRD)) %R% ")"



str_view( "navn1 (2019)", pattern = pattern2)





df <-  tibble( title = c("navn1 (2018)", "navn2 (2019", "navn3 (2015)"), tall = c(1,2,3) )


library(rebus)

pattern2 <- WRD - DGT %R% DGT %R% DGT %R% DGT

df %>% extract(title, into = c("navn", "ar"), regex = "*( - d/d/d/d/")

df <- data.frame(x = c(NA, "a-b", "a-d", "b-c", "d-e"))

df %>% extract(x, "A")

df %>% extract(x, c("A", "B"), "([[:alnum:]]+)-([[:alnum:]]+)")


horror_movies %>% select(1:5)

horror_movies %>% 
  tidyr::separate_rows(genres ,  sep = "\\| ")   %>% 
  select(1:5)



