/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50545
Source Host           : localhost:3306
Source Database       : loftblog_dz2

Target Server Type    : MYSQL
Target Server Version : 50545
File Encoding         : 65001

Date: 2015-10-07 13:58:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Номер заказа',
  `id_user` int(11) unsigned NOT NULL COMMENT 'Идентификатор пользователя',
  `status` int(11) unsigned DEFAULT NULL COMMENT 'Статус пользователя',
  `date_order` timestamp NULL DEFAULT NULL COMMENT 'Дата формирования заказа',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `id_user` (`id_user`) USING BTREE,
  KEY `status` (`status`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`status`) REFERENCES `order_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_3` FOREIGN KEY (`id`) REFERENCES `order_cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Заказы';

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', '1', '1', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('2', '1', '2', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('3', '2', '2', '2015-09-12 00:00:00');
INSERT INTO `order` VALUES ('4', '9', '2', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('5', '6', '4', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('6', '5', '1', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('7', '7', '1', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('8', '10', '1', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('9', '8', '1', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('10', '11', '2', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('11', '12', '2', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('12', '13', '2', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('13', '14', '2', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('14', '15', '2', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('15', '16', '2', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('16', '17', '2', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('17', '18', '2', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('18', '19', '2', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('19', '20', '2', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('20', '21', '1', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('21', '22', '3', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('22', '23', '2', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('23', '24', '1', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('24', '25', '1', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('25', '26', '2', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('26', '27', '1', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('27', '28', '1', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('28', '29', '4', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('29', '1', '1', '2015-09-18 00:00:00');
INSERT INTO `order` VALUES ('30', '4', '1', '2015-10-07 12:10:55');

-- ----------------------------
-- Table structure for order_cart
-- ----------------------------
DROP TABLE IF EXISTS `order_cart`;
CREATE TABLE `order_cart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) unsigned NOT NULL COMMENT 'Идентификатор заказа',
  `price` float(10,0) unsigned DEFAULT NULL COMMENT 'Цена товара',
  `count` int(10) unsigned DEFAULT NULL COMMENT 'Количество товара в заказе',
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `order_cart_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='Состав товара';

-- ----------------------------
-- Records of order_cart
-- ----------------------------
INSERT INTO `order_cart` VALUES ('1', '9', '9500', '5');
INSERT INTO `order_cart` VALUES ('2', '2', '5121', '3');
INSERT INTO `order_cart` VALUES ('3', '3', '1619', '1');
INSERT INTO `order_cart` VALUES ('4', '11', '20700', '1');
INSERT INTO `order_cart` VALUES ('5', '33', '1590', '10');
INSERT INTO `order_cart` VALUES ('6', '5', '2100', '3');
INSERT INTO `order_cart` VALUES ('7', '5', '2100', '1');
INSERT INTO `order_cart` VALUES ('8', '11', '2070', '6');
INSERT INTO `order_cart` VALUES ('9', '15', '3000', '2');
INSERT INTO `order_cart` VALUES ('10', '10', '6000', '1');
INSERT INTO `order_cart` VALUES ('11', '3', '1619', '4');
INSERT INTO `order_cart` VALUES ('12', '31', '17990', '1');
INSERT INTO `order_cart` VALUES ('13', '32', '50', '2');
INSERT INTO `order_cart` VALUES ('14', '29', '6500', '4');
INSERT INTO `order_cart` VALUES ('15', '28', '6500', '1');
INSERT INTO `order_cart` VALUES ('16', '5', '2100', '2');
INSERT INTO `order_cart` VALUES ('17', '5', '2100', '1');
INSERT INTO `order_cart` VALUES ('18', '5', '2100', '2');
INSERT INTO `order_cart` VALUES ('19', '5', '2100', '1');
INSERT INTO `order_cart` VALUES ('20', '2', '5121', '1');
INSERT INTO `order_cart` VALUES ('21', '2', '5121', '3');
INSERT INTO `order_cart` VALUES ('22', '2', '5121', '1');
INSERT INTO `order_cart` VALUES ('23', '2', '5121', '2');
INSERT INTO `order_cart` VALUES ('24', '9', '9500', '1');
INSERT INTO `order_cart` VALUES ('25', '9', '9500', '2');
INSERT INTO `order_cart` VALUES ('26', '9', '9500', '3');
INSERT INTO `order_cart` VALUES ('27', '9', '9500', '1');
INSERT INTO `order_cart` VALUES ('28', '11', '20700', '1');
INSERT INTO `order_cart` VALUES ('29', '11', '20700', '1');
INSERT INTO `order_cart` VALUES ('30', '12', '16000', '1');

-- ----------------------------
-- Table structure for order_status
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_status
-- ----------------------------
INSERT INTO `order_status` VALUES ('1', 'В оброботке');
INSERT INTO `order_status` VALUES ('2', 'Куплен');
INSERT INTO `order_status` VALUES ('3', 'Не купил');
INSERT INTO `order_status` VALUES ('4', 'Отгружен');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT 'Название товара',
  `mark` varchar(100) NOT NULL COMMENT 'Марка товара',
  `count` int(10) unsigned DEFAULT '0' COMMENT 'Количество товара на складе',
  `price` float(10,0) unsigned DEFAULT NULL COMMENT 'Цена за единицу товара',
  `description` text COMMENT 'Описание товара',
  `id_catalog` int(11) unsigned NOT NULL COMMENT 'Идентификатор категории',
  PRIMARY KEY (`id`),
  KEY `id_catalog` (`id_catalog`),
  KEY `price` (`price`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_catalog`) REFERENCES `product_catid` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='Товары';

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('2', 'Навигатор Garmin nuvi 2495LT', 'Garmin 1', '10', '5121', 'Навигатор не только подсказывает Вам, где нужно повернуть, но и реагирует на произносимые Вами команды. Благодаря инновационной функции распознавания речи Вы можете управлять устройством с помощью голоса, не отрывая рук от руля. Активизируйте nuvi 2495 Глонасс (Glonass) с помощью специально настраиваемой команды и начинайте произносить необходимые опции меню, показанные на экране. ', '1');
INSERT INTO `product` VALUES ('3', 'Навигатор Garmin SG-555', 'Garmin', '10', '1619', 'Тонкий корпус 13 мм из материала«soft-touch», металлическая рамка экрана. Современный процессор MStar 500 МГц и ОС WinCE 6.0. Предустановленный навигационный пакет Навител 5 с картами России с бесплатным обновлением (возможна поставка пакетов навигации «ПРОГОРОД» и «Ситигид») .', '1');
INSERT INTO `product` VALUES ('4', 'Навигатор Pioneer 780', 'Pioneer', '10', '1999', 'Портативный автомобильный GPS навигатор 780 с большим 7 дюймовым экраном. Краткие характеристики: поддержка MP3, MPEG4, JPG, miniUSB, карты памяти формата MicroSD, Bluetooth, просмотр 3D карт, голосовые подсказки, режим Hands-Free для мобильного телефона, AV-вход.', '1');
INSERT INTO `product` VALUES ('5', 'ParkCity DVR HD 150', 'Parkcity', '5', '2100', 'Parkcity DVR HD 150 - современный автомобильный видеорегистратор, оснащенный встроенным откидным дисплеем с диагональю экрана 2.5 дюйма. Автомобильный видеорегистратор Parkcity DVR HD 150 записывает все, что происходит во время движения автомобиля и позволяет при возникновении необходимости воссоздать картину всего происходящего.', '2');
INSERT INTO `product` VALUES ('9', 'Видеорегистратор ParkCity DVR HD 420', ' \r\nParkCity', '7', '9500', 'Новинка этого года - автомобильный видеорегистратор ParkCity DVR HD 420 уникален тем, что сочетает в себе наличие сразу двух камер и большого встроенного экрана, и при этом не содержит «излишеств» вроде GPS и акселерометра. Кому-то такая избирательность должна прийтись по вкусу.', '2');
INSERT INTO `product` VALUES ('10', 'Ritmix AVR-770', 'Ritmix', '3', '6000', 'Видеорегистратор Ritmix AVR-770 оснащен двумя камерами – основной (фронтальной) и дополнительной камерами с углом обзора 110° каждая. Дополнительная камера может по желанию использоваться в качестве внутрисалонной или как камера заднего наблюдения.', '2');
INSERT INTO `product` VALUES ('11', 'Автомагнитола Intro CHR-2231 (IE)', 'Chevrolet', '12', '20700', 'Штатная автомагнитола для Chevrolet, DVD-проигрыватель, воспроизведение MP3, MPEG4, навигатор с GPS, сенсорный дисплей 7\", ТВ-тюнер, макс. мощность 4 x 45 Вт.', '3');
INSERT INTO `product` VALUES ('12', 'Автомагнитола Intro CHR-2271', 'Toyota', '15', '16000', 'Штатная автомагнитола для Toyota. DVD-проигрыватель, воспроизведение MP3, MPEG4, навигатор с GPS, сенсорный дисплей 7\", ТВ-тюнер, макс. мощность 4 x 45 Вт.', '3');
INSERT INTO `product` VALUES ('13', 'Набор автомагнитола JVC KW-XR817EE', 'JVC', '5', '6700', 'Набор — это предложенный магазином список (рекомендованный список) до трёх товаров, которые отображаются в публичной части магазина, к основному товару для которого набор и создаётся. Плюс этот список может содержать любое разумное количество товаров, из которого можно выбрать замену для предложенного товара.', '3');
INSERT INTO `product` VALUES ('14', 'Сабвуфер Mystery MBB-20A', 'Mystery', '6', '2370', 'Сабвуфер, типоразмер: 20 см (8 дюйм.), максимальная мощность 200 Вт, тип корпуса: закрытый ящик, встроенный усилитель, диапазон частот 30 - 200 Гц.', '4');
INSERT INTO `product` VALUES ('15', ' \r\nАвтоакустика Pioneer TS-A1713I', 'Pioneer', '5', '3000', 'Трехполосная коаксиальная АС, номинальная мощность 35 Вт, максимальная мощность 300 Вт, чувствительность 90 дБ (Вт/м), импеданс 4 Ом, диапазон частот 33 - 32000 Гц.', '4');
INSERT INTO `product` VALUES ('17', 'Сабвуфер Mystery MTB 300 A', 'Mystery', '5', '4800', 'Типоразмер: 30 см (12 дюйм.), номинальная мощность 180 Вт, тип корпуса: фазоинверторный, встроенный усилитель, диапазон частот 40 - 250 Гц.', '4');
INSERT INTO `product` VALUES ('18', 'Автоакустика Pioneer TS-A1313I', 'Pioneer', '5', '1410', 'Трехполосная коаксиальная АС, типоразмер: 13 см (5 дюйм.), номинальная мощность 35 Вт, максимальная мощность 300 Вт, чувствительность 89 дБ (Вт/м), импеданс 4 Ом, диапазон частот 28 - 29000 Гц.', '4');
INSERT INTO `product` VALUES ('19', 'Cobra RU R9G', 'Cobra ', '5', '13500', 'Cobra RU R9G – совмещает в себе 3 приспособления в одном: радар-детектор, который устанавливается на фронтальное стекло возле зеркала заднего вида; приемник GPS, который крепится рядом с радар-детектором; беспроводной монитор, который Вы можете определить в любое удобное для Вас место.', '5');
INSERT INTO `product` VALUES ('21', 'Радар-детектор Cobra RU 860', 'Cobra ', '5', '8800', 'Cobra RU 860  является современнейшей моделью радаров детекторов  этого поколения. Во время проектирования данного устройства  была проделана огромнейшая работа с учетом технических  особенностей,  которыми обладают  детекторы  сотрудников дорожного патруля.', '5');
INSERT INTO `product` VALUES ('22', 'Sho me 213', 'Sho', '11', '1390', 'Детектор радаров, диапазонов X, K, широкополосного Ka и сигналов лазера в радиусе 360 град.. Выдает визуальные и звуковые сигналы при обнаружении радаров и лазерных пушек указанных диапазонов. Регулятор громкости сигналов. Цвет черный.', '5');
INSERT INTO `product` VALUES ('23', 'SHO ME 1720', 'Sho', '11', '1490', 'Детектор радаров, диапазонов X, K, широкополосного Ka и сигналов лазера в радиусе 360 град. Выдает визуальные и звуковые сигналы при обнаружении радаров и лазерных пушек указанных диапазонов. Регулятор громкости сигналов. Цвет черный.', '5');
INSERT INTO `product` VALUES ('26', ' \r\nВидеокамера Sony HDR-CX200E Red', 'Sony', '15', '10490', 'Простая в работе видеокамера Full HD с мощным зумом и непревзойденным качеством изображения Запись Full HD на карту памяти, 25-кратный зум, фотографии 5,3 МП, сенсорный ЖК-экран 6,7 см/2,7\", iAUTO.', '6');
INSERT INTO `product` VALUES ('27', 'Видеокамера Panasonic HC-V100EE-W', ' \r\nPanasonic', '10', '11400', 'Эти камкордеры очень легкие и компактные, их всегда можно носить с собой. Также они предлагают обильный функционал, в том числе Интеллектуальный 42x зум и оптическую стабилизацию изображения POWER O.I.S. Интеллектуальный 42x зум Компактный камкордер HC-V100 не только позволяет снимать видео в разрешении Full HD, но и предлагает 42x зум.', '6');
INSERT INTO `product` VALUES ('28', 'Объектив Canon Tokina AT-X 10-17 F/3.5-4.5', 'Canon', '2', '20591', 'Объектив Tokina AT-X 1017 DX - фиш-ай подходит для цифровых зеркальных камер с матрицей формата APC-C типа CMOS и CCD. Объективы с таким углом охвата и таким кардинальным изгибом пространства называют также \"рыбий глаз\". Этот объектив добавит новое измерение ваших фото-возможностей.', '7');
INSERT INTO `product` VALUES ('29', 'Объектив Nikon Nikkor 50 F1.8D AF', 'Nikon', '7', '6500', 'Объектив для ф-та Nikon Nikon 50 F1.8D AF Nikkor. Компактный, доступный нормальный объектив Легкий (155 г) Хорошее управление глубиной резкости - диафрагма закрывается до f/22. Идеален для макросъемки с использованием удлиннительных колец.', '7');
INSERT INTO `product` VALUES ('30', 'Фотоаппарат Canon EOS 5D Mark III 24-105IS', 'Canon', '5', '13440', 'Цифровая зеркальная камера новинка! EOS 5D Mark III — полнокадровая зеркальная камера с 22,3 МП, 61-точечной автофокусировкой и режимом серийной съемки 6 кадров/сек.', '8');
INSERT INTO `product` VALUES ('31', 'Фотоаппарат Sony SLT-A37', 'Sony', '1', '17990', 'Быстрая съемка и множество творческих возможностей! Творческая съемка — это просто Откройте для себя мир высокого качества фотографий, оперативной, \"быстрой\" съемке и сменных объективов.', '8');
INSERT INTO `product` VALUES ('32', 'Фоторамка Sony DPF-HD1000', 'Sony', '50', '4250', 'Наслаждайтесь поразительным качеством воспроизведения фотографий и видеоклипов в формате HD со звуком. Множество режимов просмотра слайд-шоу, режимов отображения часов и календаря. Невероятное качество изображения, любимые воспоминания заслуживают особого обрамления.', '9');
INSERT INTO `product` VALUES ('33', 'Фоторамка Ritmix RDF-702', 'Ritmix', '55', '1590', 'Данная модель позволяет прослушивать MP3 музыку и смотреть фильмы MPEG4, а также ролики с Вашего фотоаппарата.', '9');

