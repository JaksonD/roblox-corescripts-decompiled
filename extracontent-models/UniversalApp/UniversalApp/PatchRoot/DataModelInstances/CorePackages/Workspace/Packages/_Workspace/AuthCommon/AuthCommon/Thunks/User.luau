local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Players_0 = game:GetService("Players");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_script_FirstAncestor_0.Enums.AuthLocalStorageKeys);
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v7 = game:DefineFastFlag("EnableBlackbirdCheckDev", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("HasRobloxSubscriptionStorageKey");
local v9 = {};
v9.__index = v9;
v9.new = function(v10, v11, v12, v13, v14, v15, v16) --[[ Line: 39 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy)
    local v17 = {
        userId = v10, 
        username = v11, 
        displayName = v15 or nil, 
        membershipType = v12, 
        isUnder13 = v13, 
        countryCode = v14, 
        hasRobloxSubscription = v16
    };
    setmetatable(v17, v9);
    return v17;
end;
v9.fromRequest = function(v18) --[[ Line: 62 ]] --[[ Name: fromRequest ]]
    -- upvalues: v7 (copy), v9 (copy)
    local v19 = if v7 then v18.responseBody.HasRobloxSubscription == true else nil;
    return v9.new(v18.responseBody.UserId, v18.responseBody.Username, tonumber(v18.responseBody.MembershipType), v18.responseBody.AgeBracket == 1, v18.responseBody.CountryCode, v18.responseBody.DisplayName or nil, v19);
end;
v9.fromUserInfoRequest = function(v20) --[[ Line: 77 ]] --[[ Name: fromUserInfoRequest ]]
    -- upvalues: v7 (copy), v9 (copy)
    local v21 = v20.responseBody.isPremium and 4 or 0;
    local v22 = if v7 then v20.responseBody.hasRobloxSubscription == true else nil;
    return v9.new(v20.responseBody.id, v20.responseBody.name, v21, v20.responseBody.ageBracket == 1, v20.responseBody.countryCode, v20.responseBody.displayName or nil, v22);
end;
v9.fromLocalStorage = function() --[[ Line: 94 ]] --[[ Name: fromLocalStorage ]]
    -- upvalues: v7 (copy), l_game_EngineFeature_0 (copy), l_AppStorageService_0 (copy), v5 (copy), l_Logger_0 (copy), v9 (copy)
    local v23 = nil;
    if v7 and l_game_EngineFeature_0 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 98 ]]
            -- upvalues: l_AppStorageService_0 (ref), v5 (ref)
            return l_AppStorageService_0:GetItem(v5.HasRobloxSubscription);
        end);
        if l_status_0 then
            local v26 = true;
            if l_result_0 ~= "true" then
                v26 = false;
            end;
            v23 = v26;
        else
            l_Logger_0:warning("Failed to read HasRobloxSubscription from local storage: {}", (tostring(l_result_0)));
        end;
    end;
    return v9.new(tonumber(l_AppStorageService_0:GetItem(v5.UserId)) or -1, l_AppStorageService_0:GetItem(v5.Username), tonumber(l_AppStorageService_0:GetItem(v5.Membership)) or 0, l_AppStorageService_0:GetItem(v5.IsUnder13) == "true", l_AppStorageService_0:GetItem(v5.CountryCode) or nil, l_AppStorageService_0:GetItem(v5.DisplayName) or nil, v23);
end;
v9.clearLocalStorage = function() --[[ Line: 118 ]] --[[ Name: clearLocalStorage ]]
    -- upvalues: l_AppStorageService_0 (copy), v5 (copy), v7 (copy), l_game_EngineFeature_0 (copy), l_Logger_0 (copy)
    l_AppStorageService_0:SetItem(v5.UserId, "-1");
    l_AppStorageService_0:SetItem(v5.Username, "");
    l_AppStorageService_0:SetItem(v5.Membership, "");
    l_AppStorageService_0:SetItem(v5.IsUnder13, "");
    l_AppStorageService_0:SetItem(v5.DisplayName, "");
    l_AppStorageService_0:SetItem(v5.CountryCode, "");
    if v7 and l_game_EngineFeature_0 then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 126 ]]
            -- upvalues: l_AppStorageService_0 (ref), v5 (ref)
            l_AppStorageService_0:SetItem(v5.HasRobloxSubscription, "");
        end);
        if not l_status_1 then
            l_Logger_0:warning("Failed to clear HasRobloxSubscription from local storage: {}", (tostring(l_result_1)));
        end;
    end;
    l_AppStorageService_0:Flush();
