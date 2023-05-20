/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12
// Date      : Sun May 21 04:51:12 2023
/////////////////////////////////////////////////////////////


module Controller ( start, rst_n, clk, done, control );
  output [21:0] control;
  input start, rst_n, clk;
  output done;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n21, n22, n23,
         n24, n26, n27, n28, n29, n1, n2, n3, n5, n6, n7, n20, n30, n32, n33;
  wire   [3:0] Current_State;
  wire   [3:0] Next_State;

  DFFRHQX8 \Current_State_reg[3]  ( .D(n30), .CK(clk), .RN(n7), .Q(
        Current_State[3]) );
  DFFRHQX8 \Current_State_reg[0]  ( .D(Next_State[0]), .CK(clk), .RN(n7), .Q(
        Current_State[0]) );
  DFFRHQX8 \Current_State_reg[2]  ( .D(Next_State[2]), .CK(clk), .RN(n7), .Q(
        Current_State[2]) );
  DFFRHQX8 \Current_State_reg[1]  ( .D(Next_State[1]), .CK(clk), .RN(n7), .Q(
        Current_State[1]) );
  NAND2BX2 U3 ( .AN(control[18]), .B(n16), .Y(control[12]) );
  NAND2X4 U4 ( .A(n27), .B(n6), .Y(n24) );
  CLKBUFX2 U5 ( .A(n11), .Y(n3) );
  NAND4BX2 U6 ( .AN(Current_State[3]), .B(n1), .C(Current_State[0]), .D(
        Current_State[1]), .Y(n22) );
  NAND4BX2 U7 ( .AN(Current_State[3]), .B(Current_State[0]), .C(
        Current_State[1]), .D(Current_State[2]), .Y(n11) );
  NOR3BX4 U8 ( .AN(n6), .B(Current_State[1]), .C(n33), .Y(control[0]) );
  NOR2X1 U9 ( .A(n32), .B(Current_State[3]), .Y(n6) );
  NAND3X4 U10 ( .A(n21), .B(n3), .C(n23), .Y(control[11]) );
  INVX2 U11 ( .A(Current_State[0]), .Y(n32) );
  CLKAND2X2 U12 ( .A(Current_State[1]), .B(n1), .Y(n5) );
  CLKINVX1 U13 ( .A(Current_State[2]), .Y(n1) );
  NAND3X2 U14 ( .A(n9), .B(n18), .C(n15), .Y(control[19]) );
  NAND3X2 U15 ( .A(n16), .B(n3), .C(n15), .Y(control[21]) );
  NOR2X2 U16 ( .A(n2), .B(control[2]), .Y(n14) );
  CLKINVX1 U17 ( .A(n16), .Y(n2) );
  NAND4X2 U18 ( .A(n20), .B(n26), .C(n24), .D(n18), .Y(Next_State[1]) );
  CLKINVX2 U19 ( .A(control[0]), .Y(n20) );
  CLKNAND2X2 U20 ( .A(n13), .B(n3), .Y(control[4]) );
  NOR2BX2 U21 ( .AN(n18), .B(control[1]), .Y(n13) );
  AND3X2 U22 ( .A(n27), .B(Current_State[3]), .C(n32), .Y(control[1]) );
  NAND3X4 U23 ( .A(Current_State[3]), .B(Current_State[0]), .C(n27), .Y(n18)
         );
  NAND3BX4 U24 ( .AN(control[4]), .B(n20), .C(n16), .Y(control[15]) );
  CLKNAND2X4 U25 ( .A(n24), .B(n22), .Y(control[18]) );
  NOR2X2 U26 ( .A(Current_State[2]), .B(Current_State[1]), .Y(n27) );
  CLKINVX1 U27 ( .A(control[1]), .Y(n10) );
  CLKNAND2X2 U28 ( .A(n29), .B(n5), .Y(n21) );
  NOR2X4 U29 ( .A(Current_State[3]), .B(Current_State[0]), .Y(n29) );
  NAND3BX2 U30 ( .AN(Current_State[1]), .B(n29), .C(Current_State[2]), .Y(n23)
         );
  NOR2XL U31 ( .A(control[5]), .B(control[4]), .Y(n17) );
  CLKINVX1 U32 ( .A(n12), .Y(control[5]) );
  CLKINVX1 U33 ( .A(n17), .Y(n30) );
  CLKINVX1 U34 ( .A(n22), .Y(control[2]) );
  CLKNAND2X2 U35 ( .A(n15), .B(n17), .Y(control[20]) );
  NAND2BX1 U36 ( .AN(control[16]), .B(n14), .Y(Next_State[2]) );
  NAND2BX2 U37 ( .AN(control[11]), .B(n18), .Y(control[13]) );
  NAND3X2 U38 ( .A(n22), .B(n23), .C(n13), .Y(control[14]) );
  NAND4X2 U39 ( .A(n10), .B(n3), .C(n20), .D(n9), .Y(control[9]) );
  CLKNAND2X2 U40 ( .A(n14), .B(n9), .Y(control[7]) );
  NAND3X2 U41 ( .A(n12), .B(n13), .C(n14), .Y(control[8]) );
  NAND3X2 U42 ( .A(n12), .B(n3), .C(n22), .Y(control[10]) );
  NAND4X2 U43 ( .A(n14), .B(n21), .C(n10), .D(n20), .Y(control[17]) );
  CLKNAND2X2 U44 ( .A(n23), .B(n20), .Y(control[16]) );
  CLKNAND2X2 U45 ( .A(n9), .B(n18), .Y(control[3]) );
  CLKNAND2X2 U46 ( .A(n16), .B(n3), .Y(control[6]) );
  CLKINVX1 U47 ( .A(n9), .Y(done) );
  CLKNAND2X2 U48 ( .A(n29), .B(n27), .Y(n15) );
  AND3X1 U49 ( .A(n16), .B(n12), .C(n21), .Y(n26) );
  NAND3X2 U50 ( .A(Current_State[2]), .B(Current_State[1]), .C(n29), .Y(n16)
         );
  CLKINVX1 U51 ( .A(Current_State[2]), .Y(n33) );
  CLKNAND2X2 U52 ( .A(Current_State[3]), .B(n19), .Y(n9) );
  OAI2B1X1 U53 ( .A1N(n5), .A0(n32), .B0(n33), .Y(n19) );
  NAND3X2 U54 ( .A(n5), .B(n32), .C(Current_State[3]), .Y(n12) );
  NAND4X2 U55 ( .A(n26), .B(n28), .C(n23), .D(n10), .Y(Next_State[0]) );
  NAND2BX1 U56 ( .AN(n15), .B(start), .Y(n28) );
  CLKBUFX2 U57 ( .A(rst_n), .Y(n7) );
endmodule


module Register_0 ( D, reset, clk, load, Q );
  input [8:0] D;
  output [8:0] Q;
  input reset, clk, load;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n1, n11;

  DFFRQX1 \Q_reg[8]  ( .D(n10), .CK(clk), .RN(reset), .Q(Q[8]) );
  DFFRQX1 \Q_reg[7]  ( .D(n9), .CK(clk), .RN(reset), .Q(Q[7]) );
  DFFRQX1 \Q_reg[6]  ( .D(n8), .CK(clk), .RN(reset), .Q(Q[6]) );
  DFFRQX1 \Q_reg[5]  ( .D(n7), .CK(clk), .RN(reset), .Q(Q[5]) );
  DFFRQX1 \Q_reg[4]  ( .D(n6), .CK(clk), .RN(reset), .Q(Q[4]) );
  DFFRQX1 \Q_reg[3]  ( .D(n5), .CK(clk), .RN(reset), .Q(Q[3]) );
  DFFRQX1 \Q_reg[2]  ( .D(n4), .CK(clk), .RN(reset), .Q(Q[2]) );
  DFFRQX1 \Q_reg[1]  ( .D(n3), .CK(clk), .RN(reset), .Q(Q[1]) );
  DFFRQX1 \Q_reg[0]  ( .D(n2), .CK(clk), .RN(reset), .Q(Q[0]) );
  CLKINVX2 U2 ( .A(n1), .Y(n11) );
  CLKBUFX3 U3 ( .A(load), .Y(n1) );
  AO22X2 U4 ( .A0(Q[8]), .A1(n11), .B0(D[8]), .B1(n1), .Y(n10) );
  AO22X2 U5 ( .A0(Q[7]), .A1(n11), .B0(D[7]), .B1(n1), .Y(n9) );
  AO22X2 U6 ( .A0(Q[6]), .A1(n11), .B0(D[6]), .B1(n1), .Y(n8) );
  AO22X2 U7 ( .A0(Q[5]), .A1(n11), .B0(D[5]), .B1(n1), .Y(n7) );
  AO22X2 U8 ( .A0(Q[4]), .A1(n11), .B0(D[4]), .B1(n1), .Y(n6) );
  AO22X2 U9 ( .A0(Q[3]), .A1(n11), .B0(D[3]), .B1(n1), .Y(n5) );
  AO22X2 U10 ( .A0(Q[2]), .A1(n11), .B0(D[2]), .B1(n1), .Y(n4) );
  AO22X2 U11 ( .A0(Q[1]), .A1(n11), .B0(D[1]), .B1(n1), .Y(n3) );
  AO22X2 U12 ( .A0(Q[0]), .A1(n11), .B0(n1), .B1(D[0]), .Y(n2) );
endmodule


