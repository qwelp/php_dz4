<?php
/**
 * Класс управления таблицой users
 */
class users extends table implements interface_users
{
    /**
     * @var Integer $id - auto_increment
     */
    private $id;
    /**
     * @var String  $name - Имя
     */
    private $name;
    /**
     * @var String $lastname Фамилия
     */
    private $lastname;
    /**
     * @var Data $birthday - Дата рождения
     */
    private $birthday;
    /**
     * @var String  $email
     */
    private $email;
    /**
     * @var String $password - Пароль
     */
    private $password;
    /**
     * @var $is_active - Активность
     */
    private $is_active;
    /**
     * Название таблицы БД
     *
     * @var $table - string
     */
    protected $table = "users";
    /**
     * Метод создания записи в таблице БД для таблицы - users
     *
     * @var String  $name - Имя
     * @var String  $lastname - Фамилия
     * @var Data    $birthday - Дата рождения
     * @var String  $email
     * @var String  $password - Пароль
     * @var Blob    $is_active - Активность
     */
    public function create($name, $lastname, $birthday, $email, $password, $is_active)
    {
        try
        {
            $sql = "INSERT INTO `{$this->table}` VALUES (NULL, :name, :lastname, :birthday, :email, :password, :is_active, :reg_data, :last_update)";
            $stmt = $this->_db->prepare($sql);
            $stmt->execute(array(
                ':name' => $name,
                ':lastname' => $lastname,
                ':birthday' => $birthday,
                ':email' => $email,
                ':password' => $password,
                ':is_active' => $is_active,
                ':reg_data' => date("Y-m-d h:m:s"),
                ':last_update' => date("Y-m-d h:m:s")
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