end;
v9.setToLocalPlayer = function(v29) --[[ Line: 136 ]] --[[ Name: setToLocalPlayer ]]
    -- upvalues: v7 (copy), l_Players_0 (copy)
    if v7 and v29.hasRobloxSubscription ~= nil then
        l_Players_0:SetLocalPlayerInfo(v29.userId, v29.username, v29.displayName or "", v29.membershipType, v29.isUnder13, v29.hasRobloxSubscription);
        return;
    else
        l_Players_0:SetLocalPlayerInfo(v29.userId, v29.username, v29.displayName or "", v29.membershipType, v29.isUnder13);
        return;
    end;
end;
v9.setToLocalStorage = function(v30) --[[ Line: 157 ]] --[[ Name: setToLocalStorage ]]
    -- upvalues: l_AppStorageService_0 (copy), v5 (copy), v7 (copy), l_game_EngineFeature_0 (copy), l_Logger_0 (copy)
    l_AppStorageService_0:SetItem(v5.UserId, (tostring(v30.userId)));
    l_AppStorageService_0:SetItem(v5.Username, v30.username);
    l_AppStorageService_0:SetItem(v5.Membership, (tostring(v30.membershipType)));
    l_AppStorageService_0:SetItem(v5.IsUnder13, (tostring(v30.isUnder13)));
    l_AppStorageService_0:SetItem(v5.DisplayName, (tostring(v30.displayName)));
    l_AppStorageService_0:SetItem(v5.CountryCode, (tostring(v30.countryCode)));
    if v7 and l_game_EngineFeature_0 then
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 165 ]]
            -- upvalues: l_AppStorageService_0 (ref), v5 (ref), v30 (copy)
            l_AppStorageService_0:SetItem(v5.HasRobloxSubscription, (tostring(v30.hasRobloxSubscription == true)));
        end);
        if not l_status_2 then
            l_Logger_0:warning("Failed to save HasRobloxSubscription to local storage: {}", (tostring(l_result_2)));
        end;
    end;
    l_AppStorageService_0:Flush();
end;
v9.isSame = function(v33, v34) --[[ Line: 178 ]] --[[ Name: isSame ]]
    return v33.userId == v34.userId;
end;
v9.isEqual = function(v35, v36) --[[ Line: 182 ]] --[[ Name: isEqual ]]
    -- upvalues: v7 (copy)
    local v37 = false;
    if v35.userId == v36.userId then
        v37 = false;
        if v35.username == v36.username then
            v37 = false;
            if v35.membershipType == v36.membershipType then
                v37 = false;
                if v35.isUnder13 == v36.isUnder13 then
                    v37 = false;
                    if v35.displayName == v36.displayName then
                        v37 = false;
                        if v35.countryCode == v36.countryCode then
                            if v7 then
                                return v35.hasRobloxSubscription == v36.hasRobloxSubscription;
                            else
                                v37 = true;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v37;
end;
v9.toString = function(v38) --[[ Line: 192 ]] --[[ Name: toString ]]
    -- upvalues: v7 (copy)
    local v39 = string.format("userId:%s, username:%s, membershipType:%s, isUnder13:%s, countryCode:%s", tostring(v38.userId), v38.username, tostring(v38.membershipType), tostring(v38.isUnder13), (tostring(v38.countryCode)));
    if v7 then
        v39 = v39 .. string.format(", hasRobloxSubscription:%s", (tostring(v38.hasRobloxSubscription)));
    end;
    return v39;
end;
v9.toJsonData = function(v40) --[[ Line: 207 ]] --[[ Name: toJsonData ]]
    -- upvalues: v7 (copy), l_HttpService_0 (copy)
    local v41 = {
        userId = v40.userId, 
        username = v40.username, 
        displayName = v40.displayName or nil, 
        membershipType = v40.membershipType, 
        isUnder13 = v40.isUnder13, 
        countryCode = v40.countryCode
    };
    if v7 then
        v41.hasRobloxSubscription = v40.hasRobloxSubscription;
    end;
    return l_HttpService_0:JSONEncode(v41);
end;
return v9;