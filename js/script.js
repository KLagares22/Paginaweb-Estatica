document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('formulario-contacto');

    form.addEventListener('submit', function(event) {
        event.preventDefault();

        if (validateForm()) {
            alert('Formulario enviado con éxito!');
            form.reset();
        }
    });

    function validateForm() {
        const nombre = document.getElementById('nombre').value.trim();
        const email = document.getElementById('email').value.trim();
        const motivo = document.getElementById('motivo').value;
        const mensaje = document.getElementById('mensaje').value.trim();

        if (nombre === '') {
            alert('Por favor, ingrese su nombre.');
            return false;
        }

        if (email === '' || !isValidEmail(email)) {
            alert('Por favor, ingrese un correo electrónico válido.');
            return false;
        }

        if (motivo === '') {
            alert('Por favor, seleccione un motivo de contacto.');
            return false;
        }

        if (mensaje === '') {
            alert('Por favor, ingrese un mensaje.');
            return false;
        }

        return true;
    }

    function isValidEmail(email) {
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(email);
    }
});

