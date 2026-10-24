module MUX_2a1 #(
    parameter ANCHO = 32
)(
    input logic [ANCHO-1:0] Entrada_A,
    input logic [ANCHO-1:0] Entrada_B,
    input logic Selector,
    output logic [ANCHO-1:0] Salida
);

    always_comb begin
        case (Selector)
            1'b0: Salida = Entrada_A;
            1'b1: Salida = Entrada_B;
            default: Salida = '0;
        endcase
    end

endmodule
