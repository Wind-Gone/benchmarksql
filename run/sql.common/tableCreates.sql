create table bmsql_config
(
    cfg_name  varchar(30) primary key,
    cfg_value varchar(50)
);

create table bmsql_warehouse
(
    w_id       integer not null,
    w_ytd      decimal(12, 2),
    w_tax      decimal(4, 4),
    w_name     varchar(10),
    w_street_1 varchar(20),
    w_street_2 varchar(20),
    w_city     varchar(20),
    w_state    integer,
    w_zip      char(9)
);

create table bmsql_district
(
    d_w_id      integer not null,
    d_id        integer not null,
    d_ytd       decimal(12, 2),
    d_tax       decimal(4, 4),
    d_next_o_id integer,
    d_name      varchar(10),
    d_street_1  varchar(20),
    d_street_2  varchar(20),
    d_city      varchar(20),
    d_state     integer,
    d_zip       char(9)
);

create table bmsql_customer
(
    c_w_id         integer not null,
    c_d_id         integer not null,
    c_id           integer not null,
    c_discount     decimal(4, 4),
    c_credit       char(2),
    c_last         varchar(16),
    c_first        varchar(16),
    c_credit_lim   decimal(12, 2),
    c_balance      decimal(12, 2),
    c_ytd_payment  decimal(12, 2),
    c_payment_cnt  integer,
    c_delivery_cnt integer,
    c_street_1     varchar(20),
    c_street_2     varchar(20),
    c_city         varchar(20),
    c_nationkey    integer not null,
    c_zip          char(9),
    c_phone        char(16),
    c_since        timestamp,
    c_middle       char(2),
    c_data         varchar(500),
    c_mktsegment   char(10)
);

create sequence bmsql_hist_id_seq;

create table bmsql_history
(
    hist_id  integer,
    h_c_id   integer,
    h_c_d_id integer,
    h_c_w_id integer,
    h_d_id   integer,
    h_w_id   integer,
    h_date   timestamp,
    h_amount decimal(6, 2),
    h_data   varchar(24)
);

create table bmsql_new_order
(
    no_w_id integer not null,
    no_d_id integer not null,
    no_o_id integer not null
);

create table bmsql_oorder
(
    o_w_id         integer not null,
    o_d_id         integer not null,
    o_id           integer not null,
    o_c_id         integer,
    o_carrier_id   integer,
    o_ol_cnt       integer,
    o_all_local    integer,
    o_entry_d      timestamp,
    o_comment      varchar(79),
    o_shippriority integer not null
);

create table bmsql_order_line
(
    ol_w_id         integer not null,
    ol_d_id         integer not null,
    ol_o_id         integer not null,
    ol_number       integer not null,
    ol_i_id         integer not null,
    ol_delivery_d   timestamp,
    ol_amount       decimal(6, 2),
    ol_supply_w_id  integer,
    ol_quantity     integer,
    ol_tax          decimal(15, 2),
    ol_dist_info    char(24),
    ol_discount     decimal(15, 2),
    ol_shipmode     char(10),
    ol_shipinstruct char(25),
    ol_receipdate   timestamp,
    ol_commitdate   timestamp,
    ol_returnflag   char(1),
    ol_suppkey      integer not null
);

create table bmsql_item
(
    i_id        integer     not null,
    i_name      varchar(24),
    i_price     decimal(5, 2),
    i_data      varchar(50),
    i_im_id     integer,
    i_container char(10)    not null,
    i_size      integer     not null,
    i_brand     char(10)    not null,
    i_type      varchar(25) not null,
    i_mfgr      char(25)    not null
);

create table bmsql_stock
(
    s_w_id        integer not null,
    s_i_id        integer not null,
    s_quantity    integer,
    s_ytd         integer,
    s_order_cnt   integer,
    s_remote_cnt  integer,
    s_data        varchar(50),
    s_dist_01     char(24),
    s_dist_02     char(24),
    s_dist_03     char(24),
    s_dist_04     char(24),
    s_dist_05     char(24),
    s_dist_06     char(24),
    s_dist_07     char(24),
    s_dist_08     char(24),
    s_dist_09     char(24),
    s_dist_10     char(24),
    s_supplycost  decimal(6, 2),
    s_tocksuppkey integer not null
);

CREATE TABLE bmsql_nation
(
    n_NATIONKEY integer  NOT NULL,
    N_NAME      char(25) NOT NULL,
    N_REGIONKEY integer  NOT NULL,
    N_COMMENT   varchar(152)
);

CREATE TABLE bmsql_region
(
    R_REGIONKEY integer  NOT NULL,
    R_NAME      char(25) NOT NULL,
    R_COMMENT   varchar(152)
);

CREATE TABLE bmsql_supplier
(
    S_SUPPKEY   integer NOT NULL,
    S_NAME      char(25),
    S_ADDRESS   varchar(40),
    S_NATIONKEY integer NOT NULL,
    S_PHONE     char(15),
    S_ACCTBAL   decimal(15, 2),
    S_COMMENT   varchar(101)
);

--create view revenue0 (supplier_no, total_revenue) as
--select ol_suppkey,
--       sum(ol_amount * (1 - ol_discount))
--from bmsql_order_line
--where ol_delivery_d >= date '1996-01-01'
--  and ol_delivery_d < date '1996-01-01' + interval '3' month
--group by ol_suppkey;