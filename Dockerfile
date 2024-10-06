# 基于镜像基础
#FROM python:3.6
FROM python:3-slim
 
# 复制当前代码文件到容器中 /app
ADD . /app
 
# 设置app文件夹是工作目录 /app
WORKDIR /app

#解决Dockers中打印日志不及时的问题
ENV PYTHONUNBUFFERED=0
 
# 安装所需的包，默认为使用python官方镜像源，安装 比较慢
#RUN pip install -r requirements.txt
#可以修改为清华源
#RUN pip install -r requirements.txt - i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install poetry && \
python -m poetry install

# Run test.py when the container launches
CMD ["python", "/app/main.py"]
