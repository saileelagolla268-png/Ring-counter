//============================================================
// Testbench for 4-bit Ring Counter
//============================================================

`timescale 1ns/1ps

module ring_counter_tb;

    reg clk;
    reg reset;
    wire [3:0] q;

    // Instantiate Ring Counter
    ring_counter uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        $dumpfile("ring_counter.vcd");
        $dumpvars(0, ring_counter_tb);

        clk = 0;
        reset = 1;

        #10;
        reset = 0;

        #50;

        $finish;
    end

    // Display output
    initial begin
        $monitor("Time = %0t | Reset = %b | Q = %b",
                 $time, reset, q);
    end

endmodule
