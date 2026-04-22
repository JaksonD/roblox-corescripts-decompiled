local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useScreenSize_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useScreenSize;
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_GridMetrics_0 = v6.App.Grid.GridMetrics;
local l_DefaultMetricsGridView_0 = v6.App.Grid.DefaultMetricsGridView;
local v9 = require(l_Modules_0.LuaApp.Components.Subscription.SubscriptionTile);
local _ = require(l_Modules_0.LuaApp.Models.SubscriptionApi.SubscriptionProductInfoModel);
local v11 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableDevSubsInRobux);
local l_FFlagEnableDevSubsFastFollowFixes_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableDevSubsFastFollowFixes;
local function v26(v13, v14, v15, v16, v17) --[[ Line: 34 ]] --[[ Name: getTiles ]]
    local v18 = {};
    local v19 = v13.GameSubscriptionProducts[v14];
    if v19 == nil then
        return v18;
    else
        local l_SubscriptionProductsThumbnails_0 = v13.SubscriptionProductsThumbnails;
        local l_SubscriptionStatuses_0 = v13.SubscriptionStatuses;
        for _, v23 in v19 do
            local v24 = "";
            local v25 = false;
            if l_SubscriptionProductsThumbnails_0[tostring(v23.iconImageAssetId)] then
                v24 = l_SubscriptionProductsThumbnails_0[tostring(v23.iconImageAssetId)].url;
            end;
            if v23.subscriptionTargetKey and l_SubscriptionStatuses_0[v23.subscriptionTargetKey] then
                v25 = l_SubscriptionStatuses_0[v23.subscriptionTargetKey].isSubscribed;
            end;
            table.insert(v18, {
                subscriptionProduct = v23, 
                thumbnailString = v24, 
                screenSize = v15, 
                isSubscribed = v25, 
                creatorName = v16, 
                creatorVerified = v17
            });
        end;
        return v18;
    end;
end;
return function(v27) --[[ Line: 65 ]] --[[ Name: SubscriptionsGrid ]]
    -- upvalues: l_useScreenSize_0 (copy), v2 (copy), v26 (copy), l_useSelector_0 (copy), l_useDesignTokens_0 (copy), l_FFlagEnableDevSubsFastFollowFixes_0 (copy), l_DefaultMetricsGridView_0 (copy), v9 (copy), v11 (copy), l_GridMetrics_0 (copy)
    local v28 = l_useScreenSize_0();
    local l_creatorName_0 = v27.creatorName;
    local l_creatorVerified_0 = v27.creatorVerified;
    local v32 = v2.useCallback(function(v31) --[[ Line: 69 ]]
        -- upvalues: v26 (ref), v27 (copy), v28 (copy), l_creatorName_0 (copy), l_creatorVerified_0 (copy)
        return (v26(v31, v27.universeId, v28, l_creatorName_0, l_creatorVerified_0));
    end, {
        v27.universeId, 
        v28, 
        l_creatorName_0, 
        l_creatorVerified_0
    });
    local v33 = l_useSelector_0(v32);
    local v34 = l_useDesignTokens_0();
    local v35 = if l_FFlagEnableDevSubsFastFollowFixes_0 then v34.Global.Space_200 else v34.Global.Space_300;
    return v2.createElement(l_DefaultMetricsGridView_0, {
        renderItem = function(v36) --[[ Line: 79 ]] --[[ Name: renderItem ]]
            -- upvalues: v2 (ref), v9 (ref)
            return v2.createElement(v9, v36);
        end, 
        getItemHeight = function() --[[ Line: 82 ]] --[[ Name: getItemHeight ]]
            -- upvalues: v11 (ref)
            if v11() then
                return 136;
            else
                return 224;
            end;
        end, 
        getItemMetrics = l_GridMetrics_0.getLargeMetrics, 
        itemPadding = Vector2.new(v35, v35), 
        items = v33, 
        LayoutOrder = v27.layoutOrder
    });
end;