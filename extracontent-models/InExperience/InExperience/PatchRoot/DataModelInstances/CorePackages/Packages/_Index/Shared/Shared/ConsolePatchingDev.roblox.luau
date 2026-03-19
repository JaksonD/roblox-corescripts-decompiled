local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local v2 = require(script.Parent.console);
local v3 = 0;
local v4 = nil;
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = nil;
local v10 = nil;
local function v11() --[[ Line: 34 ]]

end;
return {
    disabledLog = v11, 
    disableLogs = function() --[[ Line: 43 ]]
        -- upvalues: v1 (copy), v3 (ref), v4 (ref), v2 (copy), v5 (ref), v6 (ref), v7 (ref), v8 (ref), v9 (ref), v10 (ref), v11 (copy)
        if v1.__DEV__ then
            if v3 == 0 then
                v4 = v2.log;
                v5 = v2.info;
                v6 = v2.warn;
                v7 = v2.error;
                v8 = v2.group;
                v9 = v2.groupCollapsed;
                v10 = v2.groupEnd;
                v2.info = v11;
                v2.log = v11;
                v2.warn = v11;
                v2.error = v11;
                v2.group = v11;
                v2.groupCollapsed = v11;
                v2.groupEnd = v11;
            end;
            v3 = v3 + 1;
        end;
    end, 
    reenableLogs = function() --[[ Line: 67 ]]
        -- upvalues: v1 (copy), v3 (ref), v2 (copy), v4 (ref), v5 (ref), v6 (ref), v7 (ref), v8 (ref), v9 (ref), v10 (ref)
        if v1.__DEV__ then
            v3 = v3 - 1;
            if v3 == 0 then
                v2.log = v4;
                v2.info = v5;
                v2.warn = v6;
                v2.error = v7;
                v2.group = v8;
                v2.groupCollapsed = v9;
                v2.groupEnd = v10;
            end;
            if v3 < 0 then
                v2.error("disabledDepth fell below zero. This is a bug in React. Please file an issue.");
            end;
        end;
    end
};