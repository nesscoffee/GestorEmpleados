<script>
    async function loadData() {
        await fetch('http://localhost:8080/api/data')
        .then(response => response.json())
        .then(data => {
            document.getElementById("tabla").innerHTML = `
            <table style="100%">
            <tr>
                <th>Nombre</th>
                <th>Salario</th>
            </tr>
            ${data.map(empleado => `
            <tr>
                <td>${empleado.name}</td>
                <td>${empleado.salary}</td>
            </tr>`).join('')}
            </table>`
        });
    }

    $: loadData();
</script>

<div class="main">
    <div class="lista">
        <h1> Gestor de empleados </h1>
        <div id="tabla" class="divTabla"> </div>
    </div>
    <a href="/insertar">
        <button class="insertarButton">Insertar empleado</button>
    </a>
</div>

<style>
    :global(body) {
        background-color: #D9D9D9;
    }

    h1 {
        font-family: 'Franklin Gothic Medium';
    }

    .divTabla {
        font-family: 'Franklin Gothic Medium';
        border: 1px solid black;
        border-collapse: collapse;
    }
    
    .insertarButton {
        font-family: 'Franklin Gothic Medium';
    }

</style>
