local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Players_0 = game:GetService("Players");
local l_HttpService_0 = game:GetService("HttpService");
local function _() --[[ Line: 5 ]] --[[ Name: getCurrentUser ]]
    -- upvalues: l_Players_0 (copy)
    if l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId > 0 then
        return (tostring(l_Players_0.LocalPlayer.UserId));
    else
        return "0";
    end;
end;
local function _(v4) --[[ Line: 14 ]] --[[ Name: getUserKey ]]
    return "u_" .. tostring(v4 or "0");
end;
local function v10(v6) --[[ Line: 18 ]] --[[ Name: getValuesForAllUsers ]]
    -- upvalues: l_AppStorageService_0 (copy), l_HttpService_0 (copy)
    local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem(v6);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 20 ]]
        -- upvalues: l_HttpService_0 (ref), l_l_AppStorageService_0_Item_0 (copy)
        return l_HttpService_0:JSONDecode(l_l_AppStorageService_0_Item_0);
    end);
    if l_status_0 and type(l_result_0) == "table" then
        return l_result_0;
    else
        return {
            default = l_l_AppStorageService_0_Item_0
        };
    end;
end;
local function _(v11, v12) --[[ Line: 32 ]] --[[ Name: setValuesForAllUsers ]]
    -- upvalues: l_HttpService_0 (copy), l_AppStorageService_0 (copy)
    local v13 = l_HttpService_0:JSONEncode(v12);
    l_AppStorageService_0:SetItem(v11, v13);
end;
local v15 = {};
v15.__index = v15;
v15.new = function(v16) --[[ Line: 40 ]] --[[ Name: new ]]
    -- upvalues: l_Players_0 (copy), v15 (copy)
    if not v16 then
        v16 = if l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId > 0 then tostring(l_Players_0.LocalPlayer.UserId) else "0";
    end;
    local v17 = {
        userId = tostring(v16)
    };
    setmetatable(v17, v15);
    return v17;
end;
v15.GetItem = function(v18, v19) --[[ Line: 52 ]] --[[ Name: GetItem ]]
    -- upvalues: v10 (copy)
    local v20 = v10(v19);
    local v21 = v20["u_" .. tostring(v18.userId or "0")];
    if v21 == nil then
        v21 = v20.default;
    end;
    return v21;
end;
v15.SetItem = function(v22, v23, v24) --[[ Line: 62 ]] --[[ Name: SetItem ]]
    -- upvalues: v10 (copy), l_HttpService_0 (copy), l_AppStorageService_0 (copy)
    local v25 = v10(v23);
    v25["u_" .. tostring(v22.userId or "0")] = v24;
    local v26 = l_HttpService_0:JSONEncode(v25);
    l_AppStorageService_0:SetItem(v23, v26);
end;
v15.Flush = function(_) --[[ Line: 69 ]] --[[ Name: Flush ]]
    -- upvalues: l_AppStorageService_0 (copy)
    l_AppStorageService_0:Flush();
end;
v15.getItem = v15.GetItem;
v15.setItem = v15.SetItem;
v15.flush = v15.Flush;
return v15;