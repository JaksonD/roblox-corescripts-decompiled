local l_Parent_0 = script:FindFirstAncestor("UserProfiles").Parent;
local l_createSignal_0 = require(l_Parent_0.Signals).createSignal;
local l_FFlagEnableVerifiedBadgeStore_0 = require(l_Parent_0.SharedFlags).FFlagEnableVerifiedBadgeStore;
return {
    update = function(v3, v4) --[[ Line: 49 ]] --[[ Name: update ]]
        -- upvalues: l_FFlagEnableVerifiedBadgeStore_0 (copy)
        if not v4 or type(v4) ~= "table" then
            return;
        else
            local l_names_0 = v4.names;
            if l_names_0 and type(l_names_0) == "table" then
                local l_username_0 = l_names_0.username;
                if l_username_0 and type(l_username_0) == "string" then
                    v3.names.setUsername(l_username_0);
                end;
                local l_displayName_0 = l_names_0.displayName;
                if l_displayName_0 and type(l_displayName_0) == "string" then
                    v3.names.setDisplayName(l_displayName_0);
                end;
                local l_combinedName_0 = l_names_0.combinedName;
                if l_combinedName_0 and type(l_combinedName_0) == "string" then
                    v3.names.setCombinedName(l_combinedName_0);
                end;
                local l_inExperienceCombinedName_0 = l_names_0.inExperienceCombinedName;
                if l_inExperienceCombinedName_0 and type(l_inExperienceCombinedName_0) == "string" then
                    v3.names.setInExperienceCombinedName(l_inExperienceCombinedName_0);
                end;
                local l_platformName_0 = l_names_0.platformName;
                if l_platformName_0 and type(l_platformName_0) == "string" then
                    v3.names.setPlatformName(l_platformName_0);
                end;
                local l_contactName_0 = l_names_0.contactName;
                if l_contactName_0 and type(l_contactName_0) == "string" then
                    v3.names.setContactName(l_contactName_0);
                end;
                local l_alias_0 = l_names_0.alias;
                if l_alias_0 and type(l_alias_0) == "string" then
                    v3.names.setAlias(l_alias_0);
                end;
            end;
            local l_platformProfileId_0 = v4.platformProfileId;
            if l_platformProfileId_0 and type(l_platformProfileId_0) == "string" then
                v3.setPlatformProfileId(l_platformProfileId_0);
            end;
            local v14 = if l_FFlagEnableVerifiedBadgeStore_0 then v4.isVerified else nil;
            if v14 ~= nil and type(v14) == "boolean" then
                v3.setIsVerified(v14);
            end;
            return;
        end;
    end, 
    create = function(v15) --[[ Line: 97 ]] --[[ Name: create ]]
        -- upvalues: l_createSignal_0 (copy), l_FFlagEnableVerifiedBadgeStore_0 (copy)
        local v16, v17 = l_createSignal_0("");
        local v18, v19 = l_createSignal_0("");
        local v20, v21 = l_createSignal_0("");
        local v22, v23 = l_createSignal_0("");
        local v24, v25 = l_createSignal_0("");
        local v26, v27 = l_createSignal_0("");
        local v28, v29 = l_createSignal_0("");
        local v30, v31 = l_createSignal_0("");
        local v32 = nil;
        local v33 = nil;
        if l_FFlagEnableVerifiedBadgeStore_0 then
            local v34, v35 = l_createSignal_0(false);
            v32 = v34;
            v33 = v35;
        end;
        return {
            userId = v15, 
            names = {
                getUsername = v16, 
                setUsername = v17, 
                getDisplayName = v18, 
                setDisplayName = v19, 
                getCombinedName = v20, 
                setCombinedName = v21, 
                getInExperienceCombinedName = v22, 
                setInExperienceCombinedName = v23, 
                getPlatformName = v24, 
                setPlatformName = v25, 
                getContactName = v26, 
                setContactName = v27, 
                getAlias = v28, 
                setAlias = v29
            }, 
            getPlatformProfileId = v30, 
            setPlatformProfileId = v31, 
            getIsVerified = if l_FFlagEnableVerifiedBadgeStore_0 then v32 else nil, 
            setIsVerified = if l_FFlagEnableVerifiedBadgeStore_0 then v33 else nil
        };
    end
};