module Register_8 ( D, reset, clk, load, Q );
  input [8:0] D;
  output [8:0] Q;
  input reset, clk, load;
  wire   n1, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20;

  DFFRQX1 \Q_reg[8]  ( .D(n12), .CK(clk), .RN(reset), .Q(Q[8]) );
  DFFRQX1 \Q_reg[7]  ( .D(n13), .CK(clk), .RN(reset), .Q(Q[7]) );
  DFFRQX1 \Q_reg[6]  ( .D(n14), .CK(clk), .RN(reset), .Q(Q[6]) );
  DFFRQX1 \Q_reg[5]  ( .D(n15), .CK(clk), .RN(reset), .Q(Q[5]) );
  DFFRQX1 \Q_reg[4]  ( .D(n16), .CK(clk), .RN(reset), .Q(Q[4]) );
  DFFRQX1 \Q_reg[3]  ( .D(n17), .CK(clk), .RN(reset), .Q(Q[3]) );
  DFFRQX1 \Q_reg[2]  ( .D(n18), .CK(clk), .RN(reset), .Q(Q[2]) );
  DFFRQX1 \Q_reg[1]  ( .D(n19), .CK(clk), .RN(reset), .Q(Q[1]) );
  DFFRQX1 \Q_reg[0]  ( .D(n20), .CK(clk), .RN(reset), .Q(Q[0]) );
  CLKINVX2 U2 ( .A(n1), .Y(n11) );
  CLKBUFX3 U3 ( .A(load), .Y(n1) );
  AO22X2 U4 ( .A0(Q[8]), .A1(n11), .B0(D[8]), .B1(n1), .Y(n12) );
  AO22X2 U5 ( .A0(Q[7]), .A1(n11), .B0(D[7]), .B1(n1), .Y(n13) );
  AO22X2 U6 ( .A0(Q[6]), .A1(n11), .B0(D[6]), .B1(n1), .Y(n14) );
  AO22X2 U7 ( .A0(Q[5]), .A1(n11), .B0(D[5]), .B1(n1), .Y(n15) );
  AO22X2 U8 ( .A0(Q[4]), .A1(n11), .B0(D[4]), .B1(n1), .Y(n16) );
  AO22X2 U9 ( .A0(Q[3]), .A1(n11), .B0(D[3]), .B1(n1), .Y(n17) );
  AO22X2 U10 ( .A0(Q[2]), .A1(n11), .B0(D[2]), .B1(n1), .Y(n18) );
  AO22X2 U11 ( .A0(Q[1]), .A1(n11), .B0(D[1]), .B1(n1), .Y(n19) );
  AO22X2 U12 ( .A0(Q[0]), .A1(n11), .B0(n1), .B1(D[0]), .Y(n20) );
endmodule


module Register_7 ( D, reset, clk, load, Q );
  input [8:0] D;
  output [8:0] Q;
  input reset, clk, load;
  wire   n1, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20;

  DFFRQX1 \Q_reg[8]  ( .D(n12), .CK(clk), .RN(reset), .Q(Q[8]) );
  DFFRQX1 \Q_reg[7]  ( .D(n13), .CK(clk), .RN(reset), .Q(Q[7]) );
  DFFRQX1 \Q_reg[6]  ( .D(n14), .CK(clk), .RN(reset), .Q(Q[6]) );
  DFFRQX1 \Q_reg[5]  ( .D(n15), .CK(clk), .RN(reset), .Q(Q[5]) );
  DFFRQX1 \Q_reg[4]  ( .D(n16), .CK(clk), .RN(reset), .Q(Q[4]) );
  DFFRQX1 \Q_reg[3]  ( .D(n17), .CK(clk), .RN(reset), .Q(Q[3]) );
  DFFRQX1 \Q_reg[2]  ( .D(n18), .CK(clk), .RN(reset), .Q(Q[2]) );
  DFFRQX1 \Q_reg[1]  ( .D(n19), .CK(clk), .RN(reset), .Q(Q[1]) );
  DFFRQX1 \Q_reg[0]  ( .D(n20), .CK(clk), .RN(reset), .Q(Q[0]) );
  CLKINVX2 U2 ( .A(n1), .Y(n11) );
  CLKBUFX3 U3 ( .A(load), .Y(n1) );
  AO22X2 U4 ( .A0(Q[8]), .A1(n11), .B0(D[8]), .B1(n1), .Y(n12) );
  AO22X2 U5 ( .A0(Q[7]), .A1(n11), .B0(D[7]), .B1(n1), .Y(n13) );
  AO22X2 U6 ( .A0(Q[6]), .A1(n11), .B0(D[6]), .B1(n1), .Y(n14) );
  AO22X2 U7 ( .A0(Q[5]), .A1(n11), .B0(D[5]), .B1(n1), .Y(n15) );
  AO22X2 U8 ( .A0(Q[4]), .A1(n11), .B0(D[4]), .B1(n1), .Y(n16) );
  AO22X2 U9 ( .A0(Q[3]), .A1(n11), .B0(D[3]), .B1(n1), .Y(n17) );
  AO22X2 U10 ( .A0(Q[2]), .A1(n11), .B0(D[2]), .B1(n1), .Y(n18) );
  AO22X2 U11 ( .A0(Q[1]), .A1(n11), .B0(D[1]), .B1(n1), .Y(n19) );
  AO22X2 U12 ( .A0(Q[0]), .A1(n11), .B0(n1), .B1(D[0]), .Y(n20) );
endmodule


module Register_6 ( D, reset, clk, load, Q );
  input [8:0] D;
  output [8:0] Q;
  input reset, clk, load;
  wire   n1, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20;

  DFFRQX1 \Q_reg[8]  ( .D(n12), .CK(clk), .RN(reset), .Q(Q[8]) );
  DFFRQX1 \Q_reg[7]  ( .D(n13), .CK(clk), .RN(reset), .Q(Q[7]) );
  DFFRQX1 \Q_reg[6]  ( .D(n14), .CK(clk), .RN(reset), .Q(Q[6]) );
  DFFRQX1 \Q_reg[5]  ( .D(n15), .CK(clk), .RN(reset), .Q(Q[5]) );
  DFFRQX1 \Q_reg[4]  ( .D(n16), .CK(clk), .RN(reset), .Q(Q[4]) );
  DFFRQX1 \Q_reg[3]  ( .D(n17), .CK(clk), .RN(reset), .Q(Q[3]) );
  DFFRQX1 \Q_reg[2]  ( .D(n18), .CK(clk), .RN(reset), .Q(Q[2]) );
  DFFRQX1 \Q_reg[1]  ( .D(n19), .CK(clk), .RN(reset), .Q(Q[1]) );
  DFFRQX1 \Q_reg[0]  ( .D(n20), .CK(clk), .RN(reset), .Q(Q[0]) );
  CLKINVX2 U2 ( .A(n1), .Y(n11) );
  CLKBUFX3 U3 ( .A(load), .Y(n1) );
  AO22X2 U4 ( .A0(Q[8]), .A1(n11), .B0(D[8]), .B1(n1), .Y(n12) );
  AO22X2 U5 ( .A0(Q[7]), .A1(n11), .B0(D[7]), .B1(n1), .Y(n13) );
  AO22X2 U6 ( .A0(Q[6]), .A1(n11), .B0(D[6]), .B1(n1), .Y(n14) );
  AO22X2 U7 ( .A0(Q[5]), .A1(n11), .B0(D[5]), .B1(n1), .Y(n15) );
  AO22X2 U8 ( .A0(Q[4]), .A1(n11), .B0(D[4]), .B1(n1), .Y(n16) );
  AO22X2 U9 ( .A0(Q[3]), .A1(n11), .B0(D[3]), .B1(n1), .Y(n17) );
  AO22X2 U10 ( .A0(Q[2]), .A1(n11), .B0(D[2]), .B1(n1), .Y(n18) );
  AO22X2 U11 ( .A0(Q[1]), .A1(n11), .B0(D[1]), .B1(n1), .Y(n19) );
  AO22X2 U12 ( .A0(Q[0]), .A1(n11), .B0(n1), .B1(D[0]), .Y(n20) );
endmodule


module Register_5 ( D, reset, clk, load, Q );
  input [8:0] D;
  output [8:0] Q;
  input reset, clk, load;
  wire   n1, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20;

  DFFRQX1 \Q_reg[8]  ( .D(n12), .CK(clk), .RN(reset), .Q(Q[8]) );
  DFFRQX1 \Q_reg[7]  ( .D(n13), .CK(clk), .RN(reset), .Q(Q[7]) );
  DFFRQX1 \Q_reg[6]  ( .D(n14), .CK(clk), .RN(reset), .Q(Q[6]) );
  DFFRQX1 \Q_reg[5]  ( .D(n15), .CK(clk), .RN(reset), .Q(Q[5]) );
  DFFRQX1 \Q_reg[4]  ( .D(n16), .CK(clk), .RN(reset), .Q(Q[4]) );
  DFFRQX1 \Q_reg[3]  ( .D(n17), .CK(clk), .RN(reset), .Q(Q[3]) );
  DFFRQX1 \Q_reg[2]  ( .D(n18), .CK(clk), .RN(reset), .Q(Q[2]) );
  DFFRQX1 \Q_reg[1]  ( .D(n19), .CK(clk), .RN(reset), .Q(Q[1]) );
  DFFRQX1 \Q_reg[0]  ( .D(n20), .CK(clk), .RN(reset), .Q(Q[0]) );
  CLKINVX2 U2 ( .A(n1), .Y(n11) );
  CLKBUFX3 U3 ( .A(load), .Y(n1) );
  AO22X2 U4 ( .A0(Q[8]), .A1(n11), .B0(D[8]), .B1(n1), .Y(n12) );
  AO22X2 U5 ( .A0(Q[7]), .A1(n11), .B0(D[7]), .B1(n1), .Y(n13) );
  AO22X2 U6 ( .A0(Q[6]), .A1(n11), .B0(D[6]), .B1(n1), .Y(n14) );
  AO22X2 U7 ( .A0(Q[5]), .A1(n11), .B0(D[5]), .B1(n1), .Y(n15) );
  AO22X2 U8 ( .A0(Q[4]), .A1(n11), .B0(D[4]), .B1(n1), .Y(n16) );
  AO22X2 U9 ( .A0(Q[3]), .A1(n11), .B0(D[3]), .B1(n1), .Y(n17) );
  AO22X2 U10 ( .A0(Q[2]), .A1(n11), .B0(D[2]), .B1(n1), .Y(n18) );
  AO22X2 U11 ( .A0(Q[1]), .A1(n11), .B0(D[1]), .B1(n1), .Y(n19) );
  AO22X2 U12 ( .A0(Q[0]), .A1(n11), .B0(n1), .B1(D[0]), .Y(n20) );