-- ----------------------------
-- Table structure for product_catid
-- ----------------------------
DROP TABLE IF EXISTS `product_catid`;
CREATE TABLE `product_catid` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT 'Название категории товаров',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Категории товаров';

-- ----------------------------
-- Records of product_catid
-- ----------------------------
INSERT INTO `product_catid` VALUES ('1', 'GPS-навигаторы');
INSERT INTO `product_catid` VALUES ('2', 'Видеорегистраторы');
INSERT INTO `product_catid` VALUES ('3', 'Магнитолы');
INSERT INTO `product_catid` VALUES ('4', 'Акустика');
INSERT INTO `product_catid` VALUES ('5', 'Радары-детекторы');
INSERT INTO `product_catid` VALUES ('6', 'Видеокамеры');
INSERT INTO `product_catid` VALUES ('7', 'Объективы');
INSERT INTO `product_catid` VALUES ('8', 'Фотоаппарат');
INSERT INTO `product_catid` VALUES ('9', 'Цифровые фоторамки');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT 'Имя пользователя',
  `lastname` varchar(50) NOT NULL COMMENT 'Фамилия пользователя',
  `birthday` date DEFAULT NULL COMMENT 'Дата рождения пользователя',
  `email` varchar(100) NOT NULL COMMENT 'Email пользователя',
  `password` char(5) NOT NULL COMMENT 'Пароль пользователя',
  `is_active` tinyint(1) DEFAULT '0' COMMENT 'Активирован или нет аккаунт пользователя',
  `reg_date` datetime NOT NULL COMMENT 'Дата регистрации',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата последнего редактирования пользователя',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='Пользователи';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Владимир', 'Бун 1', '1980-02-23', 'qwelp@mail.ru', '12345', '1', '2015-09-18 00:00:00', '2015-10-07 13:54:35');
