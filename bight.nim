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

proc readU32LE*(b: openArray[byte]): uint64 =
  const bmask = 255'u64
  result =
    (bmask and b[3]) shl 0o30 or
    (bmask and b[2]) shl 0o20 or
    (bmask and b[1]) shl 0o10 or
    (bmask and b[0])

proc readU32LE*(p: pointer): uint64 =
  readU32LE(p.toOpenArrayByte(4))

proc readI32LE*(b: openArray[byte]): int64 =
  cast[int32](readU64LE(b))

proc readI32LE*(p: pointer): int64 =
  cast[int32](readU64LE(p))

proc readU32BE*(b: openArray[byte]): uint64 =
  const bmask = 255'u64
  result =
    (bmask and b[0]) shl 0o30 or
    (bmask and b[1]) shl 0o20 or
    (bmask and b[2]) shl 0o10 or
    (bmask and b[3])

proc readU32BE*(p: pointer): uint64 =
  readU32BE(p.toOpenArrayByte(4))

proc readI32BE*(b: openArray[byte]): int64 =
  cast[int32](readU64BE(b))

proc readI32BE*(p: pointer): int64 =
  cast[int32](readU64BE(p))

when isMainModule:
  assert readU64LE([0xFF'u8, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88]) == 9843086184167632639'u64
  assert readU64BE([0xFF'u8, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88]) == 18441921395520346504'u64
  assert readI64LE([0xFF'u8, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88]) == -8603657889541918977'i64
  assert readI64BE([0xFF'u8, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88]) == -4822678189205112'i64
  echo "OK"