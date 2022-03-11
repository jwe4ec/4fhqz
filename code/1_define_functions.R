# ---------------------------------------------------------------------------- #
# Define Functions
# Author: Jeremy W. Eberle
# ---------------------------------------------------------------------------- #

# ---------------------------------------------------------------------------- #
# Define version_control() ----
# ---------------------------------------------------------------------------- #

# Define function to check R version, load groundhog package, and return groundhog_day

version_control <- function() {
  # Ensure you are using the same version of R used to write the script
  
  script_R_version <- "R version 4.1.2 (2021-11-01)"
  current_R_version <- R.Version()$version.string
  
  if(current_R_version != script_R_version) {
    warning(paste0("This script is based on ", script_R_version,
                   ". You are running ", current_R_version, "."))
  }
  
  # On Windows, to install an old version of R, go to https://groundhogr.com/many/ or
  # https://cran.r-project.org/bin/windows/base/old/. To switch which R version is 
  # running in RStudio, either (a) go to Tools > Global Options > R Version > Change 
  # or (b) hold CTRL when opening RStudio.
  
  # On Mac, to install an old version of R, go to https://groundhogr.com/many/. To
  # switch which R version is running in RStudio, use RSwitch (https://rud.is/rswitch/).
  
  # Load packages using "groundhog", which installs and loads the most recent
  # versions of packages available on the specified date ("groundhog_day"). This 
  # is important for reproducibility so that everyone running the script is using
  # the same versions of packages used at the time the script was written. For
  # more information on groundhog, see https://groundhogr.com/.
  
  # Note that packages may take longer to load the first time you load them with
  # "groundhog.library". This is because you may not have the correct versions of 
  # the packages installed based on the "groundhog_day". After "groundhog.library"
  # automatically installs the correct versions alongside other versions you may 
  # have installed, it will load the packages more quickly.
  
  # If in the process of loading packages with "groundhog.library" for the first 
  # time the console states that you first need to install "Rtools", follow steps 
  # here (https://cran.r-project.org/bin/windows/Rtools/) for installing "Rtools" 
  # and putting "Rtools" on the PATH. Then try loading the packages again.
  
  # "meta.groundhog" is used to install the latest version of "groundhog" available
  # on the specified date
  
  library(groundhog)
  groundhog_day <- "2022-01-01"
  meta.groundhog(groundhog_day)
  
  return(groundhog_day)
}