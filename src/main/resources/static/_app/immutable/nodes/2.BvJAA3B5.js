import{s as i,n as s}from"../chunks/scheduler.BvLojk_z.js";import{S as l,i as o,e as d,c,m as h,n as m,j as u,g as v}from"../chunks/index.EgFuG6B2.js";function f(e){let t,n='<div class="lista"><h1 class="svelte-1bd286r">Gestor de empleados</h1> <div id="tabla" class="divTabla svelte-1bd286r"></div></div> <a href="/insertar"><button class="insertarButton svelte-1bd286r">Insertar empleado</button></a>';return{c(){t=d("div"),t.innerHTML=n,this.h()},l(a){t=c(a,"DIV",{class:!0,"data-svelte-h":!0}),h(t)!=="svelte-1ywtygh"&&(t.innerHTML=n),this.h()},h(){m(t,"class","main")},m(a,r){u(a,t,r)},p:s,i:s,o:s,d(a){a&&v(t)}}}async function p(){await fetch("http://localhost:8080/api/data").then(e=>e.json()).then(e=>{document.getElementById("tabla").innerHTML=`
            <table style="100%">
            <tr>
                <th>Nombre</th>
                <th>Salario</th>
            </tr>
            ${e.map(t=>`
            <tr>
                <td>${t.name}</td>
                <td>${t.salary}</td>
            </tr>`).join("")}
            </table>`})}function b(e){return p(),[]}class g extends l{constructor(t){super(),o(this,t,b,f,i,{})}}export{g as component};
