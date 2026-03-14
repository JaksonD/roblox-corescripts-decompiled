local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v3 = require(l_Parent_0.Localization);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v5 = require(l_Parent_0.React);
local v6 = require(l_script_FirstAncestor_0.Analytics.useSocialCarouselAnalytics);
local v7 = require(l_script_FirstAncestor_0.Contexts.useSocialCarouselContext);
local v8 = require(l_script_FirstAncestor_0.BaseComponents.Tile);
local l_useLocalization_0 = v3.Hooks.useLocalization;
local v10 = require(l_script_FirstAncestor_0.Common.Constants);
return function(v11) --[[ Line: 29 ]] --[[ Name: StartSquadTile ]]
    -- upvalues: l_useNavigation_0 (copy), v6 (copy), v7 (copy), l_useLocalization_0 (copy), v10 (copy), v5 (copy), l_AppPage_0 (copy), v8 (copy)
    local v12 = l_useNavigation_0();
    local v13 = v6();
    local v14 = v7();
    local v15 = l_useLocalization_0({
        startPartyText = v10.LOCALIZATION.START_SQUAD_TEXT
    });
    local v16 = v5.useCallback(function() --[[ Line: 38 ]]
        -- upvalues: v11 (copy), v12 (copy), l_AppPage_0 (ref), v13 (copy)
        if v11.item and v11.item.onActivated then
            v11.item.onActivated();
        else
            v12.navigate(l_AppPage_0.Chat);
        end;
        v13.startSquadPressed(v11.index);
    end, {
        v12, 
        v11.item, 
        v11.index, 
        v13.startSquadPressed
    });
    v5.useEffect(function() --[[ Line: 55 ]]
        -- upvalues: v14 (copy), v10 (ref)
        v14.onSuccessfulRender(v10.ANALYTICS.UI_LOADING_EVENTS.START_SQUAD);
    end, {});
    return v5.createElement(v8, {
        index = v11.index, 
        itemSize = v11.itemSize, 
        onActivated = v16, 
        title = v15.startPartyText, 
        icon = "icons/actions/friends/friendsplaying", 
        selectionOrder = v11.selectionOrder
    });
end;