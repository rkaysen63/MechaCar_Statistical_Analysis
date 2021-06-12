# Del_1.3: Load dplyr. Tidyverse package contains dplyr (which is required use pipe operator %>%), tidyr, ggplot2 
library(tidyverse)

# Del_1.4: Import and read in the MechaCar_mpg.csv file as a dataframe.
MechaCar_MPG <- read.csv(file='data/MechaCar_mpg.csv',check.names = F,stringsAsFactors = F)
head(MechaCar_MPG)

# Del_1.5: Perform linear regression, passing all six variables
#generate multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
     ground_clearance + AWD,data=MechaCar_MPG) 

# Del_1.6: Determine p-value and r-quared value for the linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + 
             spoiler_angle + ground_clearance + AWD,data=MechaCar_MPG))

