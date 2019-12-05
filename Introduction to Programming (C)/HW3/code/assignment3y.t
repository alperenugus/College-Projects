- init:
    run: rm -f assignment3
    blocker: true
    points: 1

- build:
    run: gcc -std=c99 -Wall -Werror assignment3.c -o assignment3  # timeout: 2
    blocker: true
    points: 1

- case2:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "12"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 8"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 6"
        - expect: "Locations: "  # timeout: 2
        - send: "6 8"
        - expect: "Locations: "  # timeout: 2
        - send: "8 3"
        - expect: "Locations: "  # timeout: 2
        - send: "8 5"
        - expect: "Locations: "  # timeout: 2
        - send: "8 6"
        - expect: "Locations: "  # timeout: 2
        - send: "8 8"
        - expect: "Best Slot Found In: 3 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case3:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Best Slot Found In: 1 7\r\n"  # timeout: 2
    return: 0
    points: 1

- case4:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Best Slot Found In: 2 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case6:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "7 3"
        - expect: "Best Slot Found In: 3 8\r\n"  # timeout: 2
    return: 0
    points: 1

- case8:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 3"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Best Slot Found In: 1 9\r\n"  # timeout: 2
    return: 0
    points: 1

- case9:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "12"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 6"
        - expect: "Locations: "  # timeout: 2
        - send: "8 8"
        - expect: "Locations: "  # timeout: 2
        - send: "9 2"
        - expect: "Locations: "  # timeout: 2
        - send: "9 6"
        - expect: "Locations: "  # timeout: 2
        - send: "9 8"
        - expect: "Locations: "  # timeout: 2
        - send: "10 2"
        - expect: "Locations: "  # timeout: 2
        - send: "10 6"
        - expect: "Locations: "  # timeout: 2
        - send: "10 8"
        - expect: "Best Slot Found In: 1 4\r\n"  # timeout: 2
    return: 0
    points: 1

- case10:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Best Slot Found In: 5 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case11:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case13:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Best Slot Found In: 3 8\r\n"  # timeout: 2
    return: 0
    points: 1

- case15:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "20"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 7"
        - expect: "Locations: "  # timeout: 2
        - send: "4 8"
        - expect: "Locations: "  # timeout: 2
        - send: "4 9"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Locations: "  # timeout: 2
        - send: "5 9"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Locations: "  # timeout: 2
        - send: "6 8"
        - expect: "Locations: "  # timeout: 2
        - send: "6 9"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 7"
        - expect: "Locations: "  # timeout: 2
        - send: "7 8"
        - expect: "Locations: "  # timeout: 2
        - send: "7 9"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case17:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "20"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "2 10"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 7"
        - expect: "Locations: "  # timeout: 2
        - send: "3 10"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 10"
        - expect: "Locations: "  # timeout: 2
        - send: "9 2"
        - expect: "Locations: "  # timeout: 2
        - send: "9 5"
        - expect: "Locations: "  # timeout: 2
        - send: "9 6"
        - expect: "Locations: "  # timeout: 2
        - send: "9 7"
        - expect: "Locations: "  # timeout: 2
        - send: "9 10"
        - expect: "Best Slot Found In: 7 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case18:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 3"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case20:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Best Slot Found In: 2 6\r\n"  # timeout: 2
    return: 0
    points: 1

- case21:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Best Slot Found In: 6 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case22:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "20"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Best Slot Found In: 3 6\r\n"  # timeout: 2
    return: 0
    points: 1

- case24:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 1"
        - expect: "Locations: "  # timeout: 2
        - send: "7 3"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Best Slot Found In: 5 7\r\n"  # timeout: 2
    return: 0
    points: 1

- case26:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "10"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Best Slot Found In: 7 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case27:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Best Slot Found In: 2 4\r\n"  # timeout: 2
    return: 0
    points: 1

- case31:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "21"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 4"
        - expect: "Locations: "  # timeout: 2
        - send: "8 6"
        - expect: "Locations: "  # timeout: 2
        - send: "9 2"
        - expect: "Locations: "  # timeout: 2
        - send: "9 4"
        - expect: "Locations: "  # timeout: 2
        - send: "9 6"
        - expect: "Best Slot Found In: 1 9\r\n"  # timeout: 2
    return: 0
    points: 1

- case32:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "1"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Best Slot Found In: 0 0\r\n"  # timeout: 2
    return: 1

- case33:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "12"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 8"
        - expect: "Locations: "  # timeout: 2
        - send: "9 1"
        - expect: "Locations: "  # timeout: 2
        - send: "9 2"
        - expect: "Locations: "  # timeout: 2
        - send: "9 3"
        - expect: "Locations: "  # timeout: 2
        - send: "9 8"
        - expect: "Locations: "  # timeout: 2
        - send: "10 1"
        - expect: "Locations: "  # timeout: 2
        - send: "10 2"
        - expect: "Locations: "  # timeout: 2
        - send: "10 3"
        - expect: "Locations: "  # timeout: 2
        - send: "10 8"
        - expect: "Best Slot Found In: 5 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case36:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Best Slot Found In: 1 9\r\n"  # timeout: 2
    return: 0
    points: 1

- case39:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "28"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 7"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 6"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 7"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 4"
        - expect: "Locations: "  # timeout: 2
        - send: "8 6"
        - expect: "Locations: "  # timeout: 2
        - send: "8 7"
        - expect: "Locations: "  # timeout: 2
        - send: "9 2"
        - expect: "Locations: "  # timeout: 2
        - send: "9 4"
        - expect: "Locations: "  # timeout: 2
        - send: "9 6"
        - expect: "Locations: "  # timeout: 2
        - send: "9 7"
        - expect: "Best Slot Found In: 3 9\r\n"  # timeout: 2
    return: 0
    points: 1

- case40:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "15"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 7"
        - expect: "Locations: "  # timeout: 2
        - send: "3 8"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Locations: "  # timeout: 2
        - send: "6 8"
        - expect: "Locations: "  # timeout: 2
        - send: "8 1"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 4"
        - expect: "Locations: "  # timeout: 2
        - send: "8 7"
        - expect: "Locations: "  # timeout: 2
        - send: "8 8"
        - expect: "Best Slot Found In: 1 3\r\n"  # timeout: 2
    return: 0
    points: 1

- case41:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case42:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "2"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Best Slot Found In: 2 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case43:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 7"
        - expect: "Locations: "  # timeout: 2
        - send: "3 8"
        - expect: "Locations: "  # timeout: 2
        - send: "3 9"
        - expect: "Best Slot Found In: 9 3\r\n"  # timeout: 2
    return: 0
    points: 1

- case44:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "15"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 8"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 8"
        - expect: "Locations: "  # timeout: 2
        - send: "7 3"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 8"
        - expect: "Locations: "  # timeout: 2
        - send: "8 3"
        - expect: "Locations: "  # timeout: 2
        - send: "8 4"
        - expect: "Locations: "  # timeout: 2
        - send: "8 8"
        - expect: "Locations: "  # timeout: 2
        - send: "9 3"
        - expect: "Locations: "  # timeout: 2
        - send: "9 4"
        - expect: "Locations: "  # timeout: 2
        - send: "9 8"
        - expect: "Best Slot Found In: 5 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case45:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "20"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 8"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 8"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 3"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 8"
        - expect: "Best Slot Found In: 9 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case46:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "12"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "1 8"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 8"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 8"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Best Slot Found In: 8 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case47:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Best Slot Found In: 6 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case48:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Best Slot Found In: 4 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case49:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Best Slot Found In: 6 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case50:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 8"
        - expect: "Locations: "  # timeout: 2
        - send: "10 2"
        - expect: "Locations: "  # timeout: 2
        - send: "10 4"
        - expect: "Locations: "  # timeout: 2
        - send: "10 5"
        - expect: "Locations: "  # timeout: 2
        - send: "10 8"
        - expect: "Best Slot Found In: 1 10\r\n"  # timeout: 2
    return: 0
    points: 1

- case51:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Best Slot Found In: 5 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case52:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Best Slot Found In: 1 7\r\n"  # timeout: 2
    return: 0
    points: 1

