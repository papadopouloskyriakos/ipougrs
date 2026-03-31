# IPoUGRS VoIP/SIP Extension

A SIP/VoIP implementation path via Asterisk extends IPoUGRS to
software-defined telephony infrastructure, removing the hardware
dependency on physical SIM cards.

## Concept

Instead of physical SIM800L modules making and receiving calls,
a SIP server (Asterisk) generates and detects SIP INVITE messages
without establishing audio sessions. The ring signal is emulated
at the SIP layer.

## Implementation path

1. Asterisk AGI script to generate ring sequences
2. SIP INVITE → ring present = 1
3. SIP CANCEL before answer → ring absent = 0
4. Timing synchronized via NTP
5. Throughput: limited by SIP signalling overhead (~50-100ms/msg)

## Advantages over hardware

- No physical SIM cards needed
- Unlimited parallel channels (SIP trunk capacity)
- Lower latency (SIP signalling faster than GSM ring propagation)
- Software-only deployment

## Disadvantages

- Requires SIP infrastructure (not available in field/disaster)
- Carrier may detect and block high-frequency SIP INVITE patterns
- Loses the "invisible to carrier data monitoring" property

Status: planned — not yet implemented.
