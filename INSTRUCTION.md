# Docker Compose instruction

## Run
1. Install Docker Desktop and make sure it is running.
2. Open terminal in the project folder.
3. Run: docker compose up --build
4. Open http://localhost:8080 in the browser.

## Stop
- Press Ctrl+C in the terminal, then run: docker compose down
- Data is saved in the volume mysql_data and stays after stop.
- Do not use "docker compose down -v", it deletes the data.