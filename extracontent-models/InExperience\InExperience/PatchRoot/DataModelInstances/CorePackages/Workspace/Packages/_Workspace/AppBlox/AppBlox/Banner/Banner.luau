local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_FFlagEnableSocialUpsellUIFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableSocialUpsellUIFixes;
local v5 = game:DefineFastFlag("EnableSocialUpsellButtonMediumSize", false);
local v6 = game:DefineFastFlag("EnableSocialUpsellDismissButtonFix", false);
local v7 = require(script.Parent.BannerBadge);
local l_Button_0 = v3.Button;
local v9 = if l_FFlagEnableSocialUpsellUIFixes_0 then v7 else v3.Badge;
local l_Icon_0 = v3.Icon;
local l_IconButton_0 = v3.IconButton;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_Image_0 = v3.Image;
local v15 = {
    isContained = true, 
    width = UDim.new(1, 0), 
    tags = {
        container = "col auto-y"
    }
};
return v2.memo(function(v16) --[[ Line: 54 ]] --[[ Name: Banner ]]
    -- upvalues: v1 (copy), v15 (copy), v2 (copy), l_Button_0 (copy), l_FFlagEnableSocialUpsellUIFixes_0 (copy), v5 (copy), v3 (copy), v9 (copy), l_IconButton_0 (copy), v6 (copy), l_View_0 (copy), l_Icon_0 (copy), l_Image_0 (copy), l_Text_0 (copy)
    local v17 = v1.Dictionary.join(v15, v16);
    local v18 = "col auto-y";
    if v17.isContained then
        v18 = v18 .. " " .. "radius-medium padding-large stroke-standard stroke-default bg-shift-100";
    end;
    local v19 = v17.badges and #v17.badges > 0;
    local v20 = v17.buttons and #v17.buttons < 2 and not v17.image and not v17.body and not v19 and not v17.onDismiss;
    local v24 = v2.useMemo(function() --[[ Line: 69 ]]
        -- upvalues: v17 (copy), v2 (ref), l_Button_0 (ref), v1 (ref), l_FFlagEnableSocialUpsellUIFixes_0 (ref), v5 (ref), v3 (ref)
        local v21 = {};
        if v17.buttons and #v17.buttons > 0 then
            for v22, v23 in v17.buttons do
                v21["banner-button-" .. v22] = v2.createElement(l_Button_0, v1.Dictionary.join({
                    LayoutOrder = v22 + 1, 
                    size = if not l_FFlagEnableSocialUpsellUIFixes_0 or v5 then nil else v3.Enums.InputSize.Small, 
                    testId = "--banner-button-" .. v22
                }, v23));
            end;
        end;
        return v21;
    end, {
        v17.buttons
    });
    local v28 = v2.useMemo(function() --[[ Line: 88 ]]
        -- upvalues: v17 (copy), v2 (ref), v9 (ref), v1 (ref), l_FFlagEnableSocialUpsellUIFixes_0 (ref), v3 (ref)
        local v25 = {};
        if v17.badges then
            for v26, v27 in ipairs(v17.badges) do
                v25["banner-badge-" .. v26] = v2.createElement(v9, v1.Dictionary.join({
                    testId = "--banner-badge-" .. v26, 
                    variant = if l_FFlagEnableSocialUpsellUIFixes_0 then nil else v3.Enums.BadgeVariant.Contrast, 
                    LayoutOrder = v26 + 1
                }, v27));
            end;
        end;
        return v25;
    end, {
        v17.badges
    });
    local v29 = v2.useMemo(function() --[[ Line: 107 ]]
        -- upvalues: v17 (copy), l_FFlagEnableSocialUpsellUIFixes_0 (ref), v2 (ref), l_IconButton_0 (ref), v19 (copy), v6 (ref), v3 (ref), l_Button_0 (ref)
        if not v17.onDismiss then
            return nil;
        elseif l_FFlagEnableSocialUpsellUIFixes_0 then
            return (v2.createElement(l_IconButton_0, {
                testId = v19 and "--banner-badges-dismiss" or "--banner-dismiss", 
                LayoutOrder = v19 and 1 or 3, 
                icon = if v6 then v3.Enums.IconName.XSmall else "icons/navigation/close", 
                isCircular = true, 
                size = if v6 then nil else v3.Enums.InputSize.XSmall, 
                variant = v3.Enums.ButtonVariant.Utility, 
                onActivated = v17.onDismiss
            }));
        else
            return (v2.createElement(l_Button_0, {
                testId = v19 and "--banner-badges-dismiss" or "--banner-dismiss", 
                LayoutOrder = v19 and 1 or 3, 
                icon = "icons/navigation/close", 
                size = v3.Enums.InputSize.XSmall, 
                tag = "auto-xy flex-none shrink", 
                variant = v3.Enums.ButtonVariant.Utility, 
                onActivated = v17.onDismiss
            }));
        end;
    end, {
        v17.onDismiss, 
        v19
    });
    return v2.createElement(l_View_0, {
        LayoutOrder = v17.LayoutOrder, 
        Size = UDim2.new(v17.width.Scale, v17.width.Offset, 0, 0), 
        testId = "--banner", 
        tag = v18
    }, {
        BadgesRow = if v19 then v2.createElement(l_View_0, {
            tag = "row auto-y size-full-0 flex-between gap-large align-y-center padding-bottom-large", 
            LayoutOrder = 2
        }, {
            Badges = v2.createElement(l_View_0, {
                LayoutOrder = 1, 
                testId = "--banner-badges", 
                tag = "row auto-xy gap-small fill"
            }, v28), 
            Dismiss = if v29 then v2.createElement(l_View_0, {
                tag = "auto-xy", 
                LayoutOrder = 2
            }, {
                Dismiss = v29
            }) else nil
        }) else nil, 
        ContentRow = v2.createElement(l_View_0, {
            tag = {
                ["row auto-y size-full-0 gap-large"] = true, 
                ["align-y-center"] = v20
            }, 
            LayoutOrder = 3
        }, {
            Icon = if not v17.icon or v17.image then nil else v2.createElement(l_Icon_0, {
                testId = "--banner-icon", 
                LayoutOrder = 1, 
                size = v3.Enums.IconSize.Large, 
                name = v17.icon, 
                variant = v17.iconVariant, 
                style = v17.iconStyle, 
                tag = if l_FFlagEnableSocialUpsellUIFixes_0 then nil else "auto-xy flex-none shrink"
            }), 
            Image = if v17.image then v2.createElement(l_View_0, {
                tag = "auto-xy flex-none bg-shift-100 radius-medium"
            }, {
                Image = v2.createElement(l_Image_0, {
                    Image = v17.image, 
                    testId = "--banner-image", 
                    tag = "size-1800", 
                    ScaleType = Enum.ScaleType.Fit
                })
            }) else nil, 
            Content = v2.createElement(l_View_0, {
                LayoutOrder = 2, 
                tag = {
                    ["auto-xy gap-small align-x-left fill"] = true, 
                    ["col flex-fill"] = not v20, 
                    ["row align-y-center flex-between"] = v20
                }
            }, {
                Title = v2.createElement(l_Text_0, {
                    Text = v17.title, 
                    testId = "--banner-title", 
                    tag = "auto-xy text-title-medium content-emphasis fill text-wrap text-align-x-left", 
                    LayoutOrder = 1
                }), 
                InlineButton = if v20 and v17.buttons and v17.buttons[1] then v2.createElement(l_Button_0, v1.Dictionary.join({
                    tag = "auto-xy shrink", 
                    LayoutOrder = 2, 
                    testId = "--banner-button-inline"
                }, v17.buttons[1])) else nil, 
                Subcontent = if not v20 then v2.createElement(l_View_0, {
                    tag = "auto-xy col gap-large shrink", 
                    LayoutOrder = 2
                }, {
                    Body = if v17.body then v2.createElement(l_Text_0, {
                        testId = "--banner-body", 
                        Text = v17.body, 
                        tag = "auto-xy text-body-medium content-default text-wrap text-align-x-left", 
                        LayoutOrder = 1, 
                        RichText = true
                    }) else nil, 
                    Buttons = v2.createElement(l_View_0, {
                        tag = "row auto-xy grow gap-small wrap", 
                        LayoutOrder = 2, 
                        testId = "--banner-buttons"
                    }, v24)
                }) else nil
            }), 
            Dismiss = if not v19 then v29 else nil
        })
    });
end);