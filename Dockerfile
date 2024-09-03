# Use uma imagem base oficial do Python
FROM python:3.11.7-slim

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie o arquivo de requisitos
COPY requirements.txt /app/

# Instale as dependências do Python
RUN pip install --no-cache-dir -r requirements.txt

# Copie todo o código do projeto para o diretório de trabalho no container
COPY . /app/

ENV DJANGO_SETTINGS_MODULE=fit_attendance_app.settings.production

# Comando para rodar o servidor Django
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
CMD ["bash", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:$PORT"]
