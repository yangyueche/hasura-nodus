SET check_function_bodies = false;

/* Table 'friend' */
CREATE TABLE friend(id serial NOT NULL, "name" text NOT NULL, PRIMARY KEY(id));
/* Table 'pizza' */
CREATE TABLE pizza(id serial NOT NULL, title integer NOT NULL, PRIMARY KEY(id));

/* Table 'pizza_topping' */
CREATE TABLE pizza_topping(id serial NOT NULL, title text NOT NULL, emoji text NOT NULL, available boolean NOT NULL DEFAULT TRUE, PRIMARY KEY(id));

/* Table 'pizza_topping_pizza' */
CREATE TABLE pizza_topping_pizza(id serial NOT NULL,pizza_id integer NOT NULL, pizza_topping_id integer NOT NULL, PRIMARY KEY(id));

/* Table 'pizza_order' */
CREATE TABLE pizza_order(id serial NOT NULL,friend_id integer NOT NULL, pizza_id integer NOT NULL, PRIMARY KEY(id));

/* Relation 'pizza_pizza_topping_pizza' */
ALTER TABLE pizza_topping_pizza
    ADD CONSTRAINT pizza_pizza_topping_pizza
        FOREIGN KEY (pizza_id) REFERENCES pizza (id) ON DELETE Cascade;
        
/* Relation 'pizza_topping_pizza_topping_pizza' */
ALTER TABLE pizza_topping_pizza
    ADD CONSTRAINT pizza_topping_pizza_topping_pizza
        FOREIGN KEY (pizza_topping_id) REFERENCES pizza_topping (id) ON DELETE Cascade;
        
/* Relation 'friend_pizza_order' */
ALTER TABLE pizza_order
    ADD CONSTRAINT friend_pizza_order
        FOREIGN KEY (friend_id) REFERENCES friend (id) ON DELETE Cascade;

/* Relation 'pizza_pizza_oder' */
ALTER TABLE pizza_order
    ADD CONSTRAINT pizza_pizza_order
        FOREIGN KEY (pizza_id) REFERENCES pizza (id) ON DELETE Cascade;