- case53:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Best Slot Found In: 7 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case54:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Best Slot Found In: 5 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case56:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Best Slot Found In: 1 8\r\n"  # timeout: 2
    return: 0
    points: 1

- case58:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "16"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 6"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Locations: "  # timeout: 2
        - send: "10 2"
        - expect: "Locations: "  # timeout: 2
        - send: "10 3"
        - expect: "Locations: "  # timeout: 2
        - send: "10 6"
        - expect: "Locations: "  # timeout: 2
        - send: "10 7"
        - expect: "Best Slot Found In: 1 10\r\n"  # timeout: 2
    return: 0
    points: 1

- case59:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case60:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Locations: "  # timeout: 2
        - send: "10 2"
        - expect: "Locations: "  # timeout: 2
        - send: "10 7"
        - expect: "Best Slot Found In: 7 10\r\n"  # timeout: 2
    return: 0
    points: 1

- case62:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "3"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case64:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 1"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 3"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Best Slot Found In: 1 7\r\n"  # timeout: 2
    return: 0
    points: 1

- case66:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "8 4"
        - expect: "Best Slot Found In: 3 10\r\n"  # timeout: 2
    return: 0
    points: 1

- case67:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case69:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "2"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Best Slot Found In: 2 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case71:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "20"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 9"
        - expect: "Locations: "  # timeout: 2
        - send: "1 10"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 9"
        - expect: "Locations: "  # timeout: 2
        - send: "4 10"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 9"
        - expect: "Locations: "  # timeout: 2
        - send: "5 10"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 9"
        - expect: "Locations: "  # timeout: 2
        - send: "7 10"
        - expect: "Locations: "  # timeout: 2
        - send: "8 4"
        - expect: "Locations: "  # timeout: 2
        - send: "8 6"
        - expect: "Locations: "  # timeout: 2
        - send: "8 9"
        - expect: "Locations: "  # timeout: 2
        - send: "8 10"
        - expect: "Best Slot Found In: 10 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case72:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case73:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Best Slot Found In: 4 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case75:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Best Slot Found In: 9 9\r\n"  # timeout: 2
    return: 0
    points: 1

- case76:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "10"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "9 4"
        - expect: "Locations: "  # timeout: 2
        - send: "9 5"
        - expect: "Best Slot Found In: 1 10\r\n"  # timeout: 2
    return: 0
    points: 1

- case77:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Best Slot Found In: 4 8\r\n"  # timeout: 2
    return: 0
    points: 1

- case78:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "12"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 5"
        - expect: "Locations: "  # timeout: 2
        - send: "8 6"
        - expect: "Best Slot Found In: 1 10\r\n"  # timeout: 2
    return: 0
    points: 1

- case79:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case80:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Best Slot Found In: 3 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case81:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "20"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 1"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Locations: "  # timeout: 2
        - send: "8 1"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 5"
        - expect: "Locations: "  # timeout: 2
        - send: "8 6"
        - expect: "Best Slot Found In: 3 9\r\n"  # timeout: 2
    return: 0
    points: 1

- case82:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 6"
        - expect: "Best Slot Found In: 3 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case84:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 8"
        - expect: "Locations: "  # timeout: 2
        - send: "4 9"
        - expect: "Locations: "  # timeout: 2
        - send: "9 3"
        - expect: "Locations: "  # timeout: 2
        - send: "9 4"
        - expect: "Locations: "  # timeout: 2
        - send: "9 8"
        - expect: "Locations: "  # timeout: 2
        - send: "9 9"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case85:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Best Slot Found In: 5 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case86:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Best Slot Found In: 7 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case90:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "12"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Best Slot Found In: 3 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case93:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Best Slot Found In: 6 6\r\n"  # timeout: 2
    return: 0
    points: 1

- case94:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Best Slot Found In: 1 8\r\n"  # timeout: 2
    return: 0
    points: 1

- case95:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Best Slot Found In: 2 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case96:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "15"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 8"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 8"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 8"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Locations: "  # timeout: 2
        - send: "9 1"
        - expect: "Locations: "  # timeout: 2
        - send: "9 2"
        - expect: "Locations: "  # timeout: 2
        - send: "9 8"
        - expect: "Best Slot Found In: 7 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case97:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "35"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 7"
        - expect: "Locations: "  # timeout: 2
        - send: "1 8"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "2 8"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 3"
        - expect: "Locations: "  # timeout: 2
        - send: "8 4"
        - expect: "Locations: "  # timeout: 2
        - send: "8 5"
        - expect: "Locations: "  # timeout: 2
        - send: "8 6"
        - expect: "Locations: "  # timeout: 2
        - send: "8 7"
        - expect: "Locations: "  # timeout: 2
        - send: "8 8"
        - expect: "Locations: "  # timeout: 2
        - send: "10 2"
        - expect: "Locations: "  # timeout: 2
        - send: "10 3"
        - expect: "Locations: "  # timeout: 2
        - send: "10 4"
        - expect: "Locations: "  # timeout: 2
        - send: "10 5"
        - expect: "Locations: "  # timeout: 2
        - send: "10 6"
        - expect: "Locations: "  # timeout: 2
        - send: "10 7"
        - expect: "Locations: "  # timeout: 2
        - send: "10 8"
        - expect: "Best Slot Found In: 3 10\r\n"  # timeout: 2
    return: 0
    points: 1

- case98:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "36"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "2 8"
        - expect: "Locations: "  # timeout: 2
        - send: "2 9"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 7"
        - expect: "Locations: "  # timeout: 2
        - send: "3 8"
        - expect: "Locations: "  # timeout: 2
        - send: "3 9"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Locations: "  # timeout: 2
        - send: "5 9"
        - expect: "Locations: "  # timeout: 2
        - send: "7 1"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 7"
        - expect: "Locations: "  # timeout: 2
        - send: "7 8"
        - expect: "Locations: "  # timeout: 2
        - send: "7 9"
        - expect: "Locations: "  # timeout: 2
        - send: "8 1"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 5"
        - expect: "Locations: "  # timeout: 2
        - send: "8 7"
        - expect: "Locations: "  # timeout: 2
        - send: "8 8"
        - expect: "Locations: "  # timeout: 2
        - send: "8 9"
        - expect: "Locations: "  # timeout: 2
        - send: "9 1"
        - expect: "Locations: "  # timeout: 2
        - send: "9 2"
        - expect: "Locations: "  # timeout: 2
        - send: "9 5"
        - expect: "Locations: "  # timeout: 2
        - send: "9 7"
        - expect: "Locations: "  # timeout: 2
        - send: "9 8"
        - expect: "Locations: "  # timeout: 2
        - send: "9 9"
        - expect: "Best Slot Found In: 1 3\r\n"  # timeout: 2
    return: 0
    points: 1

- case100:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Best Slot Found In: 9 9\r\n"  # timeout: 2
    return: 0
    points: 1

- case102:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "3"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case103:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 6"
        - expect: "Locations: "  # timeout: 2
        - send: "9 2"
        - expect: "Locations: "  # timeout: 2
        - send: "9 4"
        - expect: "Locations: "  # timeout: 2
        - send: "9 6"
        - expect: "Best Slot Found In: 4 10\r\n"  # timeout: 2
    return: 0
    points: 1

- case104:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 1"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Best Slot Found In: 1 7\r\n"  # timeout: 2
    return: 0
    points: 1

- case105:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "16"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 7"
        - expect: "Locations: "  # timeout: 2
        - send: "3 8"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 7"
        - expect: "Locations: "  # timeout: 2
        - send: "4 8"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Locations: "  # timeout: 2
        - send: "9 1"
        - expect: "Locations: "  # timeout: 2
        - send: "9 6"
        - expect: "Locations: "  # timeout: 2
        - send: "9 7"
        - expect: "Locations: "  # timeout: 2
        - send: "9 8"
        - expect: "Best Slot Found In: 1 3\r\n"  # timeout: 2
    return: 0
    points: 1

