; Test

ORG     0x7c00          ; 시작주소

DB      0x01, 0x02      ; 2byte

RESB    0x7dfe-$        ; (0x7dfe - 0x7c00[ORG로 셋팅한 시작 주소]) - 2[지금까지 기록한 bytes]

DB      0x55, 0xaa