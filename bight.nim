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

func readU64LE*(b: openArray[byte]): uint64 =
  ## Read a `uint64` in little-endian order from a byte array.
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

func readU64LE*(p: pointer): uint64 =
  ## Read a `uint64` in little-endian order from a memory location specified by
  ## a pointer.
  ##
  ## Note: all pointer operations are unsafe. This proc will read 8 bytes from
  ## the provided pointer.
  readU64LE(p.toOpenArrayByte(8))

func readI64LE*(b: openArray[byte]): int64 =
  ## Read an `int64` in little-endian order from a byte array.
  cast[int64](readU64LE(b))

func readI64LE*(p: pointer): int64 =
  ## Read an `int64` in little-endian order from a memory location specified by a pointer.
  ##
  ## Note: all pointer operations are unsafe. This proc will read 8 bytes from
  ## the provided pointer.
  cast[int64](readU64LE(p))

func readU64BE*(b: openArray[byte]): uint64 =
  ## Read a `uint64` in big-endian order from a byte array.
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

func readU64BE*(p: pointer): uint64 =
  ## Read a `uint64` in big-endian order from a memory location specified by a pointer.
  ##
  ## Note: all pointer operations are unsafe. This proc will read 8 bytes from
  ## the provided pointer.
  readU64BE(p.toOpenArrayByte(8))

func readI64BE*(b: openArray[byte]): int64 =
  ## Read an `int64` in big-endian order from a byte array.
  cast[int64](readU64BE(b))

func readI64BE*(p: pointer): int64 =
  ## Read an `int64` in big-endian order from a memory location specified by a pointer.
  ##
  ## Note: all pointer operations are unsafe. This proc will read 8 bytes from
  ## the provided pointer.
  cast[int64](readU64BE(p))

func readU32LE*(b: openArray[byte]): uint32 =
  ## Read a `uint32` in little-endian order from a byte array.
  const bmask = 255'u32
  result =
    (bmask and b[3]) shl 0o30 or
    (bmask and b[2]) shl 0o20 or
    (bmask and b[1]) shl 0o10 or
    (bmask and b[0])

func readU32LE*(p: pointer): uint32 =
  ## Read a `uint32` in little-endian order from a memory location specified by a pointer.
  ##
  ## Note: all pointer operations are unsafe. This proc will read 4 bytes from
  ## the provided pointer.
  readU32LE(p.toOpenArrayByte(4))

func readI32LE*(b: openArray[byte]): int32 =
  ## Read an `int32` in little-endian order from a byte array.
  cast[int32](readU32LE(b))

func readI32LE*(p: pointer): int32 =
  ## Read an `int32` in little-endian order from a memory location specified by a pointer.
  ##
  ## Note: all pointer operations are unsafe. This proc will read 4 bytes from
  ## the provided pointer.
  cast[int32](readU32LE(p))

func readU32BE*(b: openArray[byte]): uint32 =
  ## Read a `uint32` in big-endian order from a byte array.
  const bmask = 255'u32
  result =
    (bmask and b[0]) shl 0o30 or
    (bmask and b[1]) shl 0o20 or
    (bmask and b[2]) shl 0o10 or
    (bmask and b[3])

func readU32BE*(p: pointer): uint32 =
  ## Read a `uint32` in big-endian order from a memory location specified by a pointer.
  ##
  ## Note: all pointer operations are unsafe. This proc will read 4 bytes from
  ## the provided pointer.
  readU32BE(p.toOpenArrayByte(4))

func readI32BE*(b: openArray[byte]): int32 =
  ## Read an `int32` in big-endian order from a byte array.
  cast[int32](readU32BE(b))

func readI32BE*(p: pointer): int32 =
  ## Read an `int32` in big-endian order from a memory location specified by a pointer.
  ##
  ## Note: all pointer operations are unsafe. This proc will read 4 bytes from
  ## the provided pointer.
  cast[int32](readU32BE(p))

func readU16LE*(b: openArray[byte]): uint16 =
  ## Read a `uint16` in little-endian order from a byte array.
  const bmask = 255'u16
  result = (bmask and b[1]) shl 8 or (bmask and b[0])

func readU16LE*(p: pointer): uint16 =
  ## Read a `uint16` in little-endian order from a memory location specified by a pointer.
  ##
  ## Note: all pointer operations are unsafe. This proc will read 2 bytes from
  ## the provided pointer.
  readU16LE(p.toOpenArrayByte(4))

func readI16LE*(b: openArray[byte]): int16 =
  ## Read an `int16` in little-endian order from a byte array.
  cast[int16](readU16LE(b))

