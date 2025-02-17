`timescale 1ns/100ps 
module mux_tb;
 reg a, b, select;
 wire y;

 mux u0_DUT(
  .a(a),
  .b(b),
  .select(select),
  .y(y)
 );
 logic correct,correct_out;
 assign correct_out = (select)?b:a;
 assign correct = (correct_out == y);

 always @(correct) begin
    #2
    if (!correct) begin
        $display("@@@ Incorrect at time %4.0f", $time);
        $display("@@@ a=%b, b=%b, select=%b", a, b, select);
        $display("@@@ expected result=%b, received %b", correct_out, y);
        $finish;
    end
end


 initial begin
  $dumpfile("mux_tb.vcd");
  $dumpvars(0,mux_tb);
  a=1'b0;b=1'b0; select=1'b0;
  #5 a=1'b1; 
  #5 select = 1'b1;
  #5 b=1'b1;
  #5 a=1'b0;
  #5 
  $display("@@@ Simulation complete at time %4.0f, all tests passed!", $time);
  $finish;
 end
endmodule