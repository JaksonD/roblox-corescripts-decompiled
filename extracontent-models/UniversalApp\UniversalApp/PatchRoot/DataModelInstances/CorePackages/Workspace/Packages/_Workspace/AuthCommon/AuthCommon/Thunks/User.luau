local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Players_0 = game:GetService("Players");
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_script_FirstAncestor_0.Enums.AuthLocalStorageKeys);
local v5 = {};
v5.__index = v5;
v5.new = function(v6, v7, v8, v9, v10, v11) --[[ Line: 33 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    local v12 = {
        userId = v6, 
        username = v7, 
        displayName = v11 or nil, 
        membershipType = v8, 
        isUnder13 = v9, 
        countryCode = v10
    };
    setmetatable(v12, v5);
    return v12;
end;
v5.fromRequest = function(v13) --[[ Line: 54 ]] --[[ Name: fromRequest ]]
    -- upvalues: v5 (copy)
    return v5.new(v13.responseBody.UserId, v13.responseBody.Username, tonumber(v13.responseBody.MembershipType), v13.responseBody.AgeBracket == 1, v13.responseBody.CountryCode, v13.responseBody.DisplayName or nil);
end;
v5.fromUserInfoRequest = function(v14) --[[ Line: 65 ]] --[[ Name: fromUserInfoRequest ]]
    -- upvalues: v5 (copy)
    local v15 = v14.responseBody.isPremium and 4 or 0;
    return v5.new(v14.responseBody.id, v14.responseBody.name, v15, v14.responseBody.ageBracket == 1, v14.responseBody.countryCode, v14.responseBody.displayName or nil);
end;
v5.fromLocalStorage = function() --[[ Line: 78 ]] --[[ Name: fromLocalStorage ]]
    -- upvalues: v5 (copy), l_AppStorageService_0 (copy), v4 (copy)
    return v5.new(tonumber(l_AppStorageService_0:GetItem(v4.UserId)) or -1, l_AppStorageService_0:GetItem(v4.Username), tonumber(l_AppStorageService_0:GetItem(v4.Membership)) or 0, l_AppStorageService_0:GetItem(v4.IsUnder13) == "true", l_AppStorageService_0:GetItem(v4.CountryCode) or nil, l_AppStorageService_0:GetItem(v4.DisplayName) or nil);
end;
v5.clearLocalStorage = function() --[[ Line: 90 ]] --[[ Name: clearLocalStorage ]]
    -- upvalues: l_AppStorageService_0 (copy), v4 (copy)
    l_AppStorageService_0:SetItem(v4.UserId, "-1");
    l_AppStorageService_0:SetItem(v4.Username, "");
    l_AppStorageService_0:SetItem(v4.Membership, "");
    l_AppStorageService_0:SetItem(v4.IsUnder13, "");
    l_AppStorageService_0:SetItem(v4.DisplayName, "");
    l_AppStorageService_0:SetItem(v4.CountryCode, "");
    l_AppStorageService_0:Flush();
end;
v5.setToLocalPlayer = function(v16) --[[ Line: 100 ]] --[[ Name: setToLocalPlayer ]]
    -- upvalues: l_Players_0 (copy)
    l_Players_0:SetLocalPlayerInfo(v16.userId, v16.username, v16.displayName or "", v16.membershipType, v16.isUnder13);
end;
v5.setToLocalStorage = function(v17) --[[ Line: 104 ]] --[[ Name: setToLocalStorage ]]
    -- upvalues: l_AppStorageService_0 (copy), v4 (copy)
    l_AppStorageService_0:SetItem(v4.UserId, (tostring(v17.userId)));
    l_AppStorageService_0:SetItem(v4.Username, v17.username);
    l_AppStorageService_0:SetItem(v4.Membership, (tostring(v17.membershipType)));
    l_AppStorageService_0:SetItem(v4.IsUnder13, (tostring(v17.isUnder13)));
    l_AppStorageService_0:SetItem(v4.DisplayName, (tostring(v17.displayName)));
    l_AppStorageService_0:SetItem(v4.CountryCode, (tostring(v17.countryCode)));
    l_AppStorageService_0:Flush();
end;
v5.isSame = function(v18, v19) --[[ Line: 114 ]] --[[ Name: isSame ]]
    return v18.userId == v19.userId;
end;
v5.isEqual = function(v20, v21) --[[ Line: 118 ]] --[[ Name: isEqual ]]
    local v22 = false;
    if v20.userId == v21.userId then
        v22 = false;
        if v20.username == v21.username then
            v22 = false;
            if v20.membershipType == v21.membershipType then
                v22 = false;
                if v20.isUnder13 == v21.isUnder13 then
                    v22 = false;
                    if v20.displayName == v21.displayName then
                        v22 = v20.countryCode == v21.countryCode;
                    end;
                end;
            end;
        end;
    end;
    return v22;
end;
v5.toString = function(v23) --[[ Line: 127 ]] --[[ Name: toString ]]
    return string.format("userId:%s, username:%s, membershipType:%s, isUnder13:%s, countryCode:%s", tostring(v23.userId), v23.username, tostring(v23.membershipType), tostring(v23.isUnder13), (tostring(v23.countryCode)));
end;
v5.toJsonData = function(v24) --[[ Line: 138 ]] --[[ Name: toJsonData ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:JSONEncode({
        userId = v24.userId, 
        username = v24.username, 
        displayName = v24.displayName or nil, 
        membershipType = v24.membershipType, 
        isUnder13 = v24.isUnder13, 
        countryCode = v24.countryCode
    });
end;
return v5;