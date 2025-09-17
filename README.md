# Employee Management System (EMS)

A **Django-based Employee Management System** with containerized deployment using **Docker, Docker Compose, and Nginx**.  
It also supports **CI/CD with Jenkins** for automated builds and deployments.  


## 🛠️ Tech Stack
- **Backend:** Django (Python)  
- **Frontend:** HTML, CSS, JS (Django Templates)  
- **Database:** SQLite (can be extended to PostgreSQL/MySQL)  
- **Containerization:** Docker, Docker Compose  
- **Web Server:** Nginx  
- **CI/CD:** Jenkins  
- **Infra as Code (IaC):** Terraform & Ansible (planned in `infra/`)

## 📂 Project Structure

ems/

├── employee_information/ # Django app for employee data

├── ems/ # Project settings

├── infra/ # Infrastructure automation (future use)

├── myenv/ # Virtual environment (local)

├── nginx/ # Nginx configuration

├── static/ # Static files (CSS, JS, assets)

├── Dockerfile # Docker image build file

├── docker-compose.yml # Multi-container setup

├── Jenkinsfile # CI/CD pipeline definition

├── requirements.txt # Python dependencies

├── manage.py # Django project runner

└── README.md # Project documentation


---

## ⚙️ Setup Instructions  

### 1️⃣ Run Locally (Without Docker)  
```bash
# Clone repo
git clone https://github.com/On-cloud7/ems.git
cd ems

# Create virtual environment
python -m venv myenv
source myenv/bin/activate   # Linux/Mac
myenv\Scripts\activate      # Windows

# Install dependencies
pip install -r requirements.txt

# Run migrations
python manage.py migrate

# Start development server
python manage.py runserver

