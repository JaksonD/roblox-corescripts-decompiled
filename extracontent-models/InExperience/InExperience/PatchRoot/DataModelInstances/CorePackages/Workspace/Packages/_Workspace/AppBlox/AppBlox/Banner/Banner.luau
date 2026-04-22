local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_FFlagEnableSocialUpsellUIFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableSocialUpsellUIFixes;
local v5 = game:DefineFastFlag("EnableSocialUpsellButtonMediumSize", false);
local v6 = require(script.Parent.BannerBadge);
local l_Button_0 = v3.Button;
local v8 = if l_FFlagEnableSocialUpsellUIFixes_0 then v6 else v3.Badge;
local l_Icon_0 = v3.Icon;
local l_IconButton_0 = v3.IconButton;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_Image_0 = v3.Image;
local v14 = {
    isContained = true, 
    width = UDim.new(1, 0), 
    tags = {
        container = "col auto-y"
    }
};
return v2.memo(function(v15) --[[ Line: 53 ]] --[[ Name: Banner ]]
    -- upvalues: v1 (copy), v14 (copy), v2 (copy), l_Button_0 (copy), l_FFlagEnableSocialUpsellUIFixes_0 (copy), v5 (copy), v3 (copy), v8 (copy), l_IconButton_0 (copy), l_View_0 (copy), l_Icon_0 (copy), l_Image_0 (copy), l_Text_0 (copy)
    local v16 = v1.Dictionary.join(v14, v15);
    local v17 = "col auto-y";
    if v16.isContained then
        v17 = v17 .. " " .. "radius-medium padding-large stroke-standard stroke-default bg-shift-100";
    end;
    local v18 = v16.badges and #v16.badges > 0;
    local v19 = v16.buttons and #v16.buttons < 2 and not v16.image and not v16.body and not v18 and not v16.onDismiss;
    local v23 = v2.useMemo(function() --[[ Line: 68 ]]
        -- upvalues: v16 (copy), v2 (ref), l_Button_0 (ref), v1 (ref), l_FFlagEnableSocialUpsellUIFixes_0 (ref), v5 (ref), v3 (ref)
        local v20 = {};
        if v16.buttons and #v16.buttons > 0 then
            for v21, v22 in v16.buttons do
                v20["banner-button-" .. v21] = v2.createElement(l_Button_0, v1.Dictionary.join({
                    LayoutOrder = v21 + 1, 
                    size = if not l_FFlagEnableSocialUpsellUIFixes_0 or v5 then nil else v3.Enums.InputSize.Small, 
                    testId = "--banner-button-" .. v21
                }, v22));
            end;
        end;
        return v20;
    end, {
        v16.buttons
    });
    local v27 = v2.useMemo(function() --[[ Line: 87 ]]
        -- upvalues: v16 (copy), v2 (ref), v8 (ref), v1 (ref), l_FFlagEnableSocialUpsellUIFixes_0 (ref), v3 (ref)
        local v24 = {};
        if v16.badges then
            for v25, v26 in ipairs(v16.badges) do
                v24["banner-badge-" .. v25] = v2.createElement(v8, v1.Dictionary.join({
                    testId = "--banner-badge-" .. v25, 
                    variant = if l_FFlagEnableSocialUpsellUIFixes_0 then nil else v3.Enums.BadgeVariant.Contrast, 
                    LayoutOrder = v25 + 1
                }, v26));
            end;
        end;
        return v24;
    end, {
        v16.badges
    });
    local v28 = v2.useMemo(function() --[[ Line: 106 ]]
        -- upvalues: v16 (copy), l_FFlagEnableSocialUpsellUIFixes_0 (ref), v2 (ref), l_IconButton_0 (ref), v18 (copy), v3 (ref), l_Button_0 (ref)
        if not v16.onDismiss then
            return nil;
        elseif l_FFlagEnableSocialUpsellUIFixes_0 then
            return (v2.createElement(l_IconButton_0, {
                testId = v18 and "--banner-badges-dismiss" or "--banner-dismiss", 
                LayoutOrder = v18 and 1 or 3, 
                icon = v3.Enums.IconName.XSmall, 
                isCircular = true, 
                variant = v3.Enums.ButtonVariant.Utility, 
                onActivated = v16.onDismiss
            }));
        else
            return (v2.createElement(l_Button_0, {
                testId = v18 and "--banner-badges-dismiss" or "--banner-dismiss", 
                LayoutOrder = v18 and 1 or 3, 
                icon = "icons/navigation/close", 
                size = v3.Enums.InputSize.XSmall, 
                tag = "auto-xy flex-none shrink", 
                variant = v3.Enums.ButtonVariant.Utility, 
                onActivated = v16.onDismiss
            }));
        end;
    end, {
        v16.onDismiss, 
        v18
    });
    return v2.createElement(l_View_0, {
        LayoutOrder = v16.LayoutOrder, 
        Size = UDim2.new(v16.width.Scale, v16.width.Offset, 0, 0), 
        testId = "--banner", 
        tag = v17
    }, {
        BadgesRow = if v18 then v2.createElement(l_View_0, {
            tag = "row auto-y size-full-0 flex-between gap-large align-y-center padding-bottom-large", 
            LayoutOrder = 2
        }, {
            Badges = v2.createElement(l_View_0, {
                LayoutOrder = 1, 
                testId = "--banner-badges", 
                tag = "row auto-xy gap-small fill"
            }, v27), 
            Dismiss = if v28 then v2.createElement(l_View_0, {
                tag = "auto-xy", 
                LayoutOrder = 2
            }, {
                Dismiss = v28
            }) else nil
        }) else nil, 
        ContentRow = v2.createElement(l_View_0, {
            tag = {
                ["row auto-y size-full-0 gap-large"] = true, 
                ["align-y-center"] = v19
            }, 
            LayoutOrder = 3
        }, {
            Icon = if not v16.icon or v16.image then nil else v2.createElement(l_Icon_0, {
                testId = "--banner-icon", 
                LayoutOrder = 1, 
                size = v3.Enums.IconSize.Large, 
                name = v16.icon, 
                variant = v16.iconVariant, 
                style = v16.iconStyle, 
                tag = if l_FFlagEnableSocialUpsellUIFixes_0 then nil else "auto-xy flex-none shrink"
            }), 
            Image = if v16.image then v2.createElement(l_View_0, {
                tag = "auto-xy flex-none bg-shift-100 radius-medium"
            }, {
                Image = v2.createElement(l_Image_0, {
                    Image = v16.image, 
                    testId = "--banner-image", 
                    tag = "size-1800", 
                    ScaleType = Enum.ScaleType.Fit
                })
            }) else nil, 
            Content = v2.createElement(l_View_0, {
                LayoutOrder = 2, 
                tag = {
                    ["auto-xy gap-small align-x-left fill"] = true, 
                    ["col flex-fill"] = not v19, 
                    ["row align-y-center flex-between"] = v19
                }
            }, {
                Title = v2.createElement(l_Text_0, {
                    Text = v16.title, 
                    testId = "--banner-title", 
                    tag = "auto-xy text-title-medium content-emphasis fill text-wrap text-align-x-left", 
                    LayoutOrder = 1
                }), 
                InlineButton = if v19 and v16.buttons and v16.buttons[1] then v2.createElement(l_Button_0, v1.Dictionary.join({
                    tag = "auto-xy shrink", 
                    LayoutOrder = 2, 
                    testId = "--banner-button-inline"
                }, v16.buttons[1])) else nil, 
                Subcontent = if not v19 then v2.createElement(l_View_0, {
                    tag = "auto-xy col gap-large shrink", 
                    LayoutOrder = 2
                }, {
                    Body = if v16.body then v2.createElement(l_Text_0, {
                        testId = "--banner-body", 
                        Text = v16.body, 
                        tag = "auto-xy text-body-medium content-default text-wrap text-align-x-left", 
                        LayoutOrder = 1, 
                        RichText = true
                    }) else nil, 
                    Buttons = v2.createElement(l_View_0, {
                        tag = "row auto-xy grow gap-small wrap", 
                        LayoutOrder = 2, 
                        testId = "--banner-buttons"
                    }, v23)
                }) else nil
            }), 
            Dismiss = if not v18 then v28 else nil
        })
    });
end);