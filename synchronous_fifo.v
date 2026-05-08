module Synchronous_FIFO #(
parameter WIDTH = 8,
parameter DEPTH = 16
)(
input clk,
input rst_n,
input wr_en,
input rd_en,
input [WIDTH-1:0] data_in,
output reg [WIDTH-1:0] data_out,
output full,
output empty
);

reg [WIDTH-1:0] fifo [0:DEPTH-1];

reg [$clog2(DEPTH)-1:0] w_ptr;
reg [$clog2(DEPTH)-1:0] r_ptr;

reg [$clog2(DEPTH):0] count;

always @(posedge clk or negedge rst_n)
begin
if(!rst_n)
begin
w_ptr <= 0;
r_ptr <= 0;
count <= 0;
data_out <= 0;
end

else
begin

// Write Operation
if(wr_en && !full)
begin
fifo[w_ptr] <= data_in;
w_ptr <= (w_ptr + 1) % DEPTH;
count <= count + 1;
end

// Read Operation
if(rd_en && !empty)
begin
data_out <= fifo[r_ptr];
r_ptr <= (r_ptr + 1) % DEPTH;
count <= count - 1;
end

// Simultaneous Read & Write
if(wr_en && rd_en && !full && !empty)
begin
count <= count;
end

end
end

assign full = (count == DEPTH);
assign empty = (count == 0);

endmodule
