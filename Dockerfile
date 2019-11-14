FROM python:3.7
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
EXPOSE 5000
CMD ["python", "app.py"]
