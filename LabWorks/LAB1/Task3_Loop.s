.global _start
_start:
MOV R0, #0
Loop1:
ADD R0, R0, #1
CMP R0, #4
BLT Loop1
MOV R1, #0
Loop2:
ADD R1, R1, #1
CMP R1, #3
BLT Loop2
end: B end
.end
