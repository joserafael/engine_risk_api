# Test Risk


## Explain the money flow and the information flow in the acquirer market and the role of the main players.

The merchant passes the card information to the acquirer for authorization of the payment. The acquirer then sends the authorization request to the card network associated with the card. The card network receives the authorization request and routes it to the consumer’s bank, which issued the card, for approval. It is the consumer’s bank that determines whether the authorization request should be approved or denied and passes that decision back through the same process in reverse order.

## Explain the difference between acquirer, sub-acquirer and payment gateway and how the flow explained in question 1 changes for these players

### Acquirer

An acquirer (also called a creditor) is a company that specializes in processing payments, meaning that it processes credit or debit card payments on behalf of a merchant. Through its network of accredited partners (or acquiring network), it enables a store to offer various payment conditions to its customers.

The acquirer receives the payment information, processes it and passes it to the card brand (when the payment method is credit card) and the issuing bank. Some examples of acquirers are: Rede, Cielo, GetNet and Stone.

For your store to be able to receive payments, you must enable its communication with an acquirer. This is done through a gateway, which must be configured to process the payment conditions. With that, purchases can follow the approval flow.

When everything is in order and a purchase is authorized by the other players within the purchase flow, the acquirer is responsible for transferring the values (which the issuing bank receives from the customer) to the account of your store.

### Sub-acquirer

A sub-acquirer is a company that processes payments and transmits the generated data to the other players involved in the payment flow. Its role is similar to that of an acquirer, but it doesn't completely replace it due to the lack of autonomy to perform all the funcilnatilies of an acquirer.

A sub-acquirer can therefore be understood as a kind of intermediary player between acquirer and store. Some examples of sub-acquirers are: PagSeguro e Paypal.

The main advantages of a sub-acquirer are its low implementation cost , own anti-fraud system and ease of integration which makes this a very attractive solution for small stores. On the other hand, the choice of using the sub-acquirer may jeopardize the retailer's profits because of the high rates charged for each transaction (greater than the acquirers).

Another negative factor for retailers is the redirection of the customer to the sub-acquirer's own page during the final steps of the checkout, which can lead to higher withdrawal rates.

### Gateway
A gateway (also called payment gateway) is a system that transmits data from purchases made in your store at checkout to companies such as Braspag e Mundipagg.

As the first player in the flow, it's responsible for sending this information to acquirers, card brands and issuing banks then obtain a response about the continuation of the process or its cancellation. In other words, the gateway sends data and receives responses so that you know whether or not a particular purchase should be confirmed, showing whether the payment was approved or not.

As an intermediary between an e-commerce and its payment method used, the gateway acts as a terminal, integrating in all the transactions carried out between the players of the payment flow in a single place.

## Explain what chargebacks are, how they differ from cancellations and what is their connection with fraud in the acquiring world.

A chargeback is the potential outcome of a disputed credit or debit card transaction. If the cardholder’s bank accepts the dispute, they will reverse the transaction, taking the funds back from the merchant and returning them to the cardholder.

When a cardholder disputes a charge, their issuing bank will review the transaction and decide if the dispute is valid. If they believe that it is, they will provide the cardholder with a provisional credit and work with the card network and the acquiring bank to finalize a chargeback.

The chargeback process allows consumers to get their refunds from their banks, and to let banks (rather than cardholders and merchants) make decisions on how to handle the situation. While the process was not yet called a chargeback, it would become the foundation for the dispute system we know today.

# Instalation

* Clone the project
  
  ```
  git clone git@github.com:joserafael/engine_risk_api.git
  ```

* Create the database:

```
rake db:create 

````
* Seed the data:

````
rake db:seed

````

* After the run the server with the command "rails s" use the endpoint in this [postman arquive](https://github.com/joserafael/engine_risk_api/blob/main/risk.postman_collection.json)

