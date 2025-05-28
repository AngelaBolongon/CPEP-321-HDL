module binary_to_excess3 (
    input  [3:0] binary_in,
    output reg [3:0] excess3_out
);

    always @(*) begin
        case (binary_in)
            4'b0000: excess3_out = 4'b0011;
            4'b0001: excess3_out = 4'b0100;
            4'b0010: excess3_out = 4'b0101;
            4'b0011: excess3_out = 4'b0110;
            4'b0100: excess3_out = 4'b0111;
            4'b0101: excess3_out = 4'b1000;
            4'b0110: excess3_out = 4'b1001;
            4'b0111: excess3_out = 4'b1010;
            4'b1000: excess3_out = 4'b1011;
            4'b1001: excess3_out = 4'b1100;
            4'b1010: excess3_out = 4'b1101;
            4'b1011: excess3_out = 4'b1110;
            4'b1100: excess3_out = 4'b1111;
            4'b1101: excess3_out = 4'b0000;
            4'b1110: excess3_out = 4'b0001;
            4'b1111: excess3_out = 4'b0010;
        endcase
    end

endmodule

module tb_binary_to_excess3;

    reg  [3:0] binary_in;
    wire [3:0] excess3_out;

    // Instantiate the DUT (Device Under Test)
    binary_to_excess3 dut (
        .binary_in(binary_in),
        .excess3_out(excess3_out)
    );

    integer i;

    initial begin
        // Generate VCD file for GTKWave
        $dumpfile("binary.vcd");
        $dumpvars(0, tb_binary_to_excess3);

        $display("Time\tBinary\tExcess-3");
        for (i = 0; i < 16; i = i + 1) begin
            binary_in = i;
            #10;
            $display("%0t\t%b\t%b", $time, binary_in, excess3_out);
        end

        #10;
        $finish;
    end

endmodule
