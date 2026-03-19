local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    return (setmetatable({
        memStorageKey = v3
    }, v2));
end;
v2.getItem = function(v4) --[[ Line: 21 ]] --[[ Name: getItem ]]
    -- upvalues: l_MemStorageService_0 (copy), l_HttpService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 22 ]]
        -- upvalues: l_MemStorageService_0 (ref), v4 (copy), l_HttpService_0 (ref)
        local l_l_MemStorageService_0_Item_0 = l_MemStorageService_0:GetItem(v4.memStorageKey);
        if l_l_MemStorageService_0_Item_0 and l_l_MemStorageService_0_Item_0 ~= "" then
            return l_HttpService_0:JSONDecode(l_l_MemStorageService_0_Item_0);
        else
            return nil;
        end;
    end);
    if l_status_0 then
        return l_result_0;
    else
        return nil;
    end;
end;
v2.setItem = function(v8, v9) --[[ Line: 35 ]] --[[ Name: setItem ]]
    -- upvalues: l_MemStorageService_0 (copy), l_HttpService_0 (copy)
    local l_status_1, _ = pcall(function() --[[ Line: 36 ]]
        -- upvalues: l_MemStorageService_0 (ref), v8 (copy), v9 (copy), l_HttpService_0 (ref)
        l_MemStorageService_0:SetItem(v8.memStorageKey, if v9 and v9 ~= "" then l_HttpService_0:JSONEncode(v9) else "");
    end);
    return l_status_1;
end;
v2.bindAndFire = function(v12, v13) --[[ Line: 42 ]] --[[ Name: bindAndFire ]]
    -- upvalues: l_MemStorageService_0 (copy), l_HttpService_0 (copy)
    return (l_MemStorageService_0:BindAndFire(v12.memStorageKey, function(v14) --[[ Line: 43 ]]
        -- upvalues: l_HttpService_0 (ref), v13 (copy)
        local v15 = nil;
        if v14 and v14 ~= "" then
            v15 = l_HttpService_0:JSONDecode(v14);
        end;
        if v13 then
            v13(v15);
        end;
    end));
end;
return v2;