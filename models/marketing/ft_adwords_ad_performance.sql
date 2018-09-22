select

    campaign_name
    ,ad_group_name
    ,criteria_id
    ,date_day as campaign_date
    ,account_name
    -- account currency
    ,'adwords' as data_source
    ,'SEM' as group_channel
    ,'sem' as medium
    ,'google' as "source"
    ,impressions
    ,clicks
    ,spend
    -- spend_usd
    -- ad_group_id,
    -- campaign_id,

from {{ref('b_adwords_criteria_performance')}}
