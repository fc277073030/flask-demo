FROM python:3.7
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN pip install flask -i http://mirrors.aliyun.com/pypi/simple/
EXPOSE 5000
CMD ["python", "app.py"]
