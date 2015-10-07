<?php
class DB
{
    protected static $_db = null;

    public static function getInstance()
    {
        if(self::$_db === null){
            self::$_db = new PDO('mysql:dbname=loftblog_dz2;host=localhost', 'root', '');
        }

        return self::$_db;
    }

    private function __construct(){}
    private function __clone(){}
}
?>