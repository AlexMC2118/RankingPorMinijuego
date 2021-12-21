<?php
  /**
   * Esta clase se usara para emplear los metodos necesarios en un crud: buscamos, eleminamos, modificamos, añadimos y vemos una lista
   */
  class Operaciones
  {
    public $conexion;
    public $resultado;

    function __construct()
    {
      require 'config.php'; //llamamos a los parametros para la conexion
      $this->conexion = new mysqli(SERVIDOR, USUARIO, CONTRASENIA, BASEDATOS);
    }

    public function hacerConsulta($consulta) //metodo usado por si se modifica el objeto que trabaja con bases de datos
    {
      return $this->conexion->query($consulta);
    }
    public function contar($idminijuego){
      $consulta = "SELECT * FROM partida WHERE idMinijuego =".$idminijuego;
      $this->resultado = $this->hacerConsulta($consulta);
      return $this->resultado->num_rows;
    }
    public function listar($idminijuego){
      $consulta = "SELECT * FROM partida WHERE idMinijuego = ".$idminijuego." ORDER BY puntuacion DESC";
      $this->resultado = $this->hacerConsulta($consulta);
      return $this->resultado;
    }

    public function informacionError() //La llamamos para ver una descripcion del error de la consulta
    {
      return $this->conexion->error;
    }

    public function numeroError() //La llamamos para ver el numero de error correspondiente por la consulta
    {
      return $this->conexion->errno;
    }

    public function filasResultado() //La llamamos para ver el numero de filas del resultado
    {
      return $this->resultado->num_rows;
    }

    public function cerrar() //La llamamos para cerrar la conexion con la  base de datos
    {
      $this->conexion->close();
    }
  }

?>
