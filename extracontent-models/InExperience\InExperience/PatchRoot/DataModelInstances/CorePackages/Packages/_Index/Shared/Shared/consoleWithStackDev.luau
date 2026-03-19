local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local v2 = require(l_Parent_0.LuauPolyfill);
local l_console_0 = v2.console;
local l_Array_0 = v2.Array;
local v5 = require(script.Parent.ReactSharedInternals);
local v6 = nil;
local v9 = {
    warn = function(v7, ...) --[[ Line: 26 ]]
        -- upvalues: v1 (copy), v6 (ref)
        if v1.__DEV__ then
            v6("warn", v7, {
                ...
            });
        end;
    end, 
    error = function(v8, ...) --[[ Line: 31 ]]
        -- upvalues: v1 (copy), v6 (ref)
        if v1.__DEV__ then
            v6("error", v8, {
                ...
            });
        end;
    end
};
v6 = function(v10, v11, v12) --[[ Line: 37 ]] --[[ Name: printWarning ]]
    -- upvalues: v1 (copy), v5 (copy), l_Array_0 (copy), l_console_0 (copy)
    if v1.__DEV__ then
        local v13 = v5.ReactDebugCurrentFrame.getStackAddendum();
        if v13 ~= "" then
            v11 = v11 .. "%s";
            v12 = l_Array_0.slice(v12, 1);
            table.insert(v12, v13);
        end;
        local v14 = l_Array_0.map(v12, tostring);
        table.insert(v14, 1, "Warning: " .. v11);
        l_console_0[v10](unpack(v14));
    end;
end;
return v9;