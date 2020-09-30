CREATE TABLE Должности
(
  Код_должности INT NOT NULL,
  Наименование_должности INT NOT NULL,
  Оклад INT NOT NULL,
  Обязанности INT NOT NULL,
  Требования INT NOT NULL,
  PRIMARY KEY (Код_должности)
);

CREATE TABLE Склад
(
  Срок_годности INT NOT NULL,
  Код_ингредиента INT NOT NULL,
  Наименование_ингредиента INT NOT NULL,
  Дата_выпуска INT NOT NULL,
  Объём INT NOT NULL,
  Поставщик INT NOT NULL,
  Стоимость INT NOT NULL,
  PRIMARY KEY (Код_ингредиента)
);

CREATE TABLE Меню
(
  Объём_ингридиента_1 INT NOT NULL,
  Время_приготовления INT NOT NULL,
  Наименование_блюда INT NOT NULL,
  Код_блюда INT NOT NULL,
  Объём_ингридиента_2 INT NOT NULL,
  Объём_ингридиента_3 INT NOT NULL,
  Стоимость INT NOT NULL,
  Код_ингредиента INT NOT NULL,
  Код_ингридиента_3Код_ингредиента INT NOT NULL,
  Код_ингридиента_2Код_ингредиента INT NOT NULL,
  PRIMARY KEY (Код_блюда),
  FOREIGN KEY (Код_ингредиента) REFERENCES Склад(Код_ингредиента),
  FOREIGN KEY (Код_ингридиента_3Код_ингредиента) REFERENCES Склад(Код_ингредиента),
  FOREIGN KEY (Код_ингридиента_2Код_ингредиента) REFERENCES Склад(Код_ингредиента)
);

CREATE TABLE Заказ
(
  Время INT NOT NULL,
  Дата INT NOT NULL,
  Отметка_о_выполнении INT NOT NULL,
  Стоимость INT NOT NULL,
  ФИО_заказчика INT NOT NULL,
  Телефон INT NOT NULL,
  Код_заказа INT NOT NULL,
  Код_блюда INT NOT NULL,
  Код_блюда_2Код_блюда INT NOT NULL,
  Код_блюда_3Код_блюда INT NOT NULL,
  PRIMARY KEY (Код_заказа),
  FOREIGN KEY (Код_блюда) REFERENCES Меню(Код_блюда),
  FOREIGN KEY (Код_блюда_2Код_блюда) REFERENCES Меню(Код_блюда),
  FOREIGN KEY (Код_блюда_3Код_блюда) REFERENCES Меню(Код_блюда)
);

CREATE TABLE Сотрудники
(
  Код_сотрудника INT NOT NULL,
  ФИО INT NOT NULL,
  Возраст INT NOT NULL,
  Пол INT NOT NULL,
  Адрес INT NOT NULL,
  Телефон INT NOT NULL,
  Паспортные_данные INT NOT NULL,
  Код_должности INT,
  Код_заказа INT NOT NULL,
  PRIMARY KEY (Код_сотрудника),
  FOREIGN KEY (Код_должности) REFERENCES Должности(Код_должности),
  FOREIGN KEY (Код_заказа) REFERENCES Заказ(Код_заказа)
);