- case106:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Best Slot Found In: 1 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case107:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Best Slot Found In: 7 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case108:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Best Slot Found In: 1 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case109:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case110:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "15"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 6"
        - expect: "Best Slot Found In: 5 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case112:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "12"
        - expect: "Locations: "  # timeout: 2
        - send: "1 9"
        - expect: "Locations: "  # timeout: 2
        - send: "1 10"
        - expect: "Locations: "  # timeout: 2
        - send: "3 9"
        - expect: "Locations: "  # timeout: 2
        - send: "3 10"
        - expect: "Locations: "  # timeout: 2
        - send: "5 9"
        - expect: "Locations: "  # timeout: 2
        - send: "5 10"
        - expect: "Locations: "  # timeout: 2
        - send: "7 9"
        - expect: "Locations: "  # timeout: 2
        - send: "7 10"
        - expect: "Locations: "  # timeout: 2
        - send: "8 9"
        - expect: "Locations: "  # timeout: 2
        - send: "8 10"
        - expect: "Locations: "  # timeout: 2
        - send: "9 9"
        - expect: "Locations: "  # timeout: 2
        - send: "9 10"
        - expect: "Best Slot Found In: 2 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case114:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "2 8"
        - expect: "Locations: "  # timeout: 2
        - send: "2 10"
        - expect: "Locations: "  # timeout: 2
        - send: "4 8"
        - expect: "Locations: "  # timeout: 2
        - send: "4 10"
        - expect: "Locations: "  # timeout: 2
        - send: "7 8"
        - expect: "Locations: "  # timeout: 2
        - send: "7 10"
        - expect: "Locations: "  # timeout: 2
        - send: "10 8"
        - expect: "Locations: "  # timeout: 2
        - send: "10 10"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case115:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "2"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case116:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "16"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Best Slot Found In: 4 6\r\n"  # timeout: 2
    return: 0
    points: 1

- case117:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Best Slot Found In: 1 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case118:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 7"
        - expect: "Locations: "  # timeout: 2
        - send: "3 9"
        - expect: "Best Slot Found In: 9 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case121:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Best Slot Found In: 7 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case122:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case123:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "2"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case125:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Best Slot Found In: 7 7\r\n"  # timeout: 2
    return: 0
    points: 1

- case127:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 6"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Locations: "  # timeout: 2
        - send: "8 1"
        - expect: "Locations: "  # timeout: 2
        - send: "8 5"
        - expect: "Locations: "  # timeout: 2
        - send: "8 6"
        - expect: "Locations: "  # timeout: 2
        - send: "8 7"
        - expect: "Best Slot Found In: 1 3\r\n"  # timeout: 2
    return: 0
    points: 1

- case128:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Best Slot Found In: 7 7\r\n"  # timeout: 2
    return: 0
    points: 1

- case131:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Best Slot Found In: 8 8\r\n"  # timeout: 2
    return: 0
    points: 1

- case132:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "25"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "2 8"
        - expect: "Locations: "  # timeout: 2
        - send: "2 9"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 7"
        - expect: "Locations: "  # timeout: 2
        - send: "4 8"
        - expect: "Locations: "  # timeout: 2
        - send: "4 9"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Locations: "  # timeout: 2
        - send: "6 8"
        - expect: "Locations: "  # timeout: 2
        - send: "6 9"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 7"
        - expect: "Locations: "  # timeout: 2
        - send: "7 8"
        - expect: "Locations: "  # timeout: 2
        - send: "7 9"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 4"
        - expect: "Locations: "  # timeout: 2
        - send: "8 7"
        - expect: "Locations: "  # timeout: 2
        - send: "8 8"
        - expect: "Locations: "  # timeout: 2
        - send: "8 9"
        - expect: "Best Slot Found In: 10 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case133:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Best Slot Found In: 2 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case134:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "12"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "2 9"
        - expect: "Locations: "  # timeout: 2
        - send: "8 1"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 5"
        - expect: "Locations: "  # timeout: 2
        - send: "8 6"
        - expect: "Locations: "  # timeout: 2
        - send: "8 7"
        - expect: "Locations: "  # timeout: 2
        - send: "8 9"
        - expect: "Best Slot Found In: 5 3\r\n"  # timeout: 2
    return: 0
    points: 1

- case135:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Best Slot Found In: 5 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case136:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "30"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "2 10"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 7"
        - expect: "Locations: "  # timeout: 2
        - send: "3 10"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 7"
        - expect: "Locations: "  # timeout: 2
        - send: "4 10"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 3"
        - expect: "Locations: "  # timeout: 2
        - send: "8 4"
        - expect: "Locations: "  # timeout: 2
        - send: "8 7"
        - expect: "Locations: "  # timeout: 2
        - send: "8 10"
        - expect: "Locations: "  # timeout: 2
        - send: "9 2"
        - expect: "Locations: "  # timeout: 2
        - send: "9 3"
        - expect: "Locations: "  # timeout: 2
        - send: "9 4"
        - expect: "Locations: "  # timeout: 2
        - send: "9 7"
        - expect: "Locations: "  # timeout: 2
        - send: "9 10"
        - expect: "Locations: "  # timeout: 2
        - send: "10 2"
        - expect: "Locations: "  # timeout: 2
        - send: "10 3"
        - expect: "Locations: "  # timeout: 2
        - send: "10 4"
        - expect: "Locations: "  # timeout: 2
        - send: "10 7"
        - expect: "Locations: "  # timeout: 2
        - send: "10 10"
        - expect: "Best Slot Found In: 6 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case137:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "20"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "2 10"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 7"
        - expect: "Locations: "  # timeout: 2
        - send: "3 10"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 7"
        - expect: "Locations: "  # timeout: 2
        - send: "4 10"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Locations: "  # timeout: 2
        - send: "6 10"
        - expect: "Locations: "  # timeout: 2
        - send: "7 1"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 7"
        - expect: "Locations: "  # timeout: 2
        - send: "7 10"
        - expect: "Best Slot Found In: 10 4\r\n"  # timeout: 2
    return: 0
    points: 1

- case138:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "12"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Best Slot Found In: 5 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case140:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "25"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 7"
        - expect: "Locations: "  # timeout: 2
        - send: "3 9"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Locations: "  # timeout: 2
        - send: "6 9"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 7"
        - expect: "Locations: "  # timeout: 2
        - send: "7 9"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 4"
        - expect: "Locations: "  # timeout: 2
        - send: "8 5"
        - expect: "Locations: "  # timeout: 2
        - send: "8 7"
        - expect: "Locations: "  # timeout: 2
        - send: "8 9"
        - expect: "Locations: "  # timeout: 2
        - send: "10 2"
        - expect: "Locations: "  # timeout: 2
        - send: "10 4"
        - expect: "Locations: "  # timeout: 2
        - send: "10 5"
        - expect: "Locations: "  # timeout: 2
        - send: "10 7"
        - expect: "Locations: "  # timeout: 2
        - send: "10 9"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case142:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "12"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 8"
        - expect: "Locations: "  # timeout: 2
        - send: "3 9"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 8"
        - expect: "Locations: "  # timeout: 2
        - send: "4 9"
        - expect: "Locations: "  # timeout: 2
        - send: "8 1"
        - expect: "Locations: "  # timeout: 2
        - send: "8 6"
        - expect: "Locations: "  # timeout: 2
        - send: "8 8"
        - expect: "Locations: "  # timeout: 2
        - send: "8 9"
        - expect: "Best Slot Found In: 1 3\r\n"  # timeout: 2
    return: 0
    points: 1

