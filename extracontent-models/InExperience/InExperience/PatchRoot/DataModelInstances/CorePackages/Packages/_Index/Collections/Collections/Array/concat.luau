local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v3 = require(l_Parent_0.isArray);
local _ = require(l_Parent_1.ES7Types);
return function(v5, ...) --[[ Line: 29 ]] --[[ Name: concat ]]
    -- upvalues: v3 (copy), l___DEV___0 (copy)
    local v6 = nil;
    local v7 = 0;
    if v3(v5) then
        v6 = table.clone(v5);
        v7 = #v5;
    else
        v7 = v7 + 1;
        v6 = {
            [v7] = v5
        };
    end;
    for v8 = 1, select("#", ...) do
        local v9 = select(v8, ...);
        local v10 = typeof(v9);
        if v9 ~= nil then
            if v10 == "table" then
                if l___DEV___0 and not v3(v9) then
                    error("Array.concat(...) only works with array-like tables but it received an object-like table.\nYou can avoid this error by wrapping the object-like table into an array. Example: `concat({1, 2}, {a = true})` should be `concat({1, 2}, { {a = true} }`");
                end;
                for v11 = 1, #v9 do
                    v7 = v7 + 1;
                    v6[v7] = v9[v11];
                end;
            else
                v7 = v7 + 1;
                v6[v7] = v9;
            end;
        end;
    end;
    return v6;
end;