endmodule


module Register_4 ( D, reset, clk, load, Q );
  input [8:0] D;
  output [8:0] Q;
  input reset, clk, load;
  wire   n1, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20;

  DFFRQX1 \Q_reg[8]  ( .D(n12), .CK(clk), .RN(reset), .Q(Q[8]) );
  DFFRQX1 \Q_reg[7]  ( .D(n13), .CK(clk), .RN(reset), .Q(Q[7]) );
  DFFRQX1 \Q_reg[6]  ( .D(n14), .CK(clk), .RN(reset), .Q(Q[6]) );
  DFFRQX1 \Q_reg[5]  ( .D(n15), .CK(clk), .RN(reset), .Q(Q[5]) );
  DFFRQX1 \Q_reg[4]  ( .D(n16), .CK(clk), .RN(reset), .Q(Q[4]) );
  DFFRQX1 \Q_reg[3]  ( .D(n17), .CK(clk), .RN(reset), .Q(Q[3]) );
  DFFRQX1 \Q_reg[2]  ( .D(n18), .CK(clk), .RN(reset), .Q(Q[2]) );
  DFFRQX1 \Q_reg[1]  ( .D(n19), .CK(clk), .RN(reset), .Q(Q[1]) );
  DFFRQX1 \Q_reg[0]  ( .D(n20), .CK(clk), .RN(reset), .Q(Q[0]) );
  CLKINVX2 U2 ( .A(n1), .Y(n11) );
  CLKBUFX3 U3 ( .A(load), .Y(n1) );
  AO22X2 U4 ( .A0(Q[8]), .A1(n11), .B0(D[8]), .B1(n1), .Y(n12) );
  AO22X2 U5 ( .A0(Q[7]), .A1(n11), .B0(D[7]), .B1(n1), .Y(n13) );
  AO22X2 U6 ( .A0(Q[6]), .A1(n11), .B0(D[6]), .B1(n1), .Y(n14) );
  AO22X2 U7 ( .A0(Q[5]), .A1(n11), .B0(D[5]), .B1(n1), .Y(n15) );
  AO22X2 U8 ( .A0(Q[4]), .A1(n11), .B0(D[4]), .B1(n1), .Y(n16) );
  AO22X2 U9 ( .A0(Q[3]), .A1(n11), .B0(D[3]), .B1(n1), .Y(n17) );
  AO22X2 U10 ( .A0(Q[2]), .A1(n11), .B0(D[2]), .B1(n1), .Y(n18) );
  AO22X2 U11 ( .A0(Q[1]), .A1(n11), .B0(D[1]), .B1(n1), .Y(n19) );
  AO22X2 U12 ( .A0(Q[0]), .A1(n11), .B0(n1), .B1(D[0]), .Y(n20) );
endmodule


module MUX3_0 ( A, B, C, S, Y );
  input [8:0] A;
  input [8:0] B;
  input [8:0] C;
  input [1:0] S;
  output [8:0] Y;
  wire   n11, n12, n14, n15, n16, n17, n18, n19, n20, n21, n22, n1, n2, n3,
         n24;

  CLKBUFX4 U1 ( .A(n12), .Y(n3) );
  BUFX3 U2 ( .A(n14), .Y(n2) );
  INVX2 U3 ( .A(n17), .Y(Y[5]) );
  INVX2 U4 ( .A(n21), .Y(Y[1]) );
  CLKINVX1 U5 ( .A(n22), .Y(Y[0]) );
  INVX1 U6 ( .A(S[0]), .Y(n24) );
  INVX2 U7 ( .A(n19), .Y(Y[3]) );
  CLKINVX1 U8 ( .A(n15), .Y(Y[7]) );
  CLKXOR2X4 U9 ( .A(n24), .B(S[1]), .Y(n1) );
  AOI222X1 U10 ( .A0(B[2]), .A1(n3), .B0(A[2]), .B1(n1), .C0(C[2]), .C1(n2), 
        .Y(n20) );
  INVX2 U11 ( .A(n20), .Y(Y[2]) );
  AOI222X2 U12 ( .A0(B[1]), .A1(n3), .B0(A[1]), .B1(n1), .C0(C[1]), .C1(n14), 
        .Y(n21) );
  CLKAND2X2 U13 ( .A(S[1]), .B(n24), .Y(n14) );
  NOR2XL U14 ( .A(n24), .B(S[1]), .Y(n12) );
  AOI222X1 U15 ( .A0(B[0]), .A1(n3), .B0(A[0]), .B1(n1), .C0(C[0]), .C1(n2), 
        .Y(n22) );
  AOI222X1 U16 ( .A0(B[3]), .A1(n3), .B0(A[3]), .B1(n1), .C0(C[3]), .C1(n2), 
        .Y(n19) );
  CLKINVX1 U17 ( .A(n18), .Y(Y[4]) );
  AOI222X1 U18 ( .A0(B[4]), .A1(n3), .B0(A[4]), .B1(n1), .C0(C[4]), .C1(n2), 
        .Y(n18) );
  AOI222X1 U19 ( .A0(B[5]), .A1(n3), .B0(A[5]), .B1(n1), .C0(C[5]), .C1(n2), 
        .Y(n17) );
  CLKINVX1 U20 ( .A(n16), .Y(Y[6]) );
  AOI222X1 U21 ( .A0(B[6]), .A1(n3), .B0(A[6]), .B1(n1), .C0(C[6]), .C1(n2), 
        .Y(n16) );
  AOI222X1 U22 ( .A0(B[7]), .A1(n3), .B0(A[7]), .B1(n1), .C0(C[7]), .C1(n2), 
        .Y(n15) );
  CLKINVX1 U23 ( .A(n11), .Y(Y[8]) );
  AOI222X1 U24 ( .A0(B[8]), .A1(n3), .B0(A[8]), .B1(n1), .C0(C[8]), .C1(n2), 
        .Y(n11) );
endmodule


module MUX4_0 ( A, B, C, D, S, Y );
  input [8:0] A;
  input [8:0] B;
  input [8:0] C;
  input [8:0] D;
  input [1:0] S;
  output [8:0] Y;
  wire   n2, n3, n4, n5, n6, n7, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n1, n8, n24, n25;

  CLKAND2X2 U1 ( .A(S[1]), .B(n25), .Y(n5) );
  CLKINVX1 U2 ( .A(S[0]), .Y(n25) );
  CLKBUFX2 U3 ( .A(n6), .Y(n24) );
  NOR2XL U4 ( .A(n25), .B(S[1]), .Y(n6) );
  CLKAND2X2 U5 ( .A(S[1]), .B(S[0]), .Y(n4) );
  NOR2XL U6 ( .A(S[0]), .B(S[1]), .Y(n7) );
  CLKNAND2X2 U7 ( .A(n20), .B(n21), .Y(Y[1]) );
  CLKNAND2X2 U8 ( .A(n2), .B(n3), .Y(Y[8]) );
  CLKNAND2X2 U9 ( .A(n22), .B(n23), .Y(Y[0]) );
  CLKNAND2X2 U10 ( .A(B[0]), .B(n24), .Y(n22) );
  AOI22X1 U11 ( .A0(D[0]), .A1(n4), .B0(C[0]), .B1(n5), .Y(n23) );
  CLKNAND2X2 U12 ( .A(n18), .B(n19), .Y(Y[2]) );
  CLKNAND2X2 U13 ( .A(n16), .B(n17), .Y(Y[3]) );
  CLKNAND2X2 U14 ( .A(n14), .B(n15), .Y(Y[4]) );
  CLKNAND2X2 U15 ( .A(n12), .B(n13), .Y(Y[5]) );
  CLKNAND2X2 U16 ( .A(n10), .B(n11), .Y(Y[6]) );
  CLKNAND2X2 U17 ( .A(n1), .B(n9), .Y(Y[7]) );
  AOI22X1 U18 ( .A0(D[1]), .A1(n4), .B0(C[1]), .B1(n5), .Y(n21) );
  AOI22X1 U19 ( .A0(D[2]), .A1(n4), .B0(C[2]), .B1(n5), .Y(n19) );
  CLKNAND2X2 U20 ( .A(B[1]), .B(n24), .Y(n20) );
  AOI22X1 U21 ( .A0(D[3]), .A1(n4), .B0(C[3]), .B1(n5), .Y(n17) );
  CLKNAND2X2 U22 ( .A(B[2]), .B(n24), .Y(n18) );
  AOI22X1 U23 ( .A0(D[4]), .A1(n4), .B0(C[4]), .B1(n5), .Y(n15) );
  CLKNAND2X2 U24 ( .A(B[3]), .B(n24), .Y(n16) );
  AOI22X1 U25 ( .A0(D[5]), .A1(n4), .B0(C[5]), .B1(n5), .Y(n13) );
  CLKNAND2X2 U26 ( .A(B[4]), .B(n24), .Y(n14) );
  CLKNAND2X2 U27 ( .A(B[5]), .B(n24), .Y(n12) );
  AOI22X1 U28 ( .A0(D[6]), .A1(n4), .B0(C[6]), .B1(n5), .Y(n11) );
  CLKNAND2X2 U29 ( .A(B[6]), .B(n24), .Y(n10) );
  AOI22X1 U30 ( .A0(D[7]), .A1(n4), .B0(C[7]), .B1(n5), .Y(n9) );
  NOR2XL U31 ( .A(n8), .B(n7), .Y(n1) );
  CLKAND2X2 U32 ( .A(B[7]), .B(n24), .Y(n8) );
  AOI22X1 U33 ( .A0(D[8]), .A1(n4), .B0(C[8]), .B1(n5), .Y(n3) );
  CLKNAND2X2 U34 ( .A(B[8]), .B(n24), .Y(n2) );
endmodule


