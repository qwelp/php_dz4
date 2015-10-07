<?php
/**
 * Interface interface_product_catid
 */
interface interface_product_catid
{
    /**
     * Интерфейс создания записи в таблице БД для таблицы - product_catid
     *
     * @var string $title - Название категории
     */
    public function create($title);
}
/**
 * Interface interface_status
 */
interface interface_order_status
{
    /**
     * Интерфейс создания записи в таблице БД для таблицы - order_status
     *
     * @var string $title - Название статуса
     */
    public function create($title);
}
/**
 * Interface interface_order
 */
interface interface_order
{
    /**
     * Интерфейс создания записи в таблице БД для таблицы - order
     *
     * @var Integer  $id - ID заказа. Таблица order_cart.id=$id
     * @var Integer  $user_id - ID пользователя. Таблица users.id=$id
     * @var Integer  $status - статус покупки. Таблица order_status.id=$status
     * @var DataTime $data_order - Дата и время создания
     */
    public function create($id, $user_id, $status);
}
/**
 * Interface interface_order_cart
 */
interface interface_order_cart
{
    /**
     * Интерфейс создания записи в таблице БД для таблицы - order_cart
     *
     * @var Integer  $id_product - ID товара. Таблица product.id=$id_product
     * @var Float  $price - Цена товара. Таблица product.price=$price
     * @var Integer  $count - Кол-во товаров. Таблица product.count=$count
     */
    public function create($id_product, $price, $count);
}
/**
 * Interface interface_product
 */
interface interface_product
{
    /**
     * Интерфейс создания записи в таблице БД для таблицы - product
     *
     * @var String  $title - Название товара
     * @var String  $mark - Производитель товара
     * @var Integer $count - Кол-во товаров
     * @var Float   $price - Цена товара
     * @var String  $description - Описание товара
     * @var Integer $id_catalog - ID категории товара. Таблица product_catalog.id=$id_catalog
     */
    public function create($title, $mark, $count, $price, $description, $id_catalog);
}
/**
 * Interface users
 */
interface interface_users
{
    /**
     * Интерфейс создания записи в таблице БД для таблицы - users
     *
     * @var String  $name - Имя
     * @var String  $lastname - Фамилия
     * @var Data    $birthday - Дата рождения
     * @var String  $email
     * @var String  $password - Пароль
     * @var Blob    $is_active - Активность
     */
    public function create($name, $lastname, $birthday, $email, $password, $is_active);
}
?>