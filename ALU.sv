// ============================================================
// Proyecto: Procesador RISC-V Uniciclo
// Curso: Diseño de Sistemas Digitales
// Grupo: QBITS
//
// Módulo: ALU
//
// Descripción:
// Implementa las operaciones aritméticas y lógicas requeridas
// por el procesador RISC-V.
//
// Autor / Developer:
// Nombre: Krisdel Guido Porras
// Fecha de primera versión: 10/10/2026
//
// Historial de modificaciones:
// ------------------------------------------------------------
// Fecha       | Autor                 | Descripción
// ------------------------------------------------------------
// 10/10/2026  | Krisdel Guido Porras  | Primera versión
// ____/____/  | _________________     | ________________________
// ____/____/  | _________________     | ________________________
//
// ============================================================

// ============================================================
// ENTRADAS
// ------------------------------------------------------------
// A            : Operando de 32 bits.
// B            : Operando de 32 bits.
// ALUControl   : Código que determina la operación.
//
// SALIDAS
// ------------------------------------------------------------
// Result       : Resultado de la operación.
// Zero         : 1 cuando Result es igual a cero.
// ============================================================

module alu (
    input  logic [31:0] A, // SrcA
    input  logic [31:0] B, // SrcB
    input  logic [3:0]  ALUControl, // Código de control de la ALU
    output logic [31:0] Result,
    output logic        Zero  
);

    // ========================================================
    // IMPLEMENTACIÓN DEL MÓDULO
    // ========================================================
    always_comb begin // Bloque combinacional para la ALU
            case (ALUControl)
                4'b0000: Result = A + B; // operación ADD
                4'b0001: Result = A - B; // operación SUB
                4'b0010: Result = A & B; // operación AND
                4'b0011: Result = A | B; // operación OR
                default: Result = 32'b0; // Zero por defecto para operaciones no agregadas
            endcase
        end
        assign Zero = (Result == 32'b0); // Si el resultado es cero, Zero se activa 1
endmodule
