// Code your design here
module halfadder_2(a, b, sum, carry);
    input a, b;
    output sum, carry;
    xor (sum, a, b);
    and (carry, a, b);
endmodule

module fulladder_2(a, b, cin, sum, cout);
    input a, b, cin;
    output sum, cout;
    wire x1, d1, d2;

    halfadder_2 ha1 (.a(a), .b(b), .sum(x1), .carry(d1));
    halfadder_2 ha2 (.a(x1), .b(cin), .sum(sum), .carry(d2));
    or (cout, d1, d2);
endmodule

module fourbitadder(a, b, cin, sum, cout);
    input [3:0] a, b;
    input cin;
    output [3:0] sum;
    output cout;
    wire c1, c2, c3;

    fulladder_2 fa0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1));
    fulladder_2 fa1 (.a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2));
    fulladder_2 fa2 (.a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]), .cout(c3));
    fulladder_2 fa3 (.a(a[3]), .b(b[3]), .cin(c3), .sum(sum[3]), .cout(cout));
endmodule
