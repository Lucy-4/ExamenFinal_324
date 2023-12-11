<?php
	include 'conexion.php';
	
	$pdo = new Conexion();
	
	//Listar registros y consultar registro
	if($_SERVER['REQUEST_METHOD'] == 'GET')
	{
		if (isset($_GET["id"]))
		{
			$sqlp="SELECT * FROM docentes where id=:id";
			$sql = $pdo->prepare($sqlp);
			$sql->bindValue(':id', $_GET["id"]);
			$sql->execute();
			$sql->setFetchMode(PDO::FETCH_ASSOC);
			echo json_encode($sql->fetchAll());
			header("HTTP/1.1 200 hay datos");		
			exit;		
		}
		else
		{
			$sqlp="SELECT * FROM docentes";
			$sql = $pdo->prepare($sqlp);
			$sql->execute();
			$sql->setFetchMode(PDO::FETCH_ASSOC);
			echo json_encode($sql->fetchAll());
			header("HTTP/1.1 200 hay datos");
			exit;		
		}
			
	}
	
	//Insertar registro
	if($_SERVER['REQUEST_METHOD'] == 'POST')
	{
		$sqlp="insert into docentes values(:id,:nombre,:materia,:horario)";
		$sql = $pdo->prepare($sqlp);
		$sql->bindValue(':id', $_GET["id"]);
		$sql->bindValue(':nombre', $_GET["nombre"]);
		$sql->bindValue(':materia', $_GET["materia"]);
		$sql->bindValue(':horario', $_GET["horario"]);
		$sql->execute();
		echo json_encode('realizado');
		header("HTTP/1.1 200 ejecucion correcta");
		exit;
	}
	
	if ($_SERVER['REQUEST_METHOD'] == 'PUT') {
		$sqlp = "UPDATE docentes SET nombre=:nombre, materia=:materia, horario=:horario WHERE id=:id";
		$sql = $pdo->prepare($sqlp);
		$sql->bindValue(':id', $_GET["id"]);  // Aquí, nuevamente, $_PUT es un valor inventado. Puedes usar $_REQUEST o $_POST según sea necesario.
		$sql->bindValue(':nombre', $_GET["nombre"]);
		$sql->bindValue(':materia', $_GET["materia"]);
		$sql->bindValue(':horario', $_GET["horario"]);
		$sql->execute();
		echo json_encode('realizado');
		header("HTTP/1.1 200 ejecucion correcta");
		exit;
	}
	
	if($_SERVER['REQUEST_METHOD'] == 'DELETE')
	{
		
		 $sqlp = "DELETE FROM docentes WHERE id=:id";
		 $sql = $pdo->prepare($sqlp);
		 $sql->bindValue(':id', $_GET["id"]); 
		 $sql->execute();
		 echo json_encode('realizado');
		 header("HTTP/1.1 200 ejecucion correcta");
		 exit;
	}
	
	header("HTTP/1.1 400 Bad Request");
?>