local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local function v4(v5, v6) --[[ Line: 12 ]] --[[ Name: equal ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v4 (copy)
    if typeof(v5) ~= typeof(v6) then
        return false;
    elseif v5 == v6 then
        return true;
    elseif typeof(v5) == "table" then
        if l_Array_0.isArray(v5) and not l_Array_0.isArray(v6) then
            return false;
        elseif #v5 ~= #v6 or #l_Object_0.keys(v5) ~= #l_Object_0.keys(v6) then
            return false;
        else
            if l_Array_0.isArray(v5) then
                for v7, _ in ipairs(v5) do
                    if not v4(v5[v7], v6[v7]) then
                        return false;
                    end;
                end;
            else
                for v9 in pairs(v5) do
                    if not v4(v5[tostring(v9)], v6[tostring(v9)]) then
                        return false;
                    end;
                end;
            end;
            return true;
        end;
    elseif typeof(v5) == "string" or typeof(v5) == "number" or typeof(v5) == "boolean" then
        return v5 == v6;
    elseif typeof(v5) == "function" then
        local v10 = false;
        if debug.info(v5, "n") == debug.info(v6, "n") then
            v10 = false;
            if debug.info(v5, "s") == debug.info(v6, "s") then
                v10 = false;
                if debug.info(v5, "l") == debug.info(v6, "l") then
                    v10 = debug.info(v5, "a") == debug.info(v6, "a");
                end;
            end;
        end;
        return v10;
    else
        if typeof(v5) == "thread" then
            error("unhandled equality check for type 'thread'");
        elseif typeof(v5) == "userdata" then
            error("unhandled equality check for type 'userdata'");
        end;
        error("unhandled equality check for type " .. typeof(v5));
        return;
    end;
end;
return v4;