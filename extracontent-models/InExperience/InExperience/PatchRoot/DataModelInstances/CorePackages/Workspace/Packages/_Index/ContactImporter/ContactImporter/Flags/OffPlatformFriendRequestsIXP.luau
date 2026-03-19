game:DefineFastInt("OffPlatformFriendRequestsRolloutEnabled", 0);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_setupIsRolloutEnabledForUser_0 = v1.SocialLibraries.ReleaseHelpers.setupIsRolloutEnabledForUser;
local l_getFStringSocialFriendsLayer_0 = v1.getFStringSocialFriendsLayer;
local l_useUserExperiment_0 = v1.useUserExperiment;
local v6 = require(script.Parent.getFStringOffPlatformIXPName);
local v7 = require(l_script_FirstAncestor_0.Common.IXPVariants);
local v8 = v6();
local l_FFlagContactImporterIXPCleanup_0 = require(l_Parent_0.SharedFlags).FFlagContactImporterIXPCleanup;
local function v10() --[[ Line: 21 ]]
    return game:GetFastInt("OffPlatformFriendRequestsRolloutEnabled");
end;
local function _(v11) --[[ Line: 25 ]]
    -- upvalues: v8 (copy)
    local v12 = nil;
    if v11 then
        v12 = v11[v8];
    end;
    return v12;
end;
local function v17(v14) --[[ Line: 34 ]]
    -- upvalues: l_getFStringSocialFriendsLayer_0 (copy), v8 (copy)
    local v15 = if v14 then v14[l_getFStringSocialFriendsLayer_0()] else nil;
    local v16 = nil;
    if v15 then
        v16 = v15[v8];
    end;
    return v16;
end;
local v18 = l_setupIsRolloutEnabledForUser_0(v10);
local function v23(v19) --[[ Line: 40 ]]
    -- upvalues: l_getFStringSocialFriendsLayer_0 (copy), v8 (copy), v7 (copy), v18 (copy)
    local v20 = if v19 then v19[l_getFStringSocialFriendsLayer_0()] else nil;
    local v21 = nil;
    if v20 then
        v21 = v20[v8];
    end;
    local l_v21_0 = v21;
    v20 = false;
    if l_v21_0 then
        v21 = true;
        if l_v21_0 ~= v7.INVITES_ONLY then
            v21 = l_v21_0 == v7.BLENDED;
        end;
        v20 = v21;
    end;
    return v20 or v18();
end;
local function v24() --[[ Line: 51 ]]
    -- upvalues: l_useUserExperiment_0 (copy), l_getFStringSocialFriendsLayer_0 (copy), v17 (copy)
    return l_useUserExperiment_0({
        l_getFStringSocialFriendsLayer_0()
    }, v17);
end;
local function v25() --[[ Line: 57 ]]
    -- upvalues: l_useUserExperiment_0 (copy), l_getFStringSocialFriendsLayer_0 (copy), v23 (copy)
    return l_useUserExperiment_0({
        l_getFStringSocialFriendsLayer_0()
    }, v23);
end;
if l_FFlagContactImporterIXPCleanup_0 then
    return nil;
else
    return {
        experimentOrRolloutEnabled = v23, 
        IXPVariants = v7, 
        useOffPlatformFriendRequestsVariant = v24, 
        useOffPlatformFriendRequestsEnabled = v25, 
        getExperimentVariant = v17, 
        isRolloutEnabled = function(v26) --[[ Line: 72 ]] --[[ Name: isRolloutEnabled ]]
            -- upvalues: l_getFStringSocialFriendsLayer_0 (copy), v8 (copy), v7 (copy), v18 (copy)
            local v27 = if v26 then v26[l_getFStringSocialFriendsLayer_0()] else nil;
            local v28 = nil;
            if v27 then
                v28 = v27[v8];
            end;
            local l_v28_0 = v28;
            v27 = false;
            if l_v28_0 then
                v28 = true;
                if l_v28_0 ~= v7.INVITES_ONLY then
                    v28 = l_v28_0 == v7.BLENDED;
                end;
                v27 = v28;
            end;
            if v27 or v18() then
                return v7.BLENDED;
            else
                return v7.CONTROL;
            end;
        end
    };
end;