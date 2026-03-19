local l_Parent_0 = script:FindFirstAncestor("UserProfiles").Parent;
local l_createSignal_0 = require(l_Parent_0.Signals).createSignal;
local v2 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableVerifiedBadgeStore_0 = v2.FFlagEnableVerifiedBadgeStore;
local l_FFlagEnableBlackbirdCheckDev_0 = v2.FFlagEnableBlackbirdCheckDev;
return {
    update = function(v5, v6) --[[ Line: 53 ]] --[[ Name: update ]]
        -- upvalues: l_FFlagEnableVerifiedBadgeStore_0 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy)
        if not v6 or type(v6) ~= "table" then
            return;
        else
            local l_names_0 = v6.names;
            if l_names_0 and type(l_names_0) == "table" then
                local l_username_0 = l_names_0.username;
                if l_username_0 and type(l_username_0) == "string" then
                    v5.names.setUsername(l_username_0);
                end;
                local l_displayName_0 = l_names_0.displayName;
                if l_displayName_0 and type(l_displayName_0) == "string" then
                    v5.names.setDisplayName(l_displayName_0);
                end;
                local l_combinedName_0 = l_names_0.combinedName;
                if l_combinedName_0 and type(l_combinedName_0) == "string" then
                    v5.names.setCombinedName(l_combinedName_0);
                end;
                local l_inExperienceCombinedName_0 = l_names_0.inExperienceCombinedName;
                if l_inExperienceCombinedName_0 and type(l_inExperienceCombinedName_0) == "string" then
                    v5.names.setInExperienceCombinedName(l_inExperienceCombinedName_0);
                end;
                local l_platformName_0 = l_names_0.platformName;
                if l_platformName_0 and type(l_platformName_0) == "string" then
                    v5.names.setPlatformName(l_platformName_0);
                end;
                local l_contactName_0 = l_names_0.contactName;
                if l_contactName_0 and type(l_contactName_0) == "string" then
                    v5.names.setContactName(l_contactName_0);
                end;
                local l_alias_0 = l_names_0.alias;
                if l_alias_0 and type(l_alias_0) == "string" then
                    v5.names.setAlias(l_alias_0);
                end;
            end;
            local l_platformProfileId_0 = v6.platformProfileId;
            if l_platformProfileId_0 and type(l_platformProfileId_0) == "string" then
                v5.setPlatformProfileId(l_platformProfileId_0);
            end;
            local v16 = if l_FFlagEnableVerifiedBadgeStore_0 then v6.isVerified else nil;
            if v16 ~= nil and type(v16) == "boolean" then
                v5.setIsVerified(v16);
            end;
            local v17 = if l_FFlagEnableBlackbirdCheckDev_0 then v6.hasRobloxSubscription else nil;
            if v17 ~= nil and type(v17) == "boolean" then
                v5.setHasRobloxSubscription(v17);
            end;
            return;
        end;
    end, 
    create = function(v18) --[[ Line: 106 ]] --[[ Name: create ]]
        -- upvalues: l_createSignal_0 (copy), l_FFlagEnableVerifiedBadgeStore_0 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy)
        local v19, v20 = l_createSignal_0("");
        local v21, v22 = l_createSignal_0("");
        local v23, v24 = l_createSignal_0("");
        local v25, v26 = l_createSignal_0("");
        local v27, v28 = l_createSignal_0("");
        local v29, v30 = l_createSignal_0("");
        local v31, v32 = l_createSignal_0("");
        local v33, v34 = l_createSignal_0("");
        local v35 = nil;
        local v36 = nil;
        if l_FFlagEnableVerifiedBadgeStore_0 then
            local v37, v38 = l_createSignal_0(false);
            v35 = v37;
            v36 = v38;
        end;
        local v39 = nil;
        local v40 = nil;
        if l_FFlagEnableBlackbirdCheckDev_0 then
            local v41, v42 = l_createSignal_0(false);
            v39 = v41;
            v40 = v42;
        end;
        return {
            userId = v18, 
            names = {
                getUsername = v19, 
                setUsername = v20, 
                getDisplayName = v21, 
                setDisplayName = v22, 
                getCombinedName = v23, 
                setCombinedName = v24, 
                getInExperienceCombinedName = v25, 
                setInExperienceCombinedName = v26, 
                getPlatformName = v27, 
                setPlatformName = v28, 
                getContactName = v29, 
                setContactName = v30, 
                getAlias = v31, 
                setAlias = v32
            }, 
            getPlatformProfileId = v33, 
            setPlatformProfileId = v34, 
            getIsVerified = if l_FFlagEnableVerifiedBadgeStore_0 then v35 else nil, 
            setIsVerified = if l_FFlagEnableVerifiedBadgeStore_0 then v36 else nil, 
            getHasRobloxSubscription = if l_FFlagEnableBlackbirdCheckDev_0 then v39 else nil, 
            setHasRobloxSubscription = if l_FFlagEnableBlackbirdCheckDev_0 then v40 else nil
        };
    end
};