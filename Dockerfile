FROM python:3.10-slim

# Root directory
WORKDIR /app

# Requirements copy karke install karein
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Saara code copy karein
COPY . .

# Working directory ko inner 'todoApp' folder par set karein jahan manage.py hai
WORKDIR /app/todoApp

EXPOSE 8000

# Ab Gunicorn sahi location se todoApp/wsgi.py ko dhoond payega
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "todoApp.wsgi:application"]
