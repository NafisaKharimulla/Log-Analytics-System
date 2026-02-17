#!/usr/bin/env python3
import sys

for line in sys.stdin:
    parts = line.strip().split()

    # Basic Apache log format assumption:
    # IP - - [date] "GET /endpoint HTTP/1.1" status size
    if len(parts) > 8:
        try:
            endpoint = parts[6]
            status = int(parts[8])

            if status >= 400:
                print(f"STATUS_{status}\t1")
                print(f"ENDPOINT_{endpoint}\t1")

        except:
            continue
