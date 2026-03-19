local l_AppStorageService_0 = game:GetService("AppStorageService");
local v1 = _G.__DEV__ or false;
local v2 = {};
local function v4(v3) --[[ Line: 20 ]] --[[ Name: _resetMemStorageForTesting ]]
    -- upvalues: v2 (ref)
    v2 = v3 or {};
end;
local function v9(v5, v6) --[[ Line: 25 ]] --[[ Name: getItem ]]
    -- upvalues: v1 (copy), v2 (ref), l_AppStorageService_0 (copy)
    if v1 or v6 then
        return v2[v5] or "";
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 30 ]]
            -- upvalues: l_AppStorageService_0 (ref), v5 (copy)
            return l_AppStorageService_0:GetItem(v5);
        end);
        if l_status_0 then
            return l_result_0;
        else
            return v2[v5] or "";
        end;
    end;
end;
local function v13(v10, v11, v12) --[[ Line: 42 ]] --[[ Name: setItem ]]
    -- upvalues: v1 (copy), v2 (ref), l_AppStorageService_0 (copy)
    if v1 or v12 then
        v2[v10] = v11;
        return;
    else
        if not pcall(function() --[[ Line: 48 ]]
            -- upvalues: l_AppStorageService_0 (ref), v10 (copy), v11 (copy)
            l_AppStorageService_0:SetItem(v10, v11);
        end) then
            v2[v10] = v11;
        end;
        return;
    end;
end;
return {
    getItem = v9, 
    setItem = v13, 
    flush = function() --[[ Line: 56 ]] --[[ Name: flush ]]
        -- upvalues: l_AppStorageService_0 (copy)
        pcall(function() --[[ Line: 57 ]]
            -- upvalues: l_AppStorageService_0 (ref)
            l_AppStorageService_0:Flush();
        end);
    end, 
    _resetMemStorageForTesting = v4
};