module MUX4_1 ( A, B, C, D, S, Y );
  input [8:0] A;
  input [8:0] B;
  input [8:0] C;
  input [8:0] D;
  input [1:0] S;
  output [8:0] Y;
  wire   n1, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47;

  CLKAND2X2 U1 ( .A(S[1]), .B(n25), .Y(n44) );
  CLKINVX1 U2 ( .A(S[0]), .Y(n25) );
  CLKBUFX2 U3 ( .A(n42), .Y(n24) );
  NOR2XL U4 ( .A(S[0]), .B(S[1]), .Y(n42) );
  CLKBUFX2 U5 ( .A(n43), .Y(n1) );
  NOR2XL U6 ( .A(n25), .B(S[1]), .Y(n43) );
  CLKAND2X2 U7 ( .A(S[1]), .B(S[0]), .Y(n45) );
  CLKNAND2X2 U8 ( .A(n29), .B(n28), .Y(Y[1]) );
  CLKNAND2X2 U9 ( .A(n47), .B(n46), .Y(Y[8]) );
  AOI22X1 U10 ( .A0(B[8]), .A1(n1), .B0(A[8]), .B1(n24), .Y(n47) );
  CLKNAND2X2 U11 ( .A(n31), .B(n30), .Y(Y[2]) );
  AOI22X1 U12 ( .A0(B[2]), .A1(n1), .B0(A[2]), .B1(n24), .Y(n31) );
  CLKNAND2X2 U13 ( .A(n33), .B(n32), .Y(Y[3]) );
  AOI22X1 U14 ( .A0(B[3]), .A1(n1), .B0(A[3]), .B1(n24), .Y(n33) );
  CLKNAND2X2 U15 ( .A(n35), .B(n34), .Y(Y[4]) );
  AOI22X1 U16 ( .A0(B[4]), .A1(n1), .B0(A[4]), .B1(n24), .Y(n35) );
  CLKNAND2X2 U17 ( .A(n37), .B(n36), .Y(Y[5]) );
  AOI22X1 U18 ( .A0(B[5]), .A1(n1), .B0(A[5]), .B1(n24), .Y(n37) );
  CLKNAND2X2 U19 ( .A(n39), .B(n38), .Y(Y[6]) );
  AOI22X1 U20 ( .A0(B[6]), .A1(n1), .B0(A[6]), .B1(n24), .Y(n39) );
  CLKNAND2X2 U21 ( .A(n41), .B(n40), .Y(Y[7]) );
  AOI22X1 U22 ( .A0(B[7]), .A1(n1), .B0(A[7]), .B1(n24), .Y(n41) );
  CLKNAND2X2 U23 ( .A(n27), .B(n26), .Y(Y[0]) );
  AOI22X1 U24 ( .A0(B[0]), .A1(n1), .B0(A[0]), .B1(n24), .Y(n27) );
  AOI22X1 U25 ( .A0(D[0]), .A1(n45), .B0(C[0]), .B1(n44), .Y(n26) );
  AOI22X1 U26 ( .A0(D[1]), .A1(n45), .B0(C[1]), .B1(n44), .Y(n28) );
  AOI22X1 U27 ( .A0(B[1]), .A1(n1), .B0(A[1]), .B1(n24), .Y(n29) );
  AOI22X1 U28 ( .A0(D[2]), .A1(n45), .B0(C[2]), .B1(n44), .Y(n30) );
  AOI22X1 U29 ( .A0(D[3]), .A1(n45), .B0(C[3]), .B1(n44), .Y(n32) );
  AOI22X1 U30 ( .A0(D[4]), .A1(n45), .B0(C[4]), .B1(n44), .Y(n34) );
  AOI22X1 U31 ( .A0(D[5]), .A1(n45), .B0(C[5]), .B1(n44), .Y(n36) );
  AOI22X1 U32 ( .A0(D[6]), .A1(n45), .B0(C[6]), .B1(n44), .Y(n38) );
  AOI22X1 U33 ( .A0(D[7]), .A1(n45), .B0(C[7]), .B1(n44), .Y(n40) );
  AOI22X1 U34 ( .A0(D[8]), .A1(n45), .B0(C[8]), .B1(n44), .Y(n46) );
endmodule


module MUX2_0 ( A, B, S, Y );
  input [8:0] A;
  input [8:0] B;
  output [8:0] Y;
  input S;
  wire   n1, n2;

  CLKINVX2 U1 ( .A(n1), .Y(n2) );
  CLKBUFX3 U2 ( .A(S), .Y(n1) );
  AO22X2 U3 ( .A0(n1), .A1(B[8]), .B0(A[8]), .B1(n2), .Y(Y[8]) );
  AO22X2 U4 ( .A0(B[7]), .A1(n1), .B0(A[7]), .B1(n2), .Y(Y[7]) );
  AO22X2 U5 ( .A0(B[6]), .A1(n1), .B0(A[6]), .B1(n2), .Y(Y[6]) );
  AO22X2 U6 ( .A0(B[5]), .A1(n1), .B0(A[5]), .B1(n2), .Y(Y[5]) );
  AO22X2 U7 ( .A0(B[4]), .A1(n1), .B0(A[4]), .B1(n2), .Y(Y[4]) );
  AO22X2 U8 ( .A0(B[3]), .A1(n1), .B0(A[3]), .B1(n2), .Y(Y[3]) );
  AO22X2 U9 ( .A0(B[2]), .A1(n1), .B0(A[2]), .B1(n2), .Y(Y[2]) );
  AO22X2 U10 ( .A0(B[1]), .A1(n1), .B0(A[1]), .B1(n2), .Y(Y[1]) );
  AO22X2 U11 ( .A0(B[0]), .A1(n1), .B0(A[0]), .B1(n2), .Y(Y[0]) );
endmodule


module MUX3_1 ( A, B, C, S, Y );
  input [8:0] A;
  input [8:0] B;
  input [8:0] C;
  input [1:0] S;
  output [8:0] Y;
  wire   n2, n3, n4, n5, n6, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35;

  CLKBUFX2 U1 ( .A(n35), .Y(n6) );
  NAND2X4 U2 ( .A(B[8]), .B(n6), .Y(n2) );
  CLKAND2X2 U3 ( .A(S[1]), .B(n25), .Y(n34) );
  CLKXOR2X2 U4 ( .A(n25), .B(S[1]), .Y(n5) );
  CLKNAND2X2 U5 ( .A(A[8]), .B(n5), .Y(n3) );
  CLKNAND2X2 U6 ( .A(C[8]), .B(n34), .Y(n4) );
  NAND3X2 U7 ( .A(n2), .B(n3), .C(n4), .Y(Y[8]) );
  CLKINVX1 U8 ( .A(S[0]), .Y(n25) );
  NOR2XL U9 ( .A(n25), .B(S[1]), .Y(n35) );
  CLKINVX1 U10 ( .A(n33), .Y(Y[7]) );
  AOI222X1 U11 ( .A0(B[7]), .A1(n6), .B0(A[7]), .B1(n5), .C0(C[7]), .C1(n34), 
        .Y(n33) );
  CLKINVX1 U12 ( .A(n32), .Y(Y[6]) );
  AOI222X1 U13 ( .A0(B[6]), .A1(n6), .B0(A[6]), .B1(n5), .C0(C[6]), .C1(n34), 
        .Y(n32) );
  CLKINVX1 U14 ( .A(n31), .Y(Y[5]) );
  AOI222X1 U15 ( .A0(B[5]), .A1(n6), .B0(A[5]), .B1(n5), .C0(C[5]), .C1(n34), 
        .Y(n31) );
  CLKINVX1 U16 ( .A(n30), .Y(Y[4]) );
  AOI222X1 U17 ( .A0(B[4]), .A1(n6), .B0(A[4]), .B1(n5), .C0(C[4]), .C1(n34), 
        .Y(n30) );
  CLKINVX1 U18 ( .A(n29), .Y(Y[3]) );
  AOI222X1 U19 ( .A0(B[3]), .A1(n6), .B0(A[3]), .B1(n5), .C0(C[3]), .C1(n34), 
        .Y(n29) );
  CLKINVX1 U20 ( .A(n28), .Y(Y[2]) );
  AOI222X1 U21 ( .A0(B[2]), .A1(n6), .B0(A[2]), .B1(n5), .C0(C[2]), .C1(n34), 
        .Y(n28) );
  CLKINVX1 U22 ( .A(n27), .Y(Y[1]) );
  AOI222X1 U23 ( .A0(B[1]), .A1(n6), .B0(A[1]), .B1(n5), .C0(C[1]), .C1(n34), 
        .Y(n27) );
  CLKINVX1 U24 ( .A(n26), .Y(Y[0]) );
  AOI222X1 U25 ( .A0(B[0]), .A1(n6), .B0(A[0]), .B1(n5), .C0(C[0]), .C1(n34), 
        .Y(n26) );
endmodule


module MUX2_4 ( A, B, S, Y );
  input [8:0] A;
  input [8:0] B;
  output [8:0] Y;
  input S;
  wire   n1, n2;

  CLKINVX2 U1 ( .A(n1), .Y(n2) );
  CLKBUFX3 U2 ( .A(S), .Y(n1) );
  AO22X2 U3 ( .A0(n1), .A1(B[8]), .B0(A[8]), .B1(n2), .Y(Y[8]) );
  AO22X2 U4 ( .A0(B[7]), .A1(n1), .B0(A[7]), .B1(n2), .Y(Y[7]) );
  AO22X2 U5 ( .A0(B[6]), .A1(n1), .B0(A[6]), .B1(n2), .Y(Y[6]) );
  AO22X2 U6 ( .A0(B[5]), .A1(n1), .B0(A[5]), .B1(n2), .Y(Y[5]) );
  AO22X2 U7 ( .A0(B[4]), .A1(n1), .B0(A[4]), .B1(n2), .Y(Y[4]) );
  AO22X2 U8 ( .A0(B[3]), .A1(n1), .B0(A[3]), .B1(n2), .Y(Y[3]) );
  AO22X2 U9 ( .A0(B[2]), .A1(n1), .B0(A[2]), .B1(n2), .Y(Y[2]) );
  AO22X2 U10 ( .A0(B[1]), .A1(n1), .B0(A[1]), .B1(n2), .Y(Y[1]) );
  AO22X2 U11 ( .A0(B[0]), .A1(n1), .B0(A[0]), .B1(n2), .Y(Y[0]) );
