// ============================================================
// Proyecto: Procesador RISC-V Uniciclo 32bits
// Curso: Diseño de Sistemas Digitales
// Grupo: QBITS
//
// Módulo: File Register
//
// Descripción:
// Guarda temporalmente los datos requeridos por la CPU
// con arquitectura RISC-V Uniciclo durante el tiempo de ejecución 
// del un programa. Su arquitectura contempla 32 registros con un 
// tamaño de 32bits cada uno.Permite leer dos registros simultáneamente 
// y escribir un registro cuando la señal RegWrite está habilitada.
//
// Autor / Developer:
// Nombre: Andrés Obregón López
// Fecha de primera versión: 14/10/2026
//
// Historial de modificaciones:
// ------------------------------------------------------------
// Fecha       | Autor                 | Descripción
// ------------------------------------------------------------
// 14/10/2026  | Andrés Obregón López  | Primera versión
// ____/____/  | _________________     | ________________________
// ____/____/  | _________________     | ________________________
//
// ===============================================================
//
// ===============================================================
// Estructura / Funcionamiento
// ---------------------------------------------------------------
// Señales - Signals
// ---------------------------------------------------------------
// | Signal |  Type  |  Size Bits   |    Description    		 |
// ---------------------------------------------------------------
// |  clk   | Input  |     1		|   Clock Signal 	         |
// |  WE3   | Input  |     1		|   Write Enable RegWrite	 |
// |  A1    | Input  |     5		|   Read Addres rs1 		 |
// |  A2    | Input  |     5		|   Read Addres rs2 		 |
// |  A3    | Input  |     5		|   Write Addres rd 		 |
// |  WD3   | Input  |    32		|   Store Data    		     |
// |  RD1   | Output |    32		|   Data from rs1   		 |
// |  RD2   | Output |    32		|   Data from rs2   		 |
// ---------------------------------------------------------------
// ===============================================================

// ===============================================================
// ENTRADAS
// ---------------------------------------------------------------
// clk          : Señal de reloj.
// A1           : Dirección del primer registro a leer.
// A2           : Dirección del segundo registro a leer.
// A3           : Dirección del registro a escribir.
// WD3          : Dato de 32 bits que será escrito.
// RegWrite     : Habilita la escritura en el banco de registros.
//
// SALIDAS
// ---------------------------------------------------------------
// RD1          : Dato leído del registro seleccionado por A1.
// RD2          : Dato leído del registro seleccionado por A2.
//
// CONDICIÓN ESPECIAL
// ---------------------------------------------------------------
// El registro x0 debe conservar siempre el valor 0.
// ===============================================================

module register_file (
    input  logic        clk,
    input  logic [4:0]  A1, // rs1
    input  logic [4:0]  A2, // rs2
    input  logic [4:0]  A3, // rd
    input  logic [31:0] WD3, // Dato a escribir en el registro seleccionado por A3
    input  logic        RegWrite, //WE3 Activa la escritura en el banco de registros
    output logic [31:0] RD1, // Dato leído del registro seleccionado por A1
    output logic [31:0] RD2  // Dato leído del registro seleccionado por A2
);

    // ========================================================
    // IMPLEMENTACIÓN DEL MÓDULO
    // ========================================================

    // TODO: Declarar el banco de registros. 32 Registros de 32 bits cada uno
  
  		logic [31:0] registers [0:31];

    // TODO: Implementar la lógica de escritura - Flanco positivo subida
  		
  		always_ff @(posedge clk) begin
          if (RegWrite && (A3 != 5'd0)) //Si RegWrite está activo y A3 no es x0 (registro 0)
          begin 
            registers[A3] <= WD3; //Escribe el dato WD3 en el registro A3
          end
        end

    // TODO: Implementar los puertos de lectura. - (Output) Siempre activo y combinacional
        
        always_comb begin
            RD1 = (A1 == 5'd0) ? 32'd0 : registers[A1]; //Si A1 es x0, RD1 es 0, de lo contrario, lee el registro A1
            RD2 = (A2 == 5'd0) ? 32'd0 : registers[A2]; //Si A2 es x0, RD2 es 0, de lo contrario, lee el registro A2
        end

    // TODO: Garantizar que x0 permanezca siempre en cero. - Ya que no puede ser direccionado para escritura y siempre devuelve 0 al ser leído, 
    // no se puede modificar su valor.

endmodule

