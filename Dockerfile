# Используем официальный образ Node.js
FROM node:14

# Указываем рабочую директорию
WORKDIR /app

# Копируем файл package.json и файл lock (если имеется)
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем все остальные файлы в контейнер
COPY . .

# Строим проект
RUN npm run build

# Устанавливаем сервер для сервировки static-файлов (например, serve)
RUN npm install -g serve

# Указываем команду по умолчанию для запуска контейнера
CMD ["serve", "-s", "build"]

# Открываем нужный порт
EXPOSE 5000
