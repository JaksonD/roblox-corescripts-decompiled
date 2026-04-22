local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Responsive);
local v5 = require(l_Parent_0.AppBlox);
local v6 = require(l_Parent_0.Display);
local v7 = require(l_Parent_0.SignalsReact);
local v8 = require(l_Parent_0.ReactFocusNavigation);
local v9 = require(l_Parent_0.ReactUtils);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_HttpService_0 = game:GetService("HttpService");
local l_FFlagEnableSocialUpsellUIFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableSocialUpsellUIFixes;
local l_FFlagEnableAEGIS2CommsFAEUpsell_0 = require(l_Parent_0.SharedFlags).FFlagEnableAEGIS2CommsFAEUpsell;
local v15 = require(l_script_FirstAncestor_0.Analytics.SocialUpsellAnalytics);
local _ = require(l_script_FirstAncestor_0.Analytics.Enum.UpsellEntrySurfaceType);
local v17 = require(l_script_FirstAncestor_0.Analytics.Enum.UpsellComponent);
local _ = require(l_script_FirstAncestor_0.Enum.SocialUpsellType);
local v19 = require(l_script_FirstAncestor_0.Constants);
local v20 = require(l_Parent_0.SocialLuaAnalytics);
local l_BannerBadge_0 = v5.BannerBadge;
local l_EventTypes_0 = v20.Analytics.Enums.EventTypes;
local v23 = require(l_script_FirstAncestor_0.Flag.FIntMaxDaysToShowCountDownLabel);
local v24 = require(l_script_FirstAncestor_0.Flag.FIntMinDaysToShowCountdownLabel);
local v25 = require(l_script_FirstAncestor_0.Hooks.useSocialUpsellOverlayController);
local v26 = require(l_script_FirstAncestor_0.Flag.FFlagAddUpsellEntryComponentToAnalytics);
local v27 = v4.BreakpointConfig.getMinHeightFor(v4.Keys.Medium);
local v28 = if l_FFlagEnableSocialUpsellUIFixes_0 then l_BannerBadge_0 else v2.Badge;
local l_BadgeVariant_0 = v2.Enums.BadgeVariant;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_Dialog_0 = v2.Dialog;
local l_DialogSize_0 = v2.Enums.DialogSize;
local l_IconName_0 = v2.Enums.IconName;
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local l_Image_0 = v2.Image;
local l_useScaledValue_0 = v2.Hooks.useScaledValue;
local v38 = {
    isInExperience = true
};
local function v42(v39, v40) --[[ Line: 83 ]]
    -- upvalues: v24 (copy), v23 (copy)
    if not v39 or v39 == 0 then
        return nil;
    else
        local v41 = math.floor((v39 - os.time()) / 86400);
        if v41 < v24 or v23 < v41 then
            return nil;
        elseif v41 < 1 then
            return v40.dayLeft;
        else
            return v40.daysLeft:gsub("{(.-)}", {
                daysLeft = tostring(v41)
            });
        end;
    end;
end;
local v43 = nil;
if l_FFlagEnableAEGIS2CommsFAEUpsell_0 then
    v43 = v6.GetDisplayStore(false).getViewportSize;
