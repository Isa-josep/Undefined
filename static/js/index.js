// Selecciona todos los elementos 'path' dentro del SVG
const paths = document.querySelectorAll('path');

// Crea el tooltip una vez
const tooltip = document.createElement('div');
tooltip.id = 'tooltip';
tooltip.style.position = 'absolute';
document.body.appendChild(tooltip);

// Agrega eventos a cada 'path'
paths.forEach(path => {
    path.addEventListener('mouseover', handleMouseOver);
    path.addEventListener('mouseout', handleMouseOut);
});

function handleMouseOver({ pageX, pageY }) {
    // Obtiene el 'id' y el 'title' del 'path'
    const titleElement = this.querySelector('title') || this.parentNode.querySelector('title');
    const titleText = titleElement ? titleElement.textContent : 'No title';

    // Actualiza el contenido y la posición del tooltip
    tooltip.textContent = `ID: ${this.id}, Title: ${titleText}`;
    tooltip.style.left = `${pageX}px`;
    tooltip.style.top = `${pageY}px`;

    // Muestra el tooltip
    tooltip.style.display = 'block';
}

function handleMouseOut() {
    // Oculta el tooltip
    tooltip.style.display = 'none';
}