endmodule


module MUX2_3 ( A, B, S, Y );
  input [8:0] A;
  input [8:0] B;
  output [8:0] Y;
  input S;
  wire   n1, n2;

  CLKINVX2 U1 ( .A(n1), .Y(n2) );
  CLKBUFX3 U2 ( .A(S), .Y(n1) );
  AO22X2 U3 ( .A0(B[7]), .A1(n1), .B0(A[7]), .B1(n2), .Y(Y[7]) );
  AO22X2 U4 ( .A0(B[6]), .A1(n1), .B0(A[6]), .B1(n2), .Y(Y[6]) );
  AO22X2 U5 ( .A0(B[5]), .A1(n1), .B0(A[5]), .B1(n2), .Y(Y[5]) );
  AO22X2 U6 ( .A0(B[4]), .A1(n1), .B0(A[4]), .B1(n2), .Y(Y[4]) );
  AO22X2 U7 ( .A0(B[3]), .A1(n1), .B0(A[3]), .B1(n2), .Y(Y[3]) );
  AO22X2 U8 ( .A0(B[2]), .A1(n1), .B0(A[2]), .B1(n2), .Y(Y[2]) );
  AO22X2 U9 ( .A0(B[1]), .A1(n1), .B0(A[1]), .B1(n2), .Y(Y[1]) );
  AO22X2 U10 ( .A0(B[0]), .A1(n1), .B0(A[0]), .B1(n2), .Y(Y[0]) );
  AO22X2 U11 ( .A0(n1), .A1(B[8]), .B0(A[8]), .B1(n2), .Y(Y[8]) );
endmodule


module MUX2_2 ( A, B, S, Y );
  input [8:0] A;
  input [8:0] B;
  output [8:0] Y;
  input S;
  wire   n1, n2;

  CLKINVX2 U1 ( .A(n1), .Y(n2) );
  CLKBUFX3 U2 ( .A(S), .Y(n1) );
  AO22X2 U3 ( .A0(B[7]), .A1(n1), .B0(A[7]), .B1(n2), .Y(Y[7]) );
  AO22X2 U4 ( .A0(B[6]), .A1(n1), .B0(A[6]), .B1(n2), .Y(Y[6]) );
  AO22X2 U5 ( .A0(B[5]), .A1(n1), .B0(A[5]), .B1(n2), .Y(Y[5]) );
  AO22X2 U6 ( .A0(B[4]), .A1(n1), .B0(A[4]), .B1(n2), .Y(Y[4]) );
  AO22X2 U7 ( .A0(B[3]), .A1(n1), .B0(A[3]), .B1(n2), .Y(Y[3]) );
  AO22X2 U8 ( .A0(B[2]), .A1(n1), .B0(A[2]), .B1(n2), .Y(Y[2]) );
  AO22X2 U9 ( .A0(B[1]), .A1(n1), .B0(A[1]), .B1(n2), .Y(Y[1]) );
  AO22X2 U10 ( .A0(B[0]), .A1(n1), .B0(A[0]), .B1(n2), .Y(Y[0]) );
  AO22X2 U11 ( .A0(n1), .A1(B[8]), .B0(A[8]), .B1(n2), .Y(Y[8]) );
endmodule


module MUX2_1 ( A, B, S, Y );
  input [8:0] A;
  input [8:0] B;
  output [8:0] Y;
  input S;
  wire   n1, n2;

  CLKINVX2 U1 ( .A(n1), .Y(n2) );
  CLKBUFX3 U2 ( .A(S), .Y(n1) );
  AO22X2 U3 ( .A0(B[7]), .A1(n1), .B0(A[7]), .B1(n2), .Y(Y[7]) );
  AO22X2 U4 ( .A0(B[6]), .A1(n1), .B0(A[6]), .B1(n2), .Y(Y[6]) );
  AO22X2 U5 ( .A0(B[5]), .A1(n1), .B0(A[5]), .B1(n2), .Y(Y[5]) );
  AO22X2 U6 ( .A0(B[4]), .A1(n1), .B0(A[4]), .B1(n2), .Y(Y[4]) );
  AO22X2 U7 ( .A0(B[3]), .A1(n1), .B0(A[3]), .B1(n2), .Y(Y[3]) );
  AO22X2 U8 ( .A0(B[2]), .A1(n1), .B0(A[2]), .B1(n2), .Y(Y[2]) );
  AO22X2 U9 ( .A0(B[1]), .A1(n1), .B0(A[1]), .B1(n2), .Y(Y[1]) );
  AO22X2 U10 ( .A0(B[0]), .A1(n1), .B0(A[0]), .B1(n2), .Y(Y[0]) );
  AO22X2 U11 ( .A0(n1), .A1(B[8]), .B0(A[8]), .B1(n2), .Y(Y[8]) );
endmodule


