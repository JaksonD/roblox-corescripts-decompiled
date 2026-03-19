local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_AXPrefetchMarketplaceIXP_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceExperiments).AXPrefetchMarketplaceIXP;
local v4 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(script.Parent.useMarketplaceResultsFetcher);
local v7 = require(script.Parent.useIsHomepageReady);
local v8 = game:DefineFastFlag("AXDebugForceIsRecentMarketplaceEnabled", false);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXStrictCheckForPrefetchMarketplace_0 = v12.FFlagAXStrictCheckForPrefetchMarketplace;
local l_FFlagsAXPrefetchMarketplaceThumbnailsXP_0 = v12.FFlagsAXPrefetchMarketplaceThumbnailsXP;
local v15 = l_FFlagAXStrictCheckForPrefetchMarketplace_0 and l_FFlagsAXPrefetchMarketplaceThumbnailsXP_0.UserIsInExperiment;
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Hooks.usePrefetchMarketplaceThumbnails);
local v17 = game:DefineFastFlag("AXAppLaunchedCounterEnabled", false);
local l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 = v12.FFlagAXFixPrefetchMarketplaceStartupCrash;
local function v20(v19) --[[ Line: 65 ]] --[[ Name: selectIsRecentMarketplaceUser ]]
    -- upvalues: v8 (copy), l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 (copy)
    if v8 then
        return true;
    elseif l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 and (not v19.AvatarExperience or not v19.AvatarExperience.Catalog or not v19.AvatarExperience.Catalog.Metadata) then
        return false;
    else
        return v19.AvatarExperience.Catalog.Metadata.isRecentMarketplaceUser;
    end;
end;
return function() --[[ Line: 97 ]] --[[ Name: usePrefetchMarketplace ]]
    -- upvalues: l_AXPrefetchMarketplaceIXP_0 (copy), v4 (copy), v7 (copy), l_useSelector_0 (copy), v20 (copy), v6 (copy), l_FFlagAXStrictCheckForPrefetchMarketplace_0 (copy), v2 (copy), v15 (copy), v16 (copy), v17 (copy), l_sendAXCounterV2_0 (copy), v10 (copy)
    local v21 = if l_AXPrefetchMarketplaceIXP_0.isEnabled() then v4.readTestVariable(l_AXPrefetchMarketplaceIXP_0.EnabledForUser) else nil;
    local v22 = v7();
    local v23 = l_useSelector_0(v20);
    local v24 = v6();
    local l_hasFetched_0 = v24.hasFetched;
    local l_isFetching_0 = v24.isFetching;
    local l_fetchMarketplace_0 = v24.fetchMarketplace;
    local v28 = if l_FFlagAXStrictCheckForPrefetchMarketplace_0 then v2.useRef(false) else nil;
    local v29 = nil;
    local v30 = nil;
    if v15 then
        v30 = v2.useRef(false);
        v29 = v16();
    end;
    if v17 then
        v2.useEffect(function() --[[ Line: 122 ]]
            -- upvalues: l_sendAXCounterV2_0 (ref), v10 (ref)
            l_sendAXCounterV2_0(v10.Counter.PrefetchMarketplace.appLaunched);
        end, {});
    end;
    v2.useEffect(function() --[[ Line: 138 ]]
        -- upvalues: l_FFlagAXStrictCheckForPrefetchMarketplace_0 (ref), v28 (copy), v21 (copy), v23 (copy), l_hasFetched_0 (copy), l_isFetching_0 (copy), v22 (copy), l_sendAXCounterV2_0 (ref), v10 (ref), l_fetchMarketplace_0 (copy)
        if l_FFlagAXStrictCheckForPrefetchMarketplace_0 and v28 and v28.current then
            return;
        elseif not v21 then
            return;
        elseif not v23 then
            return;
        elseif l_hasFetched_0 or l_isFetching_0 then
            return;
        elseif not v22 then
            return;
        else
            l_sendAXCounterV2_0(v10.Counter.PrefetchMarketplace.isRecentMarketplaceUser);
            l_fetchMarketplace_0();
            if l_FFlagAXStrictCheckForPrefetchMarketplace_0 and v28 then
                v28.current = true;
            end;
            return;
        end;
    end, {
        l_hasFetched_0, 
        l_isFetching_0, 
        v22, 
        v21, 
        v23
    });
    if v15 then
        v2.useEffect(function() --[[ Line: 190 ]]
            -- upvalues: v30 (ref), v28 (copy), l_hasFetched_0 (copy), v29 (ref)
            if v30.current then
                return;
            elseif v28 and not v28.current then
                return;
            elseif not l_hasFetched_0 then
                return;
            else
                if v29 then
                    v29();
                    v30.current = true;
                end;
                return;
            end;
        end, {
            v29, 
            l_hasFetched_0
        });
    end;
end;