with orders as (select * from {{ ref('stg_orders') }}),

customers as (select customer_id from {{ ref('stg_customers') }}),

payments as (select * from {{ ref('stg_payments') }}),

cst_orders as (
    select orders.order_id, 
           orders.customer_id 
    from orders 
    join customers 
     on customers.customer_id = orders.customer_id
),

final as (
    select cst_orders.order_id,
           cst_orders.customer_id,
           payments.created_at,
           payments.amount
    from cst_orders 
    join payments on payments.order_id = cst_orders.order_id     
)

select * from final
