# Documentación del código implementado

## Índice

- [Funciones Principales (funciones.php)](#funcionesphp)
  - [funciones.php](#funcionesphp)
  - [guardarContactos](#guardarcontactos)
  - [generarPassword](#generarpassword)
  - [subirImagen](#subirimagen)
- [Frontend y Visualización](#frontend-y-visualización-vistasindexphp)
  - [index.php](#indexphp)
  - [agregar_contacto_modal](#agregar_contacto_modal)
- [Estructura y Datos JSON](#estructura-y-datos-json-datacontactosjson)
  - [contactos.json](#contactosjson)
- [Estilos CSS y Popups](#estilos-css-y-popups-stylescss)
  - [styles.css](#stylescss)

---

## Funciones Principales (funciones.php)

### [funciones.php](/Implementacion/Aplicacion/funciones.php)

- **leerContactos($archivo):** Lee y decodifica el archivo JSON que contiene la lista de contactos. Devuelve un array asociativo con los contactos o un array vacío si hay error o el archivo no existe.

```php
...
function leerContactos($archivo) {
    if (!file_exists($archivo)) {
        return [];
    }
    $datos = file_get_contents($archivo);
    $contactos = json_decode($datos, true);
    if (json_last_error() !== JSON_ERROR_NONE) {
        error_log('Error al decodificar JSON: ' . json_last_error_msg());
        return [];
    }
    return $contactos ?? [];
}
...
```

### [guardarContactos](/Implementacion/Aplicacion/funciones.php)

- **guardarContactos($archivo, $contactos):** Codifica y guarda la lista de contactos en formato JSON en el archivo especificado.

```php
...
function guardarContactos($archivo, $contactos) {
    $json = json_encode($contactos, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
    if ($json === false) {
        error_log('Error al codificar JSON: ' . json_last_error_msg());
        return false;
    }
    $result = file_put_contents($archivo, $json);
    return $result !== false;
}
...
```

### [generarPassword](/Implementacion/Aplicacion/funciones.php)

- **generarPassword($longitud):** Genera una contraseña aleatoria segura con letras, números y símbolos.

```php
...
function generarPassword($longitud = 12) {
    $caracteres = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_=+[]{}<>?';
    $password = '';
    $maxIndex = strlen($caracteres) - 1;
    for ($i = 0; $i < $longitud; $i++) {
        $password .= $caracteres[random_int(0, $maxIndex)];
    }
    return $password;
}
...
```

### [subirImagen](/Implementacion/Aplicacion/funciones.php)

- **subirImagen($archivo, $directorio):** Sube una imagen al servidor, validando tipo y generando un nombre único.

```php
...
function subirImagen($archivo, $directorio) {
    if ($archivo['error'] !== UPLOAD_ERR_OK) {
        error_log('Error en la subida del archivo: ' . $archivo['error']);
        return null;
    }
    $tipoPermitido = ['image/jpeg', 'image/png', 'image/gif'];
    if (!in_array($archivo['type'], $tipoPermitido)) {
        error_log('Tipo de archivo no permitido: ' . $archivo['type']);
        return null;
    }
    $nombreArchivo = uniqid('', true) . "_" . basename($archivo["name"]);
    $rutaDestino = rtrim($directorio, '/') . "/" . $nombreArchivo;
    if (move_uploaded_file($archivo["tmp_name"], $rutaDestino)) {
        return $nombreArchivo;
    }
    error_log('Error al mover el archivo subido.');
    return null;
}
...
```

---

## Frontend y Visualización (vistas/index.php)

### [index.php](/Implementacion/Aplicacion/vistas/index.php)

- Muestra una lista paginada de contactos con foto, nombre, teléfono y email.

```php
...
<?php foreach ($contactsToShow as $contacto): ?>
    <div class="contact-card" data-id="<?= $contacto['id'] ?>">
        <div class="contact-photo">
            <?php if (!empty($contacto['imagen'])): ?>
                <img src="../uploads/<?= htmlspecialchars($contacto['imagen']) ?>" alt="Foto de <?= htmlspecialchars($contacto['nombre']) ?>" />
            <?php else: ?>
                <img src="assets/default-avatar.png" alt="Sin imagen" />
            <?php endif; ?>
        </div>
        <div class="contact-info">
            <h3><?= htmlspecialchars($contacto['nombre']) ?></h3>
            <p><strong>Teléfono:</strong> <?= htmlspecialchars($contacto['telefono']) ?></p>
            <p><strong>Email:</strong> <?= htmlspecialchars($contacto['email']) ?></p>
        </div>
        <div class="contact-actions">
            <button class="button button-edit editar-contacto-btn" data-id="<?= $contacto['id'] ?>">Editar</button>
            <button class="button button-delete eliminar-contacto-btn" data-id="<?= $contacto['id'] ?>">Eliminar</button>
        </div>
    </div>
<?php endforeach; ?>
...
```

### [agregar_contacto_modal](/Implementacion/Aplicacion/vistas/index.php)

- Incluye varios popups modales para agregar, editar, eliminar contactos y galería de imágenes.

```html
...
<div id="popup-agregar" class="modal">
    <div class="modal-content">
        <h2>Agregar Contacto</h2>
        <form id="formulario-agregar">
            <div class="form-group">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" />
            </div>
            <div class="form-group">
                <label for="telefono">Teléfono:</label>
                <input type="tel" id="telefono" name="telefono" />
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" />
            </div>
            <div class="form-group">
                <label for="password">Contraseña:</label>
                <input type="text" id="password" name="password" />
            </div>
            <div class="form-group">
                <button type="button" id="autogenerar-password-btn-agreg">Autogenerar Contraseña</button>
            </div>
            <div class="form-group">
                <label for="imagen">Imagen:</label>
                <input type="file" id="imagen" name="imagen" />
                <img id="preview-imagen" src="" alt="Preview de la imagen" />
            </div>
            <div class="form-group">
                <button id="agregar-contacto-btn">Agregar</button>
            </div>
            <div class="form-group">
                <button class="cerrar">Cerrar</button>
            </div>
        </form>
    </div>
</div>
...
```

---

## Estructura y Datos JSON (data/contactos.json)

### [contactos.json](/Implementacion/Aplicacion/data/contactos.json)

- Archivo JSON que contiene un array de objetos contacto.

```json
[
    {
        "id": "1",
        "nombre": "Luis López",
        "telefono": "+34 555 885 544",
        "email": "LuisLpz88@yahoo.com",
        "imagen": null,
        "password": "1234"
    },
]
```

---

## Estilos CSS y Popups (styles.css)

### [styles.css](/Implementacion/Aplicacion/styles.css)

- Estilos para tarjetas de contacto, botones, modales y formularios.

```css
...
.contact-card {
    background-color: white;
    border-radius: 16px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    padding: 1.5rem 2rem;
    display: flex;
    align-items: center;
    gap: 2rem;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    width: 100%;
}
...
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.5);
    z-index: 1000;
    overflow-y: auto;
    padding: 3rem 2rem;
}
...
