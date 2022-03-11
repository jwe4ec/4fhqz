# ---------------------------------------------------------------------------- #
# Reduce Duplication
# Author: Jeremy W. Eberle
# ---------------------------------------------------------------------------- #

# TODO: Revise below





# ---------------------------------------------------------------------------- #
# Example: Remove test accounts identified below ----
# ---------------------------------------------------------------------------- #

# Identify test accounts
test_accts <- participant[participant$test_account == 1, "participant_id"]

# ---------------------------------------------------------------------------- #
# Option 1: Remove test accounts table by table ----
# ---------------------------------------------------------------------------- #

# Remove test accounts from "bbsiq" table
bbsiq <- bbsiq[!(bbsiq$particiant_id %in% test_accts), ]

# Remove test accounts from "oa" table
oa <- oa[!(oa$particiant_id %in% test_accts), ]

# Remove test accounts from "rr" table
rr <- rr[!(rr$particiant_id %in% test_accts), ]

# And so on...

# ---------------------------------------------------------------------------- #
# Option 2: Apply function to tables individually ----
# ---------------------------------------------------------------------------- #

# Define function to remove test accounts
rm_test_accts <- function(df, test_accts) {
  df <- df[!(df$participant_id %in% test_accts), ]
  return(df)
}

# Remove test accounts from tables individually
bbsiq <- rm_test_accts(bbsiq, test_accts)
oa <-    rm_test_accts(oa, test_accts)
rr <-    rm_test_accts(rr, test_accts)

# And so on...

# ---------------------------------------------------------------------------- #
# Option 3: Apply function to all tables at once using a for loop or lapply ----
# ---------------------------------------------------------------------------- #

# Store tables in a list
dat <- list(bbsiq = bbsiq,
            oa = oa,
            rr = rr)

# Remove test accounts from tables using a for loop
for (i in 1:length(dat)) {
  dat[[i]] <- rm_test_accts(dat[[i]], test_accts)
}

# Or remove test accounts from tables using lapply
dat <- lapply(dat, rm_test_accts)