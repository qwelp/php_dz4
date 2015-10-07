<?php
/**
 * Класс table - Определяет основные методы для работы с таблицами!
 */
 class table
{
     /**
      * @var object - Потключение к БД PDO
      */
     protected $_db;

    function __construct()
    {
        $this->_db = DB::getInstance();
    }

     /**
      * Метод вывода дампа результата
      *
      * @param $array
      */
    protected function dump($array)
    {
        ?><pre><?print_r($array)?></pre><?
    }
    /**
     * ​М​етод возвращающий все записи из таблицы
     */
    public function find()
    {
        try{
            $result = $this->_db->query("SELECT * FROM `{$this->table}`");
            $this->dump($result->fetchAll(PDO::FETCH_ASSOC));
        }
        catch (PDOException $e)
        {
            echo "Ошибка извлечения данных из таблицы {$this->table}: ".$e->getMessage();
        }
    }
    /**
     * ​М​етод принимающий 1 параметр (ID записи) и возвращающий данные по записи из БД
     *
     * @var Integer id - ID записи
     */
    public function findOne($id)
    {
        try{
            $sql = "SELECT * FROM `{$this->table}` WHERE `id` = :id";
            $stmt = $this->_db->prepare($sql);
            $stmt->bindParam(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            $this->dump($stmt->fetchAll(PDO::FETCH_ASSOC));
        }
        catch (PDOException $e)
        {
            echo "Ошибка извлечения данных из таблицы {$this->table}: ".$e->getMessage();
        }
    }
    /**
     * ​Метод принимающий 1 параметр (ассоциативный массив) ­ имя ключа массива должно соответвовать имени поля в
     * таблице, значение ­ значению этого поля. Метод возвращает список записей, согласно данному условию.
     *
     * @var array - ассоциативный массив
     */
    public function findBy($arrASSOC)
    {
        $name = key($arrASSOC);
        $value = $arrASSOC[$name];

        try{
            $stmt = $this->_db->prepare("SELECT * FROM `{$this->table}` WHERE `{$name}` = :{$name}");

            if($name == "id")
            {
                $stmt->bindParam(':id', $value, PDO::PARAM_INT);
                $stmt->execute();
            }
            else
            {
                $stmt->execute(array(":{$name}" => $value));
            }

            $this->dump($stmt->fetchAll(PDO::FETCH_ASSOC));
        }
        catch (PDOException $e)
        {
            echo "Ошибка извлечения данных из таблицы {$this->table}: ".$e->getMessage();
        }
    }

     /**
      * Метод обновление записи
      *
      * @var array $condition - ассоциативный массив, что обновлять
      * @var array $data - ассоциативный массив, в какой записи искать
      *
      */
    public function update($condition, $data)
    {
        $condition_name = key($condition);
        $condition_value = $condition[$condition_name];
        $condition = "`{$condition_name}` = :{$condition_name}";

        $data_name = key($data);
        $data_value = $data[$data_name];
        $data = "`{$data_name}` = :{$data_name}";

        try{
            $sql = "UPDATE `{$this->table}` SET {$data} WHERE {$condition}";

            $stmt = $this->_db->prepare($sql);
            $stmt->bindParam(":{$condition_name}", $condition_value);
            $stmt->bindParam(":{$data_name}", $data_value);
            $stmt->execute();

            echo "Запись обновлена";
        }
        catch (PDOException $e)
        {
            echo "Ошибка извлечения данных из таблицы {$this->table}: ".$e->getMessage();
        }
    }
     /**
      * Метод Удаление записи
      *
      * @var Integer $id
      */
    public function delete($id)
    {
        try
        {
            $stmt = $this->_db->prepare("DELETE FROM `{$this->table}` WHERE `id` = :id");
            $stmt->bindParam(':id', $id, PDO::PARAM_INT);
            $stmt->execute();

            echo "Запись удалена";
        }
        catch (PDOException $e)
        {
            echo "Ошибка удаления {$this->table}: ".$e->getMessage();
        }
    }
}