# ZSSN

## Description
This code refers to the following challenge: [Zombie Survival Social Network (ZSSN)](https://gist.github.com/akitaonrails/711b5553533d1a14364907bbcdbee677).

## Setup
To start consuming the API, you need to run the following commands:

```
$ git clone https://github.com/hugoandregg/zssn
$ cd zssn
$ bundle install
$ rake db:setup
$ rails s
```
With you want to run the tests, just run the following command:

```
$ bundle exec rspec
```

## Operations
*To do these operations like in the examples, you have to use [HTTPie](https://httpie.org/) and have to run the server at the same time (rails s).*

### List survivors
- **URL**

/survivors

- **Method**

GET

- **Success Response**

**Code:** 200 <br />
**Content:** List of survivors with theirs inventories

- **Example**

```
$ http :3000/survivors 
```

### Add survivors
- **URL**

/survivors

- **Method**

POST

- **Data Params**

survivor: { name: [string], age: [integer], gender: [male | female], latitude: [decimal], longitude: [decimal], inventory: [ { name: [string], quantity: [integer] } ] }

- **Success Response**

**Code:** 201 <br />
**Content:** New Survivor

- **Error Response**

**Code:** 422 <br />
**Content:** An incomplete survivor

- **Example**

```
$ http POST :3000/survivors survivor:='{"name": "Hugo", "gender": "male", "age": "22", "latitude": "-12.6821", "longitude": "67.6423", "inventory": [{"name": "Water", "quantity": "4"}, {"name": "Food", "quantity": "2"}]}'
```

### Update survivor location
- **URL**

/survivors/:survivor_id/location

- **Method**

PUT | PATCH

- **Data Params**

{ latitude: [decimal], longitude: [decimal] }

- **Success Response**

**Code:** 200 <br />
**Content:** Updated Survivor

- **Example**

```
$ http put :3000/survivors/12/location latitude:='-5.432' longitude:='-34.444'
```

### Flag survivor as infected
- **URL**

/survivors/:survivor_id/contamination_reports

- **Method**

POST

- **Data Params**

contamination_report: { reporter_id: [integer] }

- **Success Response**

**Code:** 201 <br />
**Content:** Contamination report object

- **Error Response**

**Code:** 422 <br />
**Content:** Incomplete contamination report object

- **Example**

```
$ http post :3000/survivors/12/contamination_reports contamination_report:='{"reporter_id":15}'
```

### Trade items
- **URL**

/trade

- **Method**

POST

- **Data Params**

trade: { survivor_one_id: [integer], survivor_one_items: [ { name: [string], quantity: [integer] } ], survivor_two_id: [integer], survivor_two_items: [ { name: [string], quantity: [integer] } ] }

- **Success Response**

**Code:** 201 <br />
**Content:** Trade object

- **Error Response**

**Code:** 422 <br />
**Content:** Incomplete trade object

- **Example**

```
$ http post :3000/trade trade:='{"survivor_one_id": 16, "survivor_one_items": [{"name": "Medication", "quantity": "2"}], "survivor_two_id": 13, "survivor_two_items": [{"name": "Water", "quantity": "1"}]}'
```

### Reports
- **URL**

/reports/infected <br />
/reports/non-infected <br />
/reports/average <br />
/reports/lost-points <br />

- **Method**

GET

- **Success Response**

**Code:** 200<br />
**Content:** Report data

- **Example**

```
$ http :3000/reports/infected
```
