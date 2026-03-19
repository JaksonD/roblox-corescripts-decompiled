local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Foundation);
local v4 = require(l_Parent_1.Localization);
local l_Icon_0 = v3.Icon;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_Menu_0 = v3.Menu;
local l_Enums_0 = v3.Enums;
local v10 = require(l_Parent_0.WhyThisAdModal);
local v11 = require(l_Parent_0.AdDisclosureTelemetry);
local l_useLocalization_0 = v4.Hooks.useLocalization;
return v2.memo(function(v13) --[[ Line: 22 ]] --[[ Name: AdLabel ]]
    -- upvalues: l_useLocalization_0 (copy), l_Enums_0 (copy), v2 (copy), v11 (copy), l_View_0 (copy), l_Menu_0 (copy), l_Text_0 (copy), l_Icon_0 (copy), v10 (copy)
    local v14 = l_useLocalization_0({
        adLabel = "Feature.EnhancedVideo.Label.Ad", 
        whyThisAdLabel = "Feature.GameDetails.Action.WhyThisAd", 
        adDisclosureText = if v13.associatedBrandName then {
            "Feature.EnhancedVideo.Message.SponsoredDisclosure.O18NonPersonalized"; 
            BrandName = v13.associatedBrandName
        } else "Feature.GameDetails.Message.SponsoredDisclosure.Error"
    });
    local v15 = {
        {
            id = "whyThisAd", 
            icon = l_Enums_0.IconName.CircleI, 
            text = v14.whyThisAdLabel
        }
    };
    local v16, v17 = v2.useState(false);
    local v18, v19 = v2.useState(false);
    local function _(v20) --[[ Line: 41 ]] --[[ Name: toggleMenu ]]
        -- upvalues: v11 (ref), v17 (copy)
        v11.logAdDisclosureMenuToggled(v20);
        v17(v20);
    end;
    local function _(v22) --[[ Line: 46 ]] --[[ Name: toggleWhyThisAdModal ]]
        -- upvalues: v11 (ref), v19 (copy)
        v11.logAdDisclosureWhyThisAdToggled(v22);
        v19(v22);
    end;
    return v2.createElement(l_View_0, {
        tag = "size-full margin-bottom-medium"
    }, {
        Menu = v2.createElement(l_Menu_0, {
            AnchorPoint = Vector2.new(1, 1), 
            Position = UDim2.new(1, -10, 1, 0), 
            isOpen = v16, 
            items = v15, 
            size = l_Enums_0.InputSize.Medium, 
            align = l_Enums_0.PopoverAlign.End, 
            width = UDim.new(0, 180), 
            onPressedOutside = function() --[[ Line: 62 ]] --[[ Name: onPressedOutside ]]
                -- upvalues: v11 (ref), v17 (copy)
                v11.logAdDisclosureMenuToggled(false);
                v17(false);
            end, 
            onActivated = function(v24) --[[ Line: 65 ]] --[[ Name: onActivated ]]
                -- upvalues: v11 (ref), v17 (copy), v19 (copy), v13 (copy)
                if v24 == "whyThisAd" then
                    v11.logAdDisclosureMenuToggled(false);
                    v17(false);
                    v11.logAdDisclosureWhyThisAdToggled(true);
                    v19(true);
                    v13.sendPauseEvent();
                end;
            end
        }, {
            AdLabel = v2.createElement(l_View_0, {
                tag = "size-1300-600 bg-over-media-100 radius-small stroke-standard stroke-default row align-x-center align-y-center", 
                onActivated = function() --[[ Line: 75 ]] --[[ Name: onActivated ]]
                    -- upvalues: v16 (copy), v11 (ref), v17 (copy)
                    local v25 = not v16;
                    v11.logAdDisclosureMenuToggled(v25);
                    v17(v25);
                end
            }, {
                AdText = v2.createElement(l_Text_0, {
                    Text = v14.adLabel, 
                    tag = "auto-x size-0-full text-label-small", 
                    LayoutOrder = 1
                }), 
                TrailingIconWrapper = v2.createElement(l_View_0, {
                    tag = "auto-xy padding-left-small", 
                    LayoutOrder = 2
                }, {
                    MoreIcon = v2.createElement(l_Icon_0, {
                        name = l_Enums_0.IconName.CircleThreeDotsHorizontal, 
                        size = l_Enums_0.IconSize.XSmall
                    })
                })
            })
        }), 
        WhyThisAdModal = if v18 then v2.createElement(v10, {
            adDisclosureBody = v14.adDisclosureText, 
            showAdPreferencesUrl = true, 
            onClose = function() --[[ Line: 99 ]] --[[ Name: onClose ]]
                -- upvalues: v11 (ref), v19 (copy)
                v11.logAdDisclosureWhyThisAdToggled(false);
                v19(false);
            end
        }) else nil
    });
end);