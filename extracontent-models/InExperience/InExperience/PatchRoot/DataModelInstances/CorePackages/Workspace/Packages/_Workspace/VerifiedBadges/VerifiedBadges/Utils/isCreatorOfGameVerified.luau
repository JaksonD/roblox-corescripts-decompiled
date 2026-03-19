local l_script_FirstAncestor_0 = script:FindFirstAncestor("VerifiedBadges");
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
return function(v3, v4) --[[ Line: 48 ]] --[[ Name: isCreatorOfGameVerified ]]
    -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy)
    local v5 = nil;
    if (l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0) and v4.shouldUseV2GameDetails then
        if v3.GameDetailsV2 and v3.GameDetailsV2[v4.universeId] then
            v5 = v3.GameDetailsV2[v4.universeId].creator;
        end;
    elseif v3.GameDetails and v3.GameDetails[v4.universeId] then
        v5 = v3.GameDetails[v4.universeId].creator;
    end;
    local v6 = "";
    if v5 == nil or v5.id == nil then
        return false;
    else
        v6 = tostring(v5.id);
        if v5 and v3.VerifiedBadges then
            if v3.VerifiedBadges.VerifiedUsers and v5.type == Enum.CreatorType.User.Name then
                return v3.VerifiedBadges.VerifiedUsers[tostring(v6)] == true;
            elseif v3.VerifiedBadges.VerifiedGroups and v5.type == Enum.CreatorType.Group.Name then
                return v3.VerifiedBadges.VerifiedGroups[tostring(v6)] == true;
            end;
        end;
        return false;
    end;
end;