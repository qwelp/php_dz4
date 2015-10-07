<?php
/**
 * Класс управления таблицой product
 */
class product extends table implements interface_product
{
    /**
     * @var Integer $id - auto_increment
     */
    private $id;
    /**
     * @var String  $title - Название товара
     */
    private $title;
    /**
     * @var String  $mark - Производитель товара
     */
    private $mark;
    /**
     * @var Integer $count - Кол-во товаров
     */
    private $count;
    /**
     * @var Float $price - Цена товара
     */
    private $price;
    /**
     * @var String  $description - Описание товара
     */
    private $description;
    /**
     * @var Integer $id_catalog - ID категории товара. Таблица product_catalog.id=$id_catalog
     */
    private $id_catalog;
    /**
     * Название таблицы БД
     *
     * @var $table - string
     */
    protected $table = "product";
    /**
     * Метод создания записи в таблице БД для таблицы - product
     *
     * @var String  $title - Название товара
     * @var String  $mark - Производитель товара
     * @var Integer $count - Кол-во товаров
     * @var Float   $price - Цена товара
     * @var String  $description - Описание товара
     * @var Integer $id_catalog - ID категории товара. Таблица product_catalog.id=$id_catalog
     */
    public function create($title, $mark, $count, $price, $description, $id_catalog)
    {
        try
        {
            $sql = "INSERT INTO `{$this->table}` VALUES (NULL, :title, :mark, :countProduct, :price, :description, :id_catalog)";
            $stmt = $this->_db->prepare($sql);
            $stmt->execute(array(
                ':title' => $title,
                ':mark' => $mark,
                ':countProduct' => $count,
                ':price' => $price,
                ':description' => $description,
                ':id_catalog' => $id_catalog
            ));
            echo "Запись добавлена ".$sql;
        }
        catch(PDOException $e)
        {
            echo "Ошибка добавления записи: {$this->table}" . $e->getMessage();
        }
    }
}
?>