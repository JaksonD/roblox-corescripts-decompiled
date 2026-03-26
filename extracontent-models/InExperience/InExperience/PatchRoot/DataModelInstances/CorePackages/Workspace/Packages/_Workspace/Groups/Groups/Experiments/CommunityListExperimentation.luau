local l_IXPService_0 = game:GetService("IXPService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Groups");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.SharedFlags);
local v4 = require(l_script_FirstAncestor_0.Flags);
local l_GetFStringSocialCommunityAppLayer_0 = v4.GetFStringSocialCommunityAppLayer;
local l_GetFStringLuaCommunityListVariant_0 = v4.GetFStringLuaCommunityListVariant;
local l_GetFFlagForceEnableLuaCommunityList_0 = v4.GetFFlagForceEnableLuaCommunityList;
local l_GetFFlagEnableCommunityListExperimentation_0 = v3.GetFFlagEnableCommunityListExperimentation;
local function _(v9) --[[ Line: 14 ]] --[[ Name: getIsUserInTreatment ]]
    -- upvalues: l_IXPService_0 (copy), l_GetFStringSocialCommunityAppLayer_0 (copy)
    local l_l_IXPService_0_UserLayerVariables_0 = l_IXPService_0:GetUserLayerVariables(l_GetFStringSocialCommunityAppLayer_0());
    if l_l_IXPService_0_UserLayerVariables_0 and l_l_IXPService_0_UserLayerVariables_0[v9] ~= nil then
        return l_l_IXPService_0_UserLayerVariables_0[v9];
    else
        return false;
    end;
end;
return {
    getCommunityListEnabled = function() --[[ Line: 23 ]] --[[ Name: getCommunityListEnabled ]]
        -- upvalues: l_GetFFlagForceEnableLuaCommunityList_0 (copy), l_GetFFlagEnableCommunityListExperimentation_0 (copy), l_GetFStringLuaCommunityListVariant_0 (copy), l_IXPService_0 (copy), l_GetFStringSocialCommunityAppLayer_0 (copy)
        local v12 = l_GetFFlagForceEnableLuaCommunityList_0();
        if not v12 then
            v12 = l_GetFFlagEnableCommunityListExperimentation_0();
            if v12 then
                local v13 = l_GetFStringLuaCommunityListVariant_0();
                local l_l_IXPService_0_UserLayerVariables_1 = l_IXPService_0:GetUserLayerVariables(l_GetFStringSocialCommunityAppLayer_0());
                if l_l_IXPService_0_UserLayerVariables_1 and l_l_IXPService_0_UserLayerVariables_1[v13] ~= nil then
                    return l_l_IXPService_0_UserLayerVariables_1[v13];
                else
                    v12 = false;
                end;
            end;
        end;
        return v12;
    end, 
    logExposure = function() --[[ Line: 28 ]] --[[ Name: logExposure ]]
        -- upvalues: l_GetFFlagEnableCommunityListExperimentation_0 (copy), l_IXPService_0 (copy), l_GetFStringSocialCommunityAppLayer_0 (copy)
        if l_GetFFlagEnableCommunityListExperimentation_0() then
            l_IXPService_0:LogUserLayerExposure(l_GetFStringSocialCommunityAppLayer_0());
        end;
    end
};