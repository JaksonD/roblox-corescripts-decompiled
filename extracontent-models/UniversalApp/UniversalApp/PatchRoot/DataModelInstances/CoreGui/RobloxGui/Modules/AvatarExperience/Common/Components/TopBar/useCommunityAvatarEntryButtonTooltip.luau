local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_game_EngineFeature_0 = game:GetEngineFeature("AXMarketplaceCommunityAvatarsTooltipKeys");
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v6.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v6.AvatarRoute.Hooks.useAvatarRoute;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
local v11 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local l_l_AppStorageService_0_0 = l_AppStorageService_0;
local function v20() --[[ Line: 25 ]] --[[ Name: getMockAppStorageService ]]
    return {
        storage = {}, 
        GetItem = function(v14, v15) --[[ Line: 28 ]] --[[ Name: GetItem ]]
            return v14.storage[v15];
        end, 
        SetItem = function(v16, v17, v18) --[[ Line: 31 ]] --[[ Name: SetItem ]]
            v16.storage[v17] = v18;
        end, 
        Flush = function(_) --[[ Line: 34 ]] --[[ Name: Flush ]]

        end
    };
end;
if not l_game_EngineFeature_0 then
    l_l_AppStorageService_0_0 = v20();
end;
return function(v21) --[[ Line: 50 ]] --[[ Name: useCommunityAvatarEntryButtonTooltip ]]
    -- upvalues: v5 (copy), l_useAvatarRoute_0 (copy), l_useSelector_0 (copy), v11 (copy), l_getUseSelectorDeepEquals_0 (copy), l_AvatarScreen_0 (copy), l_l_AppStorageService_0_0 (ref), l_useIsSpatial_0 (copy)
    local v22, v23 = v5.useState(false);
    local v24 = l_useAvatarRoute_0();
    local v25 = l_useSelector_0(v11.isAvatarExperienceRoute, l_getUseSelectorDeepEquals_0()) and v24.current.name == l_AvatarScreen_0.AvatarEditor;
    local v26 = v21.appStorageService or l_l_AppStorageService_0_0;
    local v27 = l_useIsSpatial_0();
    v5.useEffect(function() --[[ Line: 63 ]]
        -- upvalues: v27 (copy), v23 (copy), v25 (copy), v26 (copy)
        if v27 then
            v23(false);
            return;
        elseif v25 then
            local l_v26_Item_0 = v26:GetItem("AXMarketplaceCommunityAvatarsTooltipSeenTimestamp");
            local l_v23_0 = v23;
            local v30 = true;
            if l_v26_Item_0 ~= "" then
                v30 = l_v26_Item_0 == nil;
            end;
            l_v23_0(v30);
            return;
        else
            v23(false);
            return;
        end;
    end, {
        v25, 
        v27
    });
    return v22, function(v31) --[[ Line: 75 ]]
        -- upvalues: v26 (copy), v23 (copy)
        if v31.saveDismissTime then
            v26:SetItem("AXMarketplaceCommunityAvatarsTooltipSeenTimestamp", (tostring(os.time())));
            v26:Flush();
        end;
        v23(false);
    end;
end;