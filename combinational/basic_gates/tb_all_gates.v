module tb_all_gates;

    reg a, b;
    wire and_y, or_y, not_y, nand_y, nor_y, xor_y, xnor_y;

    all_gates dut (
        .a(a),
        .b(b),
        .and_y(and_y),
        .or_y(or_y),
        .not_y(not_y),
        .nand_y(nand_y),
        .nor_y(nor_y),
        .xor_y(xor_y),
        .xnor_y(xnor_y)
    );

    initial begin
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        $finish;
    end

endmodule
