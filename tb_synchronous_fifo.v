module tb_Synchronous_FIFO;

parameter WIDTH = 8;
parameter DEPTH = 16;

reg clk;
reg rst_n;
reg wr_en;
reg rd_en;
reg [WIDTH-1:0] data_in;

wire [WIDTH-1:0] data_out;
wire full;
wire empty;

integer i;

Synchronous_FIFO #(WIDTH, DEPTH) uut (
.clk(clk),
.rst_n(rst_n),
.wr_en(wr_en),
.rd_en(rd_en),
.data_in(data_in),
.data_out(data_out),
.full(full),
.empty(empty)
);

always #5 clk = ~clk;

initial
begin

clk = 0;
rst_n = 0;
wr_en = 0;
rd_en = 0;
data_in = 0;

#10 rst_n = 1;



// TC01 : Single Write
#10;
wr_en = 1;
data_in = 8'hAA;
#10;
wr_en = 0;



// TC02 : Single Read
#10;
rd_en = 1;
#10;
rd_en = 0;



// TC03 : Full Condition
#10;
for(i=0; i<DEPTH; i=i+1)
begin
wr_en = 1;
data_in = i;
#10;
end
wr_en = 0;



// TC04 : Empty Condition
#10;
for(i=0; i<DEPTH; i=i+1)
begin
rd_en = 1;
#10;
end
rd_en = 0;



// TC05 : Single Element Write/Read
#10;
wr_en = 1;
data_in = 8'h55;
#10;
wr_en = 0;

#10;
rd_en = 1;
#10;
rd_en = 0;



// TC06 : Multiple Writes
#10;
for(i=0; i<8; i=i+1)
begin
wr_en = 1;
data_in = i + 8'h10;
#10;
end
wr_en = 0;



// TC07 : Multiple Reads
#10;
for(i=0; i<8; i=i+1)
begin
rd_en = 1;
#10;
end
rd_en = 0;



// TC08 : Wrap Around Test
#10;

for(i=0; i<DEPTH; i=i+1)
begin
wr_en = 1;
data_in = i;
#10;
end

wr_en = 0;

for(i=0; i<4; i=i+1)
begin
rd_en = 1;
#10;
end

rd_en = 0;

for(i=16; i<20; i=i+1)
begin
wr_en = 1;
data_in = i;
#10;
end

wr_en = 0;



// TC09 : Simultaneous Read/Write
#10;

wr_en = 1;
rd_en = 1;
data_in = 8'hBA;

#10;

wr_en = 0;
rd_en = 0;



// TC10 : Reset Functionality
#10;

wr_en = 1;
data_in = 8'h99;

#10;

wr_en = 0;

#10;

rst_n = 0;

#10;

rst_n = 1;



// TC11 : Speed Test
#10;

for(i=0; i<10; i=i+1)
begin
wr_en = 1;
data_in = i;
#10;
end

wr_en = 0;

for(i=0; i<10; i=i+1)
begin
rd_en = 1;
#10;
end

rd_en = 0;



// TC12 : Long Duration Test
#10;

for(i=0; i<32; i=i+1)
begin

wr_en = 1;
data_in = i;

#10;

wr_en = 0;
rd_en = 1;

#10;

rd_en = 0;

end



// TC13 : Overflow Test
#10;

for(i=0; i<DEPTH+4; i=i+1)
begin
wr_en = 1;
data_in = i;
#10;
end

wr_en = 0;



// TC14 : Underflow Test
#10;

rst_n = 0;
#10;
rst_n = 1;

#10;

rd_en = 1;

#20;

rd_en = 0;



#50;
$finish;

end

endmodule
