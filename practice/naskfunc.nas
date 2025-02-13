; naskfunc
; TAB=4

[FORMAT "WCOFF"]		; 오브젝트 파일을 만드는 모드	
[INSTRSET "i486p"]		; 486명령어 사용
[BITS 32]				; 32 비트 모드용의 기계어를 만든다
[FILE "naskfunc.nas"]	; 원시 파일명 정보

		GLOBAL	_io_hlt, _io_cli, _io_sti, _io_stihlt
		GLOBAL	_io_in8, _io_in16, _io_in32
		GLOBAL	_io_out8, _io_out16, _io_out32
		GLOBAL	_io_load_eflags, _io_store_eflags

[SECTION .text]	; 오브젝트 파일에서는 이것을 쓰고 나서 프로그램을 쓴다

_io_hlt:	; void io_hlt(void);
		HLT
		RET

_io_cli:	; void io_cli(void);
		CLI
		RET

_io_sti:	; void io_sti(void);
		STI
		RET

_io_stihlt:	; void io_stihlt(void);
		STI
		HLT
		RET

_io_in8:	; int io_in8(int port);
		MOV		EDX, [ESP+4]	; port
		MOV		EAX, 0
		IN		AL, DX
		RET

_io_in16:	; int io_in16(int port);
		MOV		EDX, [ESP+4]	; port
		MOV		EAX, 0
		IN		AX, DX
		RET

_io_in32:	; int io_in32(int port);
		MOV		EDX, [ESP+4]	; port
		IN		EAX, DX
		RET

_io_out8:	; void io_out8(int port, int data);
		MOV		EDX, [ESP+4]	; port
		MOV		AL, [ESP+8]		; data
		OUT		DX, AL
		RET

_io_out16:	; void io_out16(int port, int data);
		MOV		EDX, [ESP+4]	; port
		MOV		EAX, [ESP+8]	; data
		OUT		DX, AX
		RET

_io_out32:	; void io_out32(int port, int data);
		MOV		EDX, [ESP+4]	; port
		MOV		EAX, [ESP+8]	; data
		OUT		DX, EAX
		RET

_io_load_eflags:	; int io_load_eflags(void);
		PUSHFD		; push eflags의 의미
		POP		EAX
		RET

_io_store_eflags:	; void io_store_eflags(int eflags);
		MOV		EAX, [ESP+4]
		PUSH	EAX
		POPFD		; pop eflags의 의미
		RET
