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
local l_FFlagAddGamepadBumperNavigation_0 = require(l_Parent_1.SharedFlags).FFlagAddGamepadBumperNavigation;
local v22 = {
    selectedIndex = 1, 
    isVisible = true, 
    clipsDescendants = true
};
return v2.memo(function(v23) --[[ Line: 60 ]] --[[ Name: AppNavBar ]]
    -- upvalues: v3 (copy), v22 (copy), l_useAppPolicy_0 (copy), l_useRoactService_0 (copy), v7 (copy), v2 (copy), v14 (copy), l_game_EngineFeature_0 (copy), v15 (copy), v13 (copy), v17 (copy), v16 (copy), l_FFlagAppNavObservability_0 (copy), v19 (copy), v12 (copy), l_NavigationBar_0 (copy), l_NavigationBarAlignment_0 (copy), l_NavigationRailV2_0 (copy), l_NavigationRailAlignment_0 (copy), l_FFlagAddGamepadBumperNavigation_0 (copy)
    local v24 = v3.Dictionary.join(v22, v23);
    local l_items_0 = v24.items;
    local v27 = l_useAppPolicy_0(function(v26) --[[ Line: 65 ]]
        return v26.getShowStudioCTA();
    end);
    local v28 = l_useRoactService_0(v7.AppEventIngestService);
    local v29 = l_useRoactService_0(v7.AppLinking);
    local v32 = v2.useCallback(function(_, v31) --[[ Line: 70 ]]
        -- upvalues: v2 (ref), v14 (ref), l_game_EngineFeature_0 (ref), v23 (copy)
        return v2.createElement(v14, {
            controlState = v31, 
            showTooltip = if l_game_EngineFeature_0 then v23.showTooltip else nil
        });
    end, {
        if l_game_EngineFeature_0 then v23.showTooltip else nil
    });
    local v34 = v2.useCallback(function() --[[ Line: 76 ]]
        -- upvalues: v28 (copy), v15 (ref), v24 (copy), v29 (copy)
        v28:setRBXEventStream(v15.STUDIO_CTA_EVENT_CONTEXT, v15.STUDIO_CTA_EVENT_NAME_OPEN);
        local v33 = v24.buildCreatorWebNavUrl({
            utm_content = "side_bar_blue_icon"
        });
        v29:openURL(v33);
    end, {
        v28, 
        v29, 
        v24.buildCreatorWebNavUrl
    });
    if v27 then
        l_items_0 = v3.List.join(l_items_0);
        table.insert(l_items_0, {
            isSecondary = true, 
            renderIcon = v32, 
            onActivated = v34
        });
    end;
    local v35 = nil;
    local v38 = v2.useCallback(function(v36, v37) --[[ Line: 94 ]]
        -- upvalues: v2 (ref), v13 (ref), v24 (copy)
        return v2.createElement(v13, {
            item = v36, 
            isChecked = v37, 
            isCenterPositioned = true, 
            hasLabel = true, 
            systemBarLabelTextSizeBinding = v24.systemBarLabelTextSizeBinding
        });
    end, {
        v24.systemBarLabelTextSizeBinding
    });
    local v41 = v2.useCallback(function(v39, v40) --[[ Line: 104 ]]
        -- upvalues: v2 (ref), v13 (ref), v24 (copy)
        return v2.createElement(v13, {
            item = v39, 
            isChecked = v40, 
            isCenterPositioned = false, 
            hasLabel = true, 
            systemBarLabelTextSizeBinding = v24.systemBarLabelTextSizeBinding
        });
    end, {
        v24.systemBarLabelTextSizeBinding
    });
    local v42 = nil;
    if v17() then
        v42 = v16.getFooterBinding();
        v2.useEffect(function() --[[ Line: 117 ]]
            -- upvalues: v16 (ref), v24 (copy)
            v16.setFooterVisible(v24.isVisible);
        end, {
            v24.isVisible
        });
    end;
    if l_FFlagAppNavObservability_0 then
        v2.useEffect(function() --[[ Line: 124 ]]
            -- upvalues: v24 (copy), v19 (ref)
            local v43 = v24.items[v24.selectedIndex];
            if v43 ~= nil and v43.page ~= nil then
                v19.logSwitchTabEnd(v43.page);
            end;
        end, {
            v24.items, 
            v24.selectedIndex
        });
        v2.useEffect(function() --[[ Line: 130 ]]
            -- upvalues: v19 (ref), v24 (copy)
            v19.logVisibilityEnd(v24.isVisible);
        end, {
            v24.isVisible
        });
        v2.useEffect(function() --[[ Line: 133 ]]
            -- upvalues: v19 (ref), v24 (copy)
            v19.logPlacement(v24.placement);
        end, {
            v24.placement
        });
    end;
    if v24.placement == v12.Bottom then
        return (v2.createElement(l_NavigationBar_0, {
            alignment = l_NavigationBarAlignment_0.EvenlyDistributed, 
            items = l_items_0, 
            isVisible = v24.isVisible, 
            size = v24.size, 
            renderItem = v38, 
            position = v24.position, 
            selection = v24.selectedIndex, 
            clipsDescendants = v24.clipsDescendants, 
            animated = true, 
            visibility = v42, 
            active = true
        }));
    else
        if v24.placement == v12.Left then
            v35 = v2.createElement(l_NavigationRailV2_0, {
                alignment = l_NavigationRailAlignment_0.Justified, 
                items = l_items_0, 
                renderItem = v41, 
                size = v24.size, 
                animated = true, 
                isVisible = v24.isVisible, 
                position = v24.position, 
                selection = v24.selectedIndex, 
                clipsDescendants = v24.clipsDescendants, 
                leadingComponent = if l_FFlagAddGamepadBumperNavigation_0 then v24.leadingComponent else nil, 
                trailingComponent = if l_FFlagAddGamepadBumperNavigation_0 then v24.trailingComponent else nil
            });
        end;
        return v35;
    end;
end);