- case144:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "24"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "2 9"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 7"
        - expect: "Locations: "  # timeout: 2
        - send: "3 9"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 9"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Locations: "  # timeout: 2
        - send: "6 9"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 7"
        - expect: "Locations: "  # timeout: 2
        - send: "7 9"
        - expect: "Locations: "  # timeout: 2
        - send: "10 2"
        - expect: "Locations: "  # timeout: 2
        - send: "10 5"
        - expect: "Locations: "  # timeout: 2
        - send: "10 7"
        - expect: "Locations: "  # timeout: 2
        - send: "10 9"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case146:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "18"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 8"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 8"
        - expect: "Locations: "  # timeout: 2
        - send: "8 5"
        - expect: "Locations: "  # timeout: 2
        - send: "8 6"
        - expect: "Locations: "  # timeout: 2
        - send: "8 8"
        - expect: "Locations: "  # timeout: 2
        - send: "9 5"
        - expect: "Locations: "  # timeout: 2
        - send: "9 6"
        - expect: "Locations: "  # timeout: 2
        - send: "9 8"
        - expect: "Locations: "  # timeout: 2
        - send: "10 5"
        - expect: "Locations: "  # timeout: 2
        - send: "10 6"
        - expect: "Locations: "  # timeout: 2
        - send: "10 8"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case148:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 3"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Best Slot Found In: 3 8\r\n"  # timeout: 2
    return: 0
    points: 1

- case149:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "2 8"
        - expect: "Best Slot Found In: 10 10\r\n"  # timeout: 2
    return: 0
    points: 1

- case150:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Best Slot Found In: 10 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case151:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "2"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Best Slot Found In: 2 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case152:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 7"
        - expect: "Best Slot Found In: 8 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case155:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "2 9"
        - expect: "Best Slot Found In: 9 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case156:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Best Slot Found In: 1 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case157:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "10"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 1"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Locations: "  # timeout: 2
        - send: "8 1"
        - expect: "Locations: "  # timeout: 2
        - send: "8 6"
        - expect: "Best Slot Found In: 3 3\r\n"  # timeout: 2
    return: 0
    points: 1

- case159:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Best Slot Found In: 1 6\r\n"  # timeout: 2
    return: 0
    points: 1

- case160:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Best Slot Found In: 6 4\r\n"  # timeout: 2
    return: 0
    points: 1

- case161:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "12"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Best Slot Found In: 4 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case163:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case164:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "3"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case165:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "1"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Best Slot Found In: 0 0\r\n"  # timeout: 2
    return: 1

- case166:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case167:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 7"
        - expect: "Best Slot Found In: 7 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case169:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Best Slot Found In: 6 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case171:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "2"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Best Slot Found In: 1 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case173:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "3"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case174:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "12"
        - expect: "Locations: "  # timeout: 2
        - send: "1 7"
        - expect: "Locations: "  # timeout: 2
        - send: "1 10"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "2 10"
        - expect: "Locations: "  # timeout: 2
        - send: "3 7"
        - expect: "Locations: "  # timeout: 2
        - send: "3 10"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 10"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Locations: "  # timeout: 2
        - send: "6 10"
        - expect: "Locations: "  # timeout: 2
        - send: "10 7"
        - expect: "Locations: "  # timeout: 2
        - send: "10 10"
        - expect: "Best Slot Found In: 8 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case175:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 7"
        - expect: "Best Slot Found In: 4 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case176:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 7"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 6"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Best Slot Found In: 10 10\r\n"  # timeout: 2
    return: 0
    points: 1

- case177:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 8"
        - expect: "Locations: "  # timeout: 2
        - send: "9 2"
        - expect: "Locations: "  # timeout: 2
        - send: "9 5"
        - expect: "Locations: "  # timeout: 2
        - send: "9 8"
        - expect: "Best Slot Found In: 1 10\r\n"  # timeout: 2
    return: 0
    points: 1

- case179:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "24"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "1 8"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 8"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 8"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 8"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 8"
        - expect: "Best Slot Found In: 8 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case181:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "8 4"
        - expect: "Locations: "  # timeout: 2
        - send: "8 5"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case182:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case183:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 7"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Locations: "  # timeout: 2
        - send: "7 7"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case185:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case186:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 6"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case187:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 7"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Best Slot Found In: 7 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case189:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 3"
        - expect: "Locations: "  # timeout: 2
        - send: "8 7"
        - expect: "Best Slot Found In: 1 10\r\n"  # timeout: 2
    return: 0
    points: 1

- case190:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "24"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 8"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 8"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Locations: "  # timeout: 2
        - send: "8 1"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 3"
        - expect: "Locations: "  # timeout: 2
        - send: "8 4"
        - expect: "Locations: "  # timeout: 2
        - send: "8 6"
        - expect: "Locations: "  # timeout: 2
        - send: "8 8"
        - expect: "Best Slot Found In: 10 10\r\n"  # timeout: 2
    return: 0
    points: 1

- case191:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "2"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Best Slot Found In: 1 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case192:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "7 1"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "8 1"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 5"
        - expect: "Locations: "  # timeout: 2
        - send: "10 1"
        - expect: "Locations: "  # timeout: 2
        - send: "10 2"
        - expect: "Locations: "  # timeout: 2
        - send: "10 5"
        - expect: "Best Slot Found In: 1 10\r\n"  # timeout: 2
    return: 0
    points: 1

- case193:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case194:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Best Slot Found In: 1 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case196:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Best Slot Found In: 3 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case198:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Best Slot Found In: 6 6\r\n"  # timeout: 2
    return: 0
    points: 1

- case199:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Best Slot Found In: 6 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case200:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Best Slot Found In: 1 4\r\n"  # timeout: 2
    return: 0
    points: 1

- case201:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "12"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Best Slot Found In: 4 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case202:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "1"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Best Slot Found In: 0 0\r\n"  # timeout: 2
    return: 1

- case204:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 8"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Best Slot Found In: 8 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case205:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 9"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 9"
        - expect: "Locations: "  # timeout: 2
        - send: "8 1"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 9"
        - expect: "Best Slot Found In: 5 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case206:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Best Slot Found In: 2 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case211:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "18"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 10"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 10"
        - expect: "Locations: "  # timeout: 2
        - send: "10 2"
        - expect: "Locations: "  # timeout: 2
        - send: "10 3"
        - expect: "Locations: "  # timeout: 2
        - send: "10 4"
        - expect: "Locations: "  # timeout: 2
        - send: "10 5"
        - expect: "Locations: "  # timeout: 2
        - send: "10 6"
        - expect: "Locations: "  # timeout: 2
        - send: "10 10"
        - expect: "Best Slot Found In: 7 8\r\n"  # timeout: 2
    return: 0
    points: 1

- case212:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case213:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case214:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Best Slot Found In: 6 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case216:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Locations: "  # timeout: 2
        - send: "10 1"
        - expect: "Locations: "  # timeout: 2
        - send: "10 2"
        - expect: "Locations: "  # timeout: 2
        - send: "10 5"
        - expect: "Locations: "  # timeout: 2
        - send: "10 8"
        - expect: "Best Slot Found In: 1 10\r\n"  # timeout: 2
    return: 0
    points: 1

- case217:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "3"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Best Slot Found In: 1 3\r\n"  # timeout: 2
    return: 0
    points: 1

- case219:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "15"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 7"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 7"
        - expect: "Best Slot Found In: 9 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case221:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "6 6"
        - expect: "Locations: "  # timeout: 2
        - send: "6 8"
        - expect: "Locations: "  # timeout: 2
        - send: "6 10"
        - expect: "Locations: "  # timeout: 2
        - send: "9 6"
        - expect: "Locations: "  # timeout: 2
        - send: "9 8"
        - expect: "Locations: "  # timeout: 2
        - send: "9 10"
        - expect: "Locations: "  # timeout: 2
        - send: "10 6"
        - expect: "Locations: "  # timeout: 2
        - send: "10 8"
        - expect: "Locations: "  # timeout: 2
        - send: "10 10"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case222:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Best Slot Found In: 5 4\r\n"  # timeout: 2
    return: 0
    points: 1

- case223:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Best Slot Found In: 5 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case224:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Best Slot Found In: 6 6\r\n"  # timeout: 2
    return: 0
    points: 1

- case225:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Best Slot Found In: 9 9\r\n"  # timeout: 2
    return: 0
    points: 1

