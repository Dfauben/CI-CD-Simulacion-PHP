![](/img/_bannerD.png#gh-dark-mode-only)
![](/img/_bannerL.png#gh-light-mode-only)

# Simulación de CI/CD con Aplicación PHP

## Índice
- [Introducción a CI/CD](#introducción-a-cicd)
- [Descripción del Proyecto](#descripción-del-proyecto)
- [Tecnologías Utilizadas](#tecnologías-utilizadas)
- [Entornos de Despliegue](#entornos-de-despliegue)
- [Información Adicional](#información-adicional)
- [Licencia](#licencia)
- [Contexto del Proyecto](#contexto-del-proyecto)

## Introducción a CI/CD
CI/CD significa Integración Continua y Despliegue Continuo. Es una práctica de desarrollo de software que permite a los equipos integrar cambios en el código de manera frecuente y automática, y desplegar esos cambios en producción de forma rápida y segura. Esto ayuda a mejorar la calidad del software y acelerar el proceso de entrega.

## Descripción del Proyecto
Simulación de un proceso de Integración Continua y Despliegue Continuo (CI/CD) utilizando una aplicación PHP ubicada en el directorio `Implementacion/Aplicacion/`. La simulación demuestra cómo se pueden aplicar herramientas y prácticas modernas de DevOps para automatizar las fases de construcción, prueba y despliegue de software.

La documentación propia de la aplicación se encuentra en el siguiente enlace:

- [Documentación Aplicación PHP - Agenda de Contactos](./Implementacion/README.md)

## Tecnologías Utilizadas
- **PHP**: La aplicación principal está desarrollada en PHP.
- **Kubernetes (Minikube)**: Utilizado para crear un clúster local de Kubernetes para la orquestación de contenedores y simulación de despliegue.
- **Ansible**: Empleado para la gestión de configuración y automatización de tareas de despliegue.
- **GitHub Actions**: Usado para automatizar los flujos de trabajo de CI/CD activados por cambios en el código.
- **AWS**: La implementación está diseñada para ser compatible tanto con entornos virtualizados locales como con infraestructuras en la nube de AWS.

## Entornos de Despliegue
- **Entorno Virtualizado**: El proyecto puede desplegarse y probarse localmente usando Minikube para simular un clúster de Kubernetes.
- **Nube AWS**: El proceso de despliegue está diseñado para ser adaptable a la infraestructura de AWS, permitiendo despliegues y escalabilidad en la nube.

## Información Adicional
- La aplicación PHP incluye operaciones básicas de CRUD y utiliza archivos JSON para el almacenamiento de datos.
- El proyecto busca proporcionar un ejemplo práctico de integración de múltiples herramientas DevOps en una pipeline de CI/CD.

## Licencia
Este proyecto es de código abierto y está disponible bajo la Licencia MIT.

## Contexto del Proyecto
El proyecto se realiza como trabajo de Proyecto Integrado de la Formación Profesional Superior de Administración de Sistemas Informáticos en Red (ASIR) para el IES La Marisma. 

**Autor:** David Faustino Benitez  
**Curso:** 2024/2025
