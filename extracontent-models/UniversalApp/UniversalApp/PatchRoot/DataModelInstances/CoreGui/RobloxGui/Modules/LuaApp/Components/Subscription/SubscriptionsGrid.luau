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
local function v25(v12, v13, v14, v15, v16) --[[ Line: 32 ]] --[[ Name: getTiles ]]
    local v17 = {};
    local v18 = v12.GameSubscriptionProducts[v13];
    if v18 == nil then
        return v17;
    else
        local l_SubscriptionProductsThumbnails_0 = v12.SubscriptionProductsThumbnails;
        local l_SubscriptionStatuses_0 = v12.SubscriptionStatuses;
        for _, v22 in v18 do
            local v23 = "";
            local v24 = false;
            if l_SubscriptionProductsThumbnails_0[tostring(v22.iconImageAssetId)] then
                v23 = l_SubscriptionProductsThumbnails_0[tostring(v22.iconImageAssetId)].url;
            end;
            if v22.subscriptionTargetKey and l_SubscriptionStatuses_0[v22.subscriptionTargetKey] then
                v24 = l_SubscriptionStatuses_0[v22.subscriptionTargetKey].isSubscribed;
            end;
            table.insert(v17, {
                subscriptionProduct = v22, 
                thumbnailString = v23, 
                screenSize = v14, 
                isSubscribed = v24, 
                creatorName = v15, 
                creatorVerified = v16
            });
        end;
        return v17;
    end;
end;
return function(v26) --[[ Line: 63 ]] --[[ Name: SubscriptionsGrid ]]
    -- upvalues: l_useScreenSize_0 (copy), v2 (copy), v25 (copy), l_useSelector_0 (copy), l_useDesignTokens_0 (copy), l_DefaultMetricsGridView_0 (copy), v9 (copy), v11 (copy), l_GridMetrics_0 (copy)
    local v27 = l_useScreenSize_0();
    local l_creatorName_0 = v26.creatorName;
    local l_creatorVerified_0 = v26.creatorVerified;
    local v31 = v2.useCallback(function(v30) --[[ Line: 67 ]]
        -- upvalues: v25 (ref), v26 (copy), v27 (copy), l_creatorName_0 (copy), l_creatorVerified_0 (copy)
        return (v25(v30, v26.universeId, v27, l_creatorName_0, l_creatorVerified_0));
    end, {
        v26.universeId, 
        v27, 
        l_creatorName_0, 
        l_creatorVerified_0
    });
    local v32 = l_useSelector_0(v31);
    local l_Space_300_0 = l_useDesignTokens_0().Global.Space_300;
    return v2.createElement(l_DefaultMetricsGridView_0, {
        renderItem = function(v34) --[[ Line: 75 ]] --[[ Name: renderItem ]]
            -- upvalues: v2 (ref), v9 (ref)
            return v2.createElement(v9, v34);
        end, 
        getItemHeight = function() --[[ Line: 78 ]] --[[ Name: getItemHeight ]]
            -- upvalues: v11 (ref)
            if v11() then
                return 136;
            else
                return 224;
            end;
        end, 
        getItemMetrics = l_GridMetrics_0.getLargeMetrics, 
        itemPadding = Vector2.new(l_Space_300_0, l_Space_300_0), 
        items = v32, 
        LayoutOrder = v26.layoutOrder
    });
end;