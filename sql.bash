

read -p "Last xxx of IP : " ip

psql -h 172.24.171.$ip -U sige -c "DROP SCHEMA IF EXISTS cadastre;"
psql -h 172.24.171.$ip -U sige -c "CREATE SCHEMA cadastre ;"


psql -h 172.24.171.$ip -U sige -f batiment.sql
