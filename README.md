# AUT_Karate_MyStoreApi

## General Information
This project is about the example of karate automation for the MyStoreApi endpoints.
***
## Requirements
- Java 1.8.0
- JDK 17
- Maven 3.9.3

## Project structure
Karate Api

- Feature : Test scenario using Gherkin language with cucumber
```
  src/test/java/Store/features/adminOrden.feature
  src/test/java/Store/features/adminPedidos.feature
  src/test/java/Store/features/adminProductos.feature
  src/test/java/Store/features/autenticador.feature
  src/test/java/Store/features/crearProductos.feature
```
- Runners : Classes used to run the test all scenarios 
```
src/test/java/Store/RunnerTest.java
```
- Runners : Classes used to run the test with Tags
```
src/test/java/Store/RunnerTestTag.java
```
## Run Test
The user wants authentication and created a placed 
- the test case, approximate 21 seconds run time 
```
mvn test
```
***
## SO
- Windows 10
- Windows 11
