`timescale 1ns/1ps

module face_door_lock_tb;

reg clk;
reg reset;
reg face_match;

wire door_unlock;
wire access_granted;

face_door_lock uut (
    .clk(clk),
    .reset(reset),
    .face_match(face_match),
    .door_unlock(door_unlock),
    .access_granted(access_granted)
);

// Clock
always #5 clk = ~clk;

initial begin

    // Create waveform
    $dumpfile("waveform.vcd");
    $dumpvars(0, face_door_lock_tb);

    clk = 0;
    reset = 1;
    face_match = 0;

    // -----------------------------
    // Reset
    // -----------------------------

    #10;

    reset = 0;

    // -----------------------------
    // Test 1: Unknown Face
    // -----------------------------

    face_match = 0;

    #10;

    $display(
        "Time=%0t | Face Match=%b | Door Unlock=%b | Access=%b",
        $time,
        face_match,
        door_unlock,
        access_granted
    );

    // -----------------------------
    // Test 2: Recognized Face
    // -----------------------------

    face_match = 1;

    #10;

    $display(
        "Time=%0t | Face Match=%b | Door Unlock=%b | Access=%b",
        $time,
        face_match,
        door_unlock,
        access_granted
    );

    // -----------------------------
    // Test 3: Unknown Face
    // -----------------------------

    face_match = 0;

    #10;

    $display(
        "Time=%0t | Face Match=%b | Door Unlock=%b | Access=%b",
        $time,
        face_match,
        door_unlock,
        access_granted
    );

    // -----------------------------
    // Test 4: Recognized Face
    // -----------------------------

    face_match = 1;

    #10;

    $display(
        "Time=%0t | Face Match=%b | Door Unlock=%b | Access=%b",
        $time,
        face_match,
        door_unlock,
        access_granted
    );

    #10;

    $finish;

end

endmodule