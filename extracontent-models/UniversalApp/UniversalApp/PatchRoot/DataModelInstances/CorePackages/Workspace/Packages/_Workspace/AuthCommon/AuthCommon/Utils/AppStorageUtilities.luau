local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Enums.AuthLocalStorageKeys);
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_GetFFlagEnableMultiPageSignup_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableMultiPageSignup;
local l_GetFStringAccountSwitcherTruthyVariantId_0 = require(l_Parent_0.SharedFlags).GetFStringAccountSwitcherTruthyVariantId;
local l_GetFStringAccountSwitcherFalsyVariantId_0 = require(l_Parent_0.SharedFlags).GetFStringAccountSwitcherFalsyVariantId;
local _ = require(l_script_FirstAncestor_0.Utils.PreviousAccountEntry);
local l_GameParams_0 = require(l_Parent_0.ExperienceService).GameParams;
local v10 = {
    passkeySignupName = "PasskeySignupName"
};
local v17 = {
    setRobloxLocaleId = function(v11) --[[ Line: 21 ]] --[[ Name: setRobloxLocaleId ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        l_AppStorageService_0:SetItem(v2.RobloxLocaleId, v11);
    end, 
    setGameLocaleId = function(v12) --[[ Line: 26 ]] --[[ Name: setGameLocaleId ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        l_AppStorageService_0:SetItem(v2.GameLocaleId, v12);
    end, 
    getAuthenticatedTheme = function() --[[ Line: 30 ]] --[[ Name: getAuthenticatedTheme ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        return l_AppStorageService_0:GetItem(v2.AuthenticatedTheme);
    end, 
    getIsFirstLaunchAfterInstall = function() --[[ Line: 34 ]] --[[ Name: getIsFirstLaunchAfterInstall ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        if game:GetEngineFeature("IsFirstLaunchAfterInstallKeyAvailable") then
            return l_AppStorageService_0:GetItem(v2.IsFirstLaunchAfterInstall);
        else
            return "";
        end;
    end, 
    setAuthenticatedTheme = function(v13) --[[ Line: 41 ]] --[[ Name: setAuthenticatedTheme ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        l_AppStorageService_0:SetItem(v2.AuthenticatedTheme, v13);
    end, 
    getAccountBlob = function() --[[ Line: 45 ]] --[[ Name: getAccountBlob ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        if game:GetEngineFeature("AccountSwitchFeatureEnabled") then
            return l_AppStorageService_0:GetItem(v2.AccountBlob) or "";
        else
            return "";
        end;
    end, 
    setAccountBlob = function(v14) --[[ Line: 52 ]] --[[ Name: setAccountBlob ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        if game:GetEngineFeature("AccountSwitchFeatureEnabled") then
            l_AppStorageService_0:SetItem(v2.AccountBlob, v14 or "");
        end;
    end, 
    getDefaultUsername = function() --[[ Line: 58 ]] --[[ Name: getDefaultUsername ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        return l_AppStorageService_0:GetItem(v2.CredentialValue);
    end, 
    getSignupActionRequired = function() --[[ Line: 62 ]] --[[ Name: getSignupActionRequired ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        return l_AppStorageService_0:GetItem(v2.SignupActionRequired);
    end, 
    setSignupActionRequired = function(v15) --[[ Line: 66 ]] --[[ Name: setSignupActionRequired ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        l_AppStorageService_0:SetItem(v2.SignupActionRequired, v15);
    end, 
    getAccountSwitcherMetadataMap = function() --[[ Line: 70 ]] --[[ Name: getAccountSwitcherMetadataMap ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
            return l_AppStorageService_0:GetItem(v2.AccountSwitcherMetadataMap) or "";
        else
            return "";
        end;
    end, 
    setAccountSwitcherMetadataMap = function(v16) --[[ Line: 77 ]] --[[ Name: setAccountSwitcherMetadataMap ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
            l_AppStorageService_0:SetItem(v2.AccountSwitcherMetadataMap, v16 or "");
        end;
    end
};
v17.setAccountSwitchStartupQueryParams = function(v18) --[[ Line: 83 ]] --[[ Name: setAccountSwitchStartupQueryParams ]]
    -- upvalues: l_HttpService_0 (copy), v17 (copy)
    if typeof(v18) == "table" then
        v18 = l_HttpService_0:JSONEncode(v18);
    end;
    if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
        local v19 = v17.getAccountSwitcherMetadataMap();
        local v20 = nil;
        if v19 == nil or v19 == "" then
            v20 = {
                AccountSwitchStartupQueryParams = v18
            };
        else
            v20 = l_HttpService_0:JSONDecode(v19);
            v20.AccountSwitchStartupQueryParams = v18;
        end;
        v17.setAccountSwitcherMetadataMap(l_HttpService_0:JSONEncode(v20));
    end;
end;
v17.clearAccountSwitchStartupGameParams = function() --[[ Line: 104 ]] --[[ Name: clearAccountSwitchStartupGameParams ]]
    -- upvalues: v17 (copy)
    v17.setAccountSwitchStartupQueryParams("");
end;
v17.getAccountSwitchStartupGameParams = function() --[[ Line: 108 ]] --[[ Name: getAccountSwitchStartupGameParams ]]
    -- upvalues: v17 (copy), l_HttpService_0 (copy), l_GameParams_0 (copy)
    if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
        local v21 = v17.getAccountSwitcherMetadataMap();
        if v21 == nil or v21 == "" then
            return nil;
        else
            local v22 = l_HttpService_0:JSONDecode(v21);
            if v22 == nil or v22 == "" or next(v22) == nil or next(v22) == "" or v22.AccountSwitchTargetUsername == nil then
                return nil;
            else
                local l_AccountSwitchStartupQueryParams_0 = v22.AccountSwitchStartupQueryParams;
                if l_AccountSwitchStartupQueryParams_0 == nil or l_AccountSwitchStartupQueryParams_0 == "" then
                    return nil;
                else
                    l_AccountSwitchStartupQueryParams_0 = l_HttpService_0:JSONDecode(l_AccountSwitchStartupQueryParams_0);
                    local function _(v24) --[[ Line: 132 ]]
                        local v25 = tonumber(v24);
                        if v25 then
                            return v25;
                        elseif v24 == "true" then
                            return true;
                        elseif v24 == "false" then
                            return false;
                        else
                            return v24;
                        end;
                    end;
                    local v27 = l_GameParams_0.fromParams(l_AccountSwitchStartupQueryParams_0);
                    for v28, v29 in pairs(l_AccountSwitchStartupQueryParams_0) do
                        v27[v28] = tonumber(v29) or v29 == "true" or not (v29 == "false") and v29;
                    end;
                    return v27;
                end;
            end;
        end;
    else
        return nil;
    end;
end;
v17.setAccountSwitcherExperimentVariantId = function(v30) --[[ Line: 160 ]] --[[ Name: setAccountSwitcherExperimentVariantId ]]
    -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
    if game:GetEngineFeature("AccountSwitcherExperimentVariantIdKeyAvailable") then
        l_AppStorageService_0:SetItem(v2.AccountSwitcherExperimentVariantId, v30);
    end;
end;
v17.getAccountSwitcherAvailableByVariantId = function() --[[ Line: 166 ]] --[[ Name: getAccountSwitcherAvailableByVariantId ]]
    -- upvalues: l_AppStorageService_0 (copy), v2 (copy), l_GetFStringAccountSwitcherFalsyVariantId_0 (copy), l_GetFStringAccountSwitcherTruthyVariantId_0 (copy)
    if game:GetEngineFeature("AccountSwitcherExperimentVariantIdKeyAvailable") then
        local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem(v2.AccountSwitcherExperimentVariantId);
        if l_l_AppStorageService_0_Item_0 == l_GetFStringAccountSwitcherFalsyVariantId_0() then
            return false;
        elseif l_l_AppStorageService_0_Item_0 == l_GetFStringAccountSwitcherTruthyVariantId_0() then
            return true;
        else
            return nil;
        end;
    else
        return false;
    end;
end;
v17.getAccountSwitchTargetUsername = function() --[[ Line: 185 ]] --[[ Name: getAccountSwitchTargetUsername ]]
    -- upvalues: v17 (copy), l_HttpService_0 (copy)
    if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
        local v32 = v17.getAccountSwitcherMetadataMap();
        if v32 == nil or v32 == "" then
            return "";
        else
            local v33 = l_HttpService_0:JSONDecode(v32);
            if v33 == nil or v33 == "" or next(v33) == nil or next(v33) == "" or v33.AccountSwitchTargetUsername == nil then
                return "";
            else
                return v33.AccountSwitchTargetUsername;
            end;
        end;
    else
        return "";
    end;
end;
v17.setAccountSwitchTargetUsername = function(v34) --[[ Line: 206 ]] --[[ Name: setAccountSwitchTargetUsername ]]
    -- upvalues: v17 (copy), l_HttpService_0 (copy)
    if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
        local v35 = v17.getAccountSwitcherMetadataMap();
        local v36 = nil;
        if v35 == nil or v35 == "" then
            v36 = {
                AccountSwitchTargetUsername = v34
            };
        else
            v36 = l_HttpService_0:JSONDecode(v35);
            v36.AccountSwitchTargetUsername = v34;
        end;
        v17.setAccountSwitcherMetadataMap(l_HttpService_0:JSONEncode(v36));
    end;
end;
v17.getAccountSwitchStatus = function() --[[ Line: 222 ]] --[[ Name: getAccountSwitchStatus ]]
    -- upvalues: v17 (copy), l_HttpService_0 (copy)
    if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
        local v37 = v17.getAccountSwitcherMetadataMap();
        if v37 == nil or v37 == "" then
            return "";
        else
            local v38 = l_HttpService_0:JSONDecode(v37);
            if v38 == nil or v38 == "" or next(v38) == nil or next(v38) == "" or v38.AccountSwitchStatus == nil then
                return "";
            else
                return v38.AccountSwitchStatus;
            end;
        end;
    else
        return "";
    end;
end;
v17.setAccountSwitchStatus = function(v39) --[[ Line: 244 ]] --[[ Name: setAccountSwitchStatus ]]
    -- upvalues: v17 (copy), l_HttpService_0 (copy)
    if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
        local v40 = v17.getAccountSwitcherMetadataMap();
        local v41 = nil;
        if v40 == nil or v40 == "" then
            v41 = {
                AccountSwitchStatus = v39
            };
        else
            v41 = l_HttpService_0:JSONDecode(v40);
            v41.AccountSwitchStatus = v39;
        end;
        v17.setAccountSwitcherMetadataMap(l_HttpService_0:JSONEncode(v41));
    end;
end;
v17.getMultipageSignupMetadataMap = function() --[[ Line: 260 ]] --[[ Name: getMultipageSignupMetadataMap ]]
    -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
    return l_AppStorageService_0:GetItem(v2.MultipageSignupMetadataMap) or "";
end;
v17.setMultipageSignupMetadataMap = function(v42) --[[ Line: 264 ]] --[[ Name: setMultipageSignupMetadataMap ]]
    -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
    l_AppStorageService_0:SetItem(v2.MultipageSignupMetadataMap, v42 or "");
end;
v17.getIncompleteSignupUserId = function() --[[ Line: 268 ]] --[[ Name: getIncompleteSignupUserId ]]
    -- upvalues: v17 (copy), l_HttpService_0 (copy)
    local v43 = v17.getMultipageSignupMetadataMap();
    if v43 == nil or v43 == "" then
        return "";
    else
        local v44 = l_HttpService_0:JSONDecode(v43);
        if v44 == nil or v44 == "" or next(v44) == nil or next(v44) == "" or v44.IncompleteSignupUserId == nil then
            return "";
        else
            return v44.IncompleteSignupUserId;
        end;
    end;
end;
v17.setIncompleteSignupUserId = function(v45) --[[ Line: 286 ]] --[[ Name: setIncompleteSignupUserId ]]
    -- upvalues: l_GetFFlagEnableMultiPageSignup_0 (copy), v17 (copy), l_HttpService_0 (copy)
    if l_GetFFlagEnableMultiPageSignup_0() then
        local v46 = v17.getMultipageSignupMetadataMap();
        local v47 = nil;
        if v46 == nil or v46 == "" then
            v47 = {
                IncompleteSignupUserId = v45
            };
        else
            v47 = l_HttpService_0:JSONDecode(v46);
            v47.IncompleteSignupUserId = v45;
        end;
        v17.setMultipageSignupMetadataMap(l_HttpService_0:JSONEncode(v47));
    end;
end;
v17.getIncompleteSignupUsername = function() --[[ Line: 302 ]] --[[ Name: getIncompleteSignupUsername ]]
    -- upvalues: v17 (copy), l_HttpService_0 (copy)
    local v48 = v17.getMultipageSignupMetadataMap();
    if v48 == nil or v48 == "" then
        return "";
    else
        local v49 = l_HttpService_0:JSONDecode(v48);
        if v49 == nil or v49 == "" or next(v49) == nil or next(v49) == "" or v49.IncompleteSignupUsername == nil then
            return "";
        else
            return v49.IncompleteSignupUsername;
        end;
    end;
end;
v17.setIncompleteSignupUsername = function(v50) --[[ Line: 320 ]] --[[ Name: setIncompleteSignupUsername ]]
    -- upvalues: l_GetFFlagEnableMultiPageSignup_0 (copy), v17 (copy), l_HttpService_0 (copy)
    if l_GetFFlagEnableMultiPageSignup_0() then
        local v51 = v17.getMultipageSignupMetadataMap();
        local v52 = nil;
        if v51 == nil or v51 == "" then
            v52 = {
                IncompleteSignupUsername = v50
            };
        else
            v52 = l_HttpService_0:JSONDecode(v51);
            v52.IncompleteSignupUsername = v50;
        end;
        v17.setMultipageSignupMetadataMap(l_HttpService_0:JSONEncode(v52));
    end;
end;
getMultiPageSignupKey = function(v53) --[[ Line: 336 ]] --[[ Name: getMultiPageSignupKey ]]
    -- upvalues: v17 (copy), l_HttpService_0 (copy)
    local v54 = v17.getMultipageSignupMetadataMap();
    if v54 == nil or v54 == "" then
        return "";
    else
        local v55 = l_HttpService_0:JSONDecode(v54);
        if v55 == nil or v55 == "" or next(v55) == nil or next(v55) == "" or v55[v53] == nil then
            return "";
        else
            return v55[v53];
        end;
    end;
end;
setMultiPageSignupKey = function(v56, v57) --[[ Line: 348 ]] --[[ Name: setMultiPageSignupKey ]]
    -- upvalues: v17 (copy), l_HttpService_0 (copy)
    if game:GetEngineFeature("MultipageSignupMetadataMapKeyAvailable") then
        local v58 = v17.getMultipageSignupMetadataMap();
        local v59 = nil;
        if v58 == nil or v58 == "" then
            v59 = {
                [v56] = v57
            };
        else
            v59 = l_HttpService_0:JSONDecode(v58);
            v59[v56] = v57;
        end;
        v17.setMultipageSignupMetadataMap(l_HttpService_0:JSONEncode(v59));
    end;
end;
v17.getPasskeySignupUsername = function() --[[ Line: 364 ]] --[[ Name: getPasskeySignupUsername ]]
    -- upvalues: v10 (copy)
    return getMultiPageSignupKey(v10.passkeySignupName);
end;
v17.setPasskeySignupUsername = function(v60) --[[ Line: 368 ]] --[[ Name: setPasskeySignupUsername ]]
    -- upvalues: v10 (copy)
    setMultiPageSignupKey(v10.passkeySignupName, v60);
end;
v17.getPreviousAccountsList = function() --[[ Line: 372 ]] --[[ Name: getPreviousAccountsList ]]
    -- upvalues: l_AppStorageService_0 (copy), v2 (copy), l_HttpService_0 (copy)
    if game:GetEngineFeature("PreviousAccountsListAvailable") then
        local v61 = l_AppStorageService_0:GetItem(v2.PreviousAccountsList) or "";
        local _ = nil;
        if v61 == "" then
            return {};
        else
            return (l_HttpService_0:JSONDecode(v61));
        end;
    else
        return {};
    end;
end;
v17.setPreviousAccountsList = function(v63) --[[ Line: 386 ]] --[[ Name: setPreviousAccountsList ]]
    -- upvalues: l_HttpService_0 (copy), l_AppStorageService_0 (copy), v2 (copy)
    if game:GetEngineFeature("PreviousAccountsListAvailable") then
        local v64 = l_HttpService_0:JSONEncode(v63);
        l_AppStorageService_0:SetItem(v2.PreviousAccountsList, v64);
        l_AppStorageService_0:flush();
    end;
end;
v17.getLastSuccessfulSignInMethod = function() --[[ Line: 397 ]] --[[ Name: getLastSuccessfulSignInMethod ]]
    -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
    if game:GetEngineFeature("LastSuccessfulSignInMethodKeyAvailable") then
        return l_AppStorageService_0:GetItem(v2.LastSuccessfulSignInMethod);
    else
        return "";
    end;
end;
v17.setLastSuccessfulSignInMethod = function(v65) --[[ Line: 404 ]] --[[ Name: setLastSuccessfulSignInMethod ]]
    -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
    if game:GetEngineFeature("LastSuccessfulSignInMethodKeyAvailable") then
        l_AppStorageService_0:SetItem(v2.LastSuccessfulSignInMethod, v65);
    end;
end;
v17.setDiscoveryClientFallbackCache = function(v66) --[[ Line: 410 ]] --[[ Name: setDiscoveryClientFallbackCache ]]
    -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
    if game:GetEngineFeature("UniversalAppDiscoveryClientFallbackCacheStorageKey") then
        l_AppStorageService_0:SetItem(v2.DiscoveryClientFallbackCache, v66);
    end;
end;
v17.flush = function() --[[ Line: 416 ]] --[[ Name: flush ]]
    -- upvalues: l_AppStorageService_0 (copy)
    l_AppStorageService_0:flush();
end;
return v17;