`timescale 1ns/1ps

module sequence_detector_1011_tb;

    reg clk;
    reg reset;
    reg data_in;

    wire detected;

    // Instantiate the Design Under Test
    sequence_detector_1011 dut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .detected(detected)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Task to send one input bit
    task send_bit;
        input bit_value;
        begin
            data_in = bit_value;
            #10;

            $display(" %4t |  %b  |   %b   |    %b     |    %b",
                     $time, clk, reset, data_in, detected);
        end
    endtask

    initial begin

        // Generate waveform
        $dumpfile("sequence_detector_1011.vcd");
        $dumpvars(0, sequence_detector_1011_tb);

        // Initial values
        clk     = 1'b0;
        reset   = 1'b1;
        data_in = 1'b0;

        $display("================================================");
        $display("          1011 SEQUENCE DETECTOR");
        $display("================================================");
        $display(" Time | CLK | RESET | DATA_IN | DETECTED");
        $display("-----------------------------------------------");

        // Reset
        #10;

        $display(" %4t |  %b  |   %b   |    %b     |    %b",
                 $time, clk, reset, data_in, detected);

        // Release reset
        reset = 1'b0;

        // Send sequence: 1011
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(1);

        // Send additional bits
        send_bit(0);
        send_bit(1);
        send_bit(0);

        // Send another 1011
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(1);

        $display("-----------------------------------------------");
        $display("Simulation completed successfully.");

        $finish;

    end

endmodule
