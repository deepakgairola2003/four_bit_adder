// Code your testbench here
// or browse Examples

module fourbitadder_tb;
    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    reg cin;

    // Outputs
    wire [3:0] sum;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    fourbitadder uut (
        .a(a), 
        .b(b), 
        .cin(cin), 
        .sum(sum), 
        .cout(cout)
    );

    initial begin
        // Initialize Inputs
        a = 4'b0000; b = 4'b0000; cin = 0;
        #10; // Wait for 10 time units

        // Apply test vectors
        a = 4'b0001; b = 4'b0001; cin = 0; // 1 + 1
        #10;
        a = 4'b0010; b = 4'b0011; cin = 0; // 2 + 3
        #10;
        a = 4'b0100; b = 4'b0101; cin = 0; // 4 + 5
        #10;
        a = 4'b0111; b = 4'b0001; cin = 1; // 7 + 1 + 1
        #10;
        a = 4'b1111; b = 4'b0001; cin = 1; // 15 + 1 + 1
        #10;

        // Add more test vectors as needed
        // End simulation
        $finish;
    end

    initial begin
        $monitor("At time %t: a = %b, b = %b, cin = %b -> sum = %b, cout = %b", $time, a, b, cin, sum, cout);
    end
	initial begin
      $dumpfile("dump.vcd"); $dumpvars; end
endmodule