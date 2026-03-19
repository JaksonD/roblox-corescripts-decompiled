local function v0(v1, v2) --[[ Line: 2 ]] --[[ Name: matchAllRegex ]]
    -- upvalues: v0 (copy)
    local v3 = v2:exec(v1);
    if not v3 then
        return {};
    else
        local l_index_0 = v3.index;
        local v5 = v3[1];
        local v6 = {};
        if #v3 > 1 then
            for v7 = 2, #v3 do
                table.insert(v6, v3[v7]);
            end;
        end;
        local v8 = v1:sub(l_index_0 + #v5);
        local v9 = v0(v8, v2);
        return {
            {
                index = l_index_0, 
                input = v1, 
                matchedText = v5, 
                capturedGroups = v6
            }, 
            unpack(v9)
        };
    end;
end;
return v0;