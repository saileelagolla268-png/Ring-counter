`timescale 1ns/1ps

module shift_register_4bit_tb;

    reg       clk;
    reg       reset;
    reg       serial_in;

    wire [3:0] parallel_out;

    // Instantiate the Design Under Test
    shift_register_4bit dut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Generate waveform
        $dumpfile("shift_register_4bit.vcd");
        $dumpvars(0, shift_register_4bit_tb);

        // Initial values
        clk       = 1'b0;
        reset     = 1'b1;
        serial_in = 1'b0;

        $display("==============================================");
        $display("       4-BIT SHIFT REGISTER TESTBENCH");
        $display("==============================================");
        $display(" Time | CLK | RESET | SERIAL_IN | PARALLEL_OUT");
        $display("----------------------------------------------");

        // Reset
        #10;
        $display(" %4t |  %b  |   %b   |     %b     |    %b",
                 $time, clk, reset, serial_in, parallel_out);

        // Release reset
        reset = 1'b0;

        // Shift in 1
        serial_in = 1'b1;
        #10;
        $display(" %4t |  %b  |   %b   |     %b     |    %b",
                 $time, clk, reset, serial_in, parallel_out);

        // Shift in 0
        serial_in = 1'b0;
        #10;
        $display(" %4t |  %b  |   %b   |     %b     |    %b",
                 $time, clk, reset, serial_in, parallel_out);

        // Shift in 1
        serial_in = 1'b1;
        #10;
        $display(" %4t |  %b  |   %b   |     %b     |    %b",
                 $time, clk, reset, serial_in, parallel_out);

        // Shift in 1
        serial_in = 1'b1;
        #10;
        $display(" %4t |  %b  |   %b   |     %b     |    %b",
                 $time, clk, reset, serial_in, parallel_out);

        // Shift in 0
        serial_in = 1'b0;
        #10;
        $display(" %4t |  %b  |   %b   |     %b     |    %b",
                 $time, clk, reset, serial_in, parallel_out);

        // Shift in 1
        serial_in = 1'b1;
        #10;
        $display(" %4t |  %b  |   %b   |     %b     |    %b",
                 $time, clk, reset, serial_in, parallel_out);

        $display("----------------------------------------------");
        $display("Simulation completed successfully.");

        $finish;

    end

endmodule
