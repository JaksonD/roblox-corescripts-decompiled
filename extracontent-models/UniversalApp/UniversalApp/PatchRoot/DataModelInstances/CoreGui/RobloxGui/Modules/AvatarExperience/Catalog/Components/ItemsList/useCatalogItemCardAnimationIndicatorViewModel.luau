local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local v8 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags);
local l_RoactNetworking_0 = v8.RoactNetworking;
local l_RoactAnalytics_0 = v8.RoactAnalytics;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit);
local v12 = require(l_CorePackages_0.Packages.tutils);
local v13 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v14 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearAnimationPreview);
local v15 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAnimationPreview);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v20 = {
    v13.AssetTypeIdStrings.IdleAnimation, 
    v13.AssetTypeIdStrings.WalkAnimation, 
    v13.AssetTypeIdStrings.RunAnimation, 
    v13.AssetTypeIdStrings.JumpAnimation, 
    v13.AssetTypeIdStrings.FallAnimation, 
    v13.AssetTypeIdStrings.ClimbAnimation, 
    v13.AssetTypeIdStrings.SwimAnimation
};
local function v25(v21) --[[ Line: 43 ]] --[[ Name: getAssetIds ]]
    -- upvalues: v13 (copy)
    local v22 = {};
    if v21.items then
        for _, v24 in v21.items do
            if v24.type == v13.ItemType.Asset then
                table.insert(v22, v24.id);
            end;
        end;
    end;
    return v22;
end;
local function v32(v26, v27) --[[ Line: 56 ]] --[[ Name: getAssetInfoByAssetType ]]
    local v28 = {};
    for _, v30 in v27 do
        local v31 = v26[v30];
        if not v31 or not v31.assetType then
            return nil;
        else
            v28[v31.assetType] = v31;
        end;
    end;
    return v28;
end;
local _ = function(v33) --[[ Line: 73 ]] --[[ Name: getItemAnimationAssetTypes ]]
    -- upvalues: v20 (copy)
    local v34 = {};
    for _, v36 in v20 do
        if v33[v36] then
            table.insert(v34, v36);
        end;
    end;
    return v34;
end;
local function _(v38, v39) --[[ Line: 83 ]] --[[ Name: selectAssetInfosByAssetType ]]
    -- upvalues: v32 (copy)
    local l_AssetInfos_0 = v38.AvatarExperience.Common.AssetInfos;
    return (v32(l_AssetInfos_0, v39));
end;
return function(v42) --[[ Line: 88 ]] --[[ Name: useItemCardAnimationStates ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_RoactAnalytics_0 (copy), l_useLocalization_0 (copy), v13 (copy), l_useDispatch_0 (copy), v2 (copy), v25 (copy), v32 (copy), l_useSelector_0 (copy), v12 (copy), v20 (copy), v15 (copy), v14 (copy), v16 (copy)
    local v43 = l_useRoactService_0(l_RoactNetworking_0);
    local v44 = l_useRoactService_0(l_RoactAnalytics_0);
    local v45 = l_useLocalization_0({
        [v13.AssetTypeIdStrings.IdleAnimation] = "Feature.Avatar.Label.Idle", 
        [v13.AssetTypeIdStrings.WalkAnimation] = "Feature.Avatar.Label.Walk", 
        [v13.AssetTypeIdStrings.RunAnimation] = "Feature.Avatar.Label.Run", 
        [v13.AssetTypeIdStrings.JumpAnimation] = "Feature.Avatar.Label.Jump", 
        [v13.AssetTypeIdStrings.FallAnimation] = "Feature.Avatar.Label.Fall", 
        [v13.AssetTypeIdStrings.ClimbAnimation] = "Feature.Avatar.Label.Climb", 
        [v13.AssetTypeIdStrings.SwimAnimation] = "Feature.Avatar.Label.Swim"
    });
    local v46 = l_useDispatch_0();
    local v47, v48 = v2.useState(1);
    local v49 = v2.useMemo(function() --[[ Line: 104 ]]
        -- upvalues: v25 (ref), v42 (copy)
        return (v25(v42));
    end, {
        v42
    });
    local v53 = v2.useCallback(function(v50) --[[ Line: 108 ]]
        -- upvalues: v49 (copy), v32 (ref)
        local l_v49_0 = v49;
        local l_AssetInfos_1 = v50.AvatarExperience.Common.AssetInfos;
        return (v32(l_AssetInfos_1, l_v49_0));
    end, {
        v49
    });
    local v54 = l_useSelector_0(v53, v12.deepEqual);
    local v59 = v2.useMemo(function() --[[ Line: 114 ]]
        -- upvalues: v54 (copy), v20 (ref)
        local v55 = v54 or {};
        local v56 = {};
        for _, v58 in v20 do
            if v55[v58] then
                table.insert(v56, v58);
            end;
        end;
        return v56;
    end, {
        v54
    });
    local v60 = v59[v47];
    local v61 = if v60 and v54 then v54[v60] else nil;
    local v62 = if v61 then v61.id else nil;
    v2.useEffect(function() --[[ Line: 124 ]]
        -- upvalues: v62 (copy), v60 (copy), v46 (copy), v15 (ref), v14 (ref)
        if v62 and v60 then
            v46(v15(v62, v60));
        end;
        return function() --[[ Line: 128 ]]
            -- upvalues: v46 (ref), v14 (ref)
            v46(v14());
        end;
    end, {
        v46, 
        v62, 
        v60
    });
    local v63 = #v59;
    v2.useEffect(function() --[[ Line: 134 ]]
        -- upvalues: v63 (copy), v48 (copy)
        local v64 = nil;
        if v63 ~= 0 then
            v48(1);
            local v65 = 0;
            do
                local l_v65_0 = v65;
                v64 = game:GetService("RunService").Heartbeat:Connect(function(v67) --[[ Line: 139 ]]
                    -- upvalues: l_v65_0 (ref), v48 (ref), v63 (ref)
                    l_v65_0 = l_v65_0 + v67;
                    if l_v65_0 > 2 then
                        l_v65_0 = l_v65_0 - 2;
                        v48(function(v68) --[[ Line: 143 ]]
                            -- upvalues: v63 (ref)
                            return v68 % v63 + 1;
                        end);
                    end;
                end);
            end;
        end;
        return function() --[[ Line: 149 ]]
            -- upvalues: v64 (ref)
            if v64 then
                v64:Disconnect();
            end;
        end;
    end, {
        v63
    });
    v2.useEffect(function() --[[ Line: 156 ]]
        -- upvalues: v49 (copy), v46 (copy), v16 (ref), v43 (copy), v44 (copy), v13 (ref)
        for _, v70 in v49 do
            v46(v16(v43, v44, v70, v13.ItemType.Asset));
        end;
    end, {
        v43, 
        v44, 
        v49, 
        v46
    });
    return {
        states = v2.useMemo(function() --[[ Line: 162 ]]
            -- upvalues: v59 (copy), v60 (copy), v45 (copy)
            local v71 = {};
            for _, v73 in v59 do
                table.insert(v71, {
                    isSelected = v73 == v60, 
                    text = v45[v73]
                });
            end;
            return v71;
        end, {
            v60, 
            v59, 
            v45
        })
    };
end;