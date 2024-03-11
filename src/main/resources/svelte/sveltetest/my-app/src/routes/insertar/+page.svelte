<script>
    let name = '';
    let errorName = false;
    let nameRegex = /[A-Za-z]+ [A-Za-z]+|[A-Za-z]+-[A-Za-z]+/;

    let salario = 0;
    let errorSalario = false;
    let salarioRegex = /[0-9]+/

    let errorRepetido = false;
    let successInsercion = false;

    function validarNombre() {
        errorName = !nameRegex.test(name);
    }

    function validarSalario() {
        errorSalario = !salarioRegex.test(salario);
    }

    async function sendData() {
        await fetch('http://localhost:8080/api/adddata', {
            method: 'POST',
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ name, salario })
        })
        .then(response => console.log(response.json().then(r => {
            if (r == 50010) {
                errorRepetido = !errorRepetido
            } else {
                setTimeout(() => {
                    successInsercion = !successInsercion
                }, "2000")
                window.location = "http://localhost:8080/"
            }
        })));
    }

</script>

<div class="main">

    <div class="formulario">
        <h1> Insertar Empleado </h1>
        <div class="nombre"> 
            <input type="text" bind:value={name} placeholder="Nombre del empleado" on:input={validarNombre}>
            <p class="error" hidden={!errorName}> Formato de nombre inválido. Debe ser Amadeus Mozart / Amadeus-Mozart </p>
        </div>
        <div class="salario">
            <input type="number" bind:value={salario} placeholder="Salario" on:input={validarSalario}>
            <p class="error" hidden={!errorSalario}> Formato de salario inválido. Debe ser, por ejemplo, 3000000 o 99999.</p>
        </div>

    </div>

    <div class="Boton">
        <p class="error" hidden={!errorRepetido}> Ya existe un empleado con ese nombre. </p>
        <p class="success" hidden={!successInsercion}> Insercion correcta. </p>
        <button disabled={errorName | errorSalario | salario == "" | name == ""} on:click={sendData}>
            Insertar Empleado
        </button>
    </div>

</div>

<style> 

    h1 {
        font-family: 'Franklin Gothic Medium';
    }

    .error {
        font-family: 'Franklin Gothic Medium';
        color: red;
    }

    .success {
        font-family: 'Franklin Gothic Medium';
        color: green;
    }

    input {
        font-family: 'Franklin Gothic Medium';
    }

</style>