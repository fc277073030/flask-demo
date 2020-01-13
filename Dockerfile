FROM python:3.7
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN pip install flask -i http://pypi.douban.com/simple
EXPOSE 5000
CMD ["python", "app.py"]
