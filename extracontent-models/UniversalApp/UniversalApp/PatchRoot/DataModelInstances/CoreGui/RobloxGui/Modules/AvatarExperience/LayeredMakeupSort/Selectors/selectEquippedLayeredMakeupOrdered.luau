local l_CorePackages_0 = game:GetService("CorePackages");
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_MAKEUP_TYPE_TO_ASSET_TYPE_ID_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Constants.MAKEUP_TYPE_TO_ASSET_TYPE_ID;
local v11 = l_memoize_0(function(v3) --[[ Line: 12 ]]
    -- upvalues: l_MAKEUP_TYPE_TO_ASSET_TYPE_ID_0 (copy)
    local v4 = {};
    local v5 = {};
    for _, v7 in v3 do
        local v8 = l_MAKEUP_TYPE_TO_ASSET_TYPE_ID_0[v7.MakeupType];
        v5[tostring(v7.AssetId)] = v7.Order;
        table.insert(v4, {
            id = tostring(v7.AssetId), 
            typeId = v8
        });
    end;
    table.sort(v4, function(v9, v10) --[[ Line: 28 ]]
        -- upvalues: v5 (copy)
        return v5[v9.id] > v5[v10.id];
    end);
    return v4;
end);
return function(v12) --[[ Line: 42 ]]
    -- upvalues: v11 (copy)
    local l_CurrentCharacter_0 = v12.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if not l_CurrentCharacter_0 then
        return {};
    else
        local l_HumanoidDescription_0 = l_CurrentCharacter_0.Humanoid.HumanoidDescription;
        local v15 = {};
        for _, v17 in l_HumanoidDescription_0:GetChildren() do
            if v17:IsA("MakeupDescription") then
                table.insert(v15, v17);
            end;
        end;
        return v11(v15);
    end;
end;