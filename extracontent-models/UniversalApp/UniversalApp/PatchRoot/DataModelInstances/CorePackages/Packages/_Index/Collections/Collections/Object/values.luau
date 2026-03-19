local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.ES7Types);
return function(v2) --[[ Line: 23 ]]
    if v2 == nil then
        error("cannot extract values from a nil value");
    end;
    local v3 = typeof(v2);
    local v4 = nil;
    if v3 == "table" then
        v4 = {};
        for _, v6 in pairs(v2) do
            table.insert(v4, v6);
        end;
        return v4;
    else
        if v3 == "string" then
            local v7 = v2:len();
            v4 = table.create(v7);
            for v8 = 1, v7 do
                v4[v8] = v2:sub(v8, v8);
            end;
        end;
        return v4;
    end;
end;