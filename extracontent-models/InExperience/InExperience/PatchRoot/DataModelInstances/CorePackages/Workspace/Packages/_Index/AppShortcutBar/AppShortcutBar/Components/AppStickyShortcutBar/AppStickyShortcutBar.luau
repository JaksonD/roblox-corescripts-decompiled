local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppShortcutBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.FocusNavigationUtils);
local v5 = require(l_Parent_0.Responsive);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_FocusNavigationEventNameEnum_0 = v4.FocusNavigationEventNameEnum;
local l_useFocusedTextBox_0 = v4.useFocusedTextBox;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
local v11 = game:DefineFastFlag("DisallowStickyShortcutBarOnNotLoggedIn", false);
local function v13(v12) --[[ Line: 16 ]] --[[ Name: selectUserLoggedIn ]]
    -- upvalues: l_LoginStatus_0 (copy)
    return v12.AuthenticationStatus and v12.AuthenticationStatus.status == l_LoginStatus_0.LOGGED_IN;
end;
local l_useAppShortcutBarHeight_0 = require(l_script_FirstAncestor_0.Hooks).useAppShortcutBarHeight;
local v15 = require(l_script_FirstAncestor_0.Stores.GetShortcutBarStatusStore);
local l_AppShortcut_0 = require(l_script_FirstAncestor_0.Components.AppShortcut).AppShortcut;
AppStickyShortcutBar = function(v17) --[[ Line: 26 ]] --[[ Name: AppStickyShortcutBar ]]
    -- upvalues: v15 (copy), l_useTokens_0 (copy), l_useAppShortcutBarHeight_0 (copy), v5 (copy), l_useFocusedTextBox_0 (copy), v11 (copy), l_useSelector_0 (copy), v13 (copy), l_FocusNavigationEventNameEnum_0 (copy), v2 (copy), l_AppShortcut_0 (copy)
    local v18 = v15(false);
    local v19 = l_useTokens_0();
    local v20 = l_useAppShortcutBarHeight_0();
    local v21 = v5.usePreferredInput() == v5.Input.Directional;
    local v22 = l_useFocusedTextBox_0();
    local v23 = nil;
    if v11 then
        v23 = l_useSelector_0(v13);
    end;
    local v24 = not v17.items or #v17.items == 0 or #v17.items == 1 and v17.items[1].eventName == l_FocusNavigationEventNameEnum_0.NavigateBack or v22 or v11 and not v23;
    v2.useEffect(function() --[[ Line: 45 ]]
        -- upvalues: v18 (copy), v24 (copy)
        v18.setShortcutBarVisible(not v24);
    end, {
        v24
    });
    if v24 then
        return nil;
    else
        local v25 = nil;
        local v26 = {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, v19.Gap.Large)
            })
        };
        local v27 = if v21 then math.min(#v17.items, 4) else #v17.items;
        local v28 = 0;
        for _, v30 in v17.items do
            if v28 < v27 and v30.eventName ~= l_FocusNavigationEventNameEnum_0.NavigateBack then
                v28 = v28 + 1;
                local v31 = if v21 then v27 - v28 + 1 else v28;
                v26["Item_" .. tostring(v31)] = v2.createElement(l_AppShortcut_0, {
                    layoutOrder = v31, 
                    item = v30
                });
            end;
            if v30.eventName == l_FocusNavigationEventNameEnum_0.NavigateBack then
                v25 = v2.createElement(l_AppShortcut_0, {
                    item = v30
                });
            end;
        end;
        return v2.createElement("ImageButton", {
            BackgroundColor3 = v19.Color.Surface.Surface_0.Color3, 
            BackgroundTransparency = v19.Color.Surface.Surface_0.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, v20), 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.fromScale(0, 1), 
            Selectable = false, 
            AutoButtonColor = false
        }, {
            Divider = v2.createElement("Frame", {
                BackgroundColor3 = v19.Color.Stroke.Default.Color3, 
                BackgroundTransparency = v19.Color.Stroke.Default.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 1)
            }), 
            ShortcutsFrame = v2.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.fromScale(0.5, 0)
            }, {
                UISizeConstraint = v2.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(v19.Size.Size_3000 * 16, v20)
                }), 
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v19.Size.Size_800), 
                    PaddingTop = UDim.new(0, v19.Padding.XSmall), 
                    PaddingRight = UDim.new(0, v19.Size.Size_800), 
                    PaddingBottom = UDim.new(0, v19.Padding.XSmall)
                }), 
                BackShortcutFrame = v2.createElement("Frame", {
                    Size = UDim2.fromScale(0, 1), 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Position = UDim2.fromScale(0, 0.5), 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.XY
                }, {
                    BackShortcut = v25
                }), 
                RightShortcutsFrame = v2.createElement("Frame", {
                    Size = UDim2.fromScale(0, 1), 
                    AnchorPoint = Vector2.new(1, 0.5), 
                    Position = UDim2.fromScale(1, 0.5), 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.X
                }, v26)
            })
        });
    end;
end;
return AppStickyShortcutBar;