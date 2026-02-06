.global _start
_start:
MOV R0, #64
MOV R1, #3
STR R1, [R0]
LDR R2, [R0]
end: B end
.end