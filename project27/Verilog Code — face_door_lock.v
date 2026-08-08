module face_door_lock (
    input  wire clk,
    input  wire reset,
    input  wire face_match,

    output reg  door_unlock,
    output reg  access_granted
);

always @(posedge clk or posedge reset) begin

    if (reset) begin
        door_unlock   <= 1'b0;
        access_granted <= 1'b0;
    end

    else begin

        if (face_match) begin
            door_unlock    <= 1'b1;
            access_granted <= 1'b1;
        end

        else begin
            door_unlock    <= 1'b0;
            access_granted <= 1'b0;
        end

    end

end

endmodule