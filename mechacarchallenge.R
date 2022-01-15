#Load library
library(dplyr)
#Read in the MPG data
mecha_car<-read.csv("MechaCar_mpg.csv", head=TRUE)
#Perform multiple regression analysis
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_car)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_car))

#Read in the suspension coil data
suspension_df <- read.csv("Suspension_Coil.csv", head=T)
#Generate summary statistics for overall PSI data
total_summary<-suspension_df%>%summarize(Mean=mean(PSI),Median=median(PSI),
                        Variance=var(PSI), SD=sd(PSI), .groups = 'keep') 
#Generate summary statistics for PSI data based on Lot number 
lot_summary <- suspension_df %>% group_by(Manufacturing_Lot) %>% 
  summarize(Mean=mean(PSI),Median=median(PSI),
            Variance=var(PSI), SD=sd(PSI), .groups = 'keep') 

#t-test to determine if PSI for all lots differ from population mean (1500)
t.test(suspension_df$PSI, mu=1500)

#t-test to determine if psi from Lot1 differs from population mean(1500)
t.test(subset(suspension_df,Manufacturing_Lot=="Lot1")$PSI, mu=1500)

#t-test to determine if psi from Lot2 differs from population mean(1500)
t.test(subset(suspension_df,Manufacturing_Lot=="Lot2")$PSI, mu=1500)

#t-test to determine if psi from Lot3 differs from population mean(1500)
t.test(subset(suspension_df,Manufacturing_Lot=="Lot3")$PSI, mu=1500)



