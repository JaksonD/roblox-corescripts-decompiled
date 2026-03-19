local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Cryo);
local v4 = require(l_Parent_1.UIBlox);
local l_useAppPolicy_0 = require(l_Parent_1.UniversalAppPolicy).useAppPolicy;
local l_useRoactService_0 = require(l_Parent_1.RobloxAppHooks).useRoactService;
local v7 = require(l_Parent_1.RoactServiceTags);
local l_NavigationBar_0 = v4.App.Navigation.NavigationBar;
local l_NavigationRailV2_0 = v4.App.Navigation.NavigationRailV2;
local l_NavigationBarAlignment_0 = v4.App.Navigation.Enum.NavigationBarAlignment;
local l_NavigationRailAlignment_0 = v4.App.Navigation.Enum.NavigationRailAlignment;
local v12 = require(l_Parent_0.Enum.Placement);
local v13 = require(l_Parent_0.Components.AppNavItem);
local v14 = require(l_Parent_0.Components.StudioCTAIcon);
local v15 = require(l_Parent_0.Constants);
local v16 = require(l_Parent_0.VisibilityControl);
local v17 = require(l_Parent_0.getScrollAwayEnabled);
local l_game_EngineFeature_0 = game:GetEngineFeature("WebViewRedesignEnabled");
local v19 = {
    selectedIndex = 1, 
    isVisible = true, 
    clipsDescendants = true
};
return v2.memo(function(v20) --[[ Line: 52 ]] --[[ Name: AppNavBar ]]
    -- upvalues: v3 (copy), v19 (copy), l_useAppPolicy_0 (copy), l_useRoactService_0 (copy), v7 (copy), v2 (copy), v14 (copy), l_game_EngineFeature_0 (copy), v15 (copy), v13 (copy), v17 (copy), v16 (copy), v12 (copy), l_NavigationBar_0 (copy), l_NavigationBarAlignment_0 (copy), l_NavigationRailV2_0 (copy), l_NavigationRailAlignment_0 (copy)
    local v21 = v3.Dictionary.join(v19, v20);
    local l_items_0 = v21.items;
    local v24 = l_useAppPolicy_0(function(v23) --[[ Line: 57 ]]
        return v23.getShowStudioCTA();
    end);
    local v25 = l_useRoactService_0(v7.AppEventIngestService);
    local v26 = l_useRoactService_0(v7.AppLinking);
    local v29 = v2.useCallback(function(_, v28) --[[ Line: 62 ]]
        -- upvalues: v2 (ref), v14 (ref), l_game_EngineFeature_0 (ref), v20 (copy)
        return v2.createElement(v14, {
            controlState = v28, 
            showTooltip = if l_game_EngineFeature_0 then v20.showTooltip else nil
        });
    end, {
        if l_game_EngineFeature_0 then v20.showTooltip else nil
    });
    local v31 = v2.useCallback(function() --[[ Line: 68 ]]
        -- upvalues: v25 (copy), v15 (ref), v21 (copy), v26 (copy)
        v25:setRBXEventStream(v15.STUDIO_CTA_EVENT_CONTEXT, v15.STUDIO_CTA_EVENT_NAME_OPEN);
        local v30 = v21.buildCreatorWebNavUrl({
            utm_content = "side_bar_blue_icon"
        });
        v26:openURL(v30);
    end, {
        v25, 
        v26, 
        v21.buildCreatorWebNavUrl
    });
    if v24 then
        l_items_0 = v3.List.join(l_items_0);
        table.insert(l_items_0, {
            isSecondary = true, 
            renderIcon = v29, 
            onActivated = v31
        });
    end;
    local v32 = nil;
    local v35 = v2.useCallback(function(v33, v34) --[[ Line: 86 ]]
        -- upvalues: v2 (ref), v13 (ref), v21 (copy)
        return v2.createElement(v13, {
            item = v33, 
            isChecked = v34, 
            isCenterPositioned = true, 
            hasLabel = true, 
            systemBarLabelTextSizeBinding = v21.systemBarLabelTextSizeBinding
        });
    end, {
        v21.systemBarLabelTextSizeBinding
    });
    local v38 = v2.useCallback(function(v36, v37) --[[ Line: 96 ]]
        -- upvalues: v2 (ref), v13 (ref), v21 (copy)
        return v2.createElement(v13, {
            item = v36, 
            isChecked = v37, 
            isCenterPositioned = false, 
            hasLabel = true, 
            systemBarLabelTextSizeBinding = v21.systemBarLabelTextSizeBinding
        });
    end, {
        v21.systemBarLabelTextSizeBinding
    });
    local v39 = nil;
    if v17() then
        v39 = v16.getFooterBinding();
        v2.useEffect(function() --[[ Line: 109 ]]
            -- upvalues: v16 (ref), v21 (copy)
            v16.setFooterVisible(v21.isVisible);
        end, {
            v21.isVisible
        });
    end;
    if v21.placement == v12.Bottom then
        return (v2.createElement(l_NavigationBar_0, {
            alignment = l_NavigationBarAlignment_0.EvenlyDistributed, 
            items = l_items_0, 
            isVisible = v21.isVisible, 
            size = v21.size, 
            renderItem = v35, 
            position = v21.position, 
            selection = v21.selectedIndex, 
            clipsDescendants = v21.clipsDescendants, 
            animated = true, 
            visibility = v39, 
            active = true
        }));
    else
        if v21.placement == v12.Left then
            v32 = v2.createElement(l_NavigationRailV2_0, {
                alignment = l_NavigationRailAlignment_0.Justified, 
                items = l_items_0, 
                renderItem = v38, 
                size = v21.size, 
                animated = true, 
                isVisible = v21.isVisible, 
                position = v21.position, 
                selection = v21.selectedIndex, 
                clipsDescendants = v21.clipsDescendants
            });
        end;
        return v32;
    end;
end);