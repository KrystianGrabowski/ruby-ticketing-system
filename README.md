# Ticketing system

Things you may want to cover:

* Create new event
```
    POST http://localhost:3000/events

    {   
        "name": "event0",
        "description": "description0",
        "date": "2019-10-16T09:20:30.000Z",
        "available_tickets": 10,
        "price": 500
    }
```
* List all events
```
    GET http://localhost:3000/events
```
* List one particular event
```
    GET http://localhost:3000/events/:id
```
* Create new payment (buy ticket)
```
    POST http://localhost:3000/events
    
    {   
        "user_id": 4,
        "event_id": 5,
        "quantity": 1
    }
```
* List all payments
```
    GET http://localhost:3000/events
```
* List one particular payment
```
    GET http://localhost:3000/events/:id
```

