import std/unittest
import bight

suite "bight unit tests":
  test "Read 64-bit":
    check:
      readU64LE([0xFF'u8, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88]) == 9843086184167632639'u64
      readU64BE([0xFF'u8, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88]) == 18441921395520346504'u64
      readI64LE([0xFF'u8, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88]) == -8603657889541918977'i64
      readI64BE([0xFF'u8, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88]) == -4822678189205112'i64

  test "Read 64-bit from pointer":
    var data = [0xFF'u8, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88]
    check:
      readU64LE(data[0].addr) == 9843086184167632639'u64
      readU64BE(data[0].addr) == 18441921395520346504'u64
      readI64LE(data[0].addr) == -8603657889541918977'i64
      readI64BE(data[0].addr) == -4822678189205112'i64

  test "Read 32-bit":
    check:
      readU32LE([0xFF'u8, 0xEE, 0xDD, 0xCC]) == 3437096703'u32
      readU32BE([0xFF'u8, 0xEE, 0xDD, 0xCC]) == 4293844428'u32
      readI32LE([0xFF'u8, 0xEE, 0xDD, 0xCC]) == -857870593'i32
      readI32BE([0xFF'u8, 0xEE, 0xDD, 0xCC]) == -1122868'i32

  test "Read 32-bit from pointer":
    var data = [0xFF'u8, 0xEE, 0xDD, 0xCC]
    check:
      readU32LE(data[0].addr) == 3437096703'u32
      readU32BE(data[0].addr) == 4293844428'u32
      readI32LE(data[0].addr) == -857870593'i32
      readI32BE(data[0].addr) == -1122868'i32

  test "Read 16-bit":
    check:
      readU16LE([0xFF'u8, 0xEE]) == 61183'u16
      readU16BE([0xFF'u8, 0xEE]) == 65518'u16
      readI16LE([0xFF'u8, 0xEE]) == -4353'i16
      readI16BE([0xFF'u8, 0xEE]) == -18'i16

  test "Read 16-bit from pointer":
    var data = [0xFF'u8, 0xEE, 0xDD, 0xCC]
    check:
      readU16LE(data[0].addr) == 61183'u16
      readU16BE(data[0].addr) == 65518'u16
      readI16LE(data[0].addr) == -4353'i16
      readI16BE(data[0].addr) == -18'i16

  test "Write u64 LE":
    const
      val = 9843086184167632639'u64
      expected = [0xFF'u8, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88]
    var buf1, buf2: array[8, byte]
    writeBytesLE(val, buf1)
    writeBytesLE(val, buf2[0].addr)
    check:
      buf1 == expected
      buf2 == expected
      toBytesLE(val) == expected

  test "Write u64 BE":
    const
      val = 18441921395520346504'u64
      expected = [0xFF'u8, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88]
    var buf1, buf2: array[8, byte]
    writeBytesBE(val, buf1)
    writeBytesBE(val, buf2[0].addr)
    check:
      buf1 == expected
      buf2 == expected
      toBytesBE(val) == expected

  test "Write i64 LE":
    const
      val = -8603657889541918977'i64
      expected = [0xFF'u8, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88]
    var buf1, buf2: array[8, byte]
    writeBytesLE(val, buf1)
    writeBytesLE(val, buf2[0].addr)
    check:
      buf1 == expected
      buf2 == expected
      toBytesLE(val) == expected

  test "Write i64 BE":
    const
      val = -4822678189205112'i64
      expected = [0xFF'u8, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88]
    var buf1, buf2: array[8, byte]
    writeBytesBE(val, buf1)
    writeBytesBE(val, buf2[0].addr)
    check:
      buf1 == expected
      buf2 == expected
      toBytesBE(val) == expected

  test "Write u32 LE":
    const
      val = 3437096703'u32
      expected = [0xFF'u8, 0xEE, 0xDD, 0xCC]
    var buf1, buf2: array[4, byte]
    writeBytesLE(val, buf1)
    writeBytesLE(val, buf2[0].addr)
    check:
      buf1 == expected
      buf2 == expected
      toBytesLE(val) == expected

  test "Write u32 BE":
    const
      val = 4293844428'u32
      expected = [0xFF'u8, 0xEE, 0xDD, 0xCC]
    var buf1, buf2: array[4, byte]
    writeBytesBE(val, buf1)
    writeBytesBE(val, buf2[0].addr)
    check:
      buf1 == expected
      buf2 == expected
      toBytesBE(val) == expected

  test "Write i32 LE":
    const
      val = -857870593'i32
      expected = [0xFF'u8, 0xEE, 0xDD, 0xCC]
    var buf1, buf2: array[4, byte]
    writeBytesLE(val, buf1)
    writeBytesLE(val, buf2[0].addr)
    check:
      buf1 == expected
      buf2 == expected
      toBytesLE(val) == expected

  test "Write i32 BE":
    const
      val = -1122868'i32
      expected = [0xFF'u8, 0xEE, 0xDD, 0xCC]
    var buf1, buf2: array[4, byte]
    writeBytesBE(val, buf1)
    writeBytesBE(val, buf2[0].addr)
    check:
      buf1 == expected
      buf2 == expected
      toBytesBE(val) == expected

  test "Write u16 LE":
    const
      val = 61183'u16
      expected = [0xFF'u8, 0xEE]
    var buf1, buf2: array[2, byte]
    writeBytesLE(val, buf1)
    writeBytesLE(val, buf2[0].addr)
    check:
      buf1 == expected
      buf2 == expected
      toBytesLE(val) == expected

  test "Write u16 BE":
    const
      val = 65518'u16
      expected = [0xFF'u8, 0xEE]
    var buf1, buf2: array[2, byte]
    writeBytesBE(val, buf1)
    writeBytesBE(val, buf2[0].addr)
    check:
      buf1 == expected
      buf2 == expected
      toBytesBE(val) == expected

  test "Write i16 LE":
    const
      val = -4353'i16
      expected = [0xFF'u8, 0xEE]
    var buf1, buf2: array[2, byte]
    writeBytesLE(val, buf1)
    writeBytesLE(val, buf2[0].addr)
    check:
      buf1 == expected
      buf2 == expected
      toBytesLE(val) == expected

  test "Write i16 BE":
    const
      val = -18'i16
      expected = [0xFF'u8, 0xEE]
    var buf1, buf2: array[2, byte]
    writeBytesBE(val, buf1)
    writeBytesBE(val, buf2[0].addr)
    check:
      buf1 == expected
      buf2 == expected
      toBytesBE(val) == expected