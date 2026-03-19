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
local l_FFlagEnableSocialUpsellFocusFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableSocialUpsellFocusFixes;
local v16 = require(l_script_FirstAncestor_0.Analytics.SocialUpsellAnalytics);
local _ = require(l_script_FirstAncestor_0.Analytics.Enum.UpsellEntrySurfaceType);
local v18 = require(l_script_FirstAncestor_0.Analytics.Enum.UpsellComponent);
local _ = require(l_script_FirstAncestor_0.Enum.SocialUpsellType);
local v20 = require(l_script_FirstAncestor_0.Constants);
local v21 = require(l_Parent_0.SocialLuaAnalytics);
local l_BannerBadge_0 = v5.BannerBadge;
local l_EventTypes_0 = v21.Analytics.Enums.EventTypes;
local v24 = require(l_script_FirstAncestor_0.Flag.FFlagAddSurfaceTypeToAnalytics);
local v25 = require(l_script_FirstAncestor_0.Flag.FFlagAddMinorFixesToUpsellAnalytics);
local v26 = require(l_script_FirstAncestor_0.Flag.FIntMaxDaysToShowCountDownLabel);
local v27 = require(l_script_FirstAncestor_0.Flag.FIntMinDaysToShowCountdownLabel);
local v28 = require(l_script_FirstAncestor_0.Hooks.useSocialUpsellOverlayController);
local v29 = require(l_script_FirstAncestor_0.Flag.FFlagAddUpsellEntryComponentToAnalytics);
local v30 = v4.BreakpointConfig.getMinHeightFor(v4.Keys.Medium);
local v31 = if l_FFlagEnableSocialUpsellUIFixes_0 then l_BannerBadge_0 else v2.Badge;
local l_BadgeVariant_0 = v2.Enums.BadgeVariant;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_Dialog_0 = v2.Dialog;
local l_DialogSize_0 = v2.Enums.DialogSize;
local l_IconName_0 = v2.Enums.IconName;
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local l_Image_0 = v2.Image;
local l_useScaledValue_0 = v2.Hooks.useScaledValue;
local v41 = {
    isInExperience = true
};
local function v45(v42, v43) --[[ Line: 86 ]]
    -- upvalues: v27 (copy), v26 (copy)
    if not v42 or v42 == 0 then
        return nil;
    else
        local v44 = math.floor((v42 - os.time()) / 86400);
        if v44 < v27 or v26 < v44 then
            return nil;
        elseif v44 < 1 then
            return v43.dayLeft;
        else
            return v43.daysLeft:gsub("{(.-)}", {
                daysLeft = tostring(v44)
            });
        end;
    end;
end;
local v46 = nil;
if l_FFlagEnableAEGIS2CommsFAEUpsell_0 then
    v46 = v6.GetDisplayStore(false).getViewportSize;