func readI16LE*(p: pointer): int16 =
  ## Read an `int16` in little-endian order from a memory location specified by a pointer.
  ##
  ## Note: all pointer operations are unsafe. This proc will read 2 bytes from
  ## the provided pointer.
  cast[int16](readU16LE(p))

func readU16BE*(b: openArray[byte]): uint16 =
  ## Read a `uint16` in big-endian order from a byte array.
  const bmask = 255'u16
  result = (bmask and b[0]) shl 8 or (bmask and b[1])

func readU16BE*(p: pointer): uint16 =
  ## Read a `uint16` in big-endian order from a memory location specified by a pointer.
  ##
  ## Note: all pointer operations are unsafe. This proc will read 2 bytes from
  ## the provided pointer.
  readU16BE(p.toOpenArrayByte(4))

func readI16BE*(b: openArray[byte]): int16 =
  ## Read an `int16` in big-endian order from a byte array.
  cast[int16](readU16BE(b))

func readI16BE*(p: pointer): int16 =
  ## Read an `int16` in big-endian order from a memory location specified by a pointer.
  ##
  ## Note: all pointer operations are unsafe. This proc will read 2 bytes from
  ## the provided pointer.
  cast[int16](readU16BE(p))

proc writeBytesBE*[T: SomeInteger](x: T, dst: var openArray[byte]) =
  ## Write the given integer as bytes in big-endian order to the byte array `dst`.
  const bmask = block:
    when T is SomeSignedInt:
      0xFF'i64
    else:
      0xFF'u64

  const s = sizeof(T)
  when s == 8:
    dst[0] = byte(((bmask shl 0o70) and x) shr 0o70)
    dst[1] = byte(((bmask shl 0o60) and x) shr 0o60)
    dst[2] = byte(((bmask shl 0o50) and x) shr 0o50)
    dst[3] = byte(((bmask shl 0o40) and x) shr 0o40)
  when s >= 4:
    dst[s - 4] = byte(((bmask shl 0o30) and x) shr 0o30)
    dst[s - 3] = byte(((bmask shl 0o20) and x) shr 0o20)
  when s >= 2:
    dst[s - 2] = byte(((bmask shl 0o10) and x) shr 0o10)
  dst[s - 1] = byte(bmask and x)

proc writeBytesBE*[T: SomeInteger](x: T, dst: pointer) =
  ## Write the given integer as bytes in big-endian order to a memory location
  ## specified by a pointer.
  ##
  ## Note: All pointer operations are unsafe. This proc will write `sizeof(x)`
  ## bytes in memory at the location specified by the `dst` pointer.
  var uarr = cast[ptr UncheckedArray[byte]](dst)
  writeBytesBE(x, uarr.toOpenArray(0, sizeof(T) - 1))

func toBytesBE*[T: SomeInteger](x: T): array[sizeof(x), byte] =
  ## Encode given integer as an array of bytes in big-endian order.
  ##
  ## Returns an array of `sizeof(x)` bytes.
  writeBytesBE(x, result)

proc writeBytesLE*[T: SomeInteger](x: T, dst: var openArray[byte]) =
  ## Write the given integer as bytes in little-endian order to the byte array `dst`.
  const bmask = block:
    when T is SomeSignedInt:
      0xFF'i64
    else:
      0xFF'u64

  const s = sizeof(T)
  when s == 8:
    dst[7] = byte(((bmask shl 0o70) and x) shr 0o70)
    dst[6] = byte(((bmask shl 0o60) and x) shr 0o60)
    dst[5] = byte(((bmask shl 0o50) and x) shr 0o50)
    dst[4] = byte(((bmask shl 0o40) and x) shr 0o40)
  when s >= 4:
    dst[3] = byte(((bmask shl 0o30) and x) shr 0o30)
    dst[2] = byte(((bmask shl 0o20) and x) shr 0o20)
  when s >= 2:
    dst[1] = byte(((bmask shl 0o10) and x) shr 0o10)
  dst[0] = byte(bmask and x)

proc writeBytesLE*[T: SomeInteger](x: T, dst: pointer) =
  ## Write the given integer as bytes in little-endian order to a memory location
  ## specified by a pointer.
  ##
  ## Note: All pointer operations are unsafe. This proc will write `sizeof(x)`
  ## bytes in memory at the location specified by the `dst` pointer.
  var uarr = cast[ptr UncheckedArray[byte]](dst)
  writeBytesLE(x, uarr.toOpenArray(0, sizeof(T) - 1))

func toBytesLE*[T: SomeInteger](x: T): array[sizeof(x), byte] =
  ## Encode given integer as an array of bytes in little-endian order.
  ##
  ## Returns an array of `sizeof(x)` bytes.
  writeBytesLE(x, result)
