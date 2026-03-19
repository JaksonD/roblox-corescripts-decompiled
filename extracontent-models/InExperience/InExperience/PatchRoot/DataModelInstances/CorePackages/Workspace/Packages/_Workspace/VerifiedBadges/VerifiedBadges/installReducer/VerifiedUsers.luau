local l_script_FirstAncestor_0 = script:FindFirstAncestor("VerifiedBadges");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v3 = require(l_script_FirstAncestor_0.dependencies);
local l_UsersNetworking_0 = v3.UsersNetworking;
local l_FriendsNetworking_0 = v3.FriendsNetworking;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local v8 = {};
local function v14(v9, v10) --[[ Line: 24 ]]
    -- upvalues: v2 (copy)
    local v11 = {};
    for _, v13 in ipairs(v10) do
        v11[tostring(v13.id)] = v13.hasVerifiedBadge and true or v2.None;
    end;
    return v2.Dictionary.join(v9, v11);
end;
return v1.createReducer(v8, {
    [l_UsersNetworking_0.GetUserV2FromUserId.Succeeded.name] = function(v15, v16) --[[ Line: 35 ]]
        -- upvalues: v14 (copy)
        return v14(v15, {
            v16.responseBody
        });
    end, 
    [l_FriendsNetworking_0.GetFriendsFromUserId.Succeeded.name] = function(v17, v18) --[[ Line: 39 ]]
        -- upvalues: v14 (copy)
        return v14(v17, v18.responseBody.data);
    end, 
    AddGameDetails = function(v19, v20) --[[ Line: 43 ]] --[[ Name: AddGameDetails ]]
        -- upvalues: v2 (copy)
        local v21 = {};
        for _, v23 in pairs(v20.gameDetails) do
            local v24 = tostring(v23.creator.id);
            local l_type_0 = v23.creator.type;
            local l_hasVerifiedBadge_0 = v23.creator.hasVerifiedBadge;
            if l_type_0 == Enum.CreatorType.User.Name then
                v21[v24] = l_hasVerifiedBadge_0 and true or v2.None;
            end;
        end;
        return v2.Dictionary.join(v19, v21);
    end, 
    AddGameDetailsV2 = (not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0) and function(v27, v28) --[[ Line: 60 ]]
        -- upvalues: v2 (copy)
        local v29 = {};
        for _, v31 in pairs(v28.gameDetails) do
            local v32 = tostring(v31.creator.id);
            local l_type_1 = v31.creator.type;
            local l_hasVerifiedBadge_1 = v31.creator.hasVerifiedBadge;
            if l_type_1 == Enum.CreatorType.User.Name then
                v29[v32] = l_hasVerifiedBadge_1 and true or v2.None;
            end;
        end;
        return v2.Dictionary.join(v27, v29);
    end or nil, 
    SetAssetInfoFromCatalogItemAction = function(v35, v36) --[[ Line: 77 ]] --[[ Name: SetAssetInfoFromCatalogItemAction ]]
        -- upvalues: v2 (copy)
        if v36.assetData.creatorType ~= Enum.CreatorType.User.Name then
            return v35;
        else
            local v37 = tostring(v36.assetData.creatorTargetId);
            local l_creatorHasVerifiedBadge_0 = v36.assetData.creatorHasVerifiedBadge;
            return v2.Dictionary.join(v35, {
                [v37] = l_creatorHasVerifiedBadge_0 and true or v2.None
            });
        end;
    end
});