end;
return function(v47) --[[ Line: 114 ]]
    -- upvalues: v41 (copy), v28 (copy), v3 (copy), l_useScaledValue_0 (copy), l_FFlagEnableSocialUpsellFocusFixes_0 (copy), v8 (copy), v9 (copy), l_HttpService_0 (copy), v25 (copy), v16 (copy), v18 (copy), l_useLocalization_0 (copy), v45 (copy), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (copy), v7 (copy), v46 (ref), l_useSelector_0 (copy), v30 (copy), l_EventTypes_0 (copy), v24 (copy), v29 (copy), v20 (copy), l_ButtonVariant_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_View_0 (copy), l_Image_0 (copy), v31 (copy), l_FFlagEnableSocialUpsellUIFixes_0 (copy), v2 (copy), l_IconName_0 (copy), l_BadgeVariant_0 (copy), l_Text_0 (copy)
    local v48 = v47 or v41;
    local v49 = v28(v48.isInExperience);
    local v50 = v3.useRef(nil);
    local v51 = Vector2.new(l_useScaledValue_0(320), l_useScaledValue_0(180));
    local v52 = nil;
    local v53 = nil;
    local _ = nil;
    local v55 = v3.useRef(nil);
    if l_FFlagEnableSocialUpsellFocusFixes_0 then
        local v56, v57 = v8.useDefaultFocusBehavior();
        v53 = v56;
        v52 = v9.useComposedRef(v57, v55);
        v3.useEffect(function() --[[ Line: 126 ]]
            -- upvalues: v55 (copy)
            if v55.current then
                local l_FirstChildWhichIsA_0 = v55.current:FindFirstChildWhichIsA("ScrollingFrame", true);
                if l_FirstChildWhichIsA_0 then
                    l_FirstChildWhichIsA_0.Selectable = false;
                end;
            end;
        end, {});
    end;
    local v59 = v3.useMemo(function() --[[ Line: 138 ]]
        -- upvalues: v48 (copy), l_HttpService_0 (ref)
        return v48.impressionId or l_HttpService_0:GenerateGUID(false);
    end, {
        v48.impressionId, 
        v48.upsellEntrySurface, 
        v48.upsellPurpose, 
        if v25 then v48.upsellEntryComponent else nil
    });
    local v60 = v3.useMemo(function() --[[ Line: 150 ]]
        -- upvalues: v16 (ref), v48 (copy), v18 (ref), v25 (ref)
        return v16.evaluateUpsellStage(v48.upsellEntrySurface, v18.Modal, if v25 then v48.upsellEntryComponent else nil);
    end, {
        v48.upsellEntrySurface, 
        if v25 then v48.upsellEntryComponent else nil
    });
    local v61 = l_useLocalization_0({
        daysLeft = "Feature.FAE.Label.DaysLeft", 
        dayLeft = "Feature.FAE.Label.DayLeft"
    });
    local v62 = v3.useMemo(function() --[[ Line: 165 ]]
        -- upvalues: v48 (copy), v45 (ref), v61 (copy)
        if v48.countDownBadge then
            return v45(v48.countDownBadge.deadlineUtcTimestamp, v61);
        else
            return nil;
        end;
    end, {
        v48.countDownBadge, 
        v61
    });
    local v63 = v3.useMemo(function() --[[ Line: 172 ]]
        -- upvalues: v48 (copy), v62 (copy)
        if v48.countDownBadge then
            if v48.countDownBadge.text then
                return v48.countDownBadge.text;
            else
                return v62;
            end;
        else
            return nil;
        end;
    end, {
        v62, 
        v48.countDownBadge
    });
    local v65 = (if l_FFlagEnableAEGIS2CommsFAEUpsell_0 then v7.useSignalState(v46) else l_useSelector_0(function(v64) --[[ Line: 185 ]]
        return v64.ScreenSize;
    end)).Y >= v30;
    v3.useEffect(function() --[[ Line: 193 ]]
        -- upvalues: v59 (copy), v50 (copy), v16 (ref), l_EventTypes_0 (ref), v25 (ref), v48 (copy), v60 (copy), v24 (ref), v18 (ref), v29 (ref)
        if v59 and v50.current ~= v59 then
            v16.logUpsellEvent(l_EventTypes_0.SocialUpsellShown, {
                upsellPurpose = if v25 then v48.upsellPurpose else nil, 
                upsellEntrySurface = v48.upsellEntrySurface, 
                upsellStage = v60, 
                upsellImpressionId = v59, 
                upsellComponent = if v24 then v18.Modal else nil, 
                upsellEntryComponent = if v29 then v48.upsellEntryComponent else nil
            });
            v50.current = v59;
        end;
    end, {
        v48.upsellEntrySurface, 
        if v25 then v48.upsellPurpose else nil, 
        v59, 
        v60, 
        if v29 then v48.upsellEntryComponent else nil
    });
    local v67 = v3.useCallback(function(v66) --[[ Line: 219 ]]
        -- upvalues: v16 (ref), l_EventTypes_0 (ref), v25 (ref), v48 (copy), v60 (copy), v59 (copy), v24 (ref), v18 (ref), v29 (ref)
        v16.logUpsellEvent(l_EventTypes_0.SocialUpsellButtonClick, {
            upsellPurpose = if v25 then v48.upsellPurpose else nil, 
            upsellEntrySurface = v48.upsellEntrySurface, 
            upsellStage = v60, 
            upsellImpressionId = v59, 
            upsellComponent = if v24 then v18.Modal else nil, 
            btn = v66, 
            upsellEntryComponent = if v29 then v48.upsellEntryComponent else nil
        });
    end, {
        v48.upsellEntrySurface, 
        if v25 then v48.upsellPurpose else nil, 
        v59, 
        v60, 
        if v29 then v48.upsellEntryComponent else nil
    });
    local v68 = v3.useCallback(function() --[[ Line: 243 ]]
        -- upvalues: v67 (copy), v20 (ref), v48 (copy)
        v67(v20.UPSELL_OVERLAY_BUTTON_ACTION.Primary);
        v48.primaryAction.onActivated();
    end, {
        v48.primaryAction, 
        v67
    });
    local v69 = v3.useCallback(function() --[[ Line: 255 ]]
        -- upvalues: v67 (copy), v20 (ref), v49 (copy), v48 (copy)
        v67(v20.UPSELL_OVERLAY_BUTTON_ACTION.Dismiss);
        v49.closeSocialOverlay();
        if v48.onClose then
            v48.onClose();
        end;
    end, {
        v67, 
        v48.onClose, 
        v49.closeSocialOverlay
    });
    local v71 = v3.useMemo(function() --[[ Line: 269 ]]
        -- upvalues: v48 (copy), l_ButtonVariant_0 (ref), v68 (copy), l_FFlagEnableSocialUpsellFocusFixes_0 (ref), v53 (ref)
        local v70 = {};
        table.insert(v70, {
            text = v48.primaryAction.text, 
            variant = l_ButtonVariant_0.Emphasis, 
            onActivated = v68, 
            ref = if l_FFlagEnableSocialUpsellFocusFixes_0 then v53 else nil
        });
        return v70;
    end, {
        v68, 
        v48.primaryAction, 
        if l_FFlagEnableSocialUpsellFocusFixes_0 then v53 else nil
    });
    return v3.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Medium, 
        hasBackdrop = true, 
        closeOnClickOutside = true, 
        onClose = v69, 
        ref = if l_FFlagEnableSocialUpsellFocusFixes_0 then v52 else nil
    }, {
        DialogContent = v3.createElement(l_Dialog_0.Content, {}, {
            Content = v3.createElement(l_View_0, {
                tag = "col auto-y size-full-0 gap-medium padding-top-xlarge", 
                LayoutOrder = 1
            }, {
                Image = if v48.imageId and v65 then v3.createElement(l_Image_0, {
                    tag = "size-full-full self-center content-emphasis", 
                    Image = v48.imageId, 
                    aspectRatio = 1.7777777777777777, 
                    sizeConstraint = {
                        MaxSize = v51
                    }
                }) else nil, 
                Badge = if v63 then v3.createElement(v31, {
                    LayoutOrder = 1, 
                    icon = if l_FFlagEnableSocialUpsellUIFixes_0 then {
                        variant = v2.Enums.IconVariant.Filled, 
                        position = v2.Enums.IconPosition.Left, 
                        name = l_IconName_0.Clock
                    } else l_IconName_0.Clock, 
                    text = v63, 
                    variant = l_BadgeVariant_0.Neutral
                }) else nil, 
                TextContainer = v3.createElement(l_View_0, {
                    tag = "col gap-medium size-full-0 auto-y padding-right-xxlarge padding-bottom-xsmall", 
                    LayoutOrder = 2
                }, {
                    Title = if v48.title then v3.createElement(l_View_0, {
                        tag = "size-full-0 auto-y", 
                        LayoutOrder = 2
                    }, {
                        TitleText = v3.createElement(l_Text_0, {
                            Text = v48.title, 
                            tag = "size-full-0 auto-y content-emphasis text-wrap text-align-x-left text-heading-medium"
                        })
                    }) else nil, 
                    BodyText = if v48.bodyText then v3.createElement(l_Text_0, {
                        tag = "size-full-0 auto-y text-wrap text-align-x-left text-body-medium", 
                        Text = v48.bodyText, 
                        LayoutOrder = 3
                    }) else nil
                })
            })
        }), 
        DialogActions = v3.createElement(l_Dialog_0.Actions, {
            LayoutOrder = v63 and 3 or 4, 
            actions = v71
        })
    });
end;