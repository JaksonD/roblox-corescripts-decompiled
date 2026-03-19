local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.Foundation);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_FillBehavior_0 = v2.Enums.FillBehavior;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_StateLayerAffordance_0 = v2.Enums.StateLayerAffordance;
return v1.forwardRef(function(v8, v9) --[[ Line: 28 ]] --[[ Name: FormDropdown ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), v1 (copy), v2 (copy), l_StateLayerAffordance_0 (copy), l_FillBehavior_0 (copy), l_ButtonVariant_0 (copy)
    local v10 = l_useTokens_0();
    local v11 = l_useLocalization_0({
        apply = "CommonUI.Messages.Action.Apply"
    });
    local v12 = if v8.dropdownPosition then UDim2.fromOffset(v8.dropdownPosition.X, v8.dropdownPosition.Y) else UDim2.fromScale(0.5, 0.5);
    local v13 = if v8.dropdownPosition then Vector2.new() else Vector2.new(0.5, 0.5);
    local v17 = v1.useCallback(function(v14) --[[ Line: 38 ]]
        -- upvalues: v8 (copy), v10 (copy)
        local v15 = if v8.dropdownPosition then v8.dropdownPosition.Y else 0;
        local v16 = math.max(v14.scrimSize.Y - v15 - v14.headerHeight - v14.bottomBarHeight - v10.Gap.Medium, 0);
        return UDim2.fromOffset(v14.contentSize.X, (math.min(v14.contentSize.Y, v16)));
    end, {
        v8.dropdownPosition
    });
    local v18, v19 = v1.useBinding(Vector2.new());
    local v20, v21 = v1.useBinding(Vector2.new());
    local v22, v23 = v1.useBinding(0);
    local v24, v25 = v1.useBinding(0);
    local v26 = v1.joinBindings({
        scrimSize = v18, 
        contentSize = v20, 
        bottomBarHeight = v24, 
        headerHeight = v22
    }):map(v17);
    return v1.createElement(v2.View, {
        tag = "size-full", 
        backgroundStyle = v10.Color.Common.Scrim, 
        stateLayer = {
            affordance = l_StateLayerAffordance_0.None
        }, 
        onActivated = v8.onClose, 
        onAbsoluteSizeChanged = function(v27) --[[ Line: 69 ]] --[[ Name: onAbsoluteSizeChanged ]]
            -- upvalues: v19 (copy)
            v19(v27.AbsoluteSize);
        end
    }, {
        Dropdown = v1.createElement(v2.View, {
            tag = "bg-surface-100 radius-medium auto-xy col", 
            Position = v12, 
            AnchorPoint = v13, 
            onActivated = function() --[[ Line: 77 ]] --[[ Name: onActivated ]]

            end, 
            stateLayer = {
                affordance = l_StateLayerAffordance_0.None
            }, 
            selection = {
                Selectable = false
            }, 
            selectionGroup = true, 
            ref = v9
        }, {
            HeaderContainer = v1.createElement(v2.View, {
                tag = "auto-y size-full-0 padding-xlarge", 
                LayoutOrder = 1, 
                onAbsoluteSizeChanged = function(v28) --[[ Line: 90 ]] --[[ Name: onAbsoluteSizeChanged ]]
                    -- upvalues: v23 (copy)
                    v23(v28.AbsoluteSize.Y);
                end
            }, {
                Header = v8.headerText and v1.createElement(v2.Text, {
                    tag = "auto-xy text-title-large", 
                    Text = v8.headerText
                }), 
                CloseButton = v8.onClose and v1.createElement(v2.IconButton, {
                    icon = "icons/navigation/close", 
                    size = v2.Enums.IconSize.Small, 
                    onActivated = v8.onClose, 
                    AnchorPoint = Vector2.new(1, 0.5), 
                    Position = UDim2.fromScale(1, 0.5), 
                    LayoutOrder = 2
                })
            }), 
            ScrollView = v1.createElement(v2.ScrollView, {
                scroll = {
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    CanvasSize = UDim2.fromScale(1, 0), 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    scrollBarVisibility = v2.Enums.ScrollBarVisibility.None
                }, 
                Size = v26, 
                selection = {
                    Selectable = false
                }, 
                LayoutOrder = 2
            }, {
                ChildrenContainer = v1.createElement(v2.View, {
                    tag = "auto-xy padding-x-xlarge", 
                    onAbsoluteSizeChanged = function(v29) --[[ Line: 124 ]] --[[ Name: onAbsoluteSizeChanged ]]
                        -- upvalues: v21 (copy)
                        v21(Vector2.new(math.max(300, v29.AbsoluteSize.X), v29.AbsoluteSize.Y));
                    end
                }, v8.children)
            }), 
            ButtonContainer = v8.onApply and v1.createElement(v2.View, {
                tag = "auto-y padding-xlarge", 
                onAbsoluteSizeChanged = function(v30) --[[ Line: 134 ]] --[[ Name: onAbsoluteSizeChanged ]]
                    -- upvalues: v25 (copy)
                    v25(v30.AbsoluteSize.Y);
                end, 
                Size = v20:map(function(v31) --[[ Line: 137 ]]
                    return UDim2.fromOffset(v31.X, 0);
                end), 
                LayoutOrder = 3
            }, {
                ApplyButton = v1.createElement(v2.Button, {
                    text = v11.apply, 
                    fillBehavior = l_FillBehavior_0.Fill, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    isDisabled = not v8.canApply, 
                    onActivated = v8.onApply
                })
            })
        })
    });
end);