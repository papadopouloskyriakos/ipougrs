# IPoUGRS Software Implementation

## Reference Implementation

The IPoUGRS gateway is implemented as a bearer type in MeshSat:
https://github.com/cubeos-app/meshsat

### MeshSat Integration

IPoUGRS is registered as a channel descriptor in:
`internal/channel/defaults.go`

```
ID:            "ipougrs"
Label:         "IPoUGRS (GSM Ring Signal)"
IsPaid:        false
CanSend:       true
CanReceive:    true
BinaryCapable: true
MaxPayload:    1    (1 byte per slot)
```

### Gateway Implementation

TODO: `internal/gateway/ipougrs_gateway.go`

The gateway will manage SIM800L modules via serial AT commands:
- TX: ATD<number>; (initiate call) / ATH (hang up)
- RX: monitor RING URC on UART
- Timing: configurable bit period (default 640ms)
- Parallel channels: 1 per SIM800L module
