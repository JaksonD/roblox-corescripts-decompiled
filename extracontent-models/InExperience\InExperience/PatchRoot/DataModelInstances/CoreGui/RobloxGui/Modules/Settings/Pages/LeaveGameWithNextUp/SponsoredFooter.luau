local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Foundation);
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.Localization);
local v4 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_usePreferredInput_0 = v4.usePreferredInput;
local l_Text_0 = v1.Text;
local l_View_0 = v1.View;
local l_Icon_0 = v1.Icon;
local l_InputSize_0 = v1.Enums.InputSize;
local l_Popover_0 = v1.Popover;
local l_ControlState_0 = v1.Enums.ControlState;
local l_useScaledValue_0 = v1.Hooks.useScaledValue;
return v2.memo(function(v14) --[[ Line: 23 ]] --[[ Name: SponsoredFooter ]]
    -- upvalues: l_useLocalization_0 (copy), l_useScaledValue_0 (copy), v2 (copy), l_usePreferredInput_0 (copy), v4 (copy), l_ControlState_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_Popover_0 (copy), l_Icon_0 (copy), l_InputSize_0 (copy)
    local v15 = l_useLocalization_0({
        SponsoredText = "Feature.GamePage.Label.Sponsored", 
        SponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic"
    });
    local v16 = l_useScaledValue_0(320);
    local v17, v18 = v2.useState(false);
    local v19 = l_usePreferredInput_0() == v4.Input.Pointer;
    local v21 = v2.useCallback(function(v20) --[[ Line: 32 ]]
        -- upvalues: l_ControlState_0 (ref), v18 (copy)
        if v20 == l_ControlState_0.Hover or v20 == l_ControlState_0.Selected then
            v18(true);
            return;
        else
            if v20 == l_ControlState_0.Default then
                v18(false);
            end;
            return;
        end;
    end, {});
    local v23 = v2.useCallback(function() --[[ Line: 39 ]]
        -- upvalues: v18 (copy)
        v18(function(v22) --[[ Line: 40 ]]
            return not v22;
        end);
    end, {});
    return v2.createElement(l_View_0, {
        tag = "row align-y-bottom align-x-center gap-xsmall flex-between auto-y", 
        LayoutOrder = v14.LayoutOrder
    }, {
        SponsoredText = v2.createElement(l_Text_0, {
            tag = "size-full-0 text-no-wrap text-body-medium content-default text-align-x-left auto-xy", 
            LayoutOrder = 1, 
            Text = v15.SponsoredText
        }), 
        SponsoredTooltip = v2.createElement(l_Popover_0.Root, {
            isOpen = v17
        }, {
            Anchor = v2.createElement(l_Popover_0.Anchor, {
                LayoutOrder = 2
            }, {
                IconView = v2.createElement(l_View_0, {
                    tag = "size-400-400 radius-circle", 
                    onStateChanged = if v19 then v21 else nil, 
                    onActivated = if v19 then nil else v23
                }, {
                    Icon = v2.createElement(l_Icon_0, {
                        size = l_InputSize_0.Small, 
                        name = "icons/actions/info"
                    })
                })
            }), 
            Content = v2.createElement(l_Popover_0.Content, nil, {
                DescriptionView = v2.createElement(l_View_0, {
                    tag = "col gap-xsmall padding-small auto-xy size-full-2400", 
                    sizeConstraint = {
                        MaxSize = Vector2.new(v16, 1e999)
                    }
                }, {
                    Description = v2.createElement(l_Text_0, {
                        Text = v15.SponsoredDisclosure, 
                        tag = "auto-xy text-body-small text-wrap"
                    })
                })
            })
        })
    });
end);