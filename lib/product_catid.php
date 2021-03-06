<?php
/**
 * Класс управления таблицой product_catid
 */
class product_catid extends table implements interface_product_catid
{
    /**
     * @var Integer id - auto_increment
     */
    private $id;
    /**
     * @var string $title - Название категории
     */
    private $title;
    /**
     * Название таблицы БД
     *
     * @var $table - string
     */
    protected $table = "product_catid";
    /**
    * Метод создания записи в таблице БД для таблицы - product_catid
    *
    * @var string $title - Название категории
    */
    public function create($title)
    {
        try
        {
            $sql = "INSERT INTO `{$this->table}` VALUES (NULL, :title)";
            $stmt = $this->_db->prepare($sql);
            $stmt->execute(array(
                ':title' => $title
            ));
            echo "Запись добавлена";
        }
        catch(PDOException $e)
        {
          echo "Ошибка добавления записи: {$this->table}" . $e->getMessage();
        }
    }
}
?>