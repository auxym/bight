# MIT License
#
# Copyright (c) 2023 Francis Thérien
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


template toOpenArrayByte(p: pointer, len: Natural): untyped =
  cast[ptr UncheckedArray[byte]](p).toOpenArray(0, len - 1)

proc readU64LE*(b: openArray[byte]): uint64 =
  const bmask = 255'u64
  result =
    (bmask and b[7]) shl 0o70 or
    (bmask and b[6]) shl 0o60 or
    (bmask and b[5]) shl 0o50 or
    (bmask and b[4]) shl 0o40 or
    (bmask and b[3]) shl 0o30 or
    (bmask and b[2]) shl 0o20 or
    (bmask and b[1]) shl 0o10 or
    (bmask and b[0])

proc readU64LE*(p: pointer): uint64 =
  readU64LE(p.toOpenArrayByte(8))

proc readI64LE*(b: openArray[byte]): int64 =
  cast[int64](readU64LE(b))

proc readI64LE*(p: pointer): int64 =
  cast[int64](readU64LE(p))

proc readU64BE*(b: openArray[byte]): uint64 =
  const bmask = 255'u64
  result =
    (bmask and b[0]) shl 0o70 or
    (bmask and b[1]) shl 0o60 or
    (bmask and b[2]) shl 0o50 or
    (bmask and b[3]) shl 0o40 or
    (bmask and b[4]) shl 0o30 or
    (bmask and b[5]) shl 0o20 or
    (bmask and b[6]) shl 0o10 or
    (bmask and b[7])

proc readU64BE*(p: pointer): uint64 =
  readU64BE(p.toOpenArrayByte(8))

proc readI64BE*(b: openArray[byte]): int64 =
  cast[int64](readU64BE(b))

proc readI64BE*(p: pointer): int64 =
  cast[int64](readU64BE(p))

proc readU32LE*(b: openArray[byte]): uint32 =
  const bmask = 255'u32
  result =
    (bmask and b[3]) shl 0o30 or
    (bmask and b[2]) shl 0o20 or
    (bmask and b[1]) shl 0o10 or
    (bmask and b[0])

proc readU32LE*(p: pointer): uint32 =
  readU32LE(p.toOpenArrayByte(4))

proc readI32LE*(b: openArray[byte]): int32 =
  cast[int32](readU32LE(b))

proc readI32LE*(p: pointer): int32 =
  cast[int32](readU32LE(p))

proc readU32BE*(b: openArray[byte]): uint32 =
  const bmask = 255'u32
  result =
    (bmask and b[0]) shl 0o30 or
    (bmask and b[1]) shl 0o20 or
    (bmask and b[2]) shl 0o10 or
    (bmask and b[3])

proc readU32BE*(p: pointer): uint32 =
  readU32BE(p.toOpenArrayByte(4))

proc readI32BE*(b: openArray[byte]): int32 =
  cast[int32](readU32BE(b))

proc readI32BE*(p: pointer): int32 =
  cast[int32](readU32BE(p))

proc readU16LE*(b: openArray[byte]): uint16 =
  const bmask = 255'u16
  result = (bmask and b[1]) shl 8 or (bmask and b[0])

proc readU16LE*(p: pointer): uint16 =
  readU16LE(p.toOpenArrayByte(4))

proc readI16LE*(b: openArray[byte]): int16 =
  cast[int16](readU16LE(b))

proc readI16LE*(p: pointer): int16 =
  cast[int16](readU16LE(p))

proc readU16BE*(b: openArray[byte]): uint16 =
  const bmask = 255'u16
  result = (bmask and b[0]) shl 8 or (bmask and b[1])

proc readU16BE*(p: pointer): uint16 =
  readU16BE(p.toOpenArrayByte(4))

proc readI16BE*(b: openArray[byte]): int16 =
  cast[int16](readU16BE(b))

proc readI16BE*(p: pointer): int16 =
  cast[int16](readU16BE(p))

when isMainModule:
  assert readU64LE([0xFF'u8, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88]) == 9843086184167632639'u64
  assert readU64BE([0xFF'u8, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88]) == 18441921395520346504'u64
  assert readI64LE([0xFF'u8, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88]) == -8603657889541918977'i64
  assert readI64BE([0xFF'u8, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88]) == -4822678189205112'i64

  assert readU32LE([0xFF'u8, 0xEE, 0xDD, 0xCC]) == 3437096703'u32
  assert readU32BE([0xFF'u8, 0xEE, 0xDD, 0xCC]) == 4293844428'u32
  assert readI32LE([0xFF'u8, 0xEE, 0xDD, 0xCC]) == -857870593'i32
  assert readI32BE([0xFF'u8, 0xEE, 0xDD, 0xCC]) == -1122868'i32

  assert readU16LE([0xFF'u8, 0xEE, 0xDD, 0xCC]) == 61183'u16
  assert readU16BE([0xFF'u8, 0xEE, 0xDD, 0xCC]) == 65518'u16
  assert readI16LE([0xFF'u8, 0xEE, 0xDD, 0xCC]) == -4353'i16
  assert readI16BE([0xFF'u8, 0xEE, 0xDD, 0xCC]) == -18'i16

  echo "OK"
