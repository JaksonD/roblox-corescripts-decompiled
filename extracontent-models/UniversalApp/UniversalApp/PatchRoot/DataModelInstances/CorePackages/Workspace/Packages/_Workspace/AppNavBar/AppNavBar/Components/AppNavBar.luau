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
local v19 = game:DefineFastFlag("AppNavSinkInput2", false);
local v20 = {
    selectedIndex = 1, 
    isVisible = true, 
    clipsDescendants = true
};
return v2.memo(function(v21) --[[ Line: 53 ]] --[[ Name: AppNavBar ]]
    -- upvalues: v3 (copy), v20 (copy), l_useAppPolicy_0 (copy), l_useRoactService_0 (copy), v7 (copy), v2 (copy), v14 (copy), l_game_EngineFeature_0 (copy), v15 (copy), v13 (copy), v17 (copy), v16 (copy), v12 (copy), l_NavigationBar_0 (copy), l_NavigationBarAlignment_0 (copy), v19 (copy), l_NavigationRailV2_0 (copy), l_NavigationRailAlignment_0 (copy)
    local v22 = v3.Dictionary.join(v20, v21);
    local l_items_0 = v22.items;
    local v25 = l_useAppPolicy_0(function(v24) --[[ Line: 58 ]]
        return v24.getShowStudioCTA();
    end);
    local v26 = l_useRoactService_0(v7.AppEventIngestService);
    local v27 = l_useRoactService_0(v7.AppLinking);
    local v30 = v2.useCallback(function(_, v29) --[[ Line: 63 ]]
        -- upvalues: v2 (ref), v14 (ref), l_game_EngineFeature_0 (ref), v21 (copy)
        return v2.createElement(v14, {
            controlState = v29, 
            showTooltip = if l_game_EngineFeature_0 then v21.showTooltip else nil
        });
    end, {
        if l_game_EngineFeature_0 then v21.showTooltip else nil
    });
    local v32 = v2.useCallback(function() --[[ Line: 69 ]]
        -- upvalues: v26 (copy), v15 (ref), v22 (copy), v27 (copy)
        v26:setRBXEventStream(v15.STUDIO_CTA_EVENT_CONTEXT, v15.STUDIO_CTA_EVENT_NAME_OPEN);
        local v31 = v22.buildCreatorWebNavUrl({
            utm_content = "side_bar_blue_icon"
        });
        v27:openURL(v31);
    end, {
        v26, 
        v27, 
        v22.buildCreatorWebNavUrl
    });
    if v25 then
        l_items_0 = v3.List.join(l_items_0);
        table.insert(l_items_0, {
            isSecondary = true, 
            renderIcon = v30, 
            onActivated = v32
        });
    end;
    local v33 = nil;
    local v36 = v2.useCallback(function(v34, v35) --[[ Line: 87 ]]
        -- upvalues: v2 (ref), v13 (ref), v22 (copy)
        return v2.createElement(v13, {
            item = v34, 
            isChecked = v35, 
            isCenterPositioned = true, 
            hasLabel = true, 
            systemBarLabelTextSizeBinding = v22.systemBarLabelTextSizeBinding
        });
    end, {
        v22.systemBarLabelTextSizeBinding
    });
    local v39 = v2.useCallback(function(v37, v38) --[[ Line: 97 ]]
        -- upvalues: v2 (ref), v13 (ref), v22 (copy)
        return v2.createElement(v13, {
            item = v37, 
            isChecked = v38, 
            isCenterPositioned = false, 
            hasLabel = true, 
            systemBarLabelTextSizeBinding = v22.systemBarLabelTextSizeBinding
        });
    end, {
        v22.systemBarLabelTextSizeBinding
    });
    local v40 = nil;
    if v17() then
        v40 = v16.getFooterBinding();
        v2.useEffect(function() --[[ Line: 110 ]]
            -- upvalues: v16 (ref), v22 (copy)
            v16.setFooterVisible(v22.isVisible);
        end, {
            v22.isVisible
        });
    end;
    if v22.placement == v12.Bottom then
        return (v2.createElement(l_NavigationBar_0, {
            alignment = l_NavigationBarAlignment_0.EvenlyDistributed, 
            items = l_items_0, 
            isVisible = v22.isVisible, 
            size = v22.size, 
            renderItem = v36, 
            position = v22.position, 
            selection = v22.selectedIndex, 
            clipsDescendants = v22.clipsDescendants, 
            animated = true, 
            visibility = v40, 
            active = v19 and true or nil
        }));
    else
        if v22.placement == v12.Left then
            v33 = v2.createElement(l_NavigationRailV2_0, {
                alignment = l_NavigationRailAlignment_0.Justified, 
                items = l_items_0, 
                renderItem = v39, 
                size = v22.size, 
                animated = true, 
                isVisible = v22.isVisible, 
                position = v22.position, 
                selection = v22.selectedIndex, 
                clipsDescendants = v22.clipsDescendants
            });
        end;
        return v33;
    end;
end);