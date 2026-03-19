local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
return function(v2, v3, v4, v5) --[[ Line: 5 ]]
    if not v4 then
        if v5.isServer then
            error(string.format("Failed to load texture data"));
        else
            return false;
        end;
    end;
    local v6 = v4[v2];
    if not v6 then
        local v7 = v2[v3];
        if not v7 or v7 == "" then
            return false;
        elseif v5.isServer then
            error(string.format("Failed to load texture data"));
        end;
    end;
    local v8 = v6[v3];
    if not v8 or not v8.instance then
        local v9 = v2[v3];
        if not v9 or v9 == "" then
            return false;
        elseif v5.isServer then
            error(string.format("Failed to load texture data"));
        else
            return false;
        end;
    end;
    return true, v8.instance;
end;