// ============================================================
// Proyecto: Procesador RISC-V Uniciclo
// Curso: Diseño de Sistemas Digitales
// Grupo: QBITS506
//
// Testbench: Multiplexor 2 a 1
//
// Autor: María Fernanda Morales Calderón
// Rol: Líder del equipo
// Verificador: Pendiente de revisión
// Fecha de primera versión: 15/10/2026
//
// Historial de modificaciones:
// ------------------------------------------------------------
// Fecha       | Versión | Descripción
// ------------------------------------------------------------
// 15/10/2026  | 1.0     | Pruebas iniciales del MUX 4 a 1
//             |         | basado en la presentación.
// 15/10/2026  | 2.0     | Adaptación del testbench al
//             |         | MUX 2 a 1 de 32 bits.
// 15/10/2026  | 2.1     | Corrección de un error de
//             |         | configuración en la simulación.
// 15/10/2026  | 2.2     | Ajuste de visualización de
//             |         | señales en EPWave.
// 15/10/2026  | 2.3     | Revisión final del testbench.
// ============================================================

module mux2to1 #(
    parameter WIDTH = 32
)(
    input logic [WIDTH-1:0] A,
    input logic [WIDTH-1:0] B,
    input logic Select,
  output logic [WIDTH-1:0] Y
);

    always_comb begin
        case (Select)
            1'b0: Y = A;
            1'b1: Y = B;
            default: Y = '0;
        endcase
    end

endmodule
