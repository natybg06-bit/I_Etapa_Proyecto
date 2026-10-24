`timescale 1ns/1ps

// ============================================================
// Proyecto: Procesador RISC-V Uniciclo
// Curso: Diseño de Sistemas Digitales
// Grupo: TODO
//
// Testbench: Multiplexor 2 a 1
//
// Descripcion:
// Verifica que el multiplexor seleccione correctamente
// las entradas segun el valor del selector.
// ============================================================

module mux_tb;

    logic [31:0] Entrada_A;
    logic [31:0] Entrada_B;
    logic        Selector;
    logic [31:0] Salida;

    MUX_2a1 #(.ANCHO(32)) dut (
        .Entrada_A(Entrada_A),
        .Entrada_B(Entrada_B),
        .Selector(Selector),
        .Salida(Salida)
    );

    initial begin

        $dumpfile("dump.vcd");
        $dumpvars(0, Entrada_A, Entrada_B, Selector, Salida);


        Entrada_A = 32'h12345678;
        Entrada_B = 32'hABCDEF00;

        // TEST 1 - Selector = 0
        Selector = 0;
        #10;

        if (Salida === Entrada_A)
            $display("TEST 1: PASS");
        else
            $display("TEST 1: FAIL");

        // TEST 2 - Selector = 1
        Selector = 1;
        #10;

        if (Salida === Entrada_B)
            $display("TEST 2: PASS");
        else
            $display("TEST 2: FAIL");

        // TEST 3 - Prueba adicional
        Entrada_A = 32'h00000000;
        Entrada_B = 32'hFFFFFFFF;

        Selector = 0;
        #10;

        if (Salida === Entrada_A)
            $display("TEST 3A: PASS");
        else
            $display("TEST 3A: FAIL");

        Selector = 1;
        #10;

        if (Salida === Entrada_B)
            $display("TEST 3B: PASS");
        else
            $display("TEST 3B: FAIL");

        $finish;
    end

endmodule
