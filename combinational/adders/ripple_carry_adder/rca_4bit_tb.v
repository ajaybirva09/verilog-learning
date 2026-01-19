// rca_4bit_tb.v
module rca_4bit_tb;

    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;

    integer i;

    // DUT
    rca_4bit dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("rca_4bit.vcd");
        $dumpvars(0, rca_4bit_tb);

        // Exhaustive testing
        for (i = 0; i < 512; i = i + 1) begin
            {cin, a, b} = i[8:0];
            #1;

            // Self-check
            if ({cout, sum} !== (a + b + cin)) begin
                $display("ERROR: a=%b b=%b cin=%b | sum=%b cout=%b",
                          a, b, cin, sum, cout);
                $finish;
            end
        end

        $display("ALL TESTS PASSED ✔");
        $finish;
    end

endmodule
