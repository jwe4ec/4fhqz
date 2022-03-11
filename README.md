# 4fhqz
Scripts for manuscript "Improving the Computational Reproducibility of Clinical Science: Tools for Open Data and Code"

Author: Jeremy W. Eberle

This repository contains code for this project on the Open Science Framework (OSF): https://osf.io/4fhqz/.

## Data

Not applicable (all data are simulated)

## Code

The following scripts in the `code` folder are to be run in order.

`1_define_functions.R` defines a `version_control()` function, which is sourced at the top of later scripts. This function (a) checks the user's R version against that used to write the scripts, (b) loads the [`groundhog`](https://groundhogr.com/) package, and (c) returns a `groundhog_day` for the project.

`2_reduce_duplication.R` simulates data for an example task of removing bots from multiple tables. After removing bots table by table, options for reducing duplication are presented: (a) using a function, (b) using a for loop, and (c) using the `lapply()` function.
