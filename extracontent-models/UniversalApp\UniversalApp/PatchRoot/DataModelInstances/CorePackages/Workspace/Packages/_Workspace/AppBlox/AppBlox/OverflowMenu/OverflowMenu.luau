local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppBlox");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.BuilderIcons);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.FocusNavigationUtils);
local v5 = require(l_Parent_0.Foundation);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.SharedFlags);
local l_ThreeDotsHorizontal_0 = v2.Icon.ThreeDotsHorizontal;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v4.FocusNavigableSurfaceIdentifierEnum;
local l_useFocusNavigableSurfaceRegistryConnection_0 = v4.useFocusNavigableSurfaceRegistryConnection;
local l_ButtonVariant_0 = v5.Enums.ButtonVariant;
local l_IconButton_0 = v5.IconButton;
local l_IconSize_0 = v5.Enums.IconSize;
local l_InputSize_0 = v5.Enums.InputSize;
local l_PopoverAlign_0 = v5.Enums.PopoverAlign;
local l_PopoverSide_0 = v5.Enums.PopoverSide;
local l_Menu_0 = v5.Menu;
local l_View_0 = v5.View;
local v19 = require(l_script_FirstAncestor_0.OverflowMenu.getOverflowMenuSignalStore);
local v20 = require(l_script_FirstAncestor_0.OverflowMenu.useOverflowMenuOpen);
local l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 = v7.FFlagLuaAppGameTileOverflowMenuTelemetry;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = v7.FFlagLuaAppSduiBadgeDetailsComponents;
local v23 = game:DefineFastFlag("OverflowMenuRemoveCloseMenuChecks", false);
return v6.memo(function(v24) --[[ Line: 58 ]] --[[ Name: OverflowMenu ]]
    -- upvalues: v6 (copy), v23 (copy), v19 (copy), v20 (copy), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (copy), v3 (copy), l_useFocusNavigableSurfaceRegistryConnection_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_View_0 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), l_IconButton_0 (copy), l_ThreeDotsHorizontal_0 (copy), l_IconSize_0 (copy), l_ButtonVariant_0 (copy), l_Menu_0 (copy), l_PopoverAlign_0 (copy), l_PopoverSide_0 (copy), l_InputSize_0 (copy)
    local l_menuKey_0 = v24.menuKey;
    local v26 = v6.useRef(nil);
    local v27 = if v23 then nil else v6.useRef(nil);
    local v28 = v19();
    local v29 = v20(l_menuKey_0);
    local v31 = v6.useCallback(function() --[[ Line: 68 ]]
        -- upvalues: l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (ref), v29 (copy), v28 (copy), l_menuKey_0 (copy), v24 (copy)
        local v30 = if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then v29 else nil;
        v28.toggleMenu(l_menuKey_0);
        if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 and v24.onMenuOpenChanged then
            v24.onMenuOpenChanged(v30);
        end;
    end, {
        l_menuKey_0, 
        v28, 
        if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then v29 else nil, 
        if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then v24.onMenuOpenChanged else nil
    });
    local v32 = v6.useCallback(function() --[[ Line: 84 ]]
        -- upvalues: v23 (ref), v27 (copy), v24 (copy), v28 (copy), l_menuKey_0 (copy), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (ref)
        if v23 or v27.current == Enum.GuiState.Idle or not v24.hasOverflowButton or not v24.shouldShowAnchor then
            v28.closeMenu(l_menuKey_0);
            if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 and v24.onMenuOpenChanged then
                v24.onMenuOpenChanged(true);
            end;
        end;
    end, {
        if not v23 then v24.hasOverflowButton else nil, 
        if not v23 then v24.shouldShowAnchor else nil, 
        l_menuKey_0, 
        v28, 
        if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then v24.onMenuOpenChanged else nil
    });
    local v34 = v6.useMemo(function() --[[ Line: 110 ]]
        -- upvalues: v3 (ref), v24 (copy), v28 (copy), l_menuKey_0 (copy), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (ref)
        return v3.List.map(v24.menuItems, function(v33) --[[ Line: 111 ]]
            -- upvalues: v28 (ref), l_menuKey_0 (ref), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (ref), v24 (ref)
            return {
                icon = v33.icon, 
                id = v33.id, 
                text = v33.text, 
                onActivated = function() --[[ Line: 116 ]] --[[ Name: onActivated ]]
                    -- upvalues: v33 (copy), v28 (ref), l_menuKey_0 (ref), l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 (ref), v24 (ref)
                    task.spawn(function() --[[ Line: 117 ]]
                        -- upvalues: v33 (ref)
                        v33.onActivated();
                    end);
                    v28.closeMenu(l_menuKey_0);
                    if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 and v24.onMenuOpenChanged then
                        v24.onMenuOpenChanged(true);
                    end;
                end
            };
        end);
    end, {
        v24.menuItems, 
        l_menuKey_0, 
        v28, 
        if l_FFlagLuaAppGameTileOverflowMenuTelemetry_0 then v24.onMenuOpenChanged else nil
    });
    local v35 = v6.useRef(l_menuKey_0);
    v6.useEffect(function() --[[ Line: 138 ]]
        -- upvalues: v35 (copy), l_menuKey_0 (copy), v28 (copy)
        if v35.current ~= l_menuKey_0 and v28 then
            v35.current = l_menuKey_0;
            v28.closeMenu(l_menuKey_0);
        end;
    end, {
        l_menuKey_0, 
        v28
    });
    local v36 = nil;
    if not v23 then
        v36 = v6.useCallback(function() --[[ Line: 147 ]]
            -- upvalues: v26 (copy), v27 (copy)
            if v26.current then
                v27.current = v26.current.GuiState;
            end;
        end, {});
    end;
    local v37, v38 = v6.useState(nil);
    local v40 = v6.useCallback(function(v39) --[[ Line: 155 ]]
        -- upvalues: v38 (copy), v24 (copy)
        v38(v39);
        if v24.setFocusRef then
            v24.setFocusRef(v39);
        end;
    end, {
        v24.setFocusRef
    });
    l_useFocusNavigableSurfaceRegistryConnection_0(v37, l_FocusNavigableSurfaceIdentifierEnum_0.ContextualMenu, true);
    if v24.shouldShowAnchor or v29 then
        return (v6.createElement(v6.Fragment, nil, {
            MenuAnchor = if v24.hasOverflowButton and (v24.shouldShowAnchor or v29) then v6.createElement(l_View_0, {
                AnchorPoint = v24.anchorPoint, 
                Position = v24.anchorPosition, 
                onStateChanged = if v23 then nil else v36, 
                tag = l_FFlagLuaAppSduiBadgeDetailsComponents_0 and "auto-xy radius-circle" or "auto-xy bg-over-media-0 radius-circle", 
                backgroundStyle = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v24.buttonIconBackgroundStyle else nil, 
                ref = v26
            }, {
                IconButton = v6.createElement(l_IconButton_0, {
                    icon = v24.buttonIcon or l_ThreeDotsHorizontal_0, 
                    isCircular = true, 
                    onActivated = v31, 
                    size = v24.buttonIconSize or l_IconSize_0.Medium, 
                    variant = v24.buttonVariant or l_ButtonVariant_0.Utility
                })
            }) else v6.createElement("Frame", {
                AnchorPoint = v24.anchorPoint, 
                BackgroundTransparency = 1, 
                Position = v24.anchorPosition, 
                Size = UDim2.fromScale(0, 0), 
                ref = v26
            }), 
            OverflowMenu = if v29 then v6.createElement(l_Menu_0, {
                align = v24.popoverAlign or l_PopoverAlign_0.End, 
                isOpen = true, 
                items = v34, 
                onPressedOutside = v32, 
                side = v24.popoverSide or l_PopoverSide_0.Bottom, 
                size = v24.menuItemSize or l_InputSize_0.Medium, 
                width = v24.menuWidth, 
                anchorRef = v26, 
                ref = v40
            }) else nil
        }));
    else
        return nil;
    end;
end);