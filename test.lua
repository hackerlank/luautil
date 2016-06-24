require("util")
require("file")

local fd = io.open("dd", "rb")
if fd then
    print(fd:i8(), fd:u8(), fd:i32())
    fd:close()
end



