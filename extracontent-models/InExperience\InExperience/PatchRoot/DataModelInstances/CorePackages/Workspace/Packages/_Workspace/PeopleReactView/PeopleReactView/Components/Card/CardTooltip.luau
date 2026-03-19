local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.PeopleService);
local v4 = require(l_Parent_0.RobloxAppEnums);
local l_useDeviceOrientation_0 = require(l_Parent_0.RobloxAppHooks).useDeviceOrientation;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v7 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v7.Hooks.useTokens;
local l_InputSize_0 = v7.Enums.InputSize;
local l_ButtonVariant_0 = v7.Enums.ButtonVariant;
local l_StateLayerMode_0 = v7.Enums.StateLayerMode;
local l_Button_0 = v7.Button;
local l_Text_0 = v7.Text;
local l_View_0 = v7.View;
local v15 = require(l_script_FirstAncestor_0.Constants);
local l_GetFFlagFixPeoplePageCardTooltip_0 = v3.getService("Flags").GetFFlagFixPeoplePageCardTooltip;
return function(v17) --[[ Line: 33 ]] --[[ Name: CardTooltip ]]
    -- upvalues: l_useTokens_0 (copy), l_GetFFlagFixPeoplePageCardTooltip_0 (copy), l_useDeviceOrientation_0 (copy), v4 (copy), v2 (copy), l_useLocalization_0 (copy), v15 (copy), l_View_0 (copy), l_StateLayerMode_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_InputSize_0 (copy), l_ButtonVariant_0 (copy)
    local v18 = l_useTokens_0();
    local v19 = UDim2.fromScale(1.75, 0);
    if l_GetFFlagFixPeoplePageCardTooltip_0() then
        local v20 = l_useDeviceOrientation_0() == v4.DeviceOrientationMode.Portrait;
        v19 = v2.useMemo(function() --[[ Line: 41 ]]
            -- upvalues: v20 (copy)
            if v20 then
                return (UDim2.fromScale(1, 0));
            else
                return (UDim2.fromScale(1.75, 0));
            end;
        end, {
            v20
        });
    end;
    local v21 = l_useLocalization_0({
        title = v15.PEOPLEPAGE.CARD_TOOLTIP.LOCALIZED_STRINGS.BUY_WHAT_THEYRE_WEARING, 
        description = v15.PEOPLEPAGE.CARD_TOOLTIP.LOCALIZED_STRINGS.SELECT_AVATAR_TO_CHECKOUT_ITEMS, 
        secondaryDescription = v15.PEOPLEPAGE.CARD_TOOLTIP.LOCALIZED_STRINGS.SELECT_USERNAME_TO_VIEW_PROFILE, 
        ok = v15.PEOPLEPAGE.CARD_TOOLTIP.LOCALIZED_STRINGS.OK
    });
    return v2.createElement(l_View_0, {
        tag = "auto-y radius-medium", 
        backgroundStyle = v18.Inverse.Surface.Surface_0, 
        Position = UDim2.new(1, v18.Size.Size_300, 0, 0), 
        Size = v19, 
        stateLayer = {
            mode = l_StateLayerMode_0.Inverse
        }, 
        ZIndex = 2
    }, {
        Content = v2.createElement(l_View_0, {
            tag = "size-full-0 auto-y col gap-medium padding-medium"
        }, {
            Title = v2.createElement(l_Text_0, {
                tag = "size-full-0 auto-y text-title-large content-inverse-emphasis text-align-x-left text-wrap", 
                Text = v21.title, 
                LayoutOrder = 1
            }), 
            Description = v2.createElement(l_Text_0, {
                tag = "size-full-0 auto-y text-body-medium content-inverse-default text-align-x-left text-wrap", 
                Text = v21.description, 
                LayoutOrder = 2
            }), 
            SecondaryDescription = v2.createElement(l_Text_0, {
                tag = "size-full-0 auto-y text-body-medium content-inverse-default text-align-x-left text-wrap", 
                Text = v21.secondaryDescription, 
                LayoutOrder = 3
            }), 
            Action = v2.createElement(l_Button_0, {
                text = v21.ok, 
                size = l_InputSize_0.Medium, 
                width = UDim.new(1, 0), 
                variant = l_ButtonVariant_0.Emphasis, 
                LayoutOrder = 4, 
                onActivated = v17.action
            })
        }), 
        Arrow = v2.createElement(l_View_0, {
            tag = "size-200 radius-xsmall", 
            backgroundStyle = v18.Inverse.Surface.Surface_0, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0, 1, 0.5, 0), 
            Rotation = 45, 
            stateLayer = {
                mode = l_StateLayerMode_0.Inverse
            }
        })
    });
end;