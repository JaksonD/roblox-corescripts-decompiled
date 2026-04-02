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
local v13 = require(l_Parent_0.Parent.FFlagLuaAppEnableEnhancedVideoDisclosureUpdate);
local v14 = if v13 then require(l_Parent_0.Parent.EnhancedVideoStore) else nil;
local v15 = if v13 then require(l_Parent_1.SignalsReact).useSignalState else nil;
return v2.memo(function(v16) --[[ Line: 32 ]] --[[ Name: AdLabel ]]
    -- upvalues: l_useLocalization_0 (copy), v13 (copy), l_Enums_0 (copy), v14 (copy), v15 (copy), v2 (copy), v11 (copy), l_View_0 (copy), l_Menu_0 (copy), l_Text_0 (copy), l_Icon_0 (copy), v10 (copy)
    local v17 = l_useLocalization_0({
        adLabel = "Feature.EnhancedVideo.Label.Ad", 
        whyThisAdLabel = "Feature.GameDetails.Action.WhyThisAd", 
        adDisclosureText = if not v13 then if v16.associatedBrandName then {
            "Feature.EnhancedVideo.Message.SponsoredDisclosure.O18NonPersonalized"; 
            BrandName = v16.associatedBrandName
        } else "Feature.GameDetails.Message.SponsoredDisclosure.Error" else nil, 
        errorAdDisclosureText = v13 and "Feature.GameDetails.Message.SponsoredDisclosure.Error" or nil
    });
    local v18 = {
        {
            id = "whyThisAd", 
            icon = l_Enums_0.IconName.CircleI, 
            text = v17.whyThisAdLabel
        }
    };
    local v19 = if v13 then v14(false) else nil;
    local v20 = if v13 then v15(v19.getAdDisclosureText) else nil;
    local v21 = if v13 then v15(v19.getShowAdPreferencesUrl) else nil;
    local v22, v23 = v2.useState(false);
    local v24, v25 = v2.useState(false);
    local function _(v26) --[[ Line: 66 ]] --[[ Name: toggleMenu ]]
        -- upvalues: v11 (ref), v23 (copy)
        v11.logAdDisclosureMenuToggled(v26);
        v23(v26);
    end;
    local function _(v28) --[[ Line: 71 ]] --[[ Name: toggleWhyThisAdModal ]]
        -- upvalues: v11 (ref), v25 (copy)
        v11.logAdDisclosureWhyThisAdToggled(v28);
        v25(v28);
    end;
    return v2.createElement(l_View_0, {
        tag = "size-full margin-bottom-medium"
    }, {
        Menu = v2.createElement(l_Menu_0, {
            AnchorPoint = Vector2.new(1, 1), 
            Position = UDim2.new(1, -10, 1, 0), 
            isOpen = v22, 
            items = v18, 
            size = l_Enums_0.InputSize.Medium, 
            align = l_Enums_0.PopoverAlign.End, 
            width = UDim.new(0, 180), 
            onPressedOutside = function() --[[ Line: 87 ]] --[[ Name: onPressedOutside ]]
                -- upvalues: v11 (ref), v23 (copy)
                v11.logAdDisclosureMenuToggled(false);
                v23(false);
            end, 
            onActivated = function(v30) --[[ Line: 90 ]] --[[ Name: onActivated ]]
                -- upvalues: v11 (ref), v23 (copy), v25 (copy), v16 (copy)
                if v30 == "whyThisAd" then
                    v11.logAdDisclosureMenuToggled(false);
                    v23(false);
                    v11.logAdDisclosureWhyThisAdToggled(true);
                    v25(true);
                    v16.sendPauseEvent();
                end;
            end
        }, {
            AdLabel = v2.createElement(l_View_0, {
                tag = "size-1300-600 bg-over-media-100 radius-small stroke-standard stroke-default row align-x-center align-y-center", 
                onActivated = function() --[[ Line: 100 ]] --[[ Name: onActivated ]]
                    -- upvalues: v22 (copy), v11 (ref), v23 (copy)
                    local v31 = not v22;
                    v11.logAdDisclosureMenuToggled(v31);
                    v23(v31);
                end
            }, {
                AdText = v2.createElement(l_Text_0, {
                    Text = v17.adLabel, 
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
        WhyThisAdModal = if v24 then v2.createElement(v10, {
            adDisclosureBody = if v13 then if v20 ~= "" then v20 else v17.errorAdDisclosureText else v17.adDisclosureText, 
            showAdPreferencesUrl = not v13 or v21, 
            onClose = function() --[[ Line: 128 ]] --[[ Name: onClose ]]
                -- upvalues: v11 (ref), v25 (copy)
                v11.logAdDisclosureWhyThisAdToggled(false);
                v25(false);
            end
        }) else nil
    });
end);