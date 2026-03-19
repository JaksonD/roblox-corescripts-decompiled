local v0 = require(script.Parent.Config);
local function _(v1) --[[ Line: 4 ]] --[[ Name: trimTrailingNewline ]]
    if v1:sub(-1, -1) == "\n" then
        return v1:sub(1, -2);
    else
        return v1;
    end;
end;
return function(v3, v4, v5) --[[ Line: 12 ]]
    -- upvalues: v0 (copy)
    if typeof(v4) ~= "string" then
        error("Bad argument #2 - expected a string for the name of the library");
    end;
    if typeof(v5) ~= "table" then
        error("Bad argument #3 - expected a default config table for the library");
    end;
    local v6 = {};
    local v7 = v0.new(v5);
    v6.init = function(v8) --[[ Line: 23 ]] --[[ Name: init ]]
        -- upvalues: v6 (copy), v7 (copy), v3 (copy), v4 (copy)
        setmetatable(v6, nil);
        if v8 then
            v7.set(v8);
        end;
        v6.Config = v7.get();
        local v9 = v3(v6.Config);
        for v10, v11 in pairs(v9) do
            v6[v10] = v11;
        end;
        local v12 = debug.traceback();
        local v13 = if v12:sub(-1, -1) == "\n" then v12:sub(1, -2) else v12;
        v6.init = function(v14) --[[ Line: 38 ]]
            -- upvalues: v8 (copy), v4 (ref), v13 (copy)
            if v14 == v8 then
                return;
            else
                local v15 = debug.traceback();
                local v16 = if v15:sub(-1, -1) == "\n" then v15:sub(1, -2) else v15;
                warn(string.format("%s has already been configured\nFirst init traceback:\n%s\nCurrent init traceback:\n%s", v4, v13, v16));
                return;
            end;
        end;
        if _G.__UIBLOX_TRACK_USAGE__ then
            return (setmetatable(v6, (getmetatable(v9))));
        else
            return (setmetatable(v6, {
                __index = function(_, v18) --[[ Line: 63 ]] --[[ Name: __index ]]
                    -- upvalues: v4 (ref)
                    local v19 = ("%q (%s) is not a valid member of %s"):format(tostring(v18), typeof(v18), v4);
                    error(v19, 2);
                end, 
                __newindex = function(_, v21, _) --[[ Line: 69 ]] --[[ Name: __newindex ]]
                    -- upvalues: v4 (ref)
                    local v23 = ("%q (%s) is not a valid member of %s"):format(tostring(v21), typeof(v21), v4);
                    error(v23, 2);
                end
            }));
        end;
    end;
    return (setmetatable(v6, {
        __index = function(_, _) --[[ Line: 78 ]] --[[ Name: __index ]]
            -- upvalues: v4 (copy)
            error(("You must call %s.init(config) before using it!"):format(v4), 2);
        end, 
        __newindex = function(_, _, _) --[[ Line: 82 ]] --[[ Name: __newindex ]]
            -- upvalues: v4 (copy)
            error(("You must call %s.init(config) before using it!"):format(v4), 2);
        end
    }));
end;