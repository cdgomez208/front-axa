<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crear Cliente</title>
</head>
<body>
    <h1>Crear Nuevo Cliente</h1>
    <form id="crearClienteForm" action="crearCliente" method="post">
        name:   <input type="text" name="name"><br>
        age:      <input type="text" name="age"><br>
     phoneNumber: <input type="text" name="phoneNumber"><br>
        address:  <input type="text" name="address"><br>
        <input type="submit" value="Crear Cliente">
    </form>

    <div id="mensaje"></div>

    <script>
        document.getElementById("crearClienteForm").onsubmit = function(event) {
            event.preventDefault(); // Evitar envío del formulario por defecto

            var name = document.getElementsByName("name")[0].value;
            var age = document.getElementsByName("age")[0].value;
            var phoneNumber = document.getElementsByName("phoneNumber")[0].value;
            var address = document.getElementsByName("address")[0].value;

            var data = {
            	name: name,
            	age: age,
            	phoneNumber: phoneNumber,
            	address: address,
                
            };

            fetch('http://localhost:8080/create', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
            })
            .then(response => response.text())
            .then(data => {
                document.getElementById("mensaje").innerText = data;
            })
            .catch(error => {
                console.error('Error:', error);
            });
        };
    </script>
</body>
</html>