module Mul_DW_mult_tc_0 ( a, b, product );
  input [8:0] a;
  input [8:0] b;
  output [17:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n18, n19, n20, n21, n23, n24,
         n25, n26, n27, n28, n29, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n73, n74, n78, n79, n80, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n113, n114, n115, n116, n117, n118, n119, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354;

  ADDFX1 U5 ( .A(n28), .B(n26), .CI(n5), .CO(n4), .S(product[13]) );
  ADDFX1 U8 ( .A(n39), .B(n45), .CI(n8), .CO(n7), .S(product[10]) );
  ADDFX1 U9 ( .A(n46), .B(n52), .CI(n9), .CO(n8), .S(product[9]) );
  CMPR42X2 U22 ( .A(n275), .B(n79), .C(n93), .D(n85), .ICI(n27), .S(n26), 
        .ICO(n24), .CO(n25) );
  CMPR42X2 U23 ( .A(n94), .B(n86), .C(n31), .D(n35), .ICI(n32), .S(n29), .ICO(
        n27), .CO(n28) );
  CMPR42X2 U25 ( .A(n95), .B(n87), .C(n36), .D(n40), .ICI(n37), .S(n34), .ICO(
        n32), .CO(n33) );
  ADDFX1 U26 ( .A(n80), .B(n276), .CI(n103), .CO(n35), .S(n36) );
  CMPR42X2 U27 ( .A(n104), .B(n96), .C(n47), .D(n41), .ICI(n44), .S(n39), 
        .ICO(n37), .CO(n38) );
  ADDFX1 U28 ( .A(n88), .B(n49), .CI(n43), .CO(n40), .S(n41) );
  CMPR42X2 U30 ( .A(n97), .B(n50), .C(n54), .D(n48), .ICI(n51), .S(n46), .ICO(
        n44), .CO(n45) );
  ADDFX1 U31 ( .A(n105), .B(n113), .CI(n89), .CO(n47), .S(n48) );
  CMPR42X2 U34 ( .A(n106), .B(n90), .C(n56), .D(n59), .ICI(n55), .S(n53), 
        .ICO(n51), .CO(n52) );
  ADDFX1 U35 ( .A(n98), .B(n82), .CI(n114), .CO(n54), .S(n55) );
  CMPR42X2 U36 ( .A(n115), .B(n99), .C(n107), .D(n61), .ICI(n60), .S(n58), 
        .ICO(n56), .CO(n57) );
  ADDHX1 U37 ( .A(n91), .B(n73), .CO(n59), .S(n60) );
  CMPR42X2 U38 ( .A(n92), .B(n116), .C(n108), .D(n100), .ICI(n66), .S(n63), 
        .ICO(n61), .CO(n62) );
  ADDFX1 U39 ( .A(n109), .B(n117), .CI(n67), .CO(n64), .S(n65) );
  ADDHX1 U40 ( .A(n101), .B(n74), .CO(n66), .S(n67) );
  NAND2X4 U188 ( .A(n287), .B(n351), .Y(n268) );
  OAI22X1 U189 ( .A0(n288), .A1(n325), .B0(n326), .B1(n290), .Y(n118) );
  CLKINVX6 U190 ( .A(n331), .Y(n288) );
  NAND2BX1 U191 ( .AN(n347), .B(n68), .Y(n260) );
  CLKXOR2X4 U192 ( .A(b[3]), .B(n289), .Y(n325) );
  CLKINVX6 U193 ( .A(n303), .Y(n284) );
  BUFX2 U194 ( .A(n350), .Y(n251) );
  NOR3X1 U195 ( .A(n289), .B(b[1]), .C(n354), .Y(n352) );
  BUFX4 U196 ( .A(n287), .Y(n272) );
  CLKNAND2X2 U197 ( .A(n285), .B(n69), .Y(n265) );
  NOR3XL U198 ( .A(n273), .B(n278), .C(n277), .Y(n252) );
  CLKINVX1 U199 ( .A(n252), .Y(n318) );
  NAND2BX1 U200 ( .AN(n347), .B(n65), .Y(n259) );
  OAI21XL U201 ( .A0(n341), .A1(n351), .B0(n340), .Y(n103) );
  CLKNAND2X2 U202 ( .A(n285), .B(n70), .Y(n266) );
  CLKNAND2X4 U203 ( .A(n284), .B(n344), .Y(n269) );
  CLKNAND2X2 U204 ( .A(n68), .B(n65), .Y(n261) );
  OAI21XL U205 ( .A0(n253), .A1(n303), .B0(n302), .Y(n93) );
  CLKINVX1 U206 ( .A(n269), .Y(n253) );
  OAI21XL U207 ( .A0(n254), .A1(n313), .B0(n312), .Y(n83) );
  CLKINVX1 U208 ( .A(n270), .Y(n254) );
  CLKINVX4 U209 ( .A(a[3]), .Y(n286) );
  AOI2BB2X2 U210 ( .B0(n292), .B1(n331), .A0N(n324), .A1N(n290), .Y(n354) );
  CLKINVX4 U211 ( .A(a[0]), .Y(n290) );
  NOR2X4 U212 ( .A(n289), .B(a[0]), .Y(n331) );
  CLKINVX4 U213 ( .A(a[1]), .Y(n289) );
  OAI22X1 U214 ( .A0(n334), .A1(n268), .B0(n272), .B1(n335), .Y(n109) );
  CLKXOR2X2 U215 ( .A(b[2]), .B(n289), .Y(n324) );
  NAND3X2 U216 ( .A(n258), .B(n257), .C(n256), .Y(n2) );
  OAI22X2 U217 ( .A0(n324), .A1(n288), .B0(n325), .B1(n290), .Y(n119) );
  ADDFX1 U218 ( .A(n23), .B(n84), .CI(n24), .CO(n20), .S(n21) );
  NOR2XL U219 ( .A(n354), .B(n272), .Y(n353) );
  AND3X1 U220 ( .A(n265), .B(n266), .C(n267), .Y(n347) );
  ADDFX1 U221 ( .A(n78), .B(n274), .CI(n83), .CO(n18), .S(n19) );
  CLKNAND2X2 U222 ( .A(n3), .B(n20), .Y(n256) );
  CLKNAND2X2 U223 ( .A(n3), .B(n19), .Y(n257) );
  CLKNAND2X2 U224 ( .A(n20), .B(n19), .Y(n258) );
  OAI222X1 U225 ( .A0(n345), .A1(n279), .B0(n345), .B1(n281), .C0(n281), .C1(
        n279), .Y(n10) );
  CLKINVX1 U226 ( .A(n62), .Y(n281) );
  CLKINVX1 U227 ( .A(n58), .Y(n279) );
  CLKXOR2X4 U228 ( .A(n3), .B(n255), .Y(product[15]) );
  CLKXOR2X2 U229 ( .A(n20), .B(n19), .Y(n255) );
  ADDFHX2 U230 ( .A(n21), .B(n25), .CI(n4), .CO(n3), .S(product[14]) );
  XOR3X4 U231 ( .A(n2), .B(n18), .C(n293), .Y(product[16]) );
  OAI22X2 U232 ( .A0(n332), .A1(n268), .B0(n272), .B1(n333), .Y(n111) );
  CLKNAND2X2 U233 ( .A(n346), .B(n64), .Y(n262) );
  CLKNAND2X2 U234 ( .A(n346), .B(n63), .Y(n263) );
  AND3X1 U235 ( .A(n262), .B(n263), .C(n264), .Y(n345) );
  NAND3X2 U236 ( .A(n259), .B(n260), .C(n261), .Y(n346) );
  ADDFX1 U237 ( .A(n118), .B(n102), .CI(n110), .CO(n68), .S(n69) );
  NOR2XL U238 ( .A(n284), .B(n291), .Y(n102) );
  CLKNAND2X2 U239 ( .A(n63), .B(n64), .Y(n264) );
  OAI22X1 U240 ( .A0(n342), .A1(n269), .B0(n284), .B1(n343), .Y(n101) );
  CLKNAND2X2 U241 ( .A(n70), .B(n69), .Y(n267) );
  CLKXOR2X2 U242 ( .A(b[4]), .B(n289), .Y(n326) );
  INVX2 U243 ( .A(n348), .Y(n285) );
  ADDHX4 U244 ( .A(n119), .B(n111), .CO(n70), .S(n71) );
  CLKINVX2 U245 ( .A(n341), .Y(n287) );
  ADDFHX2 U246 ( .A(n53), .B(n57), .CI(n10), .CO(n9), .S(product[8]) );
  ADDFHX2 U247 ( .A(n33), .B(n29), .CI(n6), .CO(n5), .S(product[12]) );
  ADDFHX2 U248 ( .A(n34), .B(n38), .CI(n7), .CO(n6), .S(product[11]) );
  CLKNAND2X4 U249 ( .A(n271), .B(n317), .Y(n270) );
  CLKINVX1 U250 ( .A(b[1]), .Y(n292) );
  CLKINVX1 U251 ( .A(n273), .Y(n291) );
  CLKINVX2 U252 ( .A(n295), .Y(n277) );
  CLKBUFX3 U253 ( .A(b[0]), .Y(n273) );
  NOR2XL U254 ( .A(n271), .B(n291), .Y(n92) );
  CLKBUFX3 U255 ( .A(n282), .Y(n271) );
  CLKINVX1 U256 ( .A(n313), .Y(n282) );
  NOR2XL U257 ( .A(n277), .B(n291), .Y(n82) );
  XNOR2X2 U258 ( .A(b[2]), .B(n278), .Y(n321) );
  CLKINVX1 U259 ( .A(n43), .Y(n276) );
  NOR2XL U260 ( .A(n277), .B(n314), .Y(n80) );
  NOR2XL U261 ( .A(n277), .B(n315), .Y(n79) );
  CLKINVX1 U262 ( .A(n31), .Y(n275) );
  XNOR2X2 U263 ( .A(b[4]), .B(n278), .Y(n322) );
  XNOR2X2 U264 ( .A(b[6]), .B(n278), .Y(n323) );
  CLKINVX1 U265 ( .A(n23), .Y(n274) );
  NOR2XL U266 ( .A(n277), .B(n316), .Y(n78) );
  CLKINVX3 U267 ( .A(a[5]), .Y(n283) );
  CLKINVX3 U268 ( .A(a[7]), .Y(n280) );
  CLKINVX2 U269 ( .A(a[8]), .Y(n278) );
  AOI222X2 U270 ( .A0(n349), .A1(n71), .B0(n251), .B1(n349), .C0(n251), .C1(
        n71), .Y(n348) );
  OAI21XL U271 ( .A0(a[0]), .A1(n331), .B0(n330), .Y(n113) );
  CLKNAND2X2 U272 ( .A(n294), .B(n295), .Y(n293) );
  CLKXOR2X2 U273 ( .A(b[8]), .B(a[8]), .Y(n294) );
  OAI22X1 U274 ( .A0(n296), .A1(n269), .B0(n284), .B1(n297), .Y(n99) );
  OAI22X1 U275 ( .A0(n297), .A1(n269), .B0(n284), .B1(n298), .Y(n98) );
  CLKXOR2X2 U276 ( .A(b[3]), .B(n283), .Y(n297) );
  OAI22X1 U277 ( .A0(n298), .A1(n269), .B0(n284), .B1(n299), .Y(n97) );
  CLKXOR2X2 U278 ( .A(b[4]), .B(n283), .Y(n298) );
  OAI22X1 U279 ( .A0(n299), .A1(n269), .B0(n284), .B1(n300), .Y(n96) );
  CLKXOR2X2 U280 ( .A(b[5]), .B(n283), .Y(n299) );
  OAI22X1 U281 ( .A0(n300), .A1(n269), .B0(n284), .B1(n301), .Y(n95) );
  CLKXOR2X2 U282 ( .A(b[6]), .B(n283), .Y(n300) );
  OAI2B2X1 U283 ( .A1N(n302), .A0(n284), .B0(n301), .B1(n269), .Y(n94) );
  CLKXOR2X2 U284 ( .A(b[7]), .B(n283), .Y(n301) );
  CLKXOR2X2 U285 ( .A(b[8]), .B(a[5]), .Y(n302) );
  OAI22X1 U286 ( .A0(n304), .A1(n270), .B0(n271), .B1(n305), .Y(n91) );
  CLKXOR2X2 U287 ( .A(n273), .B(n280), .Y(n304) );
  OAI22X1 U288 ( .A0(n305), .A1(n270), .B0(n271), .B1(n306), .Y(n90) );
  CLKXOR2X2 U289 ( .A(b[1]), .B(n280), .Y(n305) );
  OAI22X1 U290 ( .A0(n306), .A1(n270), .B0(n271), .B1(n307), .Y(n89) );
  CLKXOR2X2 U291 ( .A(b[2]), .B(n280), .Y(n306) );
  OAI22X1 U292 ( .A0(n307), .A1(n270), .B0(n271), .B1(n308), .Y(n88) );
  CLKXOR2X2 U293 ( .A(b[3]), .B(n280), .Y(n307) );
  OAI22X1 U294 ( .A0(n308), .A1(n270), .B0(n271), .B1(n309), .Y(n87) );
  CLKXOR2X2 U295 ( .A(b[4]), .B(n280), .Y(n308) );
  OAI22X1 U296 ( .A0(n309), .A1(n270), .B0(n271), .B1(n310), .Y(n86) );
  CLKXOR2X2 U297 ( .A(b[5]), .B(n280), .Y(n309) );
  OAI22X1 U298 ( .A0(n310), .A1(n270), .B0(n271), .B1(n311), .Y(n85) );
  CLKXOR2X2 U299 ( .A(b[6]), .B(n280), .Y(n310) );
  OAI2B2X1 U300 ( .A1N(n312), .A0(n271), .B0(n311), .B1(n270), .Y(n84) );
  CLKXOR2X2 U301 ( .A(b[7]), .B(n280), .Y(n311) );
  CLKXOR2X2 U302 ( .A(b[8]), .B(a[7]), .Y(n312) );
  CLKXOR2X2 U303 ( .A(b[3]), .B(n278), .Y(n314) );
  CLKXOR2X2 U304 ( .A(b[5]), .B(n278), .Y(n315) );
  CLKXOR2X2 U305 ( .A(b[7]), .B(n278), .Y(n316) );
  OAI32X1 U306 ( .A0(n283), .A1(n273), .A2(n284), .B0(n283), .B1(n269), .Y(n74) );
  OAI32X1 U307 ( .A0(n280), .A1(n273), .A2(n271), .B0(n280), .B1(n270), .Y(n73) );
  CLKXOR2X2 U308 ( .A(a[7]), .B(a[6]), .Y(n317) );
  CLKXOR2X2 U309 ( .A(a[6]), .B(a[5]), .Y(n313) );
  XNOR2X2 U310 ( .A(n318), .B(n319), .Y(n50) );
  CLKNAND2X2 U311 ( .A(n319), .B(n318), .Y(n49) );
  CLKNAND2X2 U312 ( .A(n320), .B(n295), .Y(n319) );
  CLKXOR2X2 U313 ( .A(n292), .B(n278), .Y(n320) );
  CLKNAND2X2 U314 ( .A(n321), .B(n295), .Y(n43) );
  CLKNAND2X2 U315 ( .A(n322), .B(n295), .Y(n31) );
  CLKNAND2X2 U316 ( .A(n323), .B(n295), .Y(n23) );
  CLKXOR2X2 U317 ( .A(n278), .B(n280), .Y(n295) );
  OAI22X1 U318 ( .A0(n326), .A1(n288), .B0(n327), .B1(n290), .Y(n117) );
  OAI22X1 U319 ( .A0(n327), .A1(n288), .B0(n328), .B1(n290), .Y(n116) );
  CLKXOR2X2 U320 ( .A(b[5]), .B(n289), .Y(n327) );
  OAI22X1 U321 ( .A0(n328), .A1(n288), .B0(n329), .B1(n290), .Y(n115) );
  CLKXOR2X2 U322 ( .A(b[6]), .B(n289), .Y(n328) );
  OAI2B2X1 U323 ( .A1N(n330), .A0(n290), .B0(n329), .B1(n288), .Y(n114) );
  CLKXOR2X2 U324 ( .A(b[7]), .B(n289), .Y(n329) );
  CLKXOR2X2 U325 ( .A(b[8]), .B(a[1]), .Y(n330) );
  CLKXOR2X2 U326 ( .A(n273), .B(n286), .Y(n332) );
  OAI22X1 U327 ( .A0(n333), .A1(n268), .B0(n272), .B1(n334), .Y(n110) );
  CLKXOR2X2 U328 ( .A(b[1]), .B(n286), .Y(n333) );
  CLKXOR2X2 U329 ( .A(b[2]), .B(n286), .Y(n334) );
  OAI22X1 U330 ( .A0(n335), .A1(n268), .B0(n272), .B1(n336), .Y(n108) );
  CLKXOR2X2 U331 ( .A(b[3]), .B(n286), .Y(n335) );
  OAI22X1 U332 ( .A0(n336), .A1(n268), .B0(n272), .B1(n337), .Y(n107) );
  CLKXOR2X2 U333 ( .A(b[4]), .B(n286), .Y(n336) );
  OAI22X1 U334 ( .A0(n337), .A1(n268), .B0(n272), .B1(n338), .Y(n106) );
  CLKXOR2X2 U335 ( .A(b[5]), .B(n286), .Y(n337) );
  OAI22X1 U336 ( .A0(n338), .A1(n268), .B0(n272), .B1(n339), .Y(n105) );
  CLKXOR2X2 U337 ( .A(b[6]), .B(n286), .Y(n338) );
  OAI2B2X1 U338 ( .A1N(n340), .A0(n272), .B0(n339), .B1(n268), .Y(n104) );
  CLKXOR2X2 U339 ( .A(b[7]), .B(n286), .Y(n339) );
  CLKXOR2X2 U340 ( .A(b[8]), .B(a[3]), .Y(n340) );
  CLKXOR2X2 U341 ( .A(n273), .B(n283), .Y(n342) );
  OAI22X1 U342 ( .A0(n343), .A1(n269), .B0(n284), .B1(n296), .Y(n100) );
  CLKXOR2X2 U343 ( .A(b[2]), .B(n283), .Y(n296) );
  CLKXOR2X2 U344 ( .A(a[5]), .B(a[4]), .Y(n344) );
  CLKXOR2X2 U345 ( .A(a[4]), .B(a[3]), .Y(n303) );
  CLKXOR2X2 U346 ( .A(b[1]), .B(n283), .Y(n343) );
  OAI32X1 U347 ( .A0(n286), .A1(n273), .A2(n272), .B0(n286), .B1(n268), .Y(
        n350) );
  CLKXOR2X2 U348 ( .A(a[3]), .B(a[2]), .Y(n351) );
  CLKMX2X3 U349 ( .A(n352), .B(n353), .S0(n273), .Y(n349) );
  CLKXOR2X2 U350 ( .A(a[2]), .B(a[1]), .Y(n341) );
endmodule


module Mul ( A, B, Mul );
  input [8:0] A;
  input [8:0] B;
  output [8:0] Mul;

  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8;

  Mul_DW_mult_tc_0 mult_7 ( .a(A), .b(B), .product({SYNOPSYS_UNCONNECTED__0, 
        Mul, SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, SYNOPSYS_UNCONNECTED__8}) );
endmodule


module Add_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  XOR3X2 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .Y(SUM[8]) );
  CLKAND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module Add ( A, B, Add );
  input [8:0] A;
  input [8:0] B;
  output [8:0] Add;


  Add_DW01_add_0 add_5 ( .A(A), .B(B), .CI(1'b0), .SUM(Add) );
endmodule


module ROM ( clk, addr, data );
  input [2:0] addr;
  output [8:0] data;
  input clk;
  wire   n3, n5, n6, n7, n8, n1, n4, n9, n10, n11;

  OAI21X6 U8 ( .A0(n10), .A1(n9), .B0(n8), .Y(data[3]) );
  NOR3X4 U14 ( .A(n11), .B(addr[2]), .C(addr[1]), .Y(data[1]) );
  OR2X1 U3 ( .A(n3), .B(n5), .Y(n1) );
  NAND3BX2 U4 ( .AN(n4), .B(n5), .C(n3), .Y(data[7]) );
  CLKINVX6 U5 ( .A(n1), .Y(data[5]) );
  NAND2X4 U6 ( .A(addr[2]), .B(addr[0]), .Y(n9) );
  CLKXOR2X4 U7 ( .A(addr[2]), .B(n11), .Y(n5) );
  AOI31X2 U9 ( .A0(n9), .A1(n10), .A2(n5), .B0(data[5]), .Y(n8) );
  NOR2XL U10 ( .A(addr[1]), .B(n9), .Y(n4) );
  CLKNAND2X2 U11 ( .A(addr[1]), .B(n9), .Y(n3) );
  CLKNAND2X2 U12 ( .A(n6), .B(n11), .Y(data[2]) );
  CLKNAND2X2 U13 ( .A(n3), .B(n9), .Y(data[8]) );
  CLKINVX1 U15 ( .A(addr[0]), .Y(n11) );
  CLKAND2X2 U16 ( .A(addr[2]), .B(n10), .Y(n6) );
  AO21X2 U17 ( .A0(n10), .A1(addr[0]), .B0(n7), .Y(data[4]) );
  OAI31X1 U18 ( .A0(addr[0]), .A1(addr[2]), .A2(n10), .B0(n9), .Y(n7) );
  OAI2BB1X2 U19 ( .A0N(n5), .A1N(addr[1]), .B0(n9), .Y(data[0]) );
  CLKINVX2 U20 ( .A(addr[1]), .Y(n10) );
  NOR2X2 U21 ( .A(addr[0]), .B(n6), .Y(data[6]) );
endmodule


module Register_3 ( D, reset, clk, load, Q );
  input [8:0] D;
  output [8:0] Q;
  input reset, clk, load;
  wire   n1, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20;

  DFFRQX1 \Q_reg[8]  ( .D(n12), .CK(clk), .RN(reset), .Q(Q[8]) );
  DFFRQX1 \Q_reg[7]  ( .D(n13), .CK(clk), .RN(reset), .Q(Q[7]) );
  DFFRQX1 \Q_reg[6]  ( .D(n14), .CK(clk), .RN(reset), .Q(Q[6]) );
  DFFRQX1 \Q_reg[5]  ( .D(n15), .CK(clk), .RN(reset), .Q(Q[5]) );
  DFFRQX1 \Q_reg[4]  ( .D(n16), .CK(clk), .RN(reset), .Q(Q[4]) );
  DFFRQX1 \Q_reg[3]  ( .D(n17), .CK(clk), .RN(reset), .Q(Q[3]) );
  DFFRQX1 \Q_reg[2]  ( .D(n18), .CK(clk), .RN(reset), .Q(Q[2]) );
  DFFRQX1 \Q_reg[1]  ( .D(n19), .CK(clk), .RN(reset), .Q(Q[1]) );
  DFFRQX1 \Q_reg[0]  ( .D(n20), .CK(clk), .RN(reset), .Q(Q[0]) );
  CLKINVX2 U2 ( .A(n11), .Y(n1) );
  CLKBUFX2 U3 ( .A(load), .Y(n11) );
  AO22X2 U4 ( .A0(Q[0]), .A1(n1), .B0(n11), .B1(D[0]), .Y(n20) );
  AO22X2 U5 ( .A0(Q[1]), .A1(n1), .B0(D[1]), .B1(n11), .Y(n19) );
  AO22X2 U6 ( .A0(Q[2]), .A1(n1), .B0(D[2]), .B1(n11), .Y(n18) );
  AO22X2 U7 ( .A0(Q[3]), .A1(n1), .B0(D[3]), .B1(n11), .Y(n17) );
  AO22X2 U8 ( .A0(Q[4]), .A1(n1), .B0(D[4]), .B1(load), .Y(n16) );
  AO22X2 U9 ( .A0(Q[5]), .A1(n1), .B0(D[5]), .B1(load), .Y(n15) );
  AO22X2 U10 ( .A0(Q[6]), .A1(n1), .B0(D[6]), .B1(load), .Y(n14) );
  AO22X2 U11 ( .A0(Q[7]), .A1(n1), .B0(D[7]), .B1(load), .Y(n13) );
  AO22X2 U12 ( .A0(Q[8]), .A1(n1), .B0(D[8]), .B1(n11), .Y(n12) );
endmodule


module Register_2 ( D, reset, clk, load, Q );
  input [8:0] D;
  output [8:0] Q;
  input reset, clk, load;
  wire   n1, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20;

  DFFRQX1 \Q_reg[8]  ( .D(n12), .CK(clk), .RN(reset), .Q(Q[8]) );
  DFFRQX1 \Q_reg[7]  ( .D(n13), .CK(clk), .RN(reset), .Q(Q[7]) );
  DFFRQX1 \Q_reg[6]  ( .D(n14), .CK(clk), .RN(reset), .Q(Q[6]) );
  DFFRQX1 \Q_reg[5]  ( .D(n15), .CK(clk), .RN(reset), .Q(Q[5]) );
  DFFRQX1 \Q_reg[4]  ( .D(n16), .CK(clk), .RN(reset), .Q(Q[4]) );
  DFFRQX1 \Q_reg[3]  ( .D(n17), .CK(clk), .RN(reset), .Q(Q[3]) );
  DFFRQX1 \Q_reg[2]  ( .D(n18), .CK(clk), .RN(reset), .Q(Q[2]) );
  DFFRQX1 \Q_reg[1]  ( .D(n19), .CK(clk), .RN(reset), .Q(Q[1]) );
  DFFRQX1 \Q_reg[0]  ( .D(n20), .CK(clk), .RN(reset), .Q(Q[0]) );
  CLKINVX2 U2 ( .A(n11), .Y(n1) );
  CLKBUFX2 U3 ( .A(load), .Y(n11) );
  AO22X2 U4 ( .A0(Q[0]), .A1(n1), .B0(n11), .B1(D[0]), .Y(n20) );
  AO22X2 U5 ( .A0(Q[1]), .A1(n1), .B0(D[1]), .B1(n11), .Y(n19) );
  AO22X2 U6 ( .A0(Q[2]), .A1(n1), .B0(D[2]), .B1(n11), .Y(n18) );
  AO22X2 U7 ( .A0(Q[3]), .A1(n1), .B0(D[3]), .B1(load), .Y(n17) );
  AO22X2 U8 ( .A0(Q[4]), .A1(n1), .B0(D[4]), .B1(n11), .Y(n16) );
  AO22X2 U9 ( .A0(Q[5]), .A1(n1), .B0(D[5]), .B1(n11), .Y(n15) );
  AO22X2 U10 ( .A0(Q[6]), .A1(n1), .B0(D[6]), .B1(n11), .Y(n14) );
  AO22X2 U11 ( .A0(Q[7]), .A1(n1), .B0(D[7]), .B1(n11), .Y(n13) );
  AO22X2 U12 ( .A0(Q[8]), .A1(n1), .B0(D[8]), .B1(n11), .Y(n12) );
endmodule


module Register_1 ( D, reset, clk, load, Q );
  input [8:0] D;
  output [8:0] Q;
  input reset, clk, load;
  wire   n1, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20;

  DFFRQX1 \Q_reg[8]  ( .D(n12), .CK(clk), .RN(reset), .Q(Q[8]) );
  DFFRQX1 \Q_reg[7]  ( .D(n13), .CK(clk), .RN(reset), .Q(Q[7]) );
  DFFRQX1 \Q_reg[6]  ( .D(n14), .CK(clk), .RN(reset), .Q(Q[6]) );
  DFFRQX1 \Q_reg[5]  ( .D(n15), .CK(clk), .RN(reset), .Q(Q[5]) );
  DFFRQX1 \Q_reg[4]  ( .D(n16), .CK(clk), .RN(reset), .Q(Q[4]) );
  DFFRQX1 \Q_reg[3]  ( .D(n17), .CK(clk), .RN(reset), .Q(Q[3]) );
  DFFRQX1 \Q_reg[2]  ( .D(n18), .CK(clk), .RN(reset), .Q(Q[2]) );
  DFFRQX1 \Q_reg[1]  ( .D(n19), .CK(clk), .RN(reset), .Q(Q[1]) );
  DFFRQX1 \Q_reg[0]  ( .D(n20), .CK(clk), .RN(reset), .Q(Q[0]) );
  CLKINVX2 U2 ( .A(n11), .Y(n1) );
  CLKBUFX2 U3 ( .A(load), .Y(n11) );
  AO22X2 U4 ( .A0(Q[0]), .A1(n1), .B0(n11), .B1(D[0]), .Y(n20) );
  AO22X2 U5 ( .A0(Q[1]), .A1(n1), .B0(D[1]), .B1(n11), .Y(n19) );
  AO22X2 U6 ( .A0(Q[2]), .A1(n1), .B0(D[2]), .B1(n11), .Y(n18) );
  AO22X2 U7 ( .A0(Q[3]), .A1(n1), .B0(D[3]), .B1(load), .Y(n17) );
  AO22X2 U8 ( .A0(Q[4]), .A1(n1), .B0(D[4]), .B1(n11), .Y(n16) );
  AO22X2 U9 ( .A0(Q[5]), .A1(n1), .B0(D[5]), .B1(n11), .Y(n15) );
  AO22X2 U10 ( .A0(Q[6]), .A1(n1), .B0(D[6]), .B1(n11), .Y(n14) );
  AO22X2 U11 ( .A0(Q[7]), .A1(n1), .B0(D[7]), .B1(n11), .Y(n13) );
  AO22X2 U12 ( .A0(Q[8]), .A1(n1), .B0(D[8]), .B1(n11), .Y(n12) );
endmodule


module Datapath ( inportR, inportG, inportB, control, clk, rst_n, outportY, 
        outportU, outportV, done );
  input [8:0] inportR;
  input [8:0] inportG;
  input [8:0] inportB;
  input [21:0] control;
  output [8:0] outportY;
  output [8:0] outportU;
  output [8:0] outportV;
  input clk, rst_n, done;
  wire   n1;
  wire   [8:0] M4_OUT;
  wire   [8:0] R1;
  wire   [8:0] M5_OUT;
  wire   [8:0] R2;
  wire   [8:0] M6_OUT;
  wire   [8:0] R3;
  wire   [8:0] M7_OUT;
  wire   [8:0] R4;
  wire   [8:0] M8_OUT;
  wire   [8:0] R5;
  wire   [8:0] M9_OUT;
  wire   [8:0] R6;
  wire   [8:0] M1_OUT;
  wire   [8:0] M2_OUT;
  wire   [8:0] M3_OUT;
  wire   [8:0] Fadd;
  wire   [8:0] Fmul;
  wire   [8:0] data;

  Register_0 r1 ( .D(M4_OUT), .reset(rst_n), .clk(clk), .load(control[21]), 
        .Q(R1) );
  Register_8 r2 ( .D(M5_OUT), .reset(rst_n), .clk(clk), .load(control[20]), 
        .Q(R2) );
  Register_7 r3 ( .D(M6_OUT), .reset(rst_n), .clk(clk), .load(control[19]), 
        .Q(R3) );
  Register_6 r4 ( .D(M7_OUT), .reset(rst_n), .clk(clk), .load(control[18]), 
        .Q(R4) );
  Register_5 r5 ( .D(M8_OUT), .reset(rst_n), .clk(clk), .load(control[17]), 
        .Q(R5) );
  Register_4 r6 ( .D(M9_OUT), .reset(rst_n), .clk(clk), .load(control[16]), 
        .Q(R6) );
  MUX3_0 M1 ( .A(R3), .B(R2), .C(R1), .S(control[12:11]), .Y(M1_OUT) );
  MUX4_0 M2 ( .A({1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .B(
        R5), .C(R4), .D(R1), .S(control[10:9]), .Y(M2_OUT) );
  MUX4_1 M3 ( .A(R6), .B(R3), .C(R2), .D(R5), .S(control[8:7]), .Y(M3_OUT) );
  MUX2_0 M4 ( .A(inportR), .B(Fadd), .S(control[6]), .Y(M4_OUT) );
  MUX3_1 M5 ( .A(inportG), .B(Fmul), .C(Fadd), .S(control[5:4]), .Y(M5_OUT) );
  MUX2_4 M6 ( .A(inportB), .B(Fadd), .S(control[3]), .Y(M6_OUT) );
  MUX2_3 M7 ( .A(Fmul), .B(Fadd), .S(control[2]), .Y(M7_OUT) );
  MUX2_2 M8 ( .A(Fmul), .B(Fadd), .S(control[1]), .Y(M8_OUT) );
  MUX2_1 M9 ( .A(Fmul), .B(Fadd), .S(control[0]), .Y(M9_OUT) );
  Mul FU1 ( .A(M1_OUT), .B(data), .Mul(Fmul) );
  Add FU2 ( .A(M2_OUT), .B(M3_OUT), .Add(Fadd) );
  ROM FU3 ( .clk(clk), .addr(control[15:13]), .data(data) );
  Register_3 r7 ( .D(R2), .reset(rst_n), .clk(clk), .load(n1), .Q(outportY) );
  Register_2 r9 ( .D(R1), .reset(rst_n), .clk(clk), .load(n1), .Q(outportU) );
  Register_1 r8 ( .D(R3), .reset(rst_n), .clk(clk), .load(n1), .Q(outportV) );
  CLKBUFX2 U3 ( .A(done), .Y(n1) );
endmodule


module RGB2YUV ( start, clk, rst_n, inportR, inportG, inportB, done, outportY, 
        outportU, outportV );
  input [8:0] inportR;
  input [8:0] inportG;
  input [8:0] inportB;
  output [8:0] outportY;
  output [8:0] outportU;
  output [8:0] outportV;
  input start, clk, rst_n;
  output done;

  wire   [21:0] control;

  Controller Controller ( .start(start), .rst_n(rst_n), .clk(clk), .done(done), 
        .control(control) );
  Datapath Datapath ( .inportR(inportR), .inportG(inportG), .inportB(inportB), 
        .control(control), .clk(clk), .rst_n(rst_n), .outportY(outportY), 
        .outportU(outportU), .outportV(outportV), .done(done) );
endmodule

