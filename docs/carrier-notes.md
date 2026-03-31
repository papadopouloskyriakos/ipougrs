# IPoUGRS Carrier Notes

## Netherlands (NL)

### Lebara (KPN MVNO)
- Prepaid voice-only SIM: EUR 2,47 at Bol.com
- Activation: make one outgoing call
- Incoming calls: free (unanswered)
- VoLTE: supported on compatible devices
- SIM800L compatibility: confirmed (2G fallback)
- Top-up: not required for incoming-only use
- SIM validity: 13 months without top-up

### KPN (host MNO)
- Same network as Lebara
- Ring behaviour identical
- Higher SIM cost — use Lebara for PoC

## SIM Activation Procedure

1. Insert SIM in any phone
2. Make one outgoing call (activates voice service)
3. Verify incoming call works (ring detected)
4. Move SIM to SIM800L module
5. Verify AT+CREG? returns 0,1 (registered, home network)

## Important: Test One SIM First

Before activating all 36 SIMs, test the full cycle with one:
- SIM in phone → activate → call from another phone → confirm ring
- SIM in SIM800L → AT+CREG? → AT+CLCC during incoming call
- Confirm RING URC appears on UART
