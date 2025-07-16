# 🚀 InterApp - Aplicación Móvil en SwiftUI
InterApp es una aplicación móvil desarrollada en SwiftUI que implementa una arquitectura limpia siguiendo el patrón MVVM. La aplicación se conecta a servicios REST, gestiona autenticación de usuarios y almacena datos localmente.
## Características Principales
### 🔐 Autenticación:
* Validación de credenciales de usuario contra un servidor remoto.
* Almacenamiento seguro de datos de sesión.
### 🔄 Sincronización de Datos:
* Descarga y almacenamiento de esquemas de tablas para una gestión dinámica de la base de datos.
* Almacenamiento local persistente utilizando Realm.
* Lógica para la actualización de datos bajo demanda.
### 📱 Interfaz de Usuario Moderna:
* Diseño declarativo y reactivo construido enteramente con SwiftUI.
* Navegación fluida y centralizada utilizando un patrón Router programático.
* Gestión de estados de carga y manejo de errores en la UI.
## 🏗️ Arquitectura
La aplicación sigue una arquitectura limpia, desacoplada y escalable, inspirada en principios de MVVM.
### Patrón MVVM (Model-View-ViewModel)
  * Model: Representa la lógica de negocio, las entidades y las reglas de dominio.
  * View: Capa de presentación declarativa construida con SwiftUI. Es responsable de mostrar los datos y capturar las interacciones del usuario.
  * ViewModel: Actúa como intermediario entre la Vista y el Modelo. Procesa las entradas del usuario y expone estados y datos listos para ser consumidos por la Vista.
### Capas Principales
  * Capa de Presentación: Contiene las Vistas (SwiftUI) y los ViewModels.
  * Capa de Dominio: Define los casos de uso y las entidades de negocio. Es el núcleo de la lógica de la aplicación.
  * Capa de Datos: Se encarga de la obtención y persistencia de los datos a través de Repositorios, que abstraen las fuentes de datos (API remota o base de datos local).
## 🛠️ Tecnologías Utilizadas
* UI y Gestión de Estado: SwiftUI, @Published, @StateObject, @EnvironmentObject.
* Almacenamiento Local: Realm para la base de datos y UserDefaults para datos simples.
* Red: URLSession para la comunicación con servicios REST.
* Navegación: NavigationStack con un patrón Router programático.
* Inyección de Dependencias: Uso de inicializadores y @EnvironmentObject para desacoplar componentes.
