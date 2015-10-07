<?php
/**
 * Класс управления таблицой order
 */
class order extends table implements interface_order
{
    /**
     * @var Integer $id - ID заказа. Таблица order_cart.id=$id
     */
    private $id;
    /**
     * @var Integer $user_id - ID пользователя. Таблица users.id=$id
     */
    private $user_id;
    /**
     * @var Integer $status - статус покупки. Таблица order_status.id=$status
     */
    private $status;
    /**
     * @var DataTime $data_order - Дата и время создания
     */
    private $data_order;
    /**
     * Название таблицы БД
     *
     * @var $table - string
     */
    protected $table = "order";

    /**
     * Метод создания записи в таблице БД для таблицы - order
     *
     * @var Integer  $id - ID заказа. Таблица order_cart.id=$id
     * @var Integer  $user_id - ID пользователя. Таблица users.id=$id
     * @var Integer  $status - статус покупки. Таблица order_status.id=$status
     * @var DataTime $data_order - Дата и время создания
     */
    public function create($id, $user_id, $status)
    {
        try
        {
            $sql = "INSERT INTO `{$this->table}` VALUES (:id, :user_id, :status, :date_order)";
            $stmt = $this->_db->prepare($sql);
            $stmt->execute(array(
                ':id' => $id,
                ':user_id' => $user_id,
                ':status' => $status,
                ':date_order' => date("Y-m-d h:m:s")
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