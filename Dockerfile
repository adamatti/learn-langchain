FROM python:3.11.3-bullseye

RUN apt-get update && apt-get install -y \
  software-properties-common
# RUN add-apt-repository universe
RUN apt-get update && apt-get install -y \
  python3-pip
RUN pip install --upgrade pip

RUN mkdir /app
WORKDIR /app

COPY requirements.txt /app/
RUN python -m pip install -r requirements.txt

COPY ./ ./

EXPOSE 5000
CMD ["python", "/app/main.py"]
