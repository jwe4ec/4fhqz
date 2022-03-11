# ---------------------------------------------------------------------------- #
# Reduce Duplication
# Author: Jeremy W. Eberle
# ---------------------------------------------------------------------------- #

# ---------------------------------------------------------------------------- #
# Notes ----
# ---------------------------------------------------------------------------- #

# Before running this script, restart R (CTRL+SHIFT+F10 on Windows, CMD+SHIFT+F10
# on Mac) and set working directory to parent folder (CTRL+SHIFT+H on Windows/Mac)

# ---------------------------------------------------------------------------- #
# Check R version, load packages, and set seed ----
# ---------------------------------------------------------------------------- #

# Source custom functions

source("./code/1_define_functions.R")

# Check R version, load "groundhog" package, and specify "groundhog_day"

groundhog_day <- version_control()

# Load packages with groundhog. No packages are required in this script, but 
# multiple packages can be loaded using this method.

# pkgs <- c("dplyr", "lme4")
# groundhog.library(pkgs, groundhog_day)

# Set seed for reproducibility of example data generation below

set.seed(1234)

# ---------------------------------------------------------------------------- #
# Example: Remove bot participants from multiple tables ----
# ---------------------------------------------------------------------------- #

# Generate example data frames, say, one for each of 5 different measures in
# an online study (N = 1000 participants), where some participants identified 
# as bots need to be excluded during data cleaning

n_paricipants <- 1000
n_measures <- 5

df <- data.frame(participant_id = 1:n_paricipants, 
                 bot = rbinom(n_paricipants, 1, 0.05))

dat <- lapply(1:n_measures, function(x) df)
names(dat) <- paste0("df", 1:n_measures)

list2env(dat, .GlobalEnv)
rm(df, dat)

# ---------------------------------------------------------------------------- #
# Option 1: Remove bots table by table ----
# ---------------------------------------------------------------------------- #

df1_no_bots <- df1[df1$bot != 1, ]
df2_no_bots <- df2[df2$bot != 1, ]
df3_no_bots <- df3[df3$bot != 1, ]
df4_no_bots <- df4[df4$bot != 1, ]
df5_no_bots <- df5[df5$bot != 1, ]

# Confirm that no bots are in "df1"

table(df1_no_bots$bot)

# Imagine doing this for 50 tables!

# ---------------------------------------------------------------------------- #
# Option 2: Apply function to tables individually ----
# ---------------------------------------------------------------------------- #

# Define function rm_bots() to remove bots from a given data frame

rm_bots <- function(df) {
  df_no_bots <- df[df$bot != 1, ]
  return(df_no_bots)
}

# Apply function table by table

df1_no_bots <- rm_bots(df1)
df2_no_bots <- rm_bots(df2)
df3_no_bots <- rm_bots(df3)
df4_no_bots <- rm_bots(df4)
df5_no_bots <- rm_bots(df5)

# Confirm that no bots are in "df1"

table(df1_no_bots$bot)

# This removed some duplication; if our bot removal procedure changes, we only 
# need to change the rm_bots() function. For instruction on functions, see 
# https://r4ds.had.co.nz/functions.html.

# ---------------------------------------------------------------------------- #
# Option 3: Apply function to all tables using for loop ----
# ---------------------------------------------------------------------------- #

# After defining rm_bots() function above, store tables in a named list

dat <- list(df1 = df1,
            df2 = df2,
            df3 = df3,
            df4 = df4,
            df5 = df5)

# Apply function to all tables using a for loop

dat_no_bots <- vector("list", length(dat))

for (i in 1:length(dat)) {
  dat_no_bots[[i]] <- rm_bots(dat[[i]])
}

# Confirm that no bots are in "df1"

table(dat_no_bots$df1$bot)

# By using iterative programming, we remove the need to apply the function 
# table by table. For instruction on lists, see https://r4ds.had.co.nz/vectors.html. 
# For instruction on iteration, see https://r4ds.had.co.nz/iteration.html.

# ---------------------------------------------------------------------------- #
# Option 4: Apply function to all tables using lapply() function ----
# ---------------------------------------------------------------------------- #

# After defining rm_bots() function and storing tables in a named list above,
# apply function to all tables using lapply() function

dat_no_bots <- lapply(dat, rm_bots)

# Confirm that no bots are in "df1"

table(dat_no_bots$df1$bot)

# By using functional programming, we remove the need to use a for loop directly.
# Instead, the for loop itself is captured in a function. For instruction on
# functionals, see https://r4ds.had.co.nz/iteration.html#for-loops-vs.-functionals