window.addEventListener('load', function() {
    // Selecciona todos los elementos 'path' en el SVG
var municipios = document.querySelectorAll('path');

// Recorre cada municipio
municipios.forEach(function(municipio) {
    // Agrega un escuchador de eventos 'mouseover' a cada municipio
    municipio.addEventListener('mouseover', function() {
        // Obtiene el nombre del municipio del atributo 'title'
        var nombreMunicipio = municipio.getAttribute('title');
        
        // Crea un tooltip y lo muestra en la página
        var tooltip = document.createElement('div');
        tooltip.style.position = 'absolute';
        tooltip.style.left = event.pageX + 'px';
        tooltip.style.top = event.pageY + 'px';
        tooltip.style.background = '#fff';
        tooltip.style.border = '1px solid #000';
        tooltip.style.padding = '5px';
        tooltip.textContent = nombreMunicipio;
        
        document.body.appendChild(tooltip);
        
        // Agrega un escuchador de eventos 'mouseout' para eliminar el tooltip cuando el cursor se aleje
        municipio.addEventListener('mouseout', function() {
            document.body.removeChild(tooltip);
        });
    });
});

});