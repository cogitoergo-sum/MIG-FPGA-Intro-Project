module mux(
  input a,
  input b,
  input select,
  output y
);

assign y = (select)?b:a;
endmodule