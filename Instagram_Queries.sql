Create DataBase Instagram;
use Instagram;
CREATE TABLE Instagram (
    post_id VARCHAR(20) PRIMARY KEY,
    upload_date DATETIME,
    media_type VARCHAR(30),
    likes INTEGER,
    comments INTEGER,
    shares INTEGER,
    saves INTEGER,
    reach INTEGER,
    impressions INTEGER,
    caption_length INTEGER,
    hashtags_count INTEGER,
    followers_gained INTEGER,
    traffic_source VARCHAR(30),
    engagement_rate DECIMAL(6 , 2 ),
    content_category VARCHAR(30)
);

/*-------------------- Queries --------------------*/
-- Q1 Calculate The total Number of Likes
select sum(likes) as Total_Likes from instagram;

-- Q2 Calculate the total number of comments
select sum(comments) as Total_comments from instagram;

-- Q3 calculate the total number of shares
select sum(shares) as Total_shares from instagram;

-- Q4 Calculate the total number of saves
select sum(saves) as Total_saves from instagram;

-- Q5 Calculate the total number of hashtags
Select sum(hashtags_count) as Total_hashtags from instagram;

-- Q6 calculate Account Engagement by source
SELECT 
    Traffic_source AS 'Source',
    SUM(engagement_rate)  AS Account_Engagement
FROM
    instagram
GROUP BY Traffic_source
order by Account_Engagement desc;

-- Q7 Calculate the total follower by Days Name
SELECT 
    DAYNAME(upload_date) AS Days,
    SUM(followers_gained) AS Followers
FROM
    instagram
GROUP BY Days
ORDER BY Followers DESC;

-- Q8 calculate the total number of follower by Month
SELECT 
    monthNAME(upload_date) AS Days,
    SUM(followers_gained) AS Followers
FROM
    instagram
GROUP BY Days
ORDER BY Followers DESC;

-- Q9 Calculate Account Reach by Source & Media
SELECT 
    Traffic_source AS Source,
    Media_type AS Media,
    SUM(reach) AS Account_reach
FROM
    instagram
GROUP BY Source , Media
ORDER BY Account_reach DESC;

-- Q10 Calculate the Accoun Impressions by Source Media
SELECT 
    Traffic_source AS Source,
    Media_type AS Media,
    SUM(impressions) AS Account_impressions
FROM
    instagram
GROUP BY Source , Media
ORDER BY Account_impressions DESC;

/* ------------------ Save Queries in Views -----------------------------*/
-- Q1
CREATE VIEW Total_likes AS
    SELECT 
        SUM(likes) AS Total_Likes
    FROM
        instagram;
        
-- Q2
CREATE VIEW Total_comments AS
    SELECT 
        SUM(comments) AS Total_comments
    FROM
        instagram;     
        
-- Q3
CREATE VIEW Total_Shares AS
    SELECT 
        SUM(shares) AS Total_shares
    FROM
        instagram;   
        
-- Q4 
CREATE VIEW Total_Saves AS
    SELECT 
        SUM(saves) AS Total_saves
    FROM
        instagram;
        
-- Q5 
CREATE VIEW Total_Hashtags AS
    SELECT 
        SUM(hashtags_count) AS Total_hashtags
    FROM
        instagram;

-- Q6
CREATE VIEW Account_Engagement AS
    SELECT 
        Traffic_source AS 'Source',
        SUM(engagement_rate) AS Account_Engagement
    FROM
        instagram
    GROUP BY Traffic_source
order by Account_Engagement desc;

-- Q7
CREATE VIEW Daily_followers_gained AS
    SELECT 
        DAYNAME(upload_date) AS Days,
        SUM(followers_gained) AS Followers
    FROM
        instagram
    GROUP BY Days
    ORDER BY Followers DESC;
    
-- Q8 
CREATE VIEW Monthly_follower_gained AS
    SELECT 
        MONTHNAME(upload_date) AS Days,
        SUM(followers_gained) AS Followers
    FROM
        instagram
    GROUP BY Days
    ORDER BY Followers DESC;
    
-- Q9
CREATE VIEW Account_Reach AS
    SELECT 
        Traffic_source AS Source,
        Media_type AS Media,
        SUM(reach) AS Account_reach
    FROM
        instagram
    GROUP BY Source , Media
    ORDER BY Account_reach DESC;
    
-- Q10 
CREATE VIEW Account_impressions AS
    SELECT 
        Traffic_source AS Source,
        Media_type AS Media,
        SUM(impressions) AS Account_impressions
    FROM
        instagram
    GROUP BY Source , Media
    ORDER BY Account_impressions DESC; 
    
/*------------------------------- The End -------------------------------------*/    
    
    