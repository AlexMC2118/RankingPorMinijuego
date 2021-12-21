<?php
    /**
     * Clase destinada a visualizar nuestra aplicacion
     */
    class Vista
    {
        /**
         * Visualiza los minijuegos
         */
        public function listar($resultado)
        {
          echo '
            <div><h2>'.$resultado['nick'].'</h2></div>
            <div><h2>'.$resultado['puntuacion'].'</h2></div>
          ';
        }
        public function errorListar()
        {
          echo '
            <div style="grid-column: 1 / 3;"><h2>No hay partidas registradas para este minijuego</h2></div>
          ';
        }
    }
?>
