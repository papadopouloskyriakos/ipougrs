# IPoUGRS Timing Analysis

## GSM Ring Cycle

Standard GSM ring pattern: 2s ring, 4s silence = 6s cycle.
VoLTE ring pattern: varies by carrier, typically 2-3s cycle.

## NL Carrier Behaviour (Lebara/KPN)

- Lebara (KPN MVNO): VoLTE supported on compatible handsets
- Ring detected within ~640ms of INVITE on VoLTE
- Unanswered calls: no charge to either party
- Caller ID suppression: not required (both ends are ours)
- Maximum concurrent calls from single IMSI: 1
- Maximum concurrent incoming to single IMSI: 1 (parallel via SIM bank)

## Bit Encoding Timing

| Phase | Duration | Notes |
|---|---|---|
| Call setup (SIP INVITE → ring) | ~300-800ms | VoLTE |
| Ring detection window | 640ms | One bit period |
| Silence detection timeout | 1.000ms | Confirms bit=0 |
| Inter-bit guard | 200ms | Prevents overlap |
| **Effective bit rate** | ~1,6 bps | Per channel |

## Throughput Calculation

- 1 channel: ~1,6 bps
- 8 channels (1 byte): ~12,8 bps
- 16 channels (2 bytes): ~25,6 bps theoretical
- Practical: ~60-70% of theoretical due to jitter
