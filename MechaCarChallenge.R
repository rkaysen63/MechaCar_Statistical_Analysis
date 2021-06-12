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

# Create linear regression for vehical_length
model_vl <- lm(mpg~vehicle_length,MechaCar_MPG) # Create linear model.
summary(model_vl)
yvals <- model_vl$coefficients['vehicle_length']*MechaCar_MPG$vehicle_length +
  model_vl$coefficients['(Intercept)'] # Determine y-axis values from linear model
plt <- ggplot(MechaCar_MPG, aes(x=vehicle_length, y=mpg)) # Import dataset into ggplot2
plt + geom_point(color="blue") + geom_line(aes(y=yvals), color="red") + # Plot scatter and linear model
  labs(x="Vehicle Length", y="Fuel-Efficiency (MPG)") # add axis labels

# Create linear regression for ground_clearance
model_gc <- lm(mpg~ground_clearance,MechaCar_MPG) # Create linear model.
summary(model_gc)
yvals <- model_gc$coefficients['ground_clearance']*MechaCar_MPG$ground_clearance +
  model_gc$coefficients['(Intercept)'] # Determine y-axis values from linear model
plt <- ggplot(MechaCar_MPG, aes(x=ground_clearance, y=mpg)) # Import dataset into ggplot2
plt + geom_point(color="blue") + geom_line(aes(y=yvals), color="red") + # Plot scatter and linear model
  labs(x="Ground Clearance", y="Fuel-Efficiency (MPG)") # add axis labels
#---------------------------------------------------------------------------------------------------------------------
# Del_2.2: Import and read in the Suspension_Coil.csv file as a dataframe.
Suspension_Coil <- read.csv(file='data/Suspension_Coil.csv',check.names = F,stringsAsFactors = F)
head(Suspension_Coil)

# Del_2.3: Create a dataframe to get mean, median, variance and standard deviation of PSI column
total_summary <- Suspension_Coil %>% summarize(Mean=mean(PSI),Median=median(PSI),
                                               Variance=var(PSI), SD=sd(PSI))

# Del_2.4: Create a dataframe to get mean, median, variance and standard deviation of PSI column by manuf. lot
lot_summary <- Suspension_Coil %>% group_by(Suspension_Coil$Manufacturing_Lot) %>% 
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI), SD=sd(PSI))

# Create boxplot
plt <- ggplot(Suspension_Coil, aes(x=Manufacturing_Lot, y=PSI)) #import dataset into ggplot2
plt + geom_boxplot(fill="white", aes(color=Manufacturing_Lot)) + 
  theme(axis.text.x=element_text(angle=45,hjust=1))  #add boxplot and rotate x-axis labels 45 degrees

# ------------------------------------------------------------------------------------------------------------------
# Del_3.1: Determine if PSI across all manufacturing lots is statistically different from the
# population mean of 1500 psi
plt <- ggplot(Suspension_Coil, aes(x=(PSI))) # Import data into ggplot2
plt + geom_density()+ # Visualize distribution using density plot
  labs(x="PSI", y="Density") # add axis labels

set.seed(50) # Sets random sample to make it repeatable
sample_Suspension_Coil <- Suspension_Coil %>% sample_n(50)
plt <- ggplot(sample_Suspension_Coil, aes(x=PSI)) # Import data into ggplot2
plt + geom_density()+ # Visualize distribution using density plot
  labs(x="PSI", y="Density") # add axis labels

# t-test: H0 there is no statistical difference between the observed sample mean
# and its presumed population mean
t.test(sample_Suspension_Coil$PSI, Suspension_Coil$PSI)

# Del_3.2: Determine if the PSI for each manufacturing lot is statiscally
# different from the population mean of 1500 psi
population1 <- subset(Suspension_Coil, Manufacturing_Lot == 'Lot1')

plt <- ggplot(population1, aes(x=(PSI))) # Import data into ggplot2
plt + geom_density()+ # Visualize distribution using density plot
  labs(x="PSI", y="Density") # add axis labels

t.test(population1$PSI, Suspension_Coil$PSI)
# -------------------------------------------
population2 <- subset(Suspension_Coil, Manufacturing_Lot == 'Lot2')

plt <- ggplot(population2, aes(x=(PSI))) # Import data into ggplot2
plt + geom_density()+ # Visualize distribution using density plot
  labs(x="PSI", y="Density") # add axis labels

t.test(population2$PSI, Suspension_Coil$PSI)
# -------------------------------------------
population3 <- subset(Suspension_Coil, Manufacturing_Lot == 'Lot3')

plt <- ggplot(population3, aes(x=(PSI))) # Import data into ggplot2
plt + geom_density()+ # Visualize distribution using density plot
  labs(x="PSI", y="Density") # add axis labels

t.test(population3$PSI, Suspension_Coil$PSI)