end;
return function(v44) --[[ Line: 111 ]]
    -- upvalues: v38 (copy), v25 (copy), v3 (copy), l_useScaledValue_0 (copy), v8 (copy), v9 (copy), l_HttpService_0 (copy), v15 (copy), v17 (copy), l_useLocalization_0 (copy), v42 (copy), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (copy), v7 (copy), v43 (ref), l_useSelector_0 (copy), v27 (copy), l_EventTypes_0 (copy), v26 (copy), v19 (copy), l_ButtonVariant_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_View_0 (copy), l_Image_0 (copy), v28 (copy), l_FFlagEnableSocialUpsellUIFixes_0 (copy), v2 (copy), l_IconName_0 (copy), l_BadgeVariant_0 (copy), l_Text_0 (copy)
    local v45 = v44 or v38;
    local v46 = v25(v45.isInExperience);
    local v47 = v3.useRef(nil);
    local v48 = Vector2.new(l_useScaledValue_0(320), l_useScaledValue_0(180));
    local v49, v50 = v8.useDefaultFocusBehavior();
    local v51 = v3.useRef(nil);
    local v52 = v9.useComposedRef(v50, v51);
    v3.useEffect(function() --[[ Line: 120 ]]
        -- upvalues: v51 (copy)
        if v51.current then
            local l_FirstChildWhichIsA_0 = v51.current:FindFirstChildWhichIsA("ScrollingFrame", true);
            if l_FirstChildWhichIsA_0 then
                l_FirstChildWhichIsA_0.Selectable = false;
            end;
        end;
    end, {});
    local v54 = v3.useMemo(function() --[[ Line: 131 ]]
        -- upvalues: v45 (copy), l_HttpService_0 (ref)
        return v45.impressionId or l_HttpService_0:GenerateGUID(false);
    end, {
        v45.impressionId, 
        v45.upsellEntrySurface, 
        v45.upsellPurpose, 
        v45.upsellEntryComponent
    });
    local v55 = v3.useMemo(function() --[[ Line: 142 ]]
        -- upvalues: v15 (ref), v45 (copy), v17 (ref)
        return v15.evaluateUpsellStage(v45.upsellEntrySurface, v17.Modal, v45.upsellEntryComponent);
    end, {
        v45.upsellEntrySurface, 
        v45.upsellEntryComponent
    });
    local v56 = l_useLocalization_0({
        daysLeft = "Feature.FAE.Label.DaysLeft", 
        dayLeft = "Feature.FAE.Label.DayLeft"
    });
    local v57 = v3.useMemo(function() --[[ Line: 155 ]]
        -- upvalues: v45 (copy), v42 (ref), v56 (copy)
        if v45.countDownBadge then
            return v42(v45.countDownBadge.deadlineUtcTimestamp, v56);
        else
            return nil;
        end;
    end, {
        v45.countDownBadge, 
        v56
    });
    local v58 = v3.useMemo(function() --[[ Line: 162 ]]
        -- upvalues: v45 (copy), v57 (copy)
        if v45.countDownBadge then
            if v45.countDownBadge.text then
                return v45.countDownBadge.text;
            else
                return v57;
            end;
        else
            return nil;
        end;
    end, {
        v57, 
        v45.countDownBadge
    });
    local v60 = (if l_FFlagEnableAEGIS2CommsFAEUpsell_0 then v7.useSignalState(v43) else l_useSelector_0(function(v59) --[[ Line: 175 ]]
        return v59.ScreenSize;
    end)).Y >= v27;
    v3.useEffect(function() --[[ Line: 183 ]]
        -- upvalues: v54 (copy), v47 (copy), v15 (ref), l_EventTypes_0 (ref), v45 (copy), v55 (copy), v17 (ref), v26 (ref)
        if v54 and v47.current ~= v54 then
            v15.logUpsellEvent(l_EventTypes_0.SocialUpsellShown, {
                upsellPurpose = v45.upsellPurpose, 
                upsellEntrySurface = v45.upsellEntrySurface, 
                upsellStage = v55, 
                upsellImpressionId = v54, 
                upsellComponent = v17.Modal, 
                upsellEntryComponent = if v26 then v45.upsellEntryComponent else nil
            });
            v47.current = v54;
        end;
    end, {
        v45.upsellEntrySurface, 
        v45.upsellPurpose, 
        v54, 
        v55, 
        if v26 then v45.upsellEntryComponent else nil
    });
    local v62 = v3.useCallback(function(v61) --[[ Line: 209 ]]
        -- upvalues: v15 (ref), l_EventTypes_0 (ref), v45 (copy), v55 (copy), v54 (copy), v17 (ref), v26 (ref)
        v15.logUpsellEvent(l_EventTypes_0.SocialUpsellButtonClick, {
            upsellPurpose = v45.upsellPurpose, 
            upsellEntrySurface = v45.upsellEntrySurface, 
            upsellStage = v55, 
            upsellImpressionId = v54, 
            upsellComponent = v17.Modal, 
            btn = v61, 
            upsellEntryComponent = if v26 then v45.upsellEntryComponent else nil
        });
    end, {
        v45.upsellEntrySurface, 
        v45.upsellPurpose, 
        v54, 
        v55, 
        if v26 then v45.upsellEntryComponent else nil
    });
    local v63 = v3.useCallback(function() --[[ Line: 233 ]]
        -- upvalues: v62 (copy), v19 (ref), v45 (copy)
        v62(v19.UPSELL_OVERLAY_BUTTON_ACTION.Primary);
        v45.primaryAction.onActivated();
    end, {
        v45.primaryAction, 
        v62
    });
    local v64 = v3.useCallback(function() --[[ Line: 245 ]]
        -- upvalues: v62 (copy), v19 (ref), v46 (copy), v45 (copy)
        v62(v19.UPSELL_OVERLAY_BUTTON_ACTION.Dismiss);
        v46.closeSocialOverlay();
        if v45.onClose then
            v45.onClose();
        end;
    end, {
        v62, 
        v45.onClose, 
        v46.closeSocialOverlay
    });
    local v66 = v3.useMemo(function() --[[ Line: 259 ]]
        -- upvalues: v45 (copy), l_ButtonVariant_0 (ref), v63 (copy), v49 (copy)
        local v65 = {};
        table.insert(v65, {
            text = v45.primaryAction.text, 
            variant = l_ButtonVariant_0.Emphasis, 
            onActivated = v63, 
            ref = v49
        });
        return v65;
    end, {
        v63, 
        v45.primaryAction, 
        v49
    });
    return v3.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Medium, 
        hasBackdrop = true, 
        closeOnClickOutside = true, 
        onClose = v64, 
        ref = v52
    }, {
        DialogContent = v3.createElement(l_Dialog_0.Content, {}, {
            Content = v3.createElement(l_View_0, {
                tag = "col auto-y size-full-0 gap-medium padding-top-xlarge", 
                LayoutOrder = 1
            }, {
                Image = if v45.imageId and v60 then v3.createElement(l_Image_0, {
                    tag = "size-full-full self-center content-emphasis", 
                    Image = v45.imageId, 
                    aspectRatio = 1.7777777777777777, 
                    sizeConstraint = {
                        MaxSize = v48
                    }
                }) else nil, 
                Badge = if v58 then v3.createElement(v28, {
                    LayoutOrder = 1, 
                    icon = if l_FFlagEnableSocialUpsellUIFixes_0 then {
                        variant = v2.Enums.IconVariant.Filled, 
                        position = v2.Enums.IconPosition.Left, 
                        name = l_IconName_0.Clock
                    } else l_IconName_0.Clock, 
                    text = v58, 
                    variant = l_BadgeVariant_0.Neutral
                }) else nil, 
                TextContainer = v3.createElement(l_View_0, {
                    tag = "col gap-medium size-full-0 auto-y padding-right-xxlarge padding-bottom-xsmall", 
                    LayoutOrder = 2
                }, {
                    Title = if v45.title then v3.createElement(l_View_0, {
                        tag = "size-full-0 auto-y", 
                        LayoutOrder = 2
                    }, {
                        TitleText = v3.createElement(l_Text_0, {
                            Text = v45.title, 
                            tag = "size-full-0 auto-y content-emphasis text-wrap text-align-x-left text-heading-medium"
                        })
                    }) else nil, 
                    BodyText = if v45.bodyText then v3.createElement(l_Text_0, {
                        tag = "size-full-0 auto-y text-wrap text-align-x-left text-body-medium", 
                        Text = v45.bodyText, 
                        LayoutOrder = 3
                    }) else nil
                })
            })
        }), 
        DialogActions = v3.createElement(l_Dialog_0.Actions, {
            LayoutOrder = v58 and 3 or 4, 
            actions = v66
        })
    });
end;