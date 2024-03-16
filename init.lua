require("zzz.core")
require("zzz.lazy")

-- If using Windows,
-- Set shell to Powershell
if jit.os == "Windows" then
    vim.o.shell = "powershell"
end
