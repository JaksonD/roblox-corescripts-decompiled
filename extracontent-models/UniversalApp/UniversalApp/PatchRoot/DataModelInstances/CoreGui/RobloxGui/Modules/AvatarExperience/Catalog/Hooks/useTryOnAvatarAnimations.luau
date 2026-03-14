local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAnimationPreview);
local l_useEffectOnMount_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useEffectOnMount;
local v9 = require(l_CorePackages_0.Packages.tutils);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local v11 = {
    {
        AssetType = v6.AssetTypeIdStrings.IdleAnimation, 
        Label = "Feature.Avatar.Label.Idle"
    }, 
    {
        AssetType = v6.AssetTypeIdStrings.WalkAnimation, 
        Label = "Feature.Avatar.Label.Walk"
    }, 
    {
        AssetType = v6.AssetTypeIdStrings.RunAnimation, 
        Label = "Feature.Avatar.Label.Run"
    }, 
    {
        AssetType = v6.AssetTypeIdStrings.JumpAnimation, 
        Label = "Feature.Avatar.Label.Jump"
    }, 
    {
        AssetType = v6.AssetTypeIdStrings.FallAnimation, 
        Label = "Feature.Avatar.Label.Fall"
    }, 
    {
        AssetType = v6.AssetTypeIdStrings.ClimbAnimation, 
        Label = "Feature.Avatar.Label.Climb"
    }, 
    {
        AssetType = v6.AssetTypeIdStrings.SwimAnimation, 
        Label = "Feature.Avatar.Label.Swim"
    }
};
local function v16(v12) --[[ Line: 74 ]] --[[ Name: getAssetIds ]]
    -- upvalues: v6 (copy)
    local v13 = {};
    if v12 and v12.items then
        for _, v15 in v12.items do
            if v15.type == v6.ItemType.Asset then
                v13[#v13 + 1] = v15.id;
            end;
        end;
    end;
    return v13;
end;
local function v25(v17, v18) --[[ Line: 88 ]] --[[ Name: getAssetInfosByAssetType ]]
    -- upvalues: v16 (copy)
    local v19 = v16(v18);
    local v20 = {};
    local v21 = false;
    for _, v23 in v19 do
        local v24 = v17[v23];
        if not v24 then
            return nil;
        elseif not v24.assetType then
            return nil;
        else
            assert(v24.assetType, "silence type checker");
            v20[v24.assetType] = v24;
            v21 = true;
        end;
    end;
    if v21 then
        return v20;
    else
        return nil;
    end;
end;
local function v27(v26) --[[ Line: 113 ]] --[[ Name: selectAssetInfos ]]
    return v26.AvatarExperience.Common.AssetInfos;
end;
return function() --[[ Line: 117 ]] --[[ Name: useTryOnAvatarAnimations ]]
    -- upvalues: l_useDispatch_0 (copy), v2 (copy), l_useEffectOnMount_0 (copy), v5 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v27 (copy), v25 (copy), v9 (copy), v11 (copy), v7 (copy)
    local v28 = l_useDispatch_0();
    local v29, v30 = v2.useState(0);
    local v31 = v2.useRef(false);
    local v32 = v2.useRef({});
    local v33 = v2.useRef(nil);
    local v34, v35 = v2.useState(nil);
    local v36, v37 = v2.useState(nil);
    l_useEffectOnMount_0(function() --[[ Line: 127 ]]
        -- upvalues: v31 (copy)
        return function() --[[ Line: 128 ]]
            -- upvalues: v31 (ref)
            v31.current = false;
        end;
    end);
    local v39 = v2.useCallback(function(v38) --[[ Line: 134 ]]
        -- upvalues: v34 (copy), v36 (copy), v5 (ref)
        if not v34 or not v36 then
            return nil;
        else
            return v5(v38.AvatarExperience.Common, v34, v36);
        end;
    end, {
        v34, 
        v36
    });
    local v40 = l_useSelector_0(v39, l_getUseSelectorDeepEquals_0());
    local v41 = l_useSelector_0(v27, l_getUseSelectorDeepEquals_0());
    v2.useEffect(function() --[[ Line: 145 ]]
        -- upvalues: v40 (copy), v25 (ref), v41 (copy), v9 (ref), v33 (copy), v11 (ref), v32 (copy)
        if v40 ~= nil then
            local v42 = v25(v41, v40);
            if not v9.deepEqual(v42, v33.current) then
                v33.current = v42;
                if v42 then
                    local v43 = {};
                    for _, v45 in v11 do
                        if v42[v45.AssetType] then
                            v43[#v43 + 1] = v45;
                        end;
                    end;
                    v32.current = v43;
                    return;
                else
                    v32.current = {};
                end;
            end;
        end;
    end, {
        v40, 
        v41
    });
    v2.useEffect(function() --[[ Line: 169 ]]
        -- upvalues: v29 (copy), v32 (copy), v33 (copy), v28 (copy), v7 (ref)
        if v29 > 0 and #v32.current > 0 then
            local v46 = v32.current[v29];
            local v47 = if v46 and v33.current and v33.current[v46.AssetType] then v33.current[v46.AssetType] else nil;
            if v47 then
                v28(v7(v47.id, v46.AssetType));
            end;
        end;
    end, {
        v29
    });
    return (v2.useCallback(function(v48, v49, v50) --[[ Line: 184 ]]
        -- upvalues: v35 (copy), v37 (copy), v31 (copy), v30 (copy), v32 (copy)
        v35(v48);
        v37(v49);
        if v50 == "2" and not v31.current then
            v31.current = true;
            task.spawn(function() --[[ Line: 193 ]]
                -- upvalues: v30 (ref), v31 (ref), v32 (ref)
                v30(function(v51) --[[ Line: 194 ]]
                    if v51 == 0 then
                        return 1;
                    else
                        return v51;
                    end;
                end);
                while v31.current do
                    task.wait(2);
                    v30(function(v52) --[[ Line: 204 ]]
                        -- upvalues: v32 (ref)
                        local v53 = v52 + 1;
                        if #v32.current < v53 then
                            return 1;
                        else
                            return v53;
                        end;
                    end);
                end;
            end);
        end;
    end, {}));
end;