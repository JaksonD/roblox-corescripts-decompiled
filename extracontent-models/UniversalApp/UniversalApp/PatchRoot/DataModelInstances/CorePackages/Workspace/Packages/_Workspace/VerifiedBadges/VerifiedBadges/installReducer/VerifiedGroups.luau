local l_script_FirstAncestor_0 = script:FindFirstAncestor("VerifiedBadges");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
return v1.createReducer({}, {
    AddGameDetails = function(v5, v6) --[[ Line: 16 ]] --[[ Name: AddGameDetails ]]
        -- upvalues: v2 (copy)
        local v7 = {};
        for _, v9 in pairs(v6.gameDetails) do
            local v10 = tostring(v9.creator.id);
            local l_type_0 = v9.creator.type;
            local l_hasVerifiedBadge_0 = v9.creator.hasVerifiedBadge;
            if l_type_0 == Enum.CreatorType.Group.Name then
                v7[v10] = l_hasVerifiedBadge_0 and true or v2.None;
            end;
        end;
        return v2.Dictionary.join(v5, v7);
    end, 
    AddGameDetailsV2 = (not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0) and function(v13, v14) --[[ Line: 33 ]]
        -- upvalues: v2 (copy)
        local v15 = {};
        for _, v17 in pairs(v14.gameDetails) do
            local v18 = tostring(v17.creator.id);
            local l_type_1 = v17.creator.type;
            local l_hasVerifiedBadge_1 = v17.creator.hasVerifiedBadge;
            if l_type_1 == Enum.CreatorType.Group.Name then
                v15[v18] = l_hasVerifiedBadge_1 and true or v2.None;
            end;
        end;
        return v2.Dictionary.join(v13, v15);
    end or nil, 
    SetAssetInfoFromCatalogItemAction = function(v21, v22) --[[ Line: 48 ]] --[[ Name: SetAssetInfoFromCatalogItemAction ]]
        -- upvalues: v2 (copy)
        if v22.assetData.creatorType ~= Enum.CreatorType.Group.Name then
            return v21;
        else
            local v23 = tostring(v22.assetData.creatorTargetId);
            local l_creatorHasVerifiedBadge_0 = v22.assetData.creatorHasVerifiedBadge;
            return v2.Dictionary.join(v21, {
                [v23] = l_creatorHasVerifiedBadge_0 and true or v2.None
            });
        end;
    end
});