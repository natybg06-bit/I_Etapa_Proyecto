// ============================================================
// Proyecto: Procesador RISC-V Uniciclo
// Curso: Diseño de Sistemas Digitales
// Grupo: QBits 506 (Grupo 03)
//
// Testbench: Immediate Generator
//
// Descripción:
// Verifica la generación y extensión de los valores inmediatos
// requeridos durante el Capítulo 1 del proyecto.
//
// Autor / Verification Engineer:
// Nombre: Alberto Arce Estrada
// Fecha de primera versión: 20/10/26
//
// Historial de modificaciones:
// ------------------------------------------------------------
// Fecha       | Autor:             | Descripción
// ------------------------------------------------------------
// 20/10/2026  | Alberto Arce Estrada  | Primera versión:Tb con 4 pruebas necesarias y 6 adicionales 
//
// ============================================================

module imm_gen_tb;

    logic [31:0] Instr;
    logic [1:0]  ImmSrc;
    logic [31:0] ImmExt;

  imm_gen dut ( // dut = device under test, usa el modulo imm_gen que se definio en desing , dut es el nombre de la isntancia y la instancia usa el modulo imm_gen 
    .Instr(Instr), // el tn le da al modulo señale Instr
    .ImmSrc(ImmSrc),// y le señál ImmSrc
    .ImmExt(ImmExt)// nos regresa la señal Imm Ext 
    );

    initial begin

        // ====================================================
        // TEST 1 - Inmediato tipo I positivo
        // ====================================================
        // TODO: Construir una instrucción de prueba.
        // TODO: Seleccionar el ImmSrc correspondiente.
        // TODO: Verificar ImmExt.

Instr  = 32'h00530293;//  la instruccion seria addi x5, x6, 5, de modo que el inmediato debe dar 5  
ImmSrc = 2'b00;

#1;// hace que el bloque espere una unidad de tiempo del simulador para empezar 

if (ImmExt !== 32'd5) begin
  $fatal(1, "IMM-I-01 FAIL: esperado=5, obtenido=%h", ImmExt);//$fatal: termina la simulación indicando un error, nivel de error 1, %h muestra el ImmExt en hexadecimal, IMM-I-01 es el identificador de la prueba  
end else begin 
  $display("IMM-I-01 PASS: inmediato obtenido = 5");// mensaje de que si paso la prueba 
end
      
      
      
      
        // ====================================================
        // TEST 2 - Inmediato tipo I negativo
        // ====================================================
        
Instr  = 32'hFFC30293; // addi x5, x6, -4
ImmSrc = 2'b00;

#1;

      if (ImmExt !== 32'hFFFFFFFC) begin// cada F equivale a 1111 y la C equivale a 1100,FFFFFFFC reprsenta -4 en complemento a dos de 32bits    
    $fatal(1, "IMM-I-02 FAIL: esperado=FFFFFFFC, obtenido=%h", ImmExt);
end else begin
    $display("IMM-I-02 PASS: inmediato obtenido = %0d",
             $signed(ImmExt));
end
        // ====================================================
        // TEST 3 - Inmediato tipo S positivo
        // ====================================================
      Instr  = 32'h02532423;//sw x5, 40(x6), 40(x6) dice donde guardar el dato en la memoria, x5 contiene el dato a guardar y 40 es el numero de bytes que se suma a la dirrecion base y x6 es el registro que contiene la dirrecion base 
ImmSrc = 2'b01;

#1;

      if (ImmExt !== 32'd40) begin// si ImmExt es diferente de 40 ejecuta lo que sigue 
    $fatal(1, "IMM-S-01 FAIL: esperado=40, obtenido=%h", ImmExt);
end else begin
    $display("IMM-S-01 PASS: inmediato obtenido = %0d",
             $signed(ImmExt));
end 
//====================================================
        // TEST 4 - Inmediato tipo S negativo
        // ====================================================
      Instr  = 32'hFE532E23;//sw x5, -4(x6), guarda el contenidp de x5 en la dirrecion que resulta de restarle 4 al contenido de x6 
ImmSrc = 2'b01;

#1;

if (ImmExt !== 32'hFFFFFFFC) begin
    $fatal(1, "IMM-S-02 FAIL: esperado=FFFFFFFC, obtenido=%h", ImmExt);
end else begin
    $display("IMM-S-02 PASS: inmediato obtenido = %0d",
             $signed(ImmExt));
end
      
      
 //====================================================
        // Pruebas adicionales para cero 
        // TEST 5 - Inmediato tipo I igual a cero ====================================================     
      
      
      Instr  = 32'h00030293;//addi x5, x6, 0
ImmSrc = 2'b00;

#1;

if (ImmExt !== 32'd0) begin
    $fatal(1, "IMM-I-03 FAIL: esperado=0, obtenido=%h", ImmExt);
end else begin
    $display("IMM-I-03 PASS: inmediato obtenido = %0d",
             $signed(ImmExt));
end

//===================================================
// TEST 6 - Inmediato tipo S igual a cero
//====================================================     
      
Instr  = 32'h00532023;//sw x5, 0(x6)
ImmSrc = 2'b01;

#1;

if (ImmExt !== 32'd0) begin
    $fatal(1, "IMM-S-03 FAIL: esperado=0, obtenido=%h", ImmExt);
end else begin
    $display("IMM-S-03 PASS: inmediato obtenido = %0d",
             $signed(ImmExt));
end
      
//====================================================
      
      //Pruebas para numeros que llegan al limite de los 12 bits 
      // TEST 7 - I-type: máximo positivo
//====================================================
Instr  = 32'h7FF30293;//addi x5, x6, 2047
ImmSrc = 2'b00;

#1;

if (ImmExt !== 32'd2047) begin
    $fatal(1, "IMM-I-04 FAIL: esperado=2047, obtenido=%h", ImmExt);
end else begin
    $display("IMM-I-04 PASS: inmediato obtenido = %0d",
             $signed(ImmExt));
end

//====================================================
// TEST 8 - I-type: mínimo negativo
//====================================================
Instr  = 32'h80030293;//addi x5, x6, -2048
ImmSrc = 2'b00;

#1;

if (ImmExt !== 32'hFFFFF800) begin
    $fatal(1, "IMM-I-05 FAIL: esperado=FFFFF800, obtenido=%h", ImmExt);
end else begin
    $display("IMM-I-05 PASS: inmediato obtenido = %0d",
             $signed(ImmExt));
end

//====================================================
// TEST 9 - S-type: máximo positivo
//====================================================
Instr  = 32'h7E532FA3;//sw x5, 2047(x6)
ImmSrc = 2'b01;

#1;

if (ImmExt !== 32'd2047) begin
    $fatal(1, "IMM-S-04 FAIL: esperado=2047, obtenido=%h", ImmExt);
end else begin
    $display("IMM-S-04 PASS: inmediato obtenido = %0d",
             $signed(ImmExt));
end



//====================================================
// TEST 10 - S-type: mínimo negativo
//====================================================
Instr  = 32'h80532023;//sw x5, -2048(x6)
ImmSrc = 2'b01;

#1;

if (ImmExt !== 32'hFFFFF800) begin
    $fatal(1, "IMM-S-05 FAIL: esperado=FFFFF800, obtenido=%h", ImmExt);
end else begin
    $display("IMM-S-05 PASS: inmediato obtenido = %0d",
             $signed(ImmExt));
end
        $finish;
    end
  
  
 

endmodule
