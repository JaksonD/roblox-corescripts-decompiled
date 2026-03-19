local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.RegExp);
local function v2(v3, v4) --[[ Line: 6 ]] --[[ Name: matchAllRegex ]]
    -- upvalues: v2 (copy)
    local v5 = v4:exec(v3);
    if not v5 then
        return {};
    else
        local l_index_0 = v5.index;
        local v7 = v5[1];
        local v8 = {};
        if #v5 > 1 then
            for v9 = 2, #v5 do
                table.insert(v8, v5[v9]);
            end;
        end;
        local v10 = v3:sub(l_index_0 + #v7);
        local v11 = v2(v10, v4);
        return {
            {
                index = l_index_0, 
                input = v3, 
                matchedText = v7, 
                capturedGroups = v8
            }, 
            unpack(v11)
        };
    end;
end;
return v2;