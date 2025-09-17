#Base image
FROM python:3.13-alpine 

# Set working directory
WORKDIR /app

# Copy project files
COPY  . . 

# Copy requirements 
COPY requirements.txt .

#install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate


#Expose Django port
EXPOSE 8000  

# Run Django server
ENTRYPOINT [ "python3" ]

CMD [ "manage.py" , "runserver" ,"0.0.0.0:8000" ]
