local l_Number_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Number;
local v1 = require(script.Parent.null);
local function v2(v3, v4) --[[ Line: 13 ]] --[[ Name: deepEqual ]]
    -- upvalues: l_Number_0 (copy), v1 (copy), v2 (copy)
    if typeof(v3) ~= typeof(v4) then
        return false, (("{1}: value of type '%s'\n{2}: value of type '%s'"):format(typeof(v3), (typeof(v4))));
    elseif l_Number_0.isNaN(v3) and l_Number_0.isNaN(v4) then
        return true;
    elseif v3 == v4 then
        return true;
    elseif v3 == v1 or v4 == v1 or typeof(v3) ~= "table" then
        return false, string.format("{1} (%s) ~= {2} (%s)", tostring(v3), (tostring(v4)));
    else
        local v5 = {};
        for v6, v7 in pairs(v3) do
            v5[v6] = true;
            local v8, v9 = v2(v7, v4[v6]);
            if not v8 then
                return false, (v9:gsub("{1}", ("{1}[%s]"):format((tostring(v6)))):gsub("{2}", ("{2}[%s]"):format((tostring(v6)))));
            end;
        end;
        for v10, v11 in pairs(v4) do
            if not v5[v10] then
                local v12, v13 = v2(v3[v10], v11);
                if not v12 then
                    return false, (v13:gsub("{1}", ("{1}[%s]"):format((tostring(v10)))):gsub("{2}", ("{2}[%s]"):format((tostring(v10)))));
                end;
            end;
        end;
        return true;
    end;
end;
return v2;