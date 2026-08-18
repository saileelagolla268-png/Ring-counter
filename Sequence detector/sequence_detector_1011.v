`timescale 1ns/1ps

module sequence_detector_1011 (
    input  wire clk,
    input  wire reset,
    input  wire data_in,
    output reg  detected
);

    // FSM states
    parameter S0 = 2'b00;  // Initial state
    parameter S1 = 2'b01;  // Detected '1'
    parameter S2 = 2'b10;  // Detected '10'
    parameter S3 = 2'b11;  // Detected '101'

    reg [1:0] current_state;
    reg [1:0] next_state;

    // State register
    always @(posedge clk) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Next-state logic
    always @(*) begin
        case (current_state)

            S0: begin
                if (data_in)
                    next_state = S1;
                else
                    next_state = S0;
            end

            S1: begin
                if (data_in)
                    next_state = S1;
                else
                    next_state = S2;
            end

            S2: begin
                if (data_in)
                    next_state = S3;
                else
                    next_state = S0;
            end

            S3: begin
                if (data_in) begin
                    next_state = S1;
                end
                else begin
                    next_state = S2;
                end
            end

            default:
                next_state = S0;

        endcase
    end

    // Mealy output logic
    always @(*) begin
        detected = 1'b0;

        if ((current_state == S3) && (data_in == 1'b1))
            detected = 1'b1;
    end

endmodule
