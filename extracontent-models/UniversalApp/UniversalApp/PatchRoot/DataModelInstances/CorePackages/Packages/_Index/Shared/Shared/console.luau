local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.ReactGlobals);
local l_console_0 = require(l_Parent_1.LuauPolyfill).console;
local v4 = require(l_Parent_0.consoleWithStackDev);
if v2.__DEV__ then
    return (setmetatable({
        warn = v4.warn, 
        error = v4.error
    }, {
        __index = l_console_0
    }));
else
    return l_console_0;
end;