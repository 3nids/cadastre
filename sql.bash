

read -p "Last xxx of IP : " ip

psql -h 172.24.171.$ip -U sige -c "DROP SCHEMA IF EXISTS cadastre;"
psql -h 172.24.171.$ip -U sige -c "CREATE SCHEMA cadastre ;"


psql -h 172.24.171.$ip -U sige -f batiment.sql
read -p "Press any key to continue..."

psql -h 172.24.171.$ip -U sige -f bienfonds.sql
read -p "Press any key to continue..."

psql -h 172.24.171.$ip -U sige -f numeromaison.sql
read -p "Press any key to continue..."

psql -h 172.24.171.$ip -U sige -f elementlineaire.sql
read -p "Press any key to continue..."

psql -h 172.24.171.$ip -U sige -f elementsurfacique.sql
read -p "Press any key to continue..."

psql -h 172.24.171.$ip -U sige -f pointlimite.sql
read -p "Press any key to continue..."

psql -h 172.24.171.$ip -U sige -f lieudit.sql
read -p "Press any key to continue..."

