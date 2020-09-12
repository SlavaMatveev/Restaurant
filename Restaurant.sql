CREATE TABLE Сотрудники
(
  Код_сотрудника INT NOT NULL,
  ФИО VARCHAR NOT NULL,
  Возраст INT NOT NULL,
  Пол VARCHAR NOT NULL,
  Адрес VARCHAR NOT NULL,
  Телефон INT NOT NULL,
  Паспортные_данные VARCHAR NOT NULL,
  PRIMARY KEY (Код_сотрудника)
);

CREATE TABLE Должности
(
  Код_должности INT NOT NULL,
  Наименование_должности VARCHAR NOT NULL,
  Оклад INT NOT NULL,
  Обязанности VARCHAR NOT NULL,
  Требования VARCHAR NOT NULL,
  Код_сотрудника INT NOT NULL,
  PRIMARY KEY (Код_должности),
  FOREIGN KEY (Код_сотрудника) REFERENCES Сотрудники(Код_сотрудника)
);

CREATE TABLE Склад
(
  Срок_годности DATE NOT NULL,
  Код_ингредиента INT NOT NULL,
  Наименование_ингредиента VARCHAR NOT NULL,
  Дата_выпуска DATE NOT NULL,
  Объём INT NOT NULL,
  Поставщик VARCHAR NOT NULL,
  Стоимость INT NOT NULL,
  PRIMARY KEY (Код_ингредиента)
);

CREATE TABLE Меню
(
  Объём_ингридиента_1 INT NOT NULL,
  Время_приготовления DATE NOT NULL,
  Наименование_блюда VARCHAR NOT NULL,
  Код_блюда INT NOT NULL,
  Объём_ингридиента_2 INT NOT NULL,
  Объём_ингридиента_3 INT NOT NULL,
  Стоимость INT NOT NULL,
  Код_ингредиента INT NOT NULL,
  Код_ингридиента_3Код_ингредиента INT,
  Код_ингридиента_2Код_ингредиента INT,
  Код_заказа INT NOT NULL,
  Код_блюда_3Код_заказа INT NOT NULL,
  PRIMARY KEY (Код_блюда),
  FOREIGN KEY (Код_ингредиента) REFERENCES Склад(Код_ингредиента),
  FOREIGN KEY (Код_ингридиента_3Код_ингредиента) REFERENCES Склад(Код_ингредиента),
  FOREIGN KEY (Код_ингридиента_2Код_ингредиента) REFERENCES Склад(Код_ингредиента),
  FOREIGN KEY (Код_заказа) REFERENCES Заказ(Код_заказа),
  FOREIGN KEY (Код_блюда_3Код_заказа) REFERENCES Заказ(Код_заказа)
);

CREATE TABLE Заказ
(
  Время DATE NOT NULL,
  Дата DATE NOT NULL,
  Отметка_о_выполнении VARCHAR NOT NULL,
  Стоимость INT NOT NULL,
  ФИО_заказчика VARCHAR NOT NULL,
  Телефон INT NOT NULL,
  Код_заказа INT NOT NULL,
  Код_блюда INT NOT NULL,
  Код_сотрудника INT NOT NULL,
  PRIMARY KEY (Код_заказа),
  FOREIGN KEY (Код_блюда) REFERENCES Меню(Код_блюда),
  FOREIGN KEY (Код_сотрудника) REFERENCES Сотрудники(Код_сотрудника)
);
