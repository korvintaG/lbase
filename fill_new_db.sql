insert into source_type(name) values (:P1);
insert into source_type(name) values (:P2);
insert into source_type(name) values ("-");
insert into source_type(name) values (:P3);
insert into source_type(name) values (:P4);
insert into source_type(name) values (:P5);
insert into source_type(name) values (:P6);
insert into source_type(name) values (:P7);
delete from source_type where id=3;
insert into link_type(name, corr_link_type) values (:P8,2);
insert into link_type(name, corr_link_type) values (:P9,1);
insert into parameter(name, int_value) values ('Mode',0);

