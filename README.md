# mechaCar_statistical_analysis
# mechaCar_statistical_analysis
## Overview  
Given a hypothetical dataset of a car being produced at a car manufacturing facility we are analyzing the production data to gain insight into improving the performance of this car. The dataset contains specs from 50 prototypes of this car and metrics for each car such as vehicle length, vehicle weight, spoiler angle, all wheel drive status, and ground clearance. One goal is to determine how vehicle performance is impacted by these specs in order to improve production. In addition we also are given suspension coil data for the vehicles with data on psi pressures and manufacturing lot numbers whose metrics also affect production. 
## Linear Regression to Predict MPG  
A multiple linear regression was performed to assess which of the specs/metrics most affected fuel economy as measured by MPG.  These results suggest that vehicle weight and ground clearance have a very low probability of randomly contributing to vehicle MPG and likely are contribute significantly to this metric. It should be noted that the intercept also contributes significantly to vehicle MPG.  


![screenshot_mpg_lm](https://user-images.githubusercontent.com/60231630/149605998-e8300bde-bc52-47d5-8375-aa66d557eae3.png)  

Given that we have two variables with non-zero coefficients that contribute significantly to vehicle MPG coupled with an F-statistic of 22.07 (rejecting the null hypothesis that all slope parameters are equal to zero), we would expect the slope of the linear model to non-zero slope. Nevertheless, this model is not as effective at predicting vehicle MPG as desired. The significant contribution of the intercept to MPG would suggest that our variables could be scaled better or other metrics need to be included in our analysis. Indeed, vehicle weight is out of scale in proportion to the other metrics, and AWD status is really not an appropriate variable to use in this context, as it represents a boolean value.  

## Summary Statistics on Suspension Coils  
Current design specifications for the suspension coils require a variance not exceeding 100 psi overall for all suspension coils AND in each lot individually. Current data does not meet this specification. Although the psi variance for all coils is well under this limit:  

![screenshot_suspension_overall](https://user-images.githubusercontent.com/60231630/149608012-867c034e-c4fa-493f-8a98-60732ff5bfba.png)  

Manufacturing lot number three exceeds this tolerance and is likely contributing to the high overall variance.  

![screenshot_suspension_by_lot](https://user-images.githubusercontent.com/60231630/149608070-f3374f49-cb10-406f-ab29-ceb9397366e7.png)

## T-Tests on Suspension Coils  
Four student t-tests were performed to determine whether the suspension coils psi values differed from that of the population mean overall and for each Lot number. Overall, the psi values for all the suspension coils do not differ significantly from the population mean. With a type-1 error probability of 0.0603, there is insufficient data to reject the null hypothesis.  

![screenshot_suspension_t-test_all](https://user-images.githubusercontent.com/60231630/149611103-e74baf4c-3d39-494e-9ce7-e718ef989423.png)

When suspension coil data is divided by lot number we see that both Lot1 and Lot2 likewise do not differ from the population mean with type-1 error p-values of 1.0 and 0.607 respectively.  

Lot1  

![screenshot_suspension_t-test_lot1](https://user-images.githubusercontent.com/60231630/149611327-5d5e3bf2-2842-46f2-9455-d6e225b93adf.png)  

Lot2  

![screenshot_suspension_t-test_lot2](https://user-images.githubusercontent.com/60231630/149611333-e39d994d-24c5-4470-baa8-fd6960f8fd18.png)  

In contrast, Lot3 does differ significantly from the population mean with a type-1 error p-value of 0.042 suggesting an issue with this particular lot number:  

![screenshot_suspension_t-test_lot3](https://user-images.githubusercontent.com/60231630/149611373-fcbd1f84-f529-44d0-9bda-8fd68daa27e0.png)  

## Study Design: MechaCar vs Competition  

Of interest to me are the overall ratings for different cars.  There are numerous websites in which customers give ratings on scales of 1 to 5 or 1 to 10. For simplicity I would choose a car-review website and extract a sample of customer ratings over a five year period from 2016-2021 for both MechaCar and a competing car manufacturer. A simple study would be to see if ratings for MechaCar are significantly higher or lower than a competing brand for a particular year.  The null hypothesis would be that the observed differences in ratings are no different from what would be obtained by random chance. As we are comparing vehicle ratings from two different car manufacturers and sampling from two different independent populations, a two-tailed  un-paired t-test would be most appropriate. This test can be run for each of the five years.  As such, a dataset containing samples of vehicles, ratings, car manufacturer, and year are required. Using subset and groupby functions, the data can be grouped by year and car manufacturer to in order to perform the test. Sample sizes would have to be sufficient to insure normal distributions and  equal variances between MechaCar and the competition. Ratings are expected to be continuous values or vectors.  As an aside we can also see if ratings vary signicantly by year for both MechaCar and the competition for the five years in question. In this case a one-way ANOVA in which year is a factor variable with 5 levels would be the appropriate test with rating as the response variable. This test would be performed separately for MechaCar and the competition.


