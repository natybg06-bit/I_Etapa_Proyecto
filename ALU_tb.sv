// ============================================================
// Proyecto: Procesador RISC-V Uniciclo
// Curso: Diseño de Sistemas Digitales
// Grupo: QBITS
//
// Testbench: ALU
//
// Descripción:
// Verifica el funcionamiento de la ALU para las operaciones
// aritméticas y lógicas definidas en la especificación.
//
// Autor / Verification Engineer:
// Nombre: Krisdel Guido Porras /
// Fecha de primera versión: 13/10/2026
//
// Historial de modificaciones:
// ------------------------------------------------------------
// Fecha       | Autor              | Descripción
// ------------------------------------------------------------
// 13/10/2026  |Krisdel Guido Porras| Primera versión
// 14/10/2026  |Krisdel Guido Porras| Adicion de Test 5,6,7 
// 22/10/2026  |Krisdel Guido Porras| Cambio Test 6 
// ============================================================

module alu_tb;

    // Señales del testbench
    logic [31:0] A;
    logic [31:0] B;
    logic [3:0]  ALUControl;

    logic [31:0] Result;
    logic        Zero;

    // Instancia del módulo bajo prueba
    alu dut (
        .A(A),
        .B(B),
        .ALUControl(ALUControl),
        .Result(Result),
        .Zero(Zero)
    );

    initial begin

        // ====================================================
        // TEST 1 - ADD
        // ====================================================
        A = 5;
        B = 3;
        ALUControl = 4'b0000;

        #10;

        $display("TEST 1 - ADD");
      	$display("Operacion: %0d + %0d = %0d",A, B, Result);
        $display("Resultado: %0d", Result);
        $display("Zero: %b", Zero);

        if (Result == 8 && Zero == 0)
            $display("PASS");
        else
            $display("FAIL");

        // Verificar resultado

        // ====================================================
        // TEST 2 - SUB
        // ====================================================
        A = 5;
        B = 3;
        ALUControl = 4'b0001;

        #10;
        $display("\nTEST 2 - SUB");
        $display("Operacion: %0d - %0d = %0d",A, B, Result);
        $display("Resultado: %0d", Result);
        $display("Zero: %b", Zero);

        if (Result == 2 && Zero == 0)
            $display("PASS");
        else
            $display("FAIL");
        

        // ====================================================
        // TEST 3 - AND
        // ====================================================
        A = 5;
        B = 3;
        ALUControl = 4'b0010;

        #10;
        $display("\nTEST 3 - AND");
      	$display("Operacion: %0d AND %0d = %0d", A, B, Result);
        $display("Resultado: %0d", Result);
        $display("Zero: %b", Zero);

        if (Result == 1 && Zero == 0)
            $display("PASS");
        else
            $display("FAIL");
        
        // ====================================================
        // TEST 4 - OR
        // ====================================================
        A = 5;
        B = 3;
        ALUControl = 4'b0011;

        #10;
        $display("\nTEST 4 - OR");
      	$display("Operacion: %0d OR %0d = %0d", A, B, Result);
        $display("Resultado: %0d", Result);
        $display("Zero: %b", Zero);

        if (Result == 7 && Zero == 0)
            $display("PASS");
        else
            $display("FAIL");
        
            

        // Agregar pruebas adicionales según la especificación.
        // ====================================================
        // TEST 5 - SUB negativo
        // ====================================================
        A = 5;
        B = 10;
        ALUControl = 4'b0001;
        #10;
        $display("\nTEST 5 - SUB negativo");
      $display("Operacion: %0d - %0d = %0d",A, B, $signed(Result));
        $display("Resultado: %0d", $signed(Result));
        $display("Hexadecimal: %h", Result);
        $display("Zero: %b", Zero);

        if (Result == 32'hFFFFFFFB && Zero == 0)
            $display("PASS");
        else
            $display("FAIL");

        // ====================================================
		// TEST 6 - ALUControl no implementado
		// ====================================================
		A = 5;
		B = 10;
		ALUControl = 4'b1111;
		#10;

		$display("\nTEST 6 - ALUControl no implementado");
		$display("Resultado: %0d", Result);
		$display("Zero: %b", Zero);


        if (Result === 32'd0 && Zero === 1'b1)
            $display("PASS");
        else
          $fatal(1, "FAIL: esperado Result=0 Zero=1; obtenido Result=%h 				Zero=%b", Result, Zero);

        // ====================================================
        // TEST 7 - Zero flag
        // ====================================================
        A = 5;
        B = 5;
        ALUControl = 4'b0001;
        #10;
        $display("\nTEST 7 - Zero flag");
        $display("Resultado: %0d", Result);
        $display("Zero: %b", Zero);

        if (Result == 32'h0 && Zero == 1)
            $display("PASS");
        else
            $display("FAIL");

        $display("\nFin de las pruebas.");

        $finish;

        end
endmodule
