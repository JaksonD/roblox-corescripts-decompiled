local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.isArray);
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.types);
return function(v4, ...) --[[ Line: 14 ]] --[[ Name: concat ]]
    -- upvalues: v1 (copy)
    local v5 = nil;
    local v6 = 0;
    if v1(v4) then
        v5 = table.clone(v4);
        v6 = #v4;
    else
        v6 = v6 + 1;
        v5 = {
            [v6] = v4
        };
    end;
    for v7 = 1, select("#", ...) do
        local v8 = select(v7, ...);
        local v9 = typeof(v8);
        if v8 ~= nil then
            if v9 == "table" then
                if _G.__DEV__ and not v1(v8) then
                    error("Array.concat(...) only works with array-like tables but it received an object-like table.\nYou can avoid this error by wrapping the object-like table into an array. Example: `concat({1, 2}, {a = true})` should be `concat({1, 2}, { {a = true} }`");
                end;
                for v10 = 1, #v8 do
                    v6 = v6 + 1;
                    v5[v6] = v8[v10];
                end;
            else
                v6 = v6 + 1;
                v5[v6] = v8;
            end;
        end;
    end;
    return v5;
end;