INSERT INTO `users` VALUES ('2', 'Дмитрий', 'Бун', '1915-09-11', 'dmail@mail.ru', '65478', '1', '2015-09-18 00:00:00', '2015-09-18 00:00:00');
INSERT INTO `users` VALUES ('3', 'Матвей', 'Петров', '1955-09-02', 'dmail_2@mail.ru', '15973', '1', '2015-09-18 00:00:00', '2015-09-18 00:00:00');
INSERT INTO `users` VALUES ('4', 'Валентина', 'Орлова', '1990-09-02', 'dmail_3@mail.ru', '12022', '1', '2015-09-18 00:00:00', '2015-09-18 00:00:00');
INSERT INTO `users` VALUES ('5', 'Зенаида', 'Ивановна', '1963-09-16', 'dmail_4@mail.ru', '46666', '1', '2015-09-18 00:00:00', '2015-09-18 00:00:00');
INSERT INTO `users` VALUES ('6', 'Владислав', 'Макарович', '1996-09-29', 'dmail_5@mail.ru', '33355', '1', '2015-09-18 00:00:00', '2015-09-18 00:00:00');
INSERT INTO `users` VALUES ('7', 'Павел', 'Костяков', '1985-09-13', 'dmail_6@mail.ru', '00011', '1', '2015-09-18 00:00:00', '2015-09-18 00:00:00');
INSERT INTO `users` VALUES ('8', 'Василий', 'Веревка', '1933-09-10', 'dmail_7@mail.ru', '54699', '1', '2015-09-18 00:00:00', '2015-09-06 00:00:00');
INSERT INTO `users` VALUES ('9', 'Татьяна', 'Карапузова', '1978-09-05', 'dmail_8@mail.ru', '14796', '1', '2015-09-18 00:00:00', '2015-09-18 00:00:00');
INSERT INTO `users` VALUES ('10', 'Анастасия', 'Пупкина', '2001-09-05', 'dmail_9@mail.ru', '11111', '1', '2015-09-18 00:00:00', '2015-09-18 00:00:00');
INSERT INTO `users` VALUES ('11', 'Антон', 'Васильев', '1970-09-18', 'dmail_10@mail.ru', '25894', '1', '2015-09-18 00:00:00', '2015-09-18 00:00:00');
INSERT INTO `users` VALUES ('12', 'Денис', 'Борис', '1971-09-18', 'dmail_11@mail.ru', '11111', '1', '2015-09-18 00:00:00', '2015-09-18 00:00:00');
INSERT INTO `users` VALUES ('13', 'Денис', 'Крутыш', '1970-09-18', 'dmail_12@mail.ru', '00000', '1', '2015-09-18 00:00:00', '2015-09-18 00:00:00');
INSERT INTO `users` VALUES ('14', 'Леонид', 'Иванов', '1970-09-18', 'dmail_13@mail.ru', '12345', '1', '2015-09-18 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `users` VALUES ('15', 'Петр', 'Иванов', '1970-09-18', 'dmail_14@mail.ru', '12345', '1', '2015-09-18 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `users` VALUES ('16', 'Матвей', 'Петров', '1970-09-18', 'dmail_15@mail.ru', '12345', '1', '2015-09-18 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `users` VALUES ('17', 'Галя', 'Турецкая', '1970-09-18', 'dmail_16@mail.ru', '12345', '1', '2015-09-18 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `users` VALUES ('18', 'Елена ', 'Прекрасная', '1970-09-18', 'dmail_17@mail.ru', '12345', '1', '2015-09-18 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `users` VALUES ('19', 'Елена', 'Романов', '1970-09-18', 'dmail_18@mail.ru', '12345', '1', '2015-09-18 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `users` VALUES ('20', 'Евения', 'Петрова', '1970-09-18', 'dmail_19@mail.ru', '12345', '1', '2015-09-18 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `users` VALUES ('21', 'Марину', 'Черкасова', '1970-09-18', 'dmail_120@mail.ru', '12345', '1', '2015-09-18 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `users` VALUES ('22', 'Оксана', 'Черкасова', '1970-09-18', 'dmail_121@mail.ru', '12345', '0', '2015-09-18 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `users` VALUES ('23', 'Юрий', 'Михайлович', '1970-09-18', 'dmail_122@mail.ru', '12345', '0', '2015-09-18 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `users` VALUES ('24', 'Юрий', 'Курасов', '1970-09-18', 'dmail_123@mail.ru', '12345', '0', '2015-09-18 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `users` VALUES ('25', 'Юрий', 'Петров', '1970-09-18', 'dmail_124@mail.ru', '12345', '0', '2015-09-18 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `users` VALUES ('26', 'Юрий', 'Иванов', '1970-09-18', 'dmail_125@mail.ru', '12345', '0', '2015-09-18 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `users` VALUES ('27', 'Султан', 'Рашидович', '1970-09-18', 'dmail_126@mail.ru', '12345', '0', '2015-09-18 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `users` VALUES ('28', 'Аня', 'Пупсова', '1970-09-18', 'dmail_127@mail.ru', '12345', '0', '2015-09-18 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `users` VALUES ('29', 'Александр', 'Кривоглазов', '1970-09-18', 'dmail_128@mail.ru', '12345', '0', '2015-09-18 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `users` VALUES ('30', 'Анатолий', 'Чюриков', '1970-09-18', 'dmail_129@mail.ru', '12345', '0', '2015-09-18 00:00:00', '0000-00-00 00:00:00');
