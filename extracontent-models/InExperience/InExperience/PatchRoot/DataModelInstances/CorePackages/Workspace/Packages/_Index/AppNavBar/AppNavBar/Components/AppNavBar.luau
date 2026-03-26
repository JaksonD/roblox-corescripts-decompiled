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
local l_FFlagAppNavObservability_0 = require(l_Parent_1.SharedFlags).FFlagAppNavObservability;
local v19 = if l_FFlagAppNavObservability_0 then require(l_Parent_0.Telemetry.AppNavTelemetry) else nil;
local l_game_EngineFeature_0 = game:GetEngineFeature("WebViewRedesignEnabled");
local v21 = {
    selectedIndex = 1, 
    isVisible = true, 
    clipsDescendants = true
};
return v2.memo(function(v22) --[[ Line: 57 ]] --[[ Name: AppNavBar ]]
    -- upvalues: v3 (copy), v21 (copy), l_useAppPolicy_0 (copy), l_useRoactService_0 (copy), v7 (copy), v2 (copy), v14 (copy), l_game_EngineFeature_0 (copy), v15 (copy), v13 (copy), v17 (copy), v16 (copy), l_FFlagAppNavObservability_0 (copy), v19 (copy), v12 (copy), l_NavigationBar_0 (copy), l_NavigationBarAlignment_0 (copy), l_NavigationRailV2_0 (copy), l_NavigationRailAlignment_0 (copy)
    local v23 = v3.Dictionary.join(v21, v22);
    local l_items_0 = v23.items;
    local v26 = l_useAppPolicy_0(function(v25) --[[ Line: 62 ]]
        return v25.getShowStudioCTA();
    end);
    local v27 = l_useRoactService_0(v7.AppEventIngestService);
    local v28 = l_useRoactService_0(v7.AppLinking);
    local v31 = v2.useCallback(function(_, v30) --[[ Line: 67 ]]
        -- upvalues: v2 (ref), v14 (ref), l_game_EngineFeature_0 (ref), v22 (copy)
        return v2.createElement(v14, {
            controlState = v30, 
            showTooltip = if l_game_EngineFeature_0 then v22.showTooltip else nil
        });
    end, {
        if l_game_EngineFeature_0 then v22.showTooltip else nil
    });
    local v33 = v2.useCallback(function() --[[ Line: 73 ]]
        -- upvalues: v27 (copy), v15 (ref), v23 (copy), v28 (copy)
        v27:setRBXEventStream(v15.STUDIO_CTA_EVENT_CONTEXT, v15.STUDIO_CTA_EVENT_NAME_OPEN);
        local v32 = v23.buildCreatorWebNavUrl({
            utm_content = "side_bar_blue_icon"
        });
        v28:openURL(v32);
    end, {
        v27, 
        v28, 
        v23.buildCreatorWebNavUrl
    });
    if v26 then
        l_items_0 = v3.List.join(l_items_0);
        table.insert(l_items_0, {
            isSecondary = true, 
            renderIcon = v31, 
            onActivated = v33
        });
    end;
    local v34 = nil;
    local v37 = v2.useCallback(function(v35, v36) --[[ Line: 91 ]]
        -- upvalues: v2 (ref), v13 (ref), v23 (copy)
        return v2.createElement(v13, {
            item = v35, 
            isChecked = v36, 
            isCenterPositioned = true, 
            hasLabel = true, 
            systemBarLabelTextSizeBinding = v23.systemBarLabelTextSizeBinding
        });
    end, {
        v23.systemBarLabelTextSizeBinding
    });
    local v40 = v2.useCallback(function(v38, v39) --[[ Line: 101 ]]
        -- upvalues: v2 (ref), v13 (ref), v23 (copy)
        return v2.createElement(v13, {
            item = v38, 
            isChecked = v39, 
            isCenterPositioned = false, 
            hasLabel = true, 
            systemBarLabelTextSizeBinding = v23.systemBarLabelTextSizeBinding
        });
    end, {
        v23.systemBarLabelTextSizeBinding
    });
    local v41 = nil;
    if v17() then
        v41 = v16.getFooterBinding();
        v2.useEffect(function() --[[ Line: 114 ]]
            -- upvalues: v16 (ref), v23 (copy)
            v16.setFooterVisible(v23.isVisible);
        end, {
            v23.isVisible
        });
    end;
    if l_FFlagAppNavObservability_0 then
        v2.useEffect(function() --[[ Line: 121 ]]
            -- upvalues: v23 (copy), v19 (ref)
            local v42 = v23.items[v23.selectedIndex];
            if v42 ~= nil and v42.page ~= nil then
                v19.logSwitchTabEnd(v42.page);
            end;
        end, {
            v23.items, 
            v23.selectedIndex
        });
        v2.useEffect(function() --[[ Line: 127 ]]
            -- upvalues: v19 (ref), v23 (copy)
            v19.logVisibilityEnd(v23.isVisible);
        end, {
            v23.isVisible
        });
        v2.useEffect(function() --[[ Line: 130 ]]
            -- upvalues: v19 (ref), v23 (copy)
            v19.logPlacement(v23.placement);
        end, {
            v23.placement
        });
    end;
    if v23.placement == v12.Bottom then
        return (v2.createElement(l_NavigationBar_0, {
            alignment = l_NavigationBarAlignment_0.EvenlyDistributed, 
            items = l_items_0, 
            isVisible = v23.isVisible, 
            size = v23.size, 
            renderItem = v37, 
            position = v23.position, 
            selection = v23.selectedIndex, 
            clipsDescendants = v23.clipsDescendants, 
            animated = true, 
            visibility = v41, 
            active = true
        }));
    else
        if v23.placement == v12.Left then
            v34 = v2.createElement(l_NavigationRailV2_0, {
                alignment = l_NavigationRailAlignment_0.Justified, 
                items = l_items_0, 
                renderItem = v40, 
                size = v23.size, 
                animated = true, 
                isVisible = v23.isVisible, 
                position = v23.position, 
                selection = v23.selectedIndex, 
                clipsDescendants = v23.clipsDescendants
            });
        end;
        return v34;
    end;
end);