select
    dim_store_fk
    , campaign_name
    , ad_group_name
    , criteria_id
    , date_day as campaign_date
    , account as account_name
    , currency as account_currency
    , 'adwords' as data_source
    , 'Paid' as traffic_type
    , 'SEM' as group_channel
    , 'sem' as medium
    , 'google' as "source"
    , impressions
    , clicks
    , spend
    -- spend_usd
    -- ad_group_id,
    -- campaign_id,

from {{ref('b_adwords_criteria_performance')}}
