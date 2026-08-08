# Face Recognition Door Lock Using Verilog

## Description

This project implements a simple face-recognition-based door lock controller using Verilog HDL.

The simulated face recognition module provides a face-match signal to the door controller. When a recognized face is detected, access is granted and the door is unlocked. When the face is not recognized, the door remains locked.

> Note: This project models the output of a face-recognition system using a digital `face_match` signal. The actual image-processing/face-recognition algorithm is outside the Verilog RTL simulation.

## Features

- Face match detection interface
- Automatic door unlock
- Access granted signal
- Unknown-face rejection
- Reset functionality
- Verilog testbench
- Waveform simulation

## Working Principle

```text
       Face Recognition
              |
              v
       +--------------+
       | Face Match   |
       | Signal       |
       +------+-------+
              |
        +-----+-----+
        |           |
       YES          NO
        |           |
        v           v
     UNLOCK        LOCK
        |           |
        v           v
   Access Granted  Access Denied
```

## Inputs

| Signal | Description |
|---|---|
| `clk` | System clock |
| `reset` | Resets the door to locked state |
| `face_match` | Indicates whether the face is recognized |

## Outputs

| Signal | Description |
|---|---|
| `door_unlock` | Controls the door lock |
| `access_granted` | Indicates successful authentication |

## Truth Table

| Face Match | Door Unlock | Access |
|---|---|---|
| 0 | 0 | 0 |
| 1 | 1 | 1 |

## Project Structure

```text
face-recognition-door-lock/
│
├── face_door_lock.v
├── face_door_lock_tb.v
├── README.md
├── waveform.vcd
└── simulation.png
```

## Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- Visual Studio Code
- GitHub

## Simulation

### Compile

```bash
iverilog -o face_door_lock face_door_lock.v face_door_lock_tb.v
```

### Run

```bash
vvp face_door_lock
```

### View Waveform

```bash
gtkwave waveform.vcd
```

## Expected Output

```text
Face Match = 0 → Door Locked → Access Denied

Face Match = 1 → Door Unlocked → Access Granted

Face Match = 0 → Door Locked → Access Denied

Face Match = 1 → Door Unlocked → Access Granted
```

## Applications

- Smart home access control
- Office entry systems
- Laboratory security
- Restricted-area access
- Automated door systems

## Future Enhancement

The project can be extended by connecting the controller to an actual face-recognition module, adding a password/RFID backup, access logging, and alarm functionality.

## Author

**Dasari Bhargavi**

B.Tech ECE