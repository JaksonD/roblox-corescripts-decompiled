local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local v1 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v3 = require(script.Parent.Parent.Constants);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v5 = require(l_Parent_0.SharedFlags);
local l_GetFFlagPlatformEventEnabled_0 = v5.GetFFlagPlatformEventEnabled;
local l_GetFStringPlatformEventUrl_0 = v5.GetFStringPlatformEventUrl;
local l_FFlagEnableBlackbird_0 = v5.FFlagEnableBlackbird;
local l_FFlagEnableBlackbirdOnFlyoutMenu_0 = v5.FFlagEnableBlackbirdOnFlyoutMenu;
local l_FFlagEnableBlackbirdCheckDev_0 = v5.FFlagEnableBlackbirdCheckDev;
local v11 = if l_FFlagEnableBlackbirdCheckDev_0 then require(script.Parent.useHasRobloxSubscription) else nil;
local v12 = require(script.Parent.Parent.Config.FlyoutContentSettings);
local function _(v13, v14) --[[ Line: 21 ]] --[[ Name: updateNotifications ]]
    -- upvalues: v12 (copy)
    local v15 = 0;
    if v13.itemType == v12.ItemType.Settings then
        v15 = v14.MorePageSettings;
    elseif v13.itemType == v12.ItemType.Connections then
        v15 = v14.MorePageFriends;
    elseif v13.itemType == v12.ItemType.Messages then
        v15 = v14.MorePageMessages;
    end;
    if v15 > 0 and (not v13.notificationCount or v13.notificationCount ~= v15) then
        v13.notificationCount = v15;
    end;
end;
return function() --[[ Line: 37 ]] --[[ Name: useFlyoutNavigationItems ]]
    -- upvalues: v3 (copy), l_useSelector_0 (copy), v1 (copy), l_useAppPolicy_0 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), v11 (copy), v12 (copy), l_FFlagEnableBlackbird_0 (copy), l_FFlagEnableBlackbirdOnFlyoutMenu_0 (copy), l_GetFFlagPlatformEventEnabled_0 (copy), l_GetFStringPlatformEventUrl_0 (copy)
    local l_FLYOUT_DEFAULT_POLICY_0 = v3.FLYOUT_DEFAULT_POLICY;
    local v19 = l_useSelector_0(function(v18) --[[ Line: 41 ]]
        return v18.NotificationBadgeCounts;
    end);
    local v21 = l_useSelector_0(function(v20) --[[ Line: 45 ]]
        return v20.OmniRecommendations and v20.OmniRecommendations.Home;
    end);
    local v22 = v21 and v21.sorts or {};
    local v27, v28 = v1.useMemo(function() --[[ Line: 49 ]]
        -- upvalues: v22 (copy), v3 (ref)
        local v23 = nil;
        local v24 = nil;
        for _, v26 in pairs(v22) do
            if v26.topicId == v3.SORT_ID_CONTINUE_PLAYING then
                v23 = true;
            elseif v26.topicId == v3.SORT_ID_FAVORITES then
                v24 = true;
            end;
        end;
        return v23, v24;
    end, {
        v22
    });
    local v30 = l_useAppPolicy_0(function(v29) --[[ Line: 61 ]]
        return v29.getDisablePremiumEntrypoint() or false;
    end);
    local v32 = l_useAppPolicy_0(function(v31) --[[ Line: 64 ]]
        return v31.getDisableBlackbirdEntrypoints() or false;
    end);
    local v33 = if l_FFlagEnableBlackbirdCheckDev_0 then v11() else false;
    local v35 = l_useAppPolicy_0(function(v34) --[[ Line: 68 ]]
        return v34.getGiftCardSourceRefOverride();
    end);
    local v37 = l_useAppPolicy_0(function(v36) --[[ Line: 71 ]]
        return v36.getRedeemTileEnabled();
    end);
    local v38 = not v35 or v35 == "";
    return v1.useMemo(function() --[[ Line: 77 ]]
        -- upvalues: l_FLYOUT_DEFAULT_POLICY_0 (copy), v12 (ref), v28 (copy), v27 (copy), v30 (copy), v38 (copy), v37 (copy), l_FFlagEnableBlackbird_0 (ref), l_FFlagEnableBlackbirdOnFlyoutMenu_0 (ref), v32 (copy), l_FFlagEnableBlackbirdCheckDev_0 (ref), v33 (copy), v19 (copy), l_GetFFlagPlatformEventEnabled_0 (ref), l_GetFStringPlatformEventUrl_0 (ref)
        local v39 = {};
        local v40 = {};
        for _, v42 in l_FLYOUT_DEFAULT_POLICY_0.MyLibrary do
            local v43 = v12.ItemInfo[v42];
            if v43 ~= nil and (v42 ~= v12.ItemType.Favorites or v28) and (v42 ~= v12.ItemType.ContinuePlaying or v27) and (v42 ~= v12.ItemType.Premium or not v30) and (v42 ~= v12.ItemType.GiftCards or not v38) and (v42 ~= v12.ItemType.Redeem or v37) and (not l_FFlagEnableBlackbird_0 or not l_FFlagEnableBlackbirdOnFlyoutMenu_0 or v42 ~= v12.ItemType.Premium and (v42 ~= v12.ItemType.Blackbird or not v32) and (v42 ~= v12.ItemType.Blackbird or not l_FFlagEnableBlackbirdCheckDev_0 or v33)) then
                local v44 = table.clone(v43);
                local l_v19_0 = v19;
                local v46 = 0;
                if v44.itemType == v12.ItemType.Settings then
                    v46 = l_v19_0.MorePageSettings;
                elseif v44.itemType == v12.ItemType.Connections then
                    v46 = l_v19_0.MorePageFriends;
                elseif v44.itemType == v12.ItemType.Messages then
                    v46 = l_v19_0.MorePageMessages;
                end;
                if v46 > 0 and (not v44.notificationCount or v44.notificationCount ~= v46) then
                    v44.notificationCount = v46;
                end;
                table.insert(v39, v44);
            end;
        end;
        for _, v48 in l_FLYOUT_DEFAULT_POLICY_0.AdditionalNavigation do
            local v49 = v12.ItemInfo[v48];
            if v49 ~= nil and (v48 ~= v12.ItemType.Events or l_GetFFlagPlatformEventEnabled_0() and l_GetFStringPlatformEventUrl_0() ~= "") then
                table.insert(v40, (table.clone(v49)));
            end;
        end;
        return {
            myLibraryItems = v39, 
            additionalNavigationItems = v40
        };
    end, {
        v28, 
        v27, 
        l_FLYOUT_DEFAULT_POLICY_0, 
        v19, 
        v30, 
        v32, 
        v33, 
        v38
    });
end;