# ✈️ ServiciosSV — Internacionalización de Servicios
Aplicación iOS desarrollada en Xcode que presenta un listado de servicios con soporte multilingüe, permitiendo al usuario cambiar el idioma de la interfaz de forma dinámica.

## Descripción
**ServiciosSV** es una aplicación móvil para iOS que demuestra la implementación de **internacionalización (i18n)** en Swift. El usuario puede explorar un catálogo de servicios y seleccionar su idioma preferido mediante una bandera, actualizando el contenido de la interfaz en tiempo real sin necesidad de reiniciar la app.

---

## Idiomas soportados

| Idioma     | Código |
|-----------|--------|
| Español   | `es`   |
| English   | `en`   |
| Français  | `fr`   |
| 한국어     | `ko`   |

> El idioma por defecto es **Español**. Si el usuario no cambia el idioma, la app se muestra directamente en español.

---

## Tecnologías utilizadas

- **Lenguaje:** Swift
- **IDE:** Xcode 26.3
- **macOs:** 15.7.4
- **Dispositivos:** iOS 16 o superior.
- **Framework UI:** SwiftUI
- **Internacionalización:** `Localizable.strings` por idioma
- **Gestión de idioma:** Selección manual mediante componente de banderas

---

## Características principales

- **Listado de servicios** presentado de forma clara y ordenada.
- **Cambio de idioma dinámico** sin reiniciar la aplicación.
- **Vista de detalle** en modal para cada servicio seleccionado.
- **Selector de idioma por banderas** para una experiencia intuitiva.
- Arquitectura limpia y escalable siguiendo Clean Architecture + MVVM.
