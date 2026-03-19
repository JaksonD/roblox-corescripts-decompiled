local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
return function(...) --[[ Line: 10 ]] --[[ Name: joinArrays ]]
    local v2 = {
        ...
    };
    local v3 = {};
    for _, v5 in v2 do
        if v5 then
            table.move(v5, 1, #v5, #v3 + 1, v3);
        end;
    end;
    return v3;
end;