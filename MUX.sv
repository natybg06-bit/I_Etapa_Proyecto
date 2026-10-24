// ============================================================
// Proyecto: Procesador RISC-V Uniciclo
// Curso: Diseño de Sistemas Digitales
// Grupo: QBITS506
//
// Modulo: Multiplexor 2 a 1
//
// Descripcion:
// Implementa un multiplexor 2 a 1 parametrizable, con un
// ancho predeterminado de 32 bits, que permite seleccionar
// una de dos entradas de datos mediante una señal de control.
//
// Autor / Developer:
// Nombre: Maria Fernanda Morales Calderon
// Rol: Lider del equipo / Desarrolladora del MUX
// Fecha de primera version: 15/10/2026
//
// Historial de modificaciones:
// ------------------------------------------------------------
// Fecha       | Autor              | Descripcion
// ------------------------------------------------------------
// 15/10/2026  | Maria Fernanda     | Primera version basada
//             |                    | en el MUX 4 a 1 de la
//             |                    | presentacion del curso.
// 15/10/2026  | Maria Fernanda     | Adaptacion a MUX 2 a 1
//             |                    | parametrizable.
// 21/10/2026  | Maria Fernanda     | Correccion de nombres
//             |                    | segun la plantilla.
// 22/10/2026  | Maria Fernanda     | Revision final del modulo.
// ============================================================

// ============================================================
// PARAMETROS
// ------------------------------------------------------------
// WIDTH        : Ancho de las entradas y la salida.
//                Valor predeterminado de 32 bits.
//
// ENTRADAS
// ------------------------------------------------------------
// A            : Primera entrada de datos de WIDTH bits.
// B            : Segunda entrada de datos de WIDTH bits.
// Select       : Señal de seleccion de 1 bit.
//
// SALIDAS
// ------------------------------------------------------------
// Y            : Salida de WIDTH bits que contiene
//                el valor de la entrada seleccionada.
// ============================================================

`timescale 1ns/1ps

module mux_tb;

    logic [31:0] A;
    logic [31:0] B;
    logic Select;
    logic [31:0] Y;

    mux2to1 #(.WIDTH(32)) dut (
        .A(A),
        .B(B),
        .Select(Select),
        .Y(Y)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, A, B, Select, Y);

        A = 32'h12345678;
        B = 32'hABCDEF00;

        // TEST 1 - Select = 0
        Select = 0;
        #10;

        if (Y === A)
            $display("TEST 1: PASS");
        else
            $display("TEST 1: FAIL");

        // TEST 2 - Select = 1
        Select = 1;
        #10;

        if (Y === B)
            $display("TEST 2: PASS");
        else
            $display("TEST 2: FAIL");

        // TEST 3 - Prueba adicional
        A = 32'h00000000;
        B = 32'hFFFFFFFF;

        Select = 0;
        #10;

        if (Y === A)
            $display("TEST 3A: PASS");
        else
            $display("TEST 3A: FAIL");

        Select = 1;
        #10;

        if (Y === B)
            $display("TEST 3B: PASS");
        else
            $display("TEST 3B: FAIL");

        $finish;
    end

endmodule
