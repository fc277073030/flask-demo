FROM python:3.7
WORKDIR /usr/src/app
COPY requirements.txt /usr/src/app
RUN pip install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
COPY app.py /usr/src/app
EXPOSE 5000
CMD ["python", "app.py"]
