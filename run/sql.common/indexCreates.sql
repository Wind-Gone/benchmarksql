alter table bmsql_warehouse
    add constraint bmsql_warehouse_pkey
        primary key (w_id);

alter table bmsql_district
    add constraint bmsql_district_pkey
        primary key (d_w_id, d_id);

alter table bmsql_customer
    add constraint bmsql_customer_pkey
        primary key (c_w_id, c_d_id, c_id);

create index bmsql_customer_idx1
    on bmsql_customer (c_w_id, c_d_id, c_last, c_first);

alter table bmsql_oorder
    add constraint bmsql_oorder_pkey
        primary key (o_w_id, o_d_id, o_id);

create unique index bmsql_oorder_idx1
    on bmsql_oorder (o_w_id, o_d_id, o_carrier_id, o_id);

alter table bmsql_new_order
    add constraint bmsql_new_order_pkey
        primary key (no_w_id, no_d_id, no_o_id);

alter table bmsql_order_line
    add constraint bmsql_order_line_pkey
        primary key (ol_w_id, ol_d_id, ol_o_id, ol_number);

alter table bmsql_stock
    add constraint bmsql_stock_pkey
        primary key (s_w_id, s_i_id);

alter table bmsql_item
    add constraint bmsql_item_pkey
        primary key (i_id);

ALTER TABLE bmsql_nation
    ADD CONSTRAINT NATION_PKEY PRIMARY KEY (N_NATIONKEY);
ALTER TABLE bmsql_region
    ADD CONSTRAINT REGION_PKEY PRIMARY KEY (R_REGIONKEY);
ALTER TABLE bmsql_supplier
    ADD CONSTRAINT SUPPLIER_PKEY PRIMARY KEY (S_SUPPKEY);

create index bmsql_order_line_ol_i_id_index on bmsql_order_line (ol_i_id);
create index supplier_s_nationkey_index on bmsql_supplier (S_NATIONKEY);
create index bmsqlcustomer_c_state_index on bmsql_customer (c_nationkey);
create index NATION_N_REGIONKEY_index on bmsql_nation (N_REGIONKEY);
create index bmsql_stock_s_tocksuppkey_index on bmsql_stock (s_tocksuppkey);
create index bmsql_stock_s_i_id_index on bmsql_stock (s_i_id);
create index bmsql_order_line_ol_suppkey_index on bmsql_order_line (ol_suppkey);
create index bmsql_order_line_ol_delivery_d_index on bmsql_order_line (ol_delivery_d);
create index bmsql_oorder_entry_d_index on bmsql_oorder (o_entry_d);

analyse;
