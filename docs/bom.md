# IPoUGRS Hardware BOM

## Bill of Materials

| Component | Qty | Unit price | Total | Source |
|---|---|---|---|---|
| SIM800L GSM module | 34 | EUR 2,89 | EUR 98 | AliExpress |
| CP2102 USB-UART | 34 | EUR 1,84 | EUR 63 | AliExpress |
| 12-port USB hub | 4 | EUR 10,39 | EUR 42 | AliExpress |
| Perfboard 5,2x17,3cm | 5 sets | EUR 3,89 | EUR 19 | AliExpress |
| LM2596 buck converter | 10 | EUR 1,60 | EUR 16 | AliExpress |
| 12V 15A PSU | 2 | EUR 11,99 | EUR 24 | AliExpress |
| Lebara prepaid SIM | 36 | EUR 2,47 | EUR 89 | Bol.com |
| **Total** | | | **EUR 351** | |

## Power Notes

SIM800L peaks at 2A during TX burst. Set LM2596 output to 4,0V
**before** connecting any module.

16 modules per node at 216mA average = ~3,5A sustained per node.
Two LM2596 per node provide 7A peak headroom.