- case227:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case228:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "20"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Locations: "  # timeout: 2
        - send: "8 1"
        - expect: "Locations: "  # timeout: 2
        - send: "8 4"
        - expect: "Locations: "  # timeout: 2
        - send: "8 5"
        - expect: "Locations: "  # timeout: 2
        - send: "8 6"
        - expect: "Locations: "  # timeout: 2
        - send: "8 7"
        - expect: "Best Slot Found In: 10 10\r\n"  # timeout: 2
    return: 0
    points: 1

- case229:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "3"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case231:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Best Slot Found In: 1 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case232:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "12"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Locations: "  # timeout: 2
        - send: "7 1"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 7"
        - expect: "Best Slot Found In: 1 3\r\n"  # timeout: 2
    return: 0
    points: 1

- case233:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "2"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Best Slot Found In: 2 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case234:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 9"
        - expect: "Locations: "  # timeout: 2
        - send: "9 9"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case235:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Best Slot Found In: 3 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case237:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case238:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 7"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 7"
        - expect: "Best Slot Found In: 4 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case243:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Locations: "  # timeout: 2
        - send: "8 5"
        - expect: "Locations: "  # timeout: 2
        - send: "8 7"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case244:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "3"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Best Slot Found In: 3 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case246:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "2"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case247:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "3"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Best Slot Found In: 1 3\r\n"  # timeout: 2
    return: 0
    points: 1

- case249:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case250:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Best Slot Found In: 1 6\r\n"  # timeout: 2
    return: 0
    points: 1

- case252:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Best Slot Found In: 2 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case253:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 7"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 7"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case254:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "20"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "1 7"
        - expect: "Locations: "  # timeout: 2
        - send: "1 10"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 7"
        - expect: "Locations: "  # timeout: 2
        - send: "3 10"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 7"
        - expect: "Locations: "  # timeout: 2
        - send: "4 10"
        - expect: "Locations: "  # timeout: 2
        - send: "9 2"
        - expect: "Locations: "  # timeout: 2
        - send: "9 4"
        - expect: "Locations: "  # timeout: 2
        - send: "9 5"
        - expect: "Locations: "  # timeout: 2
        - send: "9 7"
        - expect: "Locations: "  # timeout: 2
        - send: "9 10"
        - expect: "Best Slot Found In: 6 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case255:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "25"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "1 7"
        - expect: "Locations: "  # timeout: 2
        - send: "1 10"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "2 10"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 7"
        - expect: "Locations: "  # timeout: 2
        - send: "4 10"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Locations: "  # timeout: 2
        - send: "6 10"
        - expect: "Locations: "  # timeout: 2
        - send: "9 2"
        - expect: "Locations: "  # timeout: 2
        - send: "9 3"
        - expect: "Locations: "  # timeout: 2
        - send: "9 5"
        - expect: "Locations: "  # timeout: 2
        - send: "9 7"
        - expect: "Locations: "  # timeout: 2
        - send: "9 10"
        - expect: "Best Slot Found In: 3 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case257:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 6"
        - expect: "Best Slot Found In: 4 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case258:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 9"
        - expect: "Locations: "  # timeout: 2
        - send: "7 1"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 9"
        - expect: "Locations: "  # timeout: 2
        - send: "9 1"
        - expect: "Locations: "  # timeout: 2
        - send: "9 5"
        - expect: "Locations: "  # timeout: 2
        - send: "9 9"
        - expect: "Best Slot Found In: 1 3\r\n"  # timeout: 2
    return: 0
    points: 1

- case260:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case261:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Best Slot Found In: 1 7\r\n"  # timeout: 2
    return: 0
    points: 1

- case263:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "3"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case264:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case267:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Best Slot Found In: 3 6\r\n"  # timeout: 2
    return: 0
    points: 1

- case268:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "20"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 8"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 6"
        - expect: "Locations: "  # timeout: 2
        - send: "6 8"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 8"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case269:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Best Slot Found In: 4 4\r\n"  # timeout: 2
    return: 0
    points: 1

- case271:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "15"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 1"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Best Slot Found In: 1 8\r\n"  # timeout: 2
    return: 0
    points: 1

- case272:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Best Slot Found In: 5 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case273:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "3"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case275:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Locations: "  # timeout: 2
        - send: "5 9"
        - expect: "Locations: "  # timeout: 2
        - send: "5 10"
        - expect: "Best Slot Found In: 10 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case276:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "16"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 3"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Best Slot Found In: 1 8\r\n"  # timeout: 2
    return: 0
    points: 1

- case278:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case279:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Best Slot Found In: 2 6\r\n"  # timeout: 2
    return: 0
    points: 1

- case280:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "2"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case281:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "16"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Best Slot Found In: 7 7\r\n"  # timeout: 2
    return: 0
    points: 1

- case283:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "9 2"
        - expect: "Locations: "  # timeout: 2
        - send: "10 2"
        - expect: "Best Slot Found In: 1 10\r\n"  # timeout: 2
    return: 0
    points: 1

- case284:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Best Slot Found In: 1 3\r\n"  # timeout: 2
    return: 0
    points: 1

- case285:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Best Slot Found In: 4 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case286:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "15"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Best Slot Found In: 1 6\r\n"  # timeout: 2
    return: 0
    points: 1

- case288:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 7"
        - expect: "Best Slot Found In: 8 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case289:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 3"
        - expect: "Locations: "  # timeout: 2
        - send: "8 6"
        - expect: "Locations: "  # timeout: 2
        - send: "9 2"
        - expect: "Locations: "  # timeout: 2
        - send: "9 3"
        - expect: "Locations: "  # timeout: 2
        - send: "9 6"
        - expect: "Best Slot Found In: 1 10\r\n"  # timeout: 2
    return: 0
    points: 1

- case290:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Best Slot Found In: 6 3\r\n"  # timeout: 2
    return: 0
    points: 1

- case291:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Best Slot Found In: 9 9\r\n"  # timeout: 2
    return: 0
    points: 1

- case292:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Best Slot Found In: 6 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case293:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case294:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "28"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 8"
        - expect: "Locations: "  # timeout: 2
        - send: "1 10"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 8"
        - expect: "Locations: "  # timeout: 2
        - send: "2 10"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 8"
        - expect: "Locations: "  # timeout: 2
        - send: "3 10"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 8"
        - expect: "Locations: "  # timeout: 2
        - send: "4 10"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Locations: "  # timeout: 2
        - send: "5 10"
        - expect: "Locations: "  # timeout: 2
        - send: "7 1"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 8"
        - expect: "Locations: "  # timeout: 2
        - send: "7 10"
        - expect: "Locations: "  # timeout: 2
        - send: "10 1"
        - expect: "Locations: "  # timeout: 2
        - send: "10 2"
        - expect: "Locations: "  # timeout: 2
        - send: "10 8"
        - expect: "Locations: "  # timeout: 2
        - send: "10 10"
        - expect: "Best Slot Found In: 6 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case295:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Best Slot Found In: 1 6\r\n"  # timeout: 2
    return: 0
    points: 1

- case296:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Best Slot Found In: 1 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case297:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "2"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case298:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "3"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case301:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Best Slot Found In: 1 7\r\n"  # timeout: 2
    return: 0
    points: 1

- case302:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "9 3"
        - expect: "Locations: "  # timeout: 2
        - send: "9 4"
        - expect: "Best Slot Found In: 1 9\r\n"  # timeout: 2
    return: 0
    points: 1

- case304:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "12"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 10"
        - expect: "Locations: "  # timeout: 2
        - send: "8 1"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 4"
        - expect: "Locations: "  # timeout: 2
        - send: "8 10"
        - expect: "Locations: "  # timeout: 2
        - send: "10 1"
        - expect: "Locations: "  # timeout: 2
        - send: "10 2"
        - expect: "Locations: "  # timeout: 2
        - send: "10 4"
        - expect: "Locations: "  # timeout: 2
        - send: "10 10"
        - expect: "Best Slot Found In: 1 7\r\n"  # timeout: 2
    return: 0
    points: 1

