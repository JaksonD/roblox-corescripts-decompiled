local function v2(v0, v1) --[[ Line: 1 ]]
    return v0.uploadedAtTimestamp > v1.uploadedAtTimestamp;
end;
return function(v3, v4) --[[ Line: 5 ]]
    -- upvalues: v2 (copy)
    local v5 = 1;
    local v6 = 1;
    local v7 = {};
    local v8 = {};
    table.sort(v4, v2);
    while v5 <= #v4 and v6 <= #v3 do
        if v4[v5].uploadedAtTimestamp >= v3[v6].uploadedAtTimestamp then
            if not v8[v4[v5].postId] then
                table.insert(v7, v4[v5]);
                v8[v4[v5].postId] = true;
            end;
            v5 = v5 + 1;
        else
            if not v8[v3[v6].postId] then
                table.insert(v7, v3[v6]);
                v8[v3[v6].postId] = true;
            end;
            v6 = v6 + 1;
        end;
    end;
    if v5 <= #v4 then
        for v9 = v5, #v4 do
            if not v8[v4[v9].postId] then
                table.insert(v7, v4[v9]);
                v8[v4[v9].postId] = true;
            end;
        end;
    end;
    if v6 <= #v3 then
        for v10 = v6, #v3 do
            if not v8[v3[v10].postId] then
                table.insert(v7, v3[v10]);
                v8[v3[v10].postId] = true;
            end;
        end;
    end;
    return v7;
end;