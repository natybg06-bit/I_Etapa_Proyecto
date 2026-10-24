// ============================================================
// Proyecto: Procesador RISC-V Uniciclo
// Curso: Diseño de Sistemas Digitales
// Grupo:  QBits 506 (Grupo 03)
//
// Módulo: Immediate Generator
//
// Descripción:
// Genera y extiende a 32 bits el valor inmediato contenido en
// una instrucción RISC-V. En esta etapa del proyecto se deben
// implementar los formatos de inmediato indicados en la
// especificación del Capítulo 1.
//
// Autor / Developer:
// Nombre: Alberto Arce Estrada
// Fecha de primera versión: 20/10/2026
//
// Historial de modificaciones:
// ------------------------------------------------------------
// Fecha       | Autor              | Descripción
// ------------------------------------------------------------
// 20/10/26  | Alberto Arce Estrada  | Primera versión: Se completa el modulo imm_gen, tanto para instrucciones I-type como s-type 
// ____/____/  | _________________  | ________________________
// ____/____/  | _________________  | ________________________
//
// ============================================================

// ============================================================
// ENTRADAS
// ------------------------------------------------------------
// Instr        : Instrucción RISC-V de 32 bits.
// ImmSrc       : Selecciona el formato del inmediato.
//
// SALIDAS
// ------------------------------------------------------------
// ImmExt       : Inmediato extendido a 32 bits.
// ============================================================

module imm_gen (       //crea el modulo generador de immediatos
  input  logic [31:0] Instr,//  señál de entrada digital,de 32 bits,contiene la instruccion completa  
  input  logic [1:0]  ImmSrc,//señál de entrada de 2 bits, indica el formato de Instr
  output logic [31:0] ImmExt//señál de salida digital de 32 bits, contiene el inmediato, o sea el numero que traia la instruccion 
);
   // ========================================================
   // IMPLEMENTACIÓN DEL MÓDULO
   // =======================================================
  always_comb begin                                                     // indica que este es un bloque de logica combinacional 
    case (ImmSrc)                                                       // revisa ImmSrc y determina que formato usar para interpretar Instr 
      2'b00: ImmExt = {{20{Instr[31]}}, Instr[31:20]};  // si ImmExt vale 00, usa el formato tipo I y colocalo en ImmExt 
      2'b01: ImmExt = {{20{Instr[31]}}, Instr[31:25], Instr[11:7]};// si ImmSrc es de forma 01, Instr se maneja como S-type
        default: ImmExt = 32'b0;                                        //  si ImmSrc no es un codigo no definido, le asigna cero a la salida 
    endcase
end


    

endmodule