- case305:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "15"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 9"
        - expect: "Locations: "  # timeout: 2
        - send: "7 1"
        - expect: "Locations: "  # timeout: 2
        - send: "7 3"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 9"
        - expect: "Locations: "  # timeout: 2
        - send: "9 1"
        - expect: "Locations: "  # timeout: 2
        - send: "9 3"
        - expect: "Locations: "  # timeout: 2
        - send: "9 4"
        - expect: "Locations: "  # timeout: 2
        - send: "9 6"
        - expect: "Locations: "  # timeout: 2
        - send: "9 9"
        - expect: "Best Slot Found In: 1 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case306:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Best Slot Found In: 8 8\r\n"  # timeout: 2
    return: 0
    points: 1

- case307:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "15"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 6"
        - expect: "Best Slot Found In: 2 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case309:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case311:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Best Slot Found In: 1 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case312:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "2"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Best Slot Found In: 1 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case313:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 3"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 7"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case315:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Best Slot Found In: 4 4\r\n"  # timeout: 2
    return: 0
    points: 1

- case317:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 7"
        - expect: "Locations: "  # timeout: 2
        - send: "8 4"
        - expect: "Locations: "  # timeout: 2
        - send: "8 7"
        - expect: "Best Slot Found In: 4 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case318:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Best Slot Found In: 6 6\r\n"  # timeout: 2
    return: 0
    points: 1

- case319:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "18"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 8"
        - expect: "Locations: "  # timeout: 2
        - send: "7 1"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 3"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 8"
        - expect: "Locations: "  # timeout: 2
        - send: "8 1"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 3"
        - expect: "Locations: "  # timeout: 2
        - send: "8 4"
        - expect: "Locations: "  # timeout: 2
        - send: "8 6"
        - expect: "Locations: "  # timeout: 2
        - send: "8 8"
        - expect: "Best Slot Found In: 4 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case321:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "15"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 3"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Locations: "  # timeout: 2
        - send: "9 2"
        - expect: "Locations: "  # timeout: 2
        - send: "9 3"
        - expect: "Locations: "  # timeout: 2
        - send: "9 6"
        - expect: "Best Slot Found In: 2 10\r\n"  # timeout: 2
    return: 0
    points: 1

- case322:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "12"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 7"
        - expect: "Locations: "  # timeout: 2
        - send: "1 9"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 9"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 3"
        - expect: "Locations: "  # timeout: 2
        - send: "8 7"
        - expect: "Locations: "  # timeout: 2
        - send: "8 9"
        - expect: "Best Slot Found In: 3 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case323:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "12"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 8"
        - expect: "Locations: "  # timeout: 2
        - send: "1 9"
        - expect: "Locations: "  # timeout: 2
        - send: "1 10"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 8"
        - expect: "Locations: "  # timeout: 2
        - send: "2 9"
        - expect: "Locations: "  # timeout: 2
        - send: "2 10"
        - expect: "Locations: "  # timeout: 2
        - send: "9 2"
        - expect: "Locations: "  # timeout: 2
        - send: "9 8"
        - expect: "Locations: "  # timeout: 2
        - send: "9 9"
        - expect: "Locations: "  # timeout: 2
        - send: "9 10"
        - expect: "Best Slot Found In: 5 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case325:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Best Slot Found In: 6 6\r\n"  # timeout: 2
    return: 0
    points: 1

- case329:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 1"
        - expect: "Locations: "  # timeout: 2
        - send: "7 3"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Best Slot Found In: 10 10\r\n"  # timeout: 2
    return: 0
    points: 1

- case331:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "10"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Locations: "  # timeout: 2
        - send: "6 8"
        - expect: "Locations: "  # timeout: 2
        - send: "7 1"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 7"
        - expect: "Locations: "  # timeout: 2
        - send: "7 8"
        - expect: "Best Slot Found In: 1 3\r\n"  # timeout: 2
    return: 0
    points: 1

- case332:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 9"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 6"
        - expect: "Locations: "  # timeout: 2
        - send: "6 9"
        - expect: "Best Slot Found In: 10 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case333:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case334:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case335:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Best Slot Found In: 5 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case336:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case337:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Best Slot Found In: 1 4\r\n"  # timeout: 2
    return: 0
    points: 1

- case338:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "1"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Best Slot Found In: 0 0\r\n"  # timeout: 2
    return: 1

- case340:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "2"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case342:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Best Slot Found In: 3 4\r\n"  # timeout: 2
    return: 0
    points: 1

- case343:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Best Slot Found In: 1 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case344:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "18"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 8"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 8"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 8"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 8"
        - expect: "Locations: "  # timeout: 2
        - send: "9 5"
        - expect: "Locations: "  # timeout: 2
        - send: "9 6"
        - expect: "Locations: "  # timeout: 2
        - send: "9 8"
        - expect: "Best Slot Found In: 3 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case345:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Best Slot Found In: 1 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case346:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "7 1"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 3"
        - expect: "Best Slot Found In: 1 7\r\n"  # timeout: 2
    return: 0
    points: 1

- case347:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "16"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "1 9"
        - expect: "Locations: "  # timeout: 2
        - send: "1 10"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 9"
        - expect: "Locations: "  # timeout: 2
        - send: "2 10"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 9"
        - expect: "Locations: "  # timeout: 2
        - send: "4 10"
        - expect: "Locations: "  # timeout: 2
        - send: "9 3"
        - expect: "Locations: "  # timeout: 2
        - send: "9 5"
        - expect: "Locations: "  # timeout: 2
        - send: "9 9"
        - expect: "Locations: "  # timeout: 2
        - send: "9 10"
        - expect: "Best Slot Found In: 6 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case349:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Best Slot Found In: 8 8\r\n"  # timeout: 2
    return: 0
    points: 1

- case350:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "20"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "2 10"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 7"
        - expect: "Locations: "  # timeout: 2
        - send: "3 10"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 10"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Locations: "  # timeout: 2
        - send: "6 10"
        - expect: "Locations: "  # timeout: 2
        - send: "10 4"
        - expect: "Locations: "  # timeout: 2
        - send: "10 5"
        - expect: "Locations: "  # timeout: 2
        - send: "10 7"
        - expect: "Locations: "  # timeout: 2
        - send: "10 10"
        - expect: "Best Slot Found In: 8 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case351:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Best Slot Found In: 4 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case353:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Best Slot Found In: 1 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case354:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Best Slot Found In: 4 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case355:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "12"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 8"
        - expect: "Locations: "  # timeout: 2
        - send: "2 9"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 8"
        - expect: "Locations: "  # timeout: 2
        - send: "6 9"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 8"
        - expect: "Locations: "  # timeout: 2
        - send: "7 9"
        - expect: "Locations: "  # timeout: 2
        - send: "9 4"
        - expect: "Locations: "  # timeout: 2
        - send: "9 8"
        - expect: "Locations: "  # timeout: 2
        - send: "9 9"
        - expect: "Best Slot Found In: 4 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case357:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "12"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 7"
        - expect: "Locations: "  # timeout: 2
        - send: "1 8"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 6"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Locations: "  # timeout: 2
        - send: "6 8"
        - expect: "Best Slot Found In: 10 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case359:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 7"
        - expect: "Best Slot Found In: 1 4\r\n"  # timeout: 2
    return: 0
    points: 1

- case360:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "2"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Best Slot Found In: 2 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case361:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "15"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "1 7"
        - expect: "Locations: "  # timeout: 2
        - send: "1 9"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 7"
        - expect: "Locations: "  # timeout: 2
        - send: "3 9"
        - expect: "Locations: "  # timeout: 2
        - send: "9 2"
        - expect: "Locations: "  # timeout: 2
        - send: "9 3"
        - expect: "Locations: "  # timeout: 2
        - send: "9 5"
        - expect: "Locations: "  # timeout: 2
        - send: "9 7"
        - expect: "Locations: "  # timeout: 2
        - send: "9 9"
        - expect: "Best Slot Found In: 6 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case362:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case363:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Best Slot Found In: 4 4\r\n"  # timeout: 2
    return: 0
    points: 1

- case365:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "1"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Best Slot Found In: 0 0\r\n"  # timeout: 2
    return: 1

