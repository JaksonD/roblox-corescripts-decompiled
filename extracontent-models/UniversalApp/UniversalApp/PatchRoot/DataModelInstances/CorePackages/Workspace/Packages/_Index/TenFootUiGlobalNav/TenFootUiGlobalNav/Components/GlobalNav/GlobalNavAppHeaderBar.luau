local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiGlobalNav");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.Style);
local l_AppHeaderBar_0 = require(l_Parent_0.AppHeaderBar).AppHeaderBar;
local l_NavigationBar_0 = v4.App.Navigation.NavigationBar;
local l_NavigationTab_0 = v4.App.Navigation.NavigationTab;
local l_NavigationBarAlignment_0 = v4.App.Navigation.Enum.NavigationBarAlignment;
local l_NavigationTabLayout_0 = v4.App.Navigation.Enum.NavigationTabLayout;
local l_Placement_0 = v4.App.Navigation.Enum.Placement;
local l_UtilityActionIcon_0 = v4.App.Button.UtilityActionIcon;
local l_useDesignTokens_0 = v5.useDesignTokens;
local v14 = game:DefineFastFlag("LuaAppFix10ftGlobalNavAppHeaderBarSelection", false);
local _ = require(l_script_FirstAncestor_0.Components.GlobalNav.GlobalNav);
return (v3.forwardRef(function(v16, _) --[[ Line: 21 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v3 (copy), l_NavigationTab_0 (copy), l_Placement_0 (copy), l_NavigationTabLayout_0 (copy), l_NavigationBar_0 (copy), l_NavigationBarAlignment_0 (copy), v14 (copy), v2 (copy), l_UtilityActionIcon_0 (copy), l_AppHeaderBar_0 (copy)
    local l_tabGroupProps_0 = v16.tabGroupProps;
    local l_optionGroupProps_0 = v16.optionGroupProps;
    local v21 = l_useDesignTokens_0(function(v20) --[[ Line: 24 ]]
        return {
            safeAreaMargin = v20.Global.Space_800, 
            tabGroupHeight = v20.Global.Size_600, 
            tabLabelFontStyle = v20.Semantic.Typography.Header, 
            defaultSpacing = v20.Global.Size_400
        };
    end);
    local v22 = if l_tabGroupProps_0 and l_tabGroupProps_0.selection then l_tabGroupProps_0.selection[1] else nil;
    local v26 = v3.useCallback(function(v23, v24) --[[ Line: 37 ]]
        -- upvalues: v3 (ref), l_NavigationTab_0 (ref), l_Placement_0 (ref), v21 (copy), l_NavigationTabLayout_0 (ref)
        return v3.createElement(l_NavigationTab_0, {
            iconImage = v23.icon, 
            renderIcon = v23.iconComponent ~= nil and function(v25) --[[ Line: 41 ]]
                -- upvalues: v3 (ref), v23 (copy), l_Placement_0 (ref)
                return v3.createElement(v23.iconComponent, {
                    placement = l_Placement_0.Bottom, 
                    selected = v25, 
                    pressed = false, 
                    hovered = false
                });
            end or nil, 
            labelText = v23.title, 
            labelTypography = v21.tabLabelFontStyle, 
            hasLabel = true, 
            isChecked = v24, 
            layout = l_NavigationTabLayout_0.Inline, 
            onActivated = v23.onActivated
        });
    end, {
        v21
    });
    local v27 = v3.useCallback(function() --[[ Line: 60 ]]
        -- upvalues: v3 (ref), l_tabGroupProps_0 (copy), l_NavigationBar_0 (ref), l_NavigationBarAlignment_0 (ref), v21 (copy), v14 (ref), v22 (copy), v26 (copy)
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, {
            TabGroup = if l_tabGroupProps_0 then v3.createElement(l_NavigationBar_0, {
                alignment = l_NavigationBarAlignment_0.Left, 
                size = UDim2.new(0, 0, 0, v21.tabGroupHeight), 
                automaticSize = Enum.AutomaticSize.X, 
                selection = if v14 then v22 else l_tabGroupProps_0.selection, 
                items = l_tabGroupProps_0.items, 
                renderItem = v26, 
                spacing = UDim.new(0, v21.defaultSpacing), 
                paddings = if l_tabGroupProps_0.padding then {
                    Left = l_tabGroupProps_0.padding.left or 0, 
                    Top = l_tabGroupProps_0.padding.top or 0, 
                    Right = l_tabGroupProps_0.padding.right or 0, 
                    Bottom = l_tabGroupProps_0.padding.bottom or 0
                } else nil, 
                backgroundColor = {
                    Transparency = 1
                }, 
                maxWidth = 1e999
            }) else nil
        });
    end, if v14 then {
        v26, 
        l_tabGroupProps_0, 
        v21, 
        v22
    } else {
        v26, 
        l_tabGroupProps_0, 
        v21
    });
    local v31 = v3.useCallback(function() --[[ Line: 98 ]]
        -- upvalues: v2 (ref), l_optionGroupProps_0 (copy), v3 (ref), l_UtilityActionIcon_0 (ref), v21 (copy)
        local v30 = v2.List.map(if l_optionGroupProps_0 then l_optionGroupProps_0.items else {}, function(v28, v29) --[[ Line: 101 ]]
            -- upvalues: v3 (ref), l_UtilityActionIcon_0 (ref)
            return v3.createElement(l_UtilityActionIcon_0, {
                icon = v28.icon, 
                tooltipText = v28.label, 
                layoutOrder = v29, 
                disableOutset = true, 
                onActivated = v28.onActivated
            });
        end);
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundTransparency = 1
        }, v2.Dictionary.join({
            UILayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v21.defaultSpacing)
            })
        }, v30));
    end, {
        l_optionGroupProps_0, 
        v21
    });
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        AppHeaderBarLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        AppHeaderBar = v3.createElement(l_AppHeaderBar_0, {
            automaticHeight = true, 
            renderNavigation = v27, 
            renderUtilities = v31, 
            paddingLeft = UDim.new(0, v21.safeAreaMargin), 
            paddingRight = UDim.new(0, v21.safeAreaMargin), 
            groupTransparencyLeft = {
                transparency = v16.animationProps.tabGroupTransparency, 
                guiObjectRef = v16.animationProps.tabGroupRef
            }, 
            groupTransparencyRight = {
                transparency = v16.animationProps.optionGroupTransparency, 
                guiObjectRef = v16.animationProps.optionGroupRef
            }, 
            onMedia = false, 
            backgroundStyle = {
                Color3 = Color3.new(0, 0, 0), 
                Transparency = 1
            }
        })
    });
end));