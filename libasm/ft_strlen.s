section .data
    msg db "Hello, world!", 0xa ; 문자열과 개행 문자를 포함합니다
    len equ $ - msg           ; 문자열의 길이를 계산합니다

section .text
    global _start             ; _start 레이블을 전역으로 선언합니다

_start:
    ; 표준 출력(stdout)으로 문자열을 씁니다
    mov eax, 4                ; SYS_WRITE 시스템 콜 번호 (Linux 32bit)
    mov ebx, 1                ; 파일 디스크립터 1 (stdout)
    mov ecx, msg              ; 출력할 메시지의 주소
    mov edx, len              ; 출력할 메시지의 길이
    int 0x80                  ; 시스템 콜을 호출합니다

    ; 프로그램을 종료합니다
    mov eax, 1                ; SYS_EXIT 시스템 콜 번호 (Linux 32bit)
    mov ebx, 0                ; 종료 코드 0 (성공)
    int 0x80                  ; 시스템 콜을 호출합니다