- case366:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Best Slot Found In: 4 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case367:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Best Slot Found In: 4 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case368:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "15"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "1 9"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 9"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 9"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 9"
        - expect: "Locations: "  # timeout: 2
        - send: "10 1"
        - expect: "Locations: "  # timeout: 2
        - send: "10 5"
        - expect: "Locations: "  # timeout: 2
        - send: "10 9"
        - expect: "Best Slot Found In: 8 3\r\n"  # timeout: 2
    return: 0
    points: 1

- case369:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 4"
        - expect: "Locations: "  # timeout: 2
        - send: "8 9"
        - expect: "Best Slot Found In: 1 6\r\n"  # timeout: 2
    return: 0
    points: 1

- case370:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Best Slot Found In: 7 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case371:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "20"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 9"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 9"
        - expect: "Locations: "  # timeout: 2
        - send: "7 1"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 9"
        - expect: "Locations: "  # timeout: 2
        - send: "8 1"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 4"
        - expect: "Locations: "  # timeout: 2
        - send: "8 9"
        - expect: "Locations: "  # timeout: 2
        - send: "10 1"
        - expect: "Locations: "  # timeout: 2
        - send: "10 2"
        - expect: "Locations: "  # timeout: 2
        - send: "10 4"
        - expect: "Locations: "  # timeout: 2
        - send: "10 9"
        - expect: "Best Slot Found In: 1 6\r\n"  # timeout: 2
    return: 0
    points: 1

- case372:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Best Slot Found In: 1 4\r\n"  # timeout: 2
    return: 0
    points: 1

- case373:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Best Slot Found In: 1 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case374:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "7 3"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 7"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case375:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 7"
        - expect: "Locations: "  # timeout: 2
        - send: "4 8"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Best Slot Found In: 9 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case376:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Best Slot Found In: 1 10\r\n"  # timeout: 2
    return: 0
    points: 1

- case377:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Best Slot Found In: 5 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case379:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "3"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Best Slot Found In: 2 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case381:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Best Slot Found In: 2 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case382:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 8"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Best Slot Found In: 9 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case384:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Best Slot Found In: 8 8\r\n"  # timeout: 2
    return: 0
    points: 1

- case385:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case386:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 9"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 9"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 9"
        - expect: "Locations: "  # timeout: 2
        - send: "9 4"
        - expect: "Locations: "  # timeout: 2
        - send: "9 9"
        - expect: "Best Slot Found In: 4 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case388:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 6"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 7"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case389:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 7"
        - expect: "Best Slot Found In: 8 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case391:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 8"
        - expect: "Best Slot Found In: 1 4\r\n"  # timeout: 2
    return: 0
    points: 1

- case392:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "15"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 7"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 3"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 7"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 3"
        - expect: "Locations: "  # timeout: 2
        - send: "8 5"
        - expect: "Locations: "  # timeout: 2
        - send: "8 6"
        - expect: "Locations: "  # timeout: 2
        - send: "8 7"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case394:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 9"
        - expect: "Locations: "  # timeout: 2
        - send: "3 10"
        - expect: "Locations: "  # timeout: 2
        - send: "9 2"
        - expect: "Locations: "  # timeout: 2
        - send: "9 5"
        - expect: "Locations: "  # timeout: 2
        - send: "9 9"
        - expect: "Locations: "  # timeout: 2
        - send: "9 10"
        - expect: "Best Slot Found In: 6 7\r\n"  # timeout: 2
    return: 0
    points: 1

- case395:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "2"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Best Slot Found In: 2 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case398:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 10"
        - expect: "Locations: "  # timeout: 2
        - send: "4 10"
        - expect: "Locations: "  # timeout: 2
        - send: "5 10"
        - expect: "Best Slot Found In: 10 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case399:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "8 1"
        - expect: "Locations: "  # timeout: 2
        - send: "8 3"
        - expect: "Best Slot Found In: 1 8\r\n"  # timeout: 2
    return: 0
    points: 1

- case401:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Best Slot Found In: 3 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case402:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Best Slot Found In: 3 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case403:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Best Slot Found In: 1 3\r\n"  # timeout: 2
    return: 0
    points: 1

- case404:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "1"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Best Slot Found In: 0 0\r\n"  # timeout: 2
    return: 1

- case405:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Best Slot Found In: 10 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case406:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Best Slot Found In: 8 8\r\n"  # timeout: 2
    return: 0
    points: 1

- case408:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "8 4"
        - expect: "Best Slot Found In: 3 8\r\n"  # timeout: 2
    return: 0
    points: 1

- case409:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "15"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 8"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 8"
        - expect: "Locations: "  # timeout: 2
        - send: "8 1"
        - expect: "Locations: "  # timeout: 2
        - send: "8 3"
        - expect: "Locations: "  # timeout: 2
        - send: "8 4"
        - expect: "Locations: "  # timeout: 2
        - send: "8 6"
        - expect: "Locations: "  # timeout: 2
        - send: "8 8"
        - expect: "Best Slot Found In: 6 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case411:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "2"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Best Slot Found In: 1 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case412:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Best Slot Found In: 8 8\r\n"  # timeout: 2
    return: 0
    points: 1

- case413:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Best Slot Found In: 7 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case414:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Best Slot Found In: 5 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case416:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "7 7"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case417:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Best Slot Found In: 5 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case419:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Best Slot Found In: 2 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case420:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Best Slot Found In: 4 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case422:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case425:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 8"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 8"
        - expect: "Best Slot Found In: 9 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case426:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Best Slot Found In: 2 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case427:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Best Slot Found In: 1 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case430:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "3"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Best Slot Found In: 2 3\r\n"  # timeout: 2
    return: 0
    points: 1

- case431:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Best Slot Found In: 7 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case432:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Best Slot Found In: 1 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case433:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 7"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case434:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "3"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case435:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Best Slot Found In: 1 4\r\n"  # timeout: 2
    return: 0
    points: 1

- case437:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "7 1"
        - expect: "Locations: "  # timeout: 2
        - send: "7 3"
        - expect: "Locations: "  # timeout: 2
        - send: "7 7"
        - expect: "Locations: "  # timeout: 2
        - send: "7 8"
        - expect: "Locations: "  # timeout: 2
        - send: "8 1"
        - expect: "Locations: "  # timeout: 2
        - send: "8 3"
        - expect: "Locations: "  # timeout: 2
        - send: "8 7"
        - expect: "Locations: "  # timeout: 2
        - send: "8 8"
        - expect: "Best Slot Found In: 1 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case438:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "2"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case440:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "2"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case442:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "10 6"
        - expect: "Locations: "  # timeout: 2
        - send: "10 9"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case445:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 9"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 9"
        - expect: "Best Slot Found In: 9 6\r\n"  # timeout: 2
    return: 0
    points: 1

- case446:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Best Slot Found In: 1 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case447:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 6"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Best Slot Found In: 4 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case448:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Best Slot Found In: 6 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case449:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 6"
        - expect: "Best Slot Found In: 1 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case451:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "1 10"
        - expect: "Locations: "  # timeout: 2
        - send: "9 5"
        - expect: "Locations: "  # timeout: 2
        - send: "9 10"
        - expect: "Best Slot Found In: 5 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case452:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "12"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 9"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 9"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 9"
        - expect: "Locations: "  # timeout: 2
        - send: "9 5"
        - expect: "Locations: "  # timeout: 2
        - send: "9 6"
        - expect: "Locations: "  # timeout: 2
        - send: "9 9"
        - expect: "Best Slot Found In: 2 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case453:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "15"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 10"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 10"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 10"
        - expect: "Locations: "  # timeout: 2
        - send: "8 1"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 10"
        - expect: "Locations: "  # timeout: 2
        - send: "10 1"
        - expect: "Locations: "  # timeout: 2
        - send: "10 2"
        - expect: "Locations: "  # timeout: 2
        - send: "10 10"
        - expect: "Best Slot Found In: 2 6\r\n"  # timeout: 2
    return: 0
    points: 1

