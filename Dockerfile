# 使用 Python 官方 Docker 映像
FROM python:3

# 安裝 pipenv
RUN pip install pipenv

# 設定工作目錄
WORKDIR /app

# 複製 Pipfile 和 Pipfile.lock 到容器中
COPY Pipfile* /app/

# 安裝 pipenv 虛擬環境中的所有依賴項
RUN pipenv install --system --deploy

# 複製應用程序代碼到容器中
COPY . /app

# 執行應用程序
ENTRYPOINT ["python", "src/app.py"]
