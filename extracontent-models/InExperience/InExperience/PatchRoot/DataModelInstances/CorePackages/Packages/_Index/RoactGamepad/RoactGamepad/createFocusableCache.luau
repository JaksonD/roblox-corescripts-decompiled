local v0 = require(script.Parent.asFocusable);
local function v2(v1) --[[ Line: 3 ]] --[[ Name: checkHostProperties ]]
    assert(Instance.new(v1):IsA("GuiObject"));
end;
local _ = function(v3) --[[ Line: 9 ]] --[[ Name: isValidFocusable ]]
    -- upvalues: v2 (copy)
    local v4 = typeof(v3);
    if v4 == "string" then
        local l_status_0, _ = pcall(v2, v3);
        return l_status_0;
    elseif v4 == "function" or v4 == "table" then
        return true;
    else
        return false;
    end;
end;
return function() --[[ Line: 25 ]] --[[ Name: createFocusableCache ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v8 = {};
    setmetatable(v8, {
        __index = function(_, v10) --[[ Line: 29 ]] --[[ Name: __index ]]
            -- upvalues: v2 (ref), v0 (ref), v8 (copy)
            local v11 = typeof(v10);
            local v12;
            if v11 == "string" then
                local l_status_1, _ = pcall(v2, v10);
                v12 = l_status_1;
            else
                v12 = v11 == "function" or v11 == "table";
            end;
            if not v12 then
                error("Component " .. tostring(v10) .. " (" .. typeof(v10) .. ") is not a valid focusable component", 2);
            end;
            v12 = v0(v10);
            v8[v10] = v12;
            return v12;
        end, 
        __tostring = function(v15) --[[ Line: 39 ]] --[[ Name: __tostring ]]
            local v16 = "{";
            for v17, v18 in pairs(v15) do
                v16 = ("%s\n\t%s -> %s"):format(v16, tostring(v17), (tostring(v18)));
            end;
            return v16 .. "\n}";
        end
    });
    return v8;
end;