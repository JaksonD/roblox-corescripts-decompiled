local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.SduiCompat);
local l_View_0 = v2.View;
local l_Text_0 = v2.Text;
local l_Icon_0 = v2.Icon;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useCursor_0 = v2.Hooks.useCursor;
local l_withCommonProps_0 = v2.Utility.withCommonProps;
local l_IconSize_0 = v2.Enums.IconSize;
local l_StateLayerMode_0 = v2.Enums.StateLayerMode;
local l_CursorType_0 = v2.Enums.CursorType;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
return v1.memo(function(v15) --[[ Line: 42 ]] --[[ Name: SduiDualActionChip ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_useCursor_0 (copy), l_CursorType_0 (copy), l_useTokens_0 (copy), v1 (copy), l_withCommonProps_0 (copy), l_StateLayerMode_0 (copy), l_View_0 (copy), v3 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), l_Text_0 (copy)
    local v16 = nil;
    local v17 = nil;
    local v18 = nil;
    if l_FFlagSduiServerCompat_0 then
        v16 = v15.layoutOrder;
        v17 = v15.anchorPoint;
        v18 = v15.position;
    else
        v16 = v15.LayoutOrder;
        v17 = v15.AnchorPoint;
        v18 = v15.Position;
    end;
    local v19 = l_useCursor_0(l_CursorType_0.SmallPill);
    local v20 = l_useTokens_0();
    if not v15.leadingIconName and not v15.trailingIconName then
        return v1.createElement(v1.Fragment, {}, {});
    else
        local v21 = v15.leadingOnActivated or function() --[[ Line: 65 ]]

        end;
        local v22 = v15.trailingOnActivated or function() --[[ Line: 66 ]]

        end;
        local v23 = l_withCommonProps_0(v15, {
            LayoutOrder = if not l_FFlagSduiServerCompat_0 then v16 else nil, 
            AnchorPoint = if not l_FFlagSduiServerCompat_0 then v17 else nil, 
            Position = if not l_FFlagSduiServerCompat_0 then v18 else nil, 
            selection = {
                Selectable = true, 
                SelectionImageObject = v19
            }, 
            stateLayer = {
                mode = l_StateLayerMode_0.Inverse
            }, 
            backgroundStyle = v20.Color.ActionStandard.Background, 
            tag = "row size-0-800 auto-x radius-circle align-y-center"
        });
        return v1.createElement(l_View_0, v3.Dictionary.join(v23, {
            LayoutOrder = if l_FFlagSduiServerCompat_0 then v16 else nil, 
            AnchorPoint = if l_FFlagSduiServerCompat_0 then v17 else nil, 
            Position = if l_FFlagSduiServerCompat_0 then v18 else nil, 
            [v1.Tag] = if v15.testId then ("data-testid=%*"):format(v15.testId) else nil
        }), {
            LeftActionButton = if v15.leadingIconName then v1.createElement(l_View_0, {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                onActivated = v21
            }, {
                UICorner = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v20.Radius.Large)
                }), 
                Content = v1.createElement(l_View_0, {
                    tag = "row fill auto-xy size-full-800 align-y-center padding-left-medium padding-right-small gap-small", 
                    [v1.Tag] = if v15.testId then ("data-testid=%*-leading"):format(v15.testId) else nil
                }, {
                    Icon = v1.createElement(l_Icon_0, {
                        LayoutOrder = 1, 
                        name = v15.leadingIconName, 
                        variant = v15.leadingIconVariant, 
                        size = l_IconSize_0.Small
                    }), 
                    Text = if v15.text and v15.text ~= "" then v1.createElement(l_Text_0, {
                        LayoutOrder = 2, 
                        Text = v15.text, 
                        textStyle = v20.Color.ActionStandard.Foreground, 
                        tag = "auto-x size-0-full shrink text-label-medium text-truncate-end"
                    }) else nil
                })
            }) else nil, 
            Divider = if v15.leadingIconName and v15.trailingIconName then v1.createElement(l_View_0, {
                LayoutOrder = 2, 
                Size = UDim2.new(0, 1, 0, 16), 
                tag = "bg-shift-200"
            }) else nil, 
            RightActionButton = if v15.trailingIconName then v1.createElement(l_View_0, {
                LayoutOrder = 4, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                onActivated = v22
            }, {
                UICorner = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v20.Radius.Circle)
                }), 
                Content = v1.createElement(l_View_0, {
                    tag = "row fill auto-xy align-y-center align-x-center size-full-800 padding-right-medium padding-left-small", 
                    [v1.Tag] = if v15.testId then ("data-testid=%*-trailing"):format(v15.testId) else nil
                }, {
                    Icon = v1.createElement(l_Icon_0, {
                        LayoutOrder = 1, 
                        name = v15.trailingIconName, 
                        variant = v15.trailingIconVariant, 
                        size = l_IconSize_0.Small
                    })
                })
            }) else nil
        });
    end;
end);