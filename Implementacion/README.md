![](/img/_bannerD.png#gh-dark-mode-only)
![](/img/_bannerL.png#gh-light-mode-only)

# Documentación de la Aplicación PHP - Agenda de Contactos



## Objetivo de la Aplicación
Esta aplicación PHP es una agenda de contactos que forma parte de un proyecto mayor de simulación de un proceso de CI/CD desarrollado como parte del Proyecto Integrado de la Formación Profesional Superior en Administración de Sistemas Informáticos en Red (FP ASIR). El objetivo principal es permitir la gestión sencilla y eficiente de contactos personales mediante una interfaz web.

## Funcionamiento
La aplicación permite a los usuarios agregar, editar, eliminar y visualizar contactos almacenados en archivos JSON. Cada contacto puede incluir nombre, teléfono, email, contraseña y una imagen asociada. La aplicación soporta paginación para mostrar los contactos en grupos de cinco por página.

La interfaz web incluye:
- Listado de contactos con foto, nombre, teléfono y email.
- Formularios para agregar y editar contactos, con soporte para subir imágenes.
- Funcionalidad para eliminar contactos.
- Generación automática de contraseñas seguras mediante AJAX.
- Galería de imágenes de los contactos.
- Vista previa de imágenes al hacer clic en las fotos de los contactos.

La lógica del servidor está implementada en PHP, utilizando archivos JSON para el almacenamiento de datos y AJAX para las operaciones dinámicas.

### Explicación del código

Para un entendimiento más profundo del código implementado, acuda a la documentación del código.
- [Documentación del código](./Codigo.md)



## Mejoras Potenciales
- Migrar el almacenamiento de datos a una base de datos relacional para mejorar la escalabilidad y seguridad.
- Implementar autenticación y autorización para controlar el acceso a la aplicación.
- Añadir pruebas automatizadas para asegurar la calidad del código.
- Mejorar la interfaz de usuario con frameworks modernos de frontend.
- Integrar más funcionalidades relacionadas con la gestión de contactos o datos.


---

<br>

> Aunque la aplicación es totalmente funcional, no se encuentra terminada.  
> Esto es intencionado para la simulación del proceso de desarrollo y despliegue CI/CD que se pretende demostrar con este proyecto.

---

## Contexto del Proyecto
Esta aplicación es una parte fundamental del proyecto CI/CD desarrollado para el **Proyecto Integrado** de la formación profesional superior de Administración de Sistemas Informáticos en Red, cursado en el **I.E.S. La Marisma**.

**Autor:** David Faustino Benitez  
**Curso:** 2024/2025
