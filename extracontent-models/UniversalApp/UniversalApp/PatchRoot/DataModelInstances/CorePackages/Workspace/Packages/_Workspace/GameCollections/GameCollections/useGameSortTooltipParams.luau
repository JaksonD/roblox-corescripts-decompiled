local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v1 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local v5 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v5.usePreferredInput;
local l_GameTopicIds_0 = require(l_Parent_0.DiscoveryTypes).GameTopicIds;
local l_OpenInfoPeekView_0 = require(l_Parent_0.DiscoveryRouting).OpenInfoPeekView;
local l_OpenCloseOnlyInteractiveAlert_0 = require(l_Parent_0.DiscoveryRouting).OpenCloseOnlyInteractiveAlert;
local function _(v10, v11) --[[ Line: 15 ]] --[[ Name: isSponsoredSort ]]
    -- upvalues: l_GameTopicIds_0 (copy)
    if v11 then
        if v10 and v10.topicId == l_GameTopicIds_0.Sponsored then
            return true;
        end;
    elseif v10 and v10.gameSetTypeId == "27" then
        return true;
    end;
    return false;
end;
return function(v13, v14, v15) --[[ Line: 31 ]] --[[ Name: useGameSortTooltipParams ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_usePreferredInput_0 (copy), l_GameTopicIds_0 (copy), v1 (copy), v5 (copy), l_OpenInfoPeekView_0 (copy), l_OpenCloseOnlyInteractiveAlert_0 (copy), l_CloseCentralOverlay_0 (copy)
    local v16 = l_useDispatch_0();
    local v17 = l_useLocalization_0({
        SponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic", 
        SponsoredTitle = "CoreScripts.Ads.Label.SponsoredAds"
    });
    local v18 = l_usePreferredInput_0();
    local l_SponsoredDisclosure_0 = v17.SponsoredDisclosure;
    local l_SponsoredTitle_0 = v17.SponsoredTitle;
    local v21 = if v14 then if v13 then v13.topicId == l_GameTopicIds_0.Sponsored else false else if v13 then v13.gameSetTypeId == "27" else false;
    local v22 = if v21 and v15 == nil then l_SponsoredDisclosure_0 else v15;
    local v23 = if v21 then l_SponsoredTitle_0 else v13 and v13.displayName or "";
    return v1.useCallback(function() --[[ Line: 44 ]]
        -- upvalues: v18 (copy), v5 (ref), v16 (copy), l_OpenInfoPeekView_0 (ref), v23 (copy), v22 (copy), l_OpenCloseOnlyInteractiveAlert_0 (ref), l_CloseCentralOverlay_0 (ref)
        if v18 == v5.Input.Touch then
            v16(l_OpenInfoPeekView_0(v23, v22));
            return;
        else
            v16(l_OpenCloseOnlyInteractiveAlert_0(v23, v22, function() --[[ Line: 48 ]]
                -- upvalues: v16 (ref), l_CloseCentralOverlay_0 (ref)
                return v16(l_CloseCentralOverlay_0());
            end));
            return;
        end;
    end, {
        v23, 
        v22, 
        v18
    }), v22;
end;