local l_isNillish_0 = require(script.Parent.Parent.luaUtils.isNillish).isNillish;
local function v5(v1, v2) --[[ Line: 10 ]] --[[ Name: instanceOf ]]
    -- upvalues: l_isNillish_0 (copy)
    if l_isNillish_0(v1) then
        return false;
    elseif typeof(v1) ~= "table" or typeof(v2) ~= "table" then
        return false;
    elseif v2.new ~= nil and v1.new == v2.new then
        return true;
    else
        local v3 = getmetatable(v1);
        while true do
            if typeof(v3) ~= "table" then
                return false;
            elseif v3.__index == v2 then
                return true;
            else
                local l_v3_0 = v3;
                v3 = getmetatable(v3.__index);
                if l_v3_0 == v3 then
                    return false;
                end;
            end;
        end;
    end;
end;
return function(v6, v7) --[[ Line: 41 ]]
    -- upvalues: v5 (copy)
    return v5(v6, v7);
end;