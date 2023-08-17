select id as payment_id,
       orderid as order_id,
       paymentmethod as payment_method,
       status,
       created as created_at,
       round(amount/100, 2) as amount
from {{ source('stripe', 'payment') }} 