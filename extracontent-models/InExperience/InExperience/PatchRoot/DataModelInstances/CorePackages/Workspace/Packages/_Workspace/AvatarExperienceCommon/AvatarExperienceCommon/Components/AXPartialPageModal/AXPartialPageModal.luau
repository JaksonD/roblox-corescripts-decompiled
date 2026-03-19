local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Responsive);
local l_ModalWindow_0 = require(l_Parent_0.UIBlox).App.Dialog.Modal.ModalWindow;
local v4 = require(l_Parent_0.Foundation);
local l_Button_0 = v4.Button;
local l_View_0 = v4.View;
local l_useTokens_0 = v4.Hooks.useTokens;
local l_FillBehavior_0 = v4.Enums.FillBehavior;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v10 = require(script.Parent.Parent.Wrappers.wrapForReactPortal);
local v11 = require(script.Parent.useAXPartialPageModalFocusHandler);
local v12 = game:DefineFastFlag("AXPartialPageModalDockedPadding", false);
local v13 = game:DefineFastInt("AXCatalogPartialPageModalBottomInsetMultiplier", 25);
local function v15(v14) --[[ Line: 30 ]] --[[ Name: selectDeviceOrientation ]]
    return v14.DeviceOrientation;
end;
local function v17(v16) --[[ Line: 50 ]]
    return v16.ScreenSize;
end;
local function v19(v18) --[[ Line: 54 ]]
    return v18.GlobalGuiInset and v18.GlobalGuiInset.bottom or 0;
end;
return function(v20) --[[ Line: 58 ]] --[[ Name: AXPartialPageModal ]]
    -- upvalues: l_useTokens_0 (copy), l_useSelector_0 (copy), v17 (copy), v1 (copy), v19 (copy), v12 (copy), v13 (copy), v15 (copy), v2 (copy), v11 (copy), l_View_0 (copy), l_Button_0 (copy), l_FillBehavior_0 (copy), l_ModalWindow_0 (copy), v10 (copy)
    local v21 = l_useTokens_0();
    local v22 = l_useSelector_0(v17);
    local l_Medium_0 = v21.Margin.Medium;
    local v24 = UDim.new(0, v21.Margin.Medium);
    local v25 = v1.useRef(nil);
    local v26 = l_useSelector_0(v19);
    if v12 then
        if v22.X < 540 then
            v24 = UDim.new(0, v21.Margin.Large + v26 * v13 / 100);
        end;
    elseif l_useSelector_0(v15) == v2.Keys.Portrait then
        v24 = UDim.new(0, v21.Margin.Large + v26 * v13 / 100);
    end;
    local v27 = nil;
    if v20.position then
        v27 = v20.position;
    end;
    local v28 = v11(v25);
    local function v34() --[[ Line: 90 ]]
        -- upvalues: v20 (copy), v1 (ref), l_View_0 (ref), l_Button_0 (ref), l_FillBehavior_0 (ref)
        local v29 = {};
        if v20.buttonStackProps == nil then
            return {};
        else
            local l_buttons_0 = v20.buttonStackProps.buttons;
            for v31, _ in ipairs(l_buttons_0) do
                local l_props_0 = l_buttons_0[v31].props;
                v29[v31] = v1.createElement(l_View_0, {
                    tag = "row gap-small wrap auto-y size-full-0 fill-x", 
                    key = l_props_0.text or v31
                }, v1.createElement(l_Button_0, {
                    text = l_props_0.text, 
                    variant = l_props_0.variant, 
                    onActivated = l_props_0.onActivated, 
                    LayoutOrder = l_props_0.layoutOrder or v31, 
                    fillBehavior = l_FillBehavior_0.Fill, 
                    size = l_props_0.size
                }));
            end;
            return v29;
        end;
    end;
    local function v40() --[[ Line: 120 ]]
        -- upvalues: v20 (copy), v1 (ref), l_Button_0 (ref), l_FillBehavior_0 (ref)
        local v35 = {};
        if v20.buttonStackProps == nil then
            return {};
        else
            local l_buttons_1 = v20.buttonStackProps.buttons;
            for v37, _ in ipairs(l_buttons_1) do
                local l_props_1 = l_buttons_1[v37].props;
                v35[v37] = v1.createElement(l_Button_0, {
                    text = l_props_1.text, 
                    key = l_props_1.text or v37, 
                    variant = l_props_1.variant, 
                    width = UDim.new(1, 0), 
                    onActivated = l_props_1.onActivated, 
                    LayoutOrder = l_props_1.layoutOrder or v37, 
                    fillBehavior = l_FillBehavior_0.Fill, 
                    size = l_props_1.size
                });
            end;
            return v35;
        end;
    end;
    local v41 = v20.visible == nil or v20.visible;
    local v42 = v1.createElement("TextButton", {
        Text = "", 
        AutoButtonColor = false, 
        Selectable = false, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        [v1.Event.Activated] = v20.onBackgroundPress, 
        ZIndex = 5, 
        Visible = v41
    }, {
        PartialPageModal = v1.createElement(l_ModalWindow_0, {
            isFullHeight = false, 
            screenSize = v22, 
            position = v27, 
            anchorPoint = v20.anchorPoint
        }, {
            ContentContainer = v1.createElement(l_View_0, {
                tag = "auto-y col size-full-0 align-x-left padding-x-xxlarge padding-top-xxlarge radius-medium", 
                Position = UDim2.new(0, 0, 0, l_Medium_0), 
                backgroundStyle = v21.Color.Surface.Surface_100, 
                padding = {
                    bottom = v24
                }, 
                ref = if v28 == nil then v25 else nil, 
                selectionGroup = if v28 == nil then {
                    SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
                    SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
                    SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
                    SelectionBehaviorRight = Enum.SelectionBehavior.Stop
                } else nil
            }, {
                Content = v1.createElement(l_View_0, {
                    tag = "auto-y size-full-0"
                }, v20.children), 
                Buttons = v20.buttonStackProps and v1.createElement(l_View_0, {
                    tag = {
                        ["col gap-medium auto-y size-full-0 fill-x"] = not v20.buttonStackProps.rowLayout, 
                        ["row gap-small auto-y size-full-0 fill-x"] = v20.buttonStackProps.rowLayout
                    }
                }, if v20.buttonStackProps.rowLayout then v40() else v34())
            })
        })
    });
    if v28 ~= nil then
        return v10(v42, v28, v25);
    else
        return v42;
    end;
end;