---  Business Scenario ---

/* 
    CRM is running a California-only "Welcome Offer" campaign . They need the latest 50 customers in California who agreed to receive marketing emails , so the local team can start outreach.
*/


--- Problem Statement ---

/* 
    Give us the 50 most recent California customers who opted into email marketing ?  
*/ 



--- Answer ---

Select * from customer; 
Select customer_id , customer_name , city , state , joining_date from customer where state='California' and email_marketing='YES' order by joining_date desc , customer_id limit 50;