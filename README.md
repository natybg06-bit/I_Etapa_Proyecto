# Procesador Uniciclo

**Instituto Tecnológico de Costa Rica**

**Curso:** EL-3310 — Diseño de Sistemas Digitales

**Proyecto Final:** Capítulo 1 — Los cimientos

**Grupo:** QBits 506 (Grupo 03)


## 1. Descripción

Este proyecto corresponde a la primera etapa del diseño e implementación de un procesador RISC-V uniciclo desarrollado en SystemVerilog. El objetivo de esta etapa es implementar y verificar de manera independiente los componentes fundamentales que posteriormente formarán parte del datapath del procesador.

Se desarrollaron cuatro módulos principales:

- **ALU:** realiza operaciones aritméticas y lógicas de 32 bits.
- **Register File:** almacena datos mediante 32 registros de 32 bits con dos puertos de lectura y uno de escritura.
- **Immediate Generator:** extrae y extiende a 32 bits los inmediatos de instrucciones I y S.
- **MUX 2:1:** selecciona entre dos entradas de datos mediante una señal de control.


## 2. Estructura del proyecto (.zip)

```text
PROCESADOR_UNICICLO/
├── src/
│   ├── alu.sv
│   ├── register_file.sv
│   ├── imm_gen.sv
│   └── mux.sv
│
├── testbench/
│   ├── alu_tb.sv
│   ├── register_file_tb.sv
│   ├── imm_gen_tb.sv
│   └── mux_tb.sv
│
├── docs/
│   ├── Grupo03informe.pdf
│   ├── matriz_pruebas.xlsx
│   │
│   └── evidencias/
│       ├── alu.png
│       ├── register_file.png
│       ├── imm_gen.png
│       └── mux.png
│
└── README.md
```


## 3. Componentes implementados

| Módulo | Archivo | Funcionalidad |
|---|---|---|
| ALU | `ALU.sv` | ADD, SUB, AND, OR y bandera Zero |
| Register File | `FILEREGISTER.sv` | Lectura y escritura de registros |
| Immediate Generator | `IMMEDIATEGENERATOR.sv` | Inmediatos con extensión de signo |
| MUX 2:1 | `MUX.sv` | Selección de entradas con ancho parametrizable |


## 4. Verificación funcional

Cada módulo tiene un testbench independiente que verifica su funcionamiento.Las simulaciones se realizaron en EDA Playground, utilizando comparaciones automáticas que identifican cada caso mediante mensajes `PASS` o `FAIL`.

### Resultados

Se elaboró una matriz de verificación funcional que documenta los 25 casos de prueba ejecutados sobre los cuatro componentes del procesador. La matriz incluye el identificador de cada prueba, el módulo evaluado, las condiciones de entrada, los resultados esperados, los resultados obtenidos y el estado de verificación (PASS/FAIL).

| Componente | Pruebas ejecutadas | PASS | FAIL |
|---|---:|---:|---:|
| ALU | 7 | 7 | 0 |
| Register File | 4 | 4 | 0 |
| Immediate Generator | 10 | 10 | 0 |
| MUX | 4 | 4 | 0 |
| **Total** | **25** | **25** | **0** |

Los 25 casos de prueba obtuvieron resultados satisfactorios, verificando el funcionamiento de los cuatro componentes en las condiciones evaluadas.


## 5. Simulaciones en EDA Playground

Los siguientes enlaces permiten acceder a las simulaciones independientes de cada componente.

| Componente | Enlace |
|---|---|
| ALU | [Simulación ALU](https://www.edaplayground.com/x/vBhu) |
| Register File | [Simulación Register File](https://www.edaplayground.com/x/9rQt) |
| Immediate Generator | [Simulación Immediate Generator](https://www.edaplayground.com/x/rb4z) |
| MUX | [Simulación MUX](https://www.edaplayground.com/x/kHEk) |


## 6. Evidencias de simulación

A continuación, se presentan las evidencias obtenidas durante la verificación funcional de los cuatro módulos implementados en SystemVerilog. Las capturas corresponden a las simulaciones realizadas en EDA Playground y muestran los resultados de los casos de prueba ejecutados.

### 6.1 Unidad aritmético-lógica (ALU)

Se verificaron siete casos de prueba correspondientes a las operaciones aritméticas y lógicas, el comportamiento de la bandera `Zero` y un código de control no implementado. Todas las pruebas obtuvieron resultados satisfactorios.

<img width="921" height="460" alt="image" src="https://github.com/user-attachments/assets/6dc9408f-6495-41c3-baf4-8fc680c682e8" />


### 6.2 Banco de registros (Register File)

Se verificaron cuatro casos de prueba relacionados con la lectura, escritura, acceso simultáneo a registros, protección de `x0` y control de escritura. Todas las pruebas obtuvieron resultados satisfactorios.

<img width="921" height="323" alt="image" src="https://github.com/user-attachments/assets/d946f3f9-fb4d-4b38-ad0f-a2ddbd955710" />


### 6.3 Generador de inmediatos (Immediate Generator)

Se verificaron diez casos de prueba para los formatos tipo I y S, incluyendo valores positivos, negativos, cero y límites de representación. Todas las pruebas obtuvieron resultados satisfactorios.

<img width="769" height="535" alt="image" src="https://github.com/user-attachments/assets/ce8caa5e-5dc5-4ed0-8cfb-c52a0f2f6e57" />


### 6.4 Multiplexor 2:1 (MUX)

Se verificaron cuatro casos de prueba para comprobar la selección de las entradas `A` y `B` mediante la señal `Select`. Todas las pruebas obtuvieron resultados satisfactorios.

<img width="921" height="347" alt="image" src="https://github.com/user-attachments/assets/bc20f9ea-4b90-4c6b-a6e4-a815700c5741" />
<img width="921" height="165" alt="image" src="https://github.com/user-attachments/assets/6092b183-7c00-411b-bf6f-65f313ad260c" />


## 7. Integrantes y responsabilidades

| Integrante | Rol |
|---|---|
| Krisdel Guido Porras | Hardware Developer |
| Andrés Obregón López | Hardware Developer |
| Alberto Arce Estrada | Verification Engineer |
| Nathalie Brown Gamboa | Documentation & Configuration Engineer |
| María Fernanda Morales Calderón | Team Lead |


## 8. Documentación técnica

El informe técnico se encuentra en la carpeta `docs/` e incluye:

- Introducción y alcance del proyecto.
- Diseño de los cuatro componentes y diagramas de bloques.
- Metodología de verificación.
- Resultados y matriz de pruebas.
- Problemas encontrados y soluciones.
- Conclusiones.
