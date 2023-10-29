FROM python:3.9.18

# Install dependencies
RUN pip install django

# Copy the project files into the container
COPY . .

# Install project requirements
RUN pip install -r requirements.txt

# Run database migrations
RUN python manage.py makemigrations
RUN python manage.py migrate

# Expose port 8000 for external access
EXPOSE 8000

# Start the Django development server, binding to 0.0.0.0 (all network interfaces)
CMD ["python","manage.py","runserver","0.0.0.0:8000"]
