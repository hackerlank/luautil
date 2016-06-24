
local fd = io.open("/tmp/tmp", "w+")
local file = getmetatable(fd)
fd:close()



file.readFmt = function(fd, fmt)
    local n = string.packsize(fmt)
    local s = fd:read(n)
    return string.unpack(fmt, s)
end

file.writeFmt = function(fd, fmt, v)
    local s = string.pack(fmt, v)
    return fd:write(s)
end


file.i8 = function(fd, v)
    if v then
        return file.writeFmt(fd, "b", v)
    else
        return file.readFmt(fd, "b")
    end
end

file.u8 = function(fd, v)
    if v then
        return file.writeFmt(fd, "B", v)
    else
        return file.readFmt(fd, "B")
    end
end

file.i16 = function(fd, v)
    if v then
        return file.writeFmt(fd, "h", v)
    else
        return file.readFmt(fd, "h")
    end
end

file.u16 = function(fd, v)
    if v then
        return file.writeFmt(fd, "H", v)
    else
        return file.readFmt(fd, "H")
    end
end

file.i32 = function(fd, v)
    if v then
        return file.writeFmt(fd, "i4", v)
    else
        return file.readFmt(fd, "i4")
    end
end

file.u32 = function(fd, v)
    if v then
        return file.writeFmt(fd, "I4", v)
    else
        return file.readFmt(fd, "I4")
    end
end

file.f = function(fd, v)
    if v then
        return file.writeFmt(fd, "f", v)
    else
        return file.readFmt(fd, "f")
    end
end

file.d = function(fd, v)
    if v then
        return file.writeFmt(fd, "d", v)
    else
        return file.readFmt(fd, "d")
    end
end

file.s = function(fd, n)
    if type(n) == "string" then
        return fd:write(v)
    else
        n = n or fd:uint16()
        return fd:read(n)
    end
end

