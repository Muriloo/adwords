{% macro stitch_adwords_criteria_performance() %}

    {{ adapter_macro('adwords.stitch_adwords_criteria_performance') }}

{% endmacro %}


{% macro default__stitch_adwords_criteria_performance() %}

with base as (

    select * from {{ var('criteria_performance_report') }}

),

aggregated as (

    select

        md5(customerid::varchar || keywordid::varchar || adgroupid::varchar || day::varchar) as id,
        day::date as date_day,
        account,
        keywordid as criteria_id,
        adgroup as ad_group_name,
        adgroupid as ad_group_id,
        adgroupstate as ad_group_state,
        campaign as campaign_name,
        campaignid as campaign_id,
        campaignstate as campaign_state,
        customerid as customer_id,
        currency as currency,
        _sdc_report_datetime,
        1 as dim_store_fk,
        sum(clicks) as clicks,
        sum(impressions) as impressions,
        sum(cast((cost::float/1000000::float) as numeric(38,6))) as spend

    from base
    group by 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13

),

ranked as (

    select
        *,
        rank() over (partition by id
            order by _sdc_report_datetime desc) as latest
    from aggregated

),

final as (

    select *
    from ranked
    where latest = 1

)

select * from final

{% endmacro %}
