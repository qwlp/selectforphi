1. Create an index on the `last_name` column in the `customer` table.
```sql
create index last_name_ind on customer (last_name);
```
2. Display all indexes from the `customer` table.
```sql
show index from customer;
```
3. Create a unique index on the `email` column in the `customer` table.
```sql
create unique index email_ind on customer (email);
```
4. Drop an index from the `customer` table.
```sql
drop index last_name_ind on customer;
```
5. Create a composite (multi-column) index on `first_name` and `last_name` in the `actor` table.
```sql
create index name_idx on actor (first_name, last_name);
```
6. Query to check how the optimizer uses an index.
```sql
explain select * from customer where email like "%m";
```
7. Create a full-text index on the `title` and `description` columns in the `film` table.
```sql
create full text index title_desc_idx on film (title, description);
```
8. Use the full-text index to search for films containing the word 'Action'.
```sql
select * from film where match(title, description) against('Action');
```
9. Create an index on the `rental_date` column in the `rental` table.
```sql
create index rental_date_idx on rental (rental_date);
```
10. Check index usage statistics for the `payment` table
```sql
explain select * from payment where amount > 20;
```
