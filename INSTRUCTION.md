**Create and start containers:** docker-compose up --build -d

**Stop containers:** docker-compose down

**Access the app:** Link to the app: http://localhost:8000/

### Notes
- Todos are stored in a MySQL database with a persistent volume.
- Database data is kept in the volume `db_data` (defined in docker-compose.yml) even if containers are stopped.