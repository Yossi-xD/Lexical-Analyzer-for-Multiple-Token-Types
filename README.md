# Lexical Analyzer

A lexical analyzer (scanner) built with Flex that recognizes multiple token types including integers, floating-point numbers, identifiers, C keywords, phone numbers, email addresses, and physical addresses.

## 📋 Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Token Types](#token-types)
- [Prerequisites](#prerequisites)
- [Contributing](#contributing)

## Overview

This lexical analyzer is implemented using Flex (Fast Lexical Analyzer Generator) and C. It reads an input file or standard input, identifies tokens based on defined regular expression patterns, and outputs each token with its type and line number.

## Features

- ✅ Recognizes **7 different token types**
- ✅ Handles **signed and unsigned** integers
- ✅ Supports **floating-point numbers with exponents**
- ✅ C-style **identifiers** (including underscore prefix)
- ✅ All standard **C keywords**
- ✅ **International phone numbers** with/without country codes
- ✅ **Email addresses** with 2-3 domain components
- ✅ **Physical addresses** (street, city, state, country)
- ✅ Line number tracking for each token
- ✅ Comment skipping (single-line)
- ✅ Error handling for unknown tokens

## Token Types

| Token Type | Description | Examples |
|------------|-------------|----------|
| `INTEGER` | Signed/unsigned integers | `12`, `-523`, `+4250`, `0` |
| `FLOAT` | Floating-point with optional exponent | `12.46`, `-15.0`, `-55.23e5`, `+123.12e-3` |
| `IDENTIFIER` | C-style variable/function names | `variable_name`, `counter1`, `_privateVar` |
| `KEYWORD` | C language keywords | `if`, `while`, `for`, `switch`, `case`, `break`, `continue` |
| `PHONE_NUMBER` | Telephone numbers | `054-878-0246`, `03-235-1222`, `+972-52-211-3467` |
| `EMAIL_ADDRESS` | Email addresses | `name@gmail.com`, `name@walla.co.il` |
| `ADDRESS` | Physical addresses | `246 Herzel str, Tel-aviv, Israel, Israel` |
| `UNKNOWN` | Unrecognized tokens | `$`, `@`, `#` |

## Prerequisites

- **Flex** - Lexical analyzer generator
- **GCC** - C compiler
- **Make** - Build automation (optional)

## Contributing

- Fork the repository
- Create your feature branch (git checkout -b feature/amazing-feature)
- Commit your changes (git commit -m 'Add amazing feature')
- Push to the branch (git push origin feature/amazing-feature)
- Open a Pull Request


Author
Yousef Youesf - [Yossi-xD](https://github.com/Yossi-xD)
