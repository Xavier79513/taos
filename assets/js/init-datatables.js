//Tablas Vecino
$('#table-misincidencias').DataTable({
    lengthMenu: [7, 10, 15, 20],
    language: {
        url: `//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json`
    },
    order: [[2, 'asc']],
    columnDefs: [
        {orderable: false, targets: [0, -1]}
    ]
});

$('#table-incidenciasGenerales').DataTable({
    lengthMenu: [7, 10, 15, 20],
    language: {
        url: `//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json`
    },
    order: [[3, 'asc']],
    columnDefs: [
        {orderable: false, targets: [0,-1]}
    ]
});

//Tablas Serenazgo
$('#serenazgo-table-incidencias').DataTable({
    responsive:true,
    lengthChange:false,
    pageLength: 10,
    info:false,
    language: {
        url: `//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json`
    },
    order: [[3, 'asc']],
    columnDefs: [
        {orderable: false, targets: [0,1, -1]}
    ]
});
$('#serenazgo-table-incidenciasfalsas').DataTable({
    responsive:true,
    lengthChange:false,
    pageLength: 10,
    info:false,
    language: {
        url: `//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json`
    },
    order: [[2, 'asc']],
    columnDefs: [
        {orderable: false, targets: [0,1, -1]}
    ]
});
//Administrador
$('#table-personalSerenazgo').DataTable({
    responsive:true,
    lengthChange:false,
    pageLength: 7,
    info:false,
    language: {
        url: `//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json`
    },
    order: [[2, 'asc']],
    columnDefs: [
        {orderable: false, targets: [0, -1]}
    ]
});
$('#table-solicitudRegistro').DataTable({
    responsive:true,
    lengthChange:false,
    pageLength: 5,
    info:false,
    language: {
        url: `//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json`
    },
    order: [[2, 'asc']],
    columnDefs: [
        {orderable: false, targets: [0,1, -1]}
    ]
});
$('#table-usuariosHabilitados').DataTable({
    responsive:true,
    lengthChange:false,
    pageLength: 7,
    info:false,
    language: {
        url: `//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json`
    },
    order: [[1, 'asc']],
    columnDefs: [
        {orderable: false, targets: [0,2, -1]}
    ]
});
$('#table-usuariosBaneados').DataTable({
    responsive:true,
    lengthChange:false,
    pageLength: 7,
    info:false,
    language: {
        url: `//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json`
    },
    order: [[2, 'asc']],
    columnDefs: [
        {orderable: false, targets: [0, -1]}
    ]
});
$('#select-all').click(function () {
    // Obtiene el estado actual del checkbox "select-all" (seleccionado o no seleccionado)
    var isChecked = $(this).prop('checked');
    // Cambia el estado de todos los otros checkboxes en las tablas
    $('#table-incidenciasGenerales tbody input[type="checkbox"], ' +
        '#table-misincidencias tbody input[type="checkbox"], ' +
        '#serenazgo-table-incidenciasfalsas tbody input[type="checkbox"],' +
        '#serenazgo-table-incidencias tbody input[type="checkbox"], ' +
        '#table-personalSerenazgo tbody input[type="checkbox"],'+
        '#table-solicitudRegistro tbody input[type="checkbox"],'+
        '#table-usuariosHabilitados tbody input[type="checkbox"],'+
        '#table-usuariosBaneados tbody input[type="checkbox"]').prop('checked', isChecked);
});