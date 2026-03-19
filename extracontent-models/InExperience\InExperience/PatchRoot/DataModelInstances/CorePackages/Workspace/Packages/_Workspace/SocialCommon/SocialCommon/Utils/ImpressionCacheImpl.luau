local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Players_0 = game:GetService("Players");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local v4 = require(l_Parent_0.Cryo);
return function(v5) --[[ Line: 23 ]] --[[ Name: ImpressionCacheImpl ]]
    -- upvalues: l_Players_0 (copy), l_AppStorageService_0 (copy), l_HttpService_0 (copy), v4 (copy)
    local l_isKeyAvailableInEngine_0 = v5.isKeyAvailableInEngine;
    local l_dismissedValue_0 = v5.dismissedValue;
    local l_appStorageKey_0 = v5.appStorageKey;
    local v9 = v5.PlayersService or l_Players_0;
    local v10 = v5.AppStorageService or l_AppStorageService_0;
    local function _() --[[ Line: 31 ]] --[[ Name: getLocalUserId ]]
        -- upvalues: v9 (copy)
        local l_LocalPlayer_0 = v9.LocalPlayer;
        if l_LocalPlayer_0 and l_LocalPlayer_0.UserId and l_LocalPlayer_0.UserId > 0 then
            return (tostring(l_LocalPlayer_0.UserId));
        else
            return nil;
        end;
    end;
    local function _(v13) --[[ Line: 40 ]] --[[ Name: updateStoredValue ]]
        -- upvalues: l_HttpService_0 (ref), v10 (copy), l_appStorageKey_0 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 41 ]]
            -- upvalues: l_HttpService_0 (ref), v13 (copy)
            return l_HttpService_0:JSONEncode(v13);
        end);
        if l_status_0 then
            v10:SetItem(l_appStorageKey_0, l_result_0);
            v10:Flush();
        end;
    end;
    local function _() --[[ Line: 50 ]] --[[ Name: getStoredValue ]]
        -- upvalues: v10 (copy), l_appStorageKey_0 (copy), l_HttpService_0 (ref)
        local v17 = v10:GetItem(l_appStorageKey_0) or "";
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 53 ]]
            -- upvalues: l_HttpService_0 (ref), v17 (copy)
            return l_HttpService_0:JSONDecode(v17);
        end);
        if l_status_1 and type(l_result_1) == "table" then
            return l_result_1;
        else
            return nil;
        end;
    end;
    local function v28(v21, v22) --[[ Line: 60 ]] --[[ Name: setImpressionCountPerUser ]]
        -- upvalues: v10 (copy), l_appStorageKey_0 (copy), l_HttpService_0 (ref), v4 (ref)
        local v23 = v10:GetItem(l_appStorageKey_0) or "";
        local l_v23_0 = v23 --[[ copy: 3 -> 6 ]];
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 53 ]]
            -- upvalues: l_HttpService_0 (ref), l_v23_0 (copy)
            return l_HttpService_0:JSONDecode(l_v23_0);
        end);
        local v27 = if l_status_2 and type(l_result_2) == "table" then l_result_2 else nil;
        v23 = v4.Dictionary.join(v27 or {}, {
            [v21] = v22
        });
        l_status_2, l_result_2 = pcall(function() --[[ Line: 41 ]]
            -- upvalues: l_HttpService_0 (ref), v23 (copy)
            return l_HttpService_0:JSONEncode(v23);
        end);
        if l_status_2 then
            v10:SetItem(l_appStorageKey_0, l_result_2);
            v10:Flush();
        end;
    end;
    local function _(v29) --[[ Line: 68 ]] --[[ Name: getImpressionCountPerUser ]]
        -- upvalues: v10 (copy), l_appStorageKey_0 (copy), l_HttpService_0 (ref)
        local v30 = v10:GetItem(l_appStorageKey_0) or "";
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 53 ]]
            -- upvalues: l_HttpService_0 (ref), v30 (copy)
            return l_HttpService_0:JSONDecode(v30);
        end);
        local v33 = if l_status_3 and type(l_result_3) == "table" then l_result_3 else nil;
        return v33 and v33[v29] and tonumber(v33[v29]) or 0;
    end;
    local function _(v35) --[[ Line: 76 ]] --[[ Name: setValue ]]
        -- upvalues: v9 (copy), l_isKeyAvailableInEngine_0 (copy), v28 (copy)
        local l_LocalPlayer_1 = v9.LocalPlayer;
        local v37 = if l_LocalPlayer_1 and l_LocalPlayer_1.UserId and l_LocalPlayer_1.UserId > 0 then tostring(l_LocalPlayer_1.UserId) else nil;
        if l_isKeyAvailableInEngine_0 and v37 then
            v28(v37, v35);
        end;
    end;
    local function v45() --[[ Line: 83 ]] --[[ Name: getValue ]]
        -- upvalues: v9 (copy), l_isKeyAvailableInEngine_0 (copy), v10 (copy), l_appStorageKey_0 (copy), l_HttpService_0 (ref), l_dismissedValue_0 (copy)
        local l_LocalPlayer_2 = v9.LocalPlayer;
        local v40 = if l_LocalPlayer_2 and l_LocalPlayer_2.UserId and l_LocalPlayer_2.UserId > 0 then tostring(l_LocalPlayer_2.UserId) else nil;
        if l_isKeyAvailableInEngine_0 and v40 then
            local v41 = v10:GetItem(l_appStorageKey_0) or "";
            local l_status_4, l_result_4 = pcall(function() --[[ Line: 53 ]]
                -- upvalues: l_HttpService_0 (ref), v41 (copy)
                return l_HttpService_0:JSONDecode(v41);
            end);
            local v44 = if l_status_4 and type(l_result_4) == "table" then l_result_4 else nil;
            return v44 and v44[v40] and tonumber(v44[v40]) or 0;
        else
            return l_dismissedValue_0;
        end;
    end;
    local function v54() --[[ Line: 93 ]] --[[ Name: incrementValue ]]
        -- upvalues: v9 (copy), l_isKeyAvailableInEngine_0 (copy), v10 (copy), l_appStorageKey_0 (copy), l_HttpService_0 (ref), l_dismissedValue_0 (copy), v28 (copy)
        local l_LocalPlayer_3 = v9.LocalPlayer;
        local v47 = if l_LocalPlayer_3 and l_LocalPlayer_3.UserId and l_LocalPlayer_3.UserId > 0 then tostring(l_LocalPlayer_3.UserId) else nil;
        local v48;
        if l_isKeyAvailableInEngine_0 and v47 then
            local v49 = v10:GetItem(l_appStorageKey_0) or "";
            local l_status_5, l_result_5 = pcall(function() --[[ Line: 53 ]]
                -- upvalues: l_HttpService_0 (ref), v49 (copy)
                return l_HttpService_0:JSONDecode(v49);
            end);
            local v52 = if l_status_5 and type(l_result_5) == "table" then l_result_5 else nil;
            v48 = v52 and v52[v47] and tonumber(v52[v47]) or 0;
        else
            v48 = l_dismissedValue_0;
        end;
        local v53 = v48 + 1;
        v47 = v9.LocalPlayer;
        v48 = if v47 and v47.UserId and v47.UserId > 0 then tostring(v47.UserId) else nil;
        if l_isKeyAvailableInEngine_0 and v48 then
            v28(v48, v53);
        end;
    end;
    return {
        getValue = v45, 
        incrementValue = v54, 
        dismissValue = function() --[[ Line: 97 ]] --[[ Name: dismissValue ]]
            -- upvalues: l_dismissedValue_0 (copy), v9 (copy), l_isKeyAvailableInEngine_0 (copy), v28 (copy)
            local l_l_dismissedValue_0_0 = l_dismissedValue_0;
            local l_LocalPlayer_4 = v9.LocalPlayer;
            local v57 = if l_LocalPlayer_4 and l_LocalPlayer_4.UserId and l_LocalPlayer_4.UserId > 0 then tostring(l_LocalPlayer_4.UserId) else nil;
            if l_isKeyAvailableInEngine_0 and v57 then
                v28(v57, l_l_dismissedValue_0_0);
            end;
        end
    };
end;