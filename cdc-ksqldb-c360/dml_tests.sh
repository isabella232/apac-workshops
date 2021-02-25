docker exec -i sqlserver /opt/mssql-tools/bin/sqlcmd -U sa -P Password! << EOF
use c360;
update phone set phone_num=11112222 where customer_id='C101';
GO
EOF

docker exec -i sqlserver /opt/mssql-tools/bin/sqlcmd -U sa -P Password! << EOF
use c360;
delete from address where customer_id='C102';
GO
EOF

docker exec -i sqlserver /opt/mssql-tools/bin/sqlcmd -U sa -P Password! << EOF
use c360;
delete from phone where customer_id='C102';
GO
EOF

docker exec -i sqlserver /opt/mssql-tools/bin/sqlcmd -U sa -P Password! << EOF
use c360;
delete from profile where customer_id='C102';
GO
EOF

docker exec -i sqlserver /opt/mssql-tools/bin/sqlcmd -U sa -P Password! << EOF
use c360;
insert into profile (customer_id, first_name, last_name) values ('C102', 'back', 'here');
GO
EOF


sqlplus C##MYUSER/mypassword@ORCLCDB
update custaccount set account_type='checking' where account_id='CUR102';
commit;
insert into custtransactions (account_id, transaction_amount, transaction_type) values ('SAV101', 500, 'DEPOSIT');
commit;
insert into custtransactions (account_id, transaction_amount, transaction_type) values ('SAV101', 100, 'WITHDRAWAL');
commit;
insert into custtransactions (account_id, transaction_amount, transaction_type) values ('CUR101', 1000, 'DEPOSIT');
commit;
delete from custaccount where account_id='CUR102';
commit;
