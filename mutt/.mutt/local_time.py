#!/usr/bin/env python

import email
import email.generator
import io
import sys

raw_message = sys.stdin.read()
message = email.message_from_string(raw_message)
date = message['Date']

if date:
    date = email.utils.parsedate_to_datetime(date)
    local_date = date.astimezone()
    message.add_header('X-Local-Date', email.utils.format_datetime(local_date))
    stream = io.StringIO()
    generator = email.generator.Generator(stream, mangle_from_=False)
    generator.flatten(message)
    raw_message = stream.getvalue()

print(raw_message, end='', flush=True)
