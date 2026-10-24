 // ============================================================
    // Proyecto: Procesador RISC-V Uniciclo 32bits
    // Curso: Diseño de Sistemas Digitales
    // Grupo: QBITS
    //
    // Testbench: Register File
    //
    // Descripción:
    // Verifica las operaciones de lectura y escritura del banco de
    // registros, incluyendo el comportamiento especial de x0.
    //
    // Autor / Verification Engineer:
    // Nombre: Andrés Obregón López
    // Fecha de primera versión: 14/10/2026
    //
    // Historial de modificaciones:
    // ------------------------------------------------------------
    // Fecha       | Autor                 | Descripción
    // ------------------------------------------------------------
    // 14/10/2026  | Andrés Obregón López  | Primera versión
    // 15/10/2026  | Andrés Obregón López  | Fail Test4 & Test2
    // 15/10/2026  | Andrés Obregón López  | Fail Test2
    // 15/10/2026  | Andrés Obregón López  | Corrección reutilizacion de registros en Test4
    // 15/10/2026  | Andrés Obregón López  | Depuración del formato y estructura
    // ===============================================================
    // ===============================================================

    module register_file_tb;

        logic        clk;
        logic [4:0]  A1;
        logic [4:0]  A2;
        logic [4:0]  A3;
        logic [31:0] WD3;
        logic        RegWrite;
        logic [31:0] RD1;
        logic [31:0] RD2;

        register_file dut (
            .clk(clk),
            .A1(A1),
            .A2(A2),
            .A3(A3),
            .WD3(WD3),
            .RegWrite(RegWrite),
            .RD1(RD1),
            .RD2(RD2)
        );

        // Generación de reloj
        initial clk = 0;
        always #5 clk = ~clk;

        initial begin

            // Inicialización
            RegWrite = 0;
            A1 = 0;
            A2 = 0;
            A3 = 0;
            WD3 = 0;

            
            $display("==================================");
            $display("TESTBENCH REGISTER FILE - QBITS");
            $display("==================================");

            // ====================================================
            // TEST 1 - Escritura y lectura de un registro
            // ====================================================
            // TODO: Escribir un valor en un registro diferente de x0. x5 = 25
            // TODO: Leer el registro y verificar el resultado.
            
                @(negedge clk); // Esperar el flanco negativo para preparar la escritura para el siguiente flanco positivo
                A3 = 5'd5; // Seleccionar el registro x5 para escribir
                WD3 = 32'd25; // Se escribe el valor 25 en el registro x5
                RegWrite = 1; // Habilitar la escritura en el banco de registros

                // Esperar el siguiente flanco positivo para escribir
                @(posedge clk);
                #1; // Esperar 1 unidad de tiempo para asegurar que la escritura se complete
                RegWrite = 0; // Deshabilitar la escritura para evitar escrituras no deseadas

                // Leer el registro x5
                A1 = 5'd5; // Seleccionar el registro x5 para leer
                #1;

            // Verificar el resultado
            if (RD1 === 32'd25) begin   // Si el valor leído es igual a 25, la prueba pasa
                $display("PASS TEST 1: x5 = %0d", RD1);
            end
            else begin
                $display("FAIL TEST 1: RD1 = %0d", RD1);
            end

            // ====================================================
            // TEST 2 - Lectura simultánea
            // ====================================================
            // TODO: Verificar los dos puertos de lectura. Con registros temporales x6 = 10 y x7 = 20, 
            //       leer ambos registros simultáneamente y verificar los resultados.
            
                @(negedge clk);
                A3 = 5'd6; // Seleccionar el registro x6 para escribir
                WD3 = 32'd10; // Se escribe el valor 10 en el registro x6
                RegWrite = 1; // Habilitar la escritura en el banco de registros

                @(posedge clk); 
                #1; // Esperar 1 unidad de tiempo para asegurar que la escritura se complete
                RegWrite = 0; // Deshabilitar la escritura para evitar escrituras no deseadas

                @(negedge clk);
                A3 = 5'd7; // Seleccionar el registro x7 para escribir
                WD3 = 32'd20; // Se escribe el valor 20 en el registro x7
                RegWrite = 1; // Habilitar la escritura en el banco de registros
            
                @(posedge clk); 
                #1; // Esperar 1 unidad de tiempo para asegurar que la escritura se complete
                RegWrite = 0; // Deshabilitar la escritura para evitar escrituras no deseadas

                // Leer x6 y x7 simultáneamente
                A1 = 5'd6;
                A2 = 5'd7;
                #1;

                // Verificar ambas salidas
                if ((RD1 === 32'd10) &&
                    (RD2 === 32'd20)) begin

                    $display("PASS TEST 2: RD1=%0d RD2=%0d",
                            RD1, RD2);
                end
                else begin
                    $display("FAIL TEST 2: RD1=%0d RD2=%0d",
                            RD1, RD2);
                end

            // ====================================================
            // TEST 3 - Registro x0
            // ====================================================
            // TODO: Intentar escribir en x0. - Escribir 10 en x0 y verificar que permanezca en cero.
            // TODO: Verificar que x0 continúe almacenando cero.

                @(negedge clk); // Intentar escribir en x0 el 
                A3 = 5'd0;
                WD3 = 32'd10;
                RegWrite = 1;

                @(posedge clk);
                #1;
                RegWrite = 0;

                // Leer x0
                A1 = 5'd0;
                #1;

                // Verificar que x0 permanezca en cero
                if (RD1 === 32'd0) begin
                    $display("PASS TEST 3: x0 = %0d", RD1);
                end
                else begin
                    $display("FAIL TEST 3: x0 = %0d", RD1);
                end

            // ====================================================
            // TEST 4 - RegWrite deshabilitado
            // ====================================================
            // TODO: Verificar que no exista escritura cuando RegWrite = 0.

                // Escribir 10 en x28 con RegWrite = 1 Valor anterior
                    @(negedge clk); // Escribir en x28 el 
                    A3 = 5'd28;
                    WD3 = 32'd10;
                    RegWrite = 1;
            
                // Esperar el flanco positivo
                    @(posedge clk);
                    #1;
                    RegWrite = 0;

                
                // Intentar escribir 20 en x28 con RegWrite = 0
                    @(negedge clk);
                    A3 = 5'd28;
                    WD3 = 32'd20;
                    RegWrite = 0;

                    // Esperar el flanco positivo
                    @(posedge clk);
                    #1;

                    // Leer x28
                    A1 = 5'd28;
                    #1;

                // Verificar que x28 conserve el valor 10
                if ((RD1 === 32'd10)) begin

                    $display("PASS TEST 4: x28 conserva %0d", RD1);
                end
                else begin
                    $display("FAIL TEST 4: x28 = %0d", RD1);
                end
            $display("==================================");
            $finish;
        end

    endmodule
