local function _(v0) --[[ Line: 1 ]] --[[ Name: separateNumberAndName ]]
    local v1 = v0:match("^%d+");
    if v1 then
        local v2 = string.sub(v0, #v1 + 1);
        return tonumber(v1), v2;
    else
        return nil, v0;
    end;
end;
return function(v4, v5) --[[ Line: 11 ]]
    local l_name_0 = v4.name;
    local v7 = l_name_0:match("^%d+");
    local v8, v9;
    if v7 then
        local v10 = string.sub(l_name_0, #v7 + 1);
        v8 = tonumber(v7);
        v9 = v10;
    else
        v8 = nil;
        v9 = l_name_0;
    end;
    local l_name_1 = v5.name;
    local v12 = l_name_1:match("^%d+");
    if v12 then
        local v13 = string.sub(l_name_1, #v12 + 1);
        l_name_0 = tonumber(v12);
        v7 = v13;
    else
        l_name_0 = nil;
        v7 = l_name_1;
    end;
    if v8 ~= nil and l_name_0 == nil then
        return true;
    elseif v8 == nil and l_name_0 ~= nil then
        return false;
    elseif v8 ~= nil and l_name_0 ~= nil and v9 == v7 then
        return v8 < l_name_0;
    else
        return v9 < v7;
    end;
end;