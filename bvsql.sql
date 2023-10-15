
/*/*1. Demographic Insights 
/*a. Who prefers energy drink more? (male/female/non-binary?)*/
select gender,count(Respondent_ID) as total from dim_repondents
group by gender
order by total desc;

/*b. Which age group prefers energy drinks more?*/
select age,count(Respondent_ID) as total from dim_repondents
group by age
order by total desc;

/*c. Which type of marketing reaches the most Youth (15-30)?*/

sELECT Marketing_channels, COUNT(*) as Channel_Count
FROM fact_survey_responses
INNER JOIN dim_repondents ON fact_survey_responses.Respondent_ID = dim_repondents.Respondent_ID
WHERE Age IN ('15-18')
GROUP BY Marketing_channels
ORDER BY Channel_Count DESC;

/*2. Consumer Preferences:
/*a. What are the preferred ingredients of energy drinks among respondents?*/
select Ingredients_expected,count(*) as total FROM fact_survey_responses
group by Ingredients_expected;

/*b. What packaging preferences do respondents have for energy drinks?*/
select Packaging_preference,count(*) as total from fact_survey_responses
group by Packaging_preference 
order by total desc  ;


/*3. Competition Analysis:
/*a. Who are the current market leaders?*/
select Current_brands,count(*) as total from fact_survey_responses
group by Current_brands
order by total desc;

/*b. What are the primary reasons consumers prefer those brands over ours?*/
select Current_brands,Consume_reason,count(*) as total from fact_survey_responses
group by Consume_reason,Current_brands
order by Current_brands,total desc;

/*4. Marketing Channels and Brand Awareness:*/
/*a. Which marketing channel can be used to reach more customers?*/
select Marketing_channels,count(*) as total from fact_survey_responses
group by Marketing_channels
order by total desc;

/*b. How effective are different marketing strategies and channels in reaching our 
customers?*/
select Marketing_channels,count(*) as total from fact_survey_responses
where Current_brands='codex'
group by Marketing_channels
order by total desc;


/*5. Brand Penetration:
/*a. What do people think about our brand? (overall rating)*/
select avg(Taste_experience) as rating from fact_survey_responses
where Current_brands='codex';


/*6. Purchase Behavior:
/*a. Where do respondents prefer to purchase energy drinks?*/
 select Purchase_location,count(*) as total from fact_survey_responses
 group by Purchase_location
 order by total desc;
 
/*b. What are the typical consumption situations for energy drinks among 
respondents?*/
select Consume_reason,count(*) as total from fact_survey_responses
group by Consume_reason
order by total desc;

/*c. What factors influence respondents' purchase decisions, such as price range and 
limited edition packaging?*/
select price_range,Limited_edition_packaging,count(*) as total from fact_survey_responses
group by 1,2
order by 3 desc;

/*7. Product Development
a. Which area of business should we focus more on our product development? 
(Branding/taste/availabili*/
select current_brands,Taste_experience,Reasons_for_choosing_brands,count(*)
from fact_survey_responses
where Current_brands='codex'
group by 1,2,3
order by 4;