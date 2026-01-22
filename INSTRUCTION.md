## **Architecture of Docker Compose**
### *Services*
1. **mysql**
   - Image: `todolist-mysql:1.0`
   - Container name: `mysql`
   - Port: `3306`
   - Volume: `mysql-data:/var/lib/mysql`
   - Environment variables:
     - `MYSQL_ROOT_PASSWORD=1234`
     - `MYSQL_DATABASE=app_db`
     - `MYSQL_USER=app_user`
     - `MYSQL_PASSWORD=1234`

2. **todolist**
   - Image: `todolist-app:1.0`
   - Container name: `todolist-app`
   - Port: `8080`
   - Depends on: `mysql`
   - Restart policy: `unless-stopped`

### *Network*
- **todolist-network** (bridge)

### *Volumes*
- **mysql-data**


## **Running app**
### 1. *Clone repository*
```bash
git clone <repository-url>
cd devops_todolist_docker_core_task_3_docker_compose
```

### 2. *Running containers*
```bash
docker-compose up
```
(detached mode):
```bash
docker-compose up -d
```

### 3. *Checking status*
```bash
docker-compose ps
```

### 4. *Checking logs*
```bash
docker-compose logs
```

## **App**
*http://localhost:8080/*


## **Stop app**
### *Stop containers*
```bash
docker-compose stop
```

### *Stop and delete containers*
```bash
docker-compose down
```

## **Restart app**
```bash
docker-compose restart
```