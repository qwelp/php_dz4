<?php
/**
 * Класс управления таблицой order_status
 */
class order_status extends table implements interface_order_status
{
    /**
     * @var Integer id - auto_increment
     */
    private $id;
    /**
     * @var string $title - Название статуса
     */
    private $title;
    /**
     * Название таблицы БД
     *
     * @var $table - string
     */
    protected $table = "order_status";
    /**
     * Метод создания записи в таблице БД для таблицы - order_status
     *
     * @var string $title - Название статуса
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
            echo "Запись добавлена ".$sql;
        }
        catch(PDOException $e)
        {
            echo "Ошибка добавления записи: {$this->table}" . $e->getMessage();
        }
    }
}
?>