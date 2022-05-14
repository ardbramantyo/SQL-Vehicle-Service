## ETL Error Handling Vehicle Service

### Scenario:
I, as a Data Scientist, was hired by a vehicle company to do some analysis for the company which services vehicles in a lot of locations. It’s a huge company with millions of customers and it does a service for them across lots of different countries and what they’re doing this time is they do some forecast for the year 2016. They give massive datasets(.csv), the data size is around 60 mb and consists up to 1.05M rows of customer data around the world.
The original data looks like this:

## ![image](https://user-images.githubusercontent.com/37673834/168415626-9bf4e2dd-ed0b-403d-a805-c98e9f638738.png)
## ![image](https://user-images.githubusercontent.com/37673834/168415356-a7d5b285-ac7e-474a-8c6e-9eaf950f3cb0.png)

The dataset consists these field:
#### •	Customer ID
#### •	Customer Since: the date since they become customer
#### •	Vehicle: What type of vehicle he/she services
#### •	2014: customers revenue for 2014
#### •	2015: customers revenue for 2015
#### •	2016e: the projected revenue for 2016. This values created by extrapolating the model based on past 2 years revenue record.

The CustomerID field does not contain duplicate records which that information come to you from the person who supplied this data. They’re saying that the dataset is well structured and it’s a guarantee from them and this can be the intrinsic knowledge. The job as a Data Scientist is to find errors inside this dataset.
