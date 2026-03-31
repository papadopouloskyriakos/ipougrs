# IPoUGRS Hardware Implementation

## Two-node PoC Architecture

### Node A (TX bank) — 16x SIM800L
Initiates calls to Node B's 16 numbers.
Ring = transmit bit 1.
Silence = transmit bit 0.
Timing: one bit per ring cycle (~640ms on NL VoLTE).

### Node B (RX bank) — 16x SIM800L
Monitors incoming calls without answering.
Detects ring = receive bit 1.
Detects silence timeout = receive bit 0.

### Effective throughput
1 bit/cycle x 16 parallel channels = 16 bits/cycle = 2 bytes/cycle
At ~1,6 bps per channel: ~25,6 bps aggregate (theoretical)
Practical: lower due to timing jitter and carrier delays

### Power supply
LM2596 buck converter set to 4,0V per bank.
2x LM2596 per 16-module node (7A peak headroom).
12V 15A PSU per node.

**CRITICAL:** Set LM2596 output to 4,0V BEFORE connecting any SIM800L.
The module's absolute max is 4,4V. Default LM2596 output is 12V — this
will destroy the SIM800L instantly.

### Wiring per module
```
LM2596 4,0V → SIM800L VCC + GND
CP2102 TXD  → SIM800L RXD
CP2102 RXD  → SIM800L TXD
CP2102 GND  → SIM800L GND
CP2102 USB  → USB hub port
```

### SIM activation
Test one SIM before activating all 32:
- Make one outgoing call to activate
- Verify it receives calls (some carriers require this)
- Lebara/KPN confirmed to support unanswered incoming calls