- case454:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "20"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 7"
        - expect: "Locations: "  # timeout: 2
        - send: "1 8"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 7"
        - expect: "Locations: "  # timeout: 2
        - send: "3 8"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Locations: "  # timeout: 2
        - send: "6 8"
        - expect: "Locations: "  # timeout: 2
        - send: "10 1"
        - expect: "Locations: "  # timeout: 2
        - send: "10 2"
        - expect: "Locations: "  # timeout: 2
        - send: "10 3"
        - expect: "Locations: "  # timeout: 2
        - send: "10 7"
        - expect: "Locations: "  # timeout: 2
        - send: "10 8"
        - expect: "Best Slot Found In: 8 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case455:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "12"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "1 8"
        - expect: "Locations: "  # timeout: 2
        - send: "1 9"
        - expect: "Locations: "  # timeout: 2
        - send: "1 10"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Locations: "  # timeout: 2
        - send: "5 9"
        - expect: "Locations: "  # timeout: 2
        - send: "5 10"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 8"
        - expect: "Locations: "  # timeout: 2
        - send: "6 9"
        - expect: "Locations: "  # timeout: 2
        - send: "6 10"
        - expect: "Best Slot Found In: 10 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case458:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Best Slot Found In: 4 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case460:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Locations: "  # timeout: 2
        - send: "7 1"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 8"
        - expect: "Best Slot Found In: 1 3\r\n"  # timeout: 2
    return: 0
    points: 1

- case461:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "9"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case462:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 7"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 7"
        - expect: "Best Slot Found In: 7 3\r\n"  # timeout: 2
    return: 0
    points: 1

- case464:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "3"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 1"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Best Slot Found In: 3 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case465:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 5"
        - expect: "Best Slot Found In: 1 9\r\n"  # timeout: 2
    return: 0
    points: 1

- case466:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "9"
        - expect: "Cars: "  # timeout: 2
        - send: "5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 8"
        - expect: "Locations: "  # timeout: 2
        - send: "3 9"
        - expect: "Best Slot Found In: 9 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case467:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 1"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Best Slot Found In: 1 6\r\n"  # timeout: 2
    return: 0
    points: 1

- case468:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "1"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Best Slot Found In: 0 0\r\n"  # timeout: 2
    return: 1

- case469:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "8"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 9"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 9"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 9"
        - expect: "Locations: "  # timeout: 2
        - send: "9 2"
        - expect: "Locations: "  # timeout: 2
        - send: "9 9"
        - expect: "Best Slot Found In: 1 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case470:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "18"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 7"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 7"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 6"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Locations: "  # timeout: 2
        - send: "8 5"
        - expect: "Locations: "  # timeout: 2
        - send: "8 6"
        - expect: "Locations: "  # timeout: 2
        - send: "8 7"
        - expect: "Locations: "  # timeout: 2
        - send: "9 5"
        - expect: "Locations: "  # timeout: 2
        - send: "9 6"
        - expect: "Locations: "  # timeout: 2
        - send: "9 7"
        - expect: "Locations: "  # timeout: 2
        - send: "10 5"
        - expect: "Locations: "  # timeout: 2
        - send: "10 6"
        - expect: "Locations: "  # timeout: 2
        - send: "10 7"
        - expect: "Best Slot Found In: 2 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case471:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case472:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "4"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Best Slot Found In: 2 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case473:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 4"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Best Slot Found In: 7 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case474:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 6"
        - expect: "Best Slot Found In: 6 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case475:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case476:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "2"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case477:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Best Slot Found In: 7 7\r\n"  # timeout: 2
    return: 0
    points: 1

- case478:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 6"
        - expect: "Locations: "  # timeout: 2
        - send: "4 6"
        - expect: "Best Slot Found In: 6 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case480:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "5"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "1 3"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 3"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Best Slot Found In: 2 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case481:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Best Slot Found In: 1 6\r\n"  # timeout: 2
    return: 0
    points: 1

- case483:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 3"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Best Slot Found In: 8 8\r\n"  # timeout: 2
    return: 0
    points: 1

- case485:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 3"
        - expect: "Locations: "  # timeout: 2
        - send: "7 8"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 3"
        - expect: "Locations: "  # timeout: 2
        - send: "8 8"
        - expect: "Best Slot Found In: 1 5\r\n"  # timeout: 2
    return: 0
    points: 1

- case486:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "18"
        - expect: "Locations: "  # timeout: 2
        - send: "3 2"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 7"
        - expect: "Locations: "  # timeout: 2
        - send: "4 2"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 7"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 7"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 7"
        - expect: "Locations: "  # timeout: 2
        - send: "7 2"
        - expect: "Locations: "  # timeout: 2
        - send: "7 4"
        - expect: "Locations: "  # timeout: 2
        - send: "7 7"
        - expect: "Locations: "  # timeout: 2
        - send: "8 2"
        - expect: "Locations: "  # timeout: 2
        - send: "8 4"
        - expect: "Locations: "  # timeout: 2
        - send: "8 7"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case487:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "3"
        - expect: "Cars: "  # timeout: 2
        - send: "2"
        - expect: "Locations: "  # timeout: 2
        - send: "2 1"
        - expect: "Locations: "  # timeout: 2
        - send: "2 2"
        - expect: "Best Slot Found In: 1 3\r\n"  # timeout: 2
    return: 0
    points: 1

- case488:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "10"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "8 5"
        - expect: "Locations: "  # timeout: 2
        - send: "10 5"
        - expect: "Best Slot Found In: 3 10\r\n"  # timeout: 2
    return: 0
    points: 1

- case492:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "4"
        - expect: "Locations: "  # timeout: 2
        - send: "1 2"
        - expect: "Locations: "  # timeout: 2
        - send: "1 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Best Slot Found In: 8 8\r\n"  # timeout: 2
    return: 0
    points: 1

- case494:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "1"
        - expect: "Cars: "  # timeout: 2
        - send: "1"
        - expect: "Best Slot Found In: 0 0\r\n"  # timeout: 2
    return: 1

- case496:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "6"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "2 3"
        - expect: "Locations: "  # timeout: 2
        - send: "2 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 3"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 3"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Best Slot Found In: 1 1\r\n"  # timeout: 2
    return: 0
    points: 1

- case498:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "8"
        - expect: "Cars: "  # timeout: 2
        - send: "16"
        - expect: "Locations: "  # timeout: 2
        - send: "3 1"
        - expect: "Locations: "  # timeout: 2
        - send: "3 4"
        - expect: "Locations: "  # timeout: 2
        - send: "3 5"
        - expect: "Locations: "  # timeout: 2
        - send: "3 8"
        - expect: "Locations: "  # timeout: 2
        - send: "4 1"
        - expect: "Locations: "  # timeout: 2
        - send: "4 4"
        - expect: "Locations: "  # timeout: 2
        - send: "4 5"
        - expect: "Locations: "  # timeout: 2
        - send: "4 8"
        - expect: "Locations: "  # timeout: 2
        - send: "5 1"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "5 8"
        - expect: "Locations: "  # timeout: 2
        - send: "8 1"
        - expect: "Locations: "  # timeout: 2
        - send: "8 4"
        - expect: "Locations: "  # timeout: 2
        - send: "8 5"
        - expect: "Locations: "  # timeout: 2
        - send: "8 8"
        - expect: "Best Slot Found In: 1 2\r\n"  # timeout: 2
    return: 0
    points: 1

- case499:
    run: ./assignment3
    script:
        - expect: "Size: "  # timeout: 2
        - send: "7"
        - expect: "Cars: "  # timeout: 2
        - send: "6"
        - expect: "Locations: "  # timeout: 2
        - send: "5 2"
        - expect: "Locations: "  # timeout: 2
        - send: "5 4"
        - expect: "Locations: "  # timeout: 2
        - send: "5 5"
        - expect: "Locations: "  # timeout: 2
        - send: "6 2"
        - expect: "Locations: "  # timeout: 2
        - send: "6 4"
        - expect: "Locations: "  # timeout: 2
        - send: "6 5"
        - expect: "Best Slot Found In: 1 7\r\n"  # timeout: 2
    return: 0
    points: 1

