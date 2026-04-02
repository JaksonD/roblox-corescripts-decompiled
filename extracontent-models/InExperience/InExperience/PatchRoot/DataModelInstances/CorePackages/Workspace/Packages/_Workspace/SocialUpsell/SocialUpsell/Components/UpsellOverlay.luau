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
local v23 = require(l_script_FirstAncestor_0.Flag.FFlagAddSurfaceTypeToAnalytics);
local v24 = require(l_script_FirstAncestor_0.Flag.FFlagAddMinorFixesToUpsellAnalytics);
local v25 = require(l_script_FirstAncestor_0.Flag.FIntMaxDaysToShowCountDownLabel);
local v26 = require(l_script_FirstAncestor_0.Flag.FIntMinDaysToShowCountdownLabel);
local v27 = require(l_script_FirstAncestor_0.Hooks.useSocialUpsellOverlayController);
local v28 = require(l_script_FirstAncestor_0.Flag.FFlagAddUpsellEntryComponentToAnalytics);
local v29 = v4.BreakpointConfig.getMinHeightFor(v4.Keys.Medium);
local v30 = if l_FFlagEnableSocialUpsellUIFixes_0 then l_BannerBadge_0 else v2.Badge;
local l_BadgeVariant_0 = v2.Enums.BadgeVariant;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_Dialog_0 = v2.Dialog;
local l_DialogSize_0 = v2.Enums.DialogSize;
local l_IconName_0 = v2.Enums.IconName;
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local l_Image_0 = v2.Image;
local l_useScaledValue_0 = v2.Hooks.useScaledValue;
local v40 = {
    isInExperience = true
};
local function v44(v41, v42) --[[ Line: 85 ]]
    -- upvalues: v26 (copy), v25 (copy)
    if not v41 or v41 == 0 then
        return nil;
    else
        local v43 = math.floor((v41 - os.time()) / 86400);
        if v43 < v26 or v25 < v43 then
            return nil;
        elseif v43 < 1 then
            return v42.dayLeft;
        else
            return v42.daysLeft:gsub("{(.-)}", {
                daysLeft = tostring(v43)
            });
        end;
    end;
end;
local v45 = nil;
if l_FFlagEnableAEGIS2CommsFAEUpsell_0 then
    v45 = v6.GetDisplayStore(false).getViewportSize;
end;
return function(v46) --[[ Line: 113 ]]
    -- upvalues: v40 (copy), v27 (copy), v3 (copy), l_useScaledValue_0 (copy), v8 (copy), v9 (copy), l_HttpService_0 (copy), v24 (copy), v15 (copy), v17 (copy), l_useLocalization_0 (copy), v44 (copy), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (copy), v7 (copy), v45 (ref), l_useSelector_0 (copy), v29 (copy), l_EventTypes_0 (copy), v23 (copy), v28 (copy), v19 (copy), l_ButtonVariant_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_View_0 (copy), l_Image_0 (copy), v30 (copy), l_FFlagEnableSocialUpsellUIFixes_0 (copy), v2 (copy), l_IconName_0 (copy), l_BadgeVariant_0 (copy), l_Text_0 (copy)
    local v47 = v46 or v40;
    local v48 = v27(v47.isInExperience);
    local v49 = v3.useRef(nil);
    local v50 = Vector2.new(l_useScaledValue_0(320), l_useScaledValue_0(180));
    local v51, v52 = v8.useDefaultFocusBehavior();
    local v53 = v3.useRef(nil);
    local v54 = v9.useComposedRef(v52, v53);
    v3.useEffect(function() --[[ Line: 122 ]]
        -- upvalues: v53 (copy)
        if v53.current then
            local l_FirstChildWhichIsA_0 = v53.current:FindFirstChildWhichIsA("ScrollingFrame", true);
            if l_FirstChildWhichIsA_0 then
                l_FirstChildWhichIsA_0.Selectable = false;
            end;
        end;
    end, {});
    local v56 = v3.useMemo(function() --[[ Line: 133 ]]
        -- upvalues: v47 (copy), l_HttpService_0 (ref)
        return v47.impressionId or l_HttpService_0:GenerateGUID(false);
    end, {
        v47.impressionId, 
        v47.upsellEntrySurface, 
        v47.upsellPurpose, 
        if v24 then v47.upsellEntryComponent else nil
    });
    local v57 = v3.useMemo(function() --[[ Line: 145 ]]
        -- upvalues: v15 (ref), v47 (copy), v17 (ref), v24 (ref)
        return v15.evaluateUpsellStage(v47.upsellEntrySurface, v17.Modal, if v24 then v47.upsellEntryComponent else nil);
    end, {
        v47.upsellEntrySurface, 
        if v24 then v47.upsellEntryComponent else nil
    });
    local v58 = l_useLocalization_0({
        daysLeft = "Feature.FAE.Label.DaysLeft", 
        dayLeft = "Feature.FAE.Label.DayLeft"
    });
    local v59 = v3.useMemo(function() --[[ Line: 160 ]]
        -- upvalues: v47 (copy), v44 (ref), v58 (copy)
        if v47.countDownBadge then
            return v44(v47.countDownBadge.deadlineUtcTimestamp, v58);
        else
            return nil;
        end;
    end, {
        v47.countDownBadge, 
        v58
    });
    local v60 = v3.useMemo(function() --[[ Line: 167 ]]
        -- upvalues: v47 (copy), v59 (copy)
        if v47.countDownBadge then
            if v47.countDownBadge.text then
                return v47.countDownBadge.text;
            else
                return v59;
            end;
        else
            return nil;
        end;
    end, {
        v59, 
        v47.countDownBadge
    });
    local v62 = (if l_FFlagEnableAEGIS2CommsFAEUpsell_0 then v7.useSignalState(v45) else l_useSelector_0(function(v61) --[[ Line: 180 ]]
        return v61.ScreenSize;
    end)).Y >= v29;
    v3.useEffect(function() --[[ Line: 188 ]]
        -- upvalues: v56 (copy), v49 (copy), v15 (ref), l_EventTypes_0 (ref), v24 (ref), v47 (copy), v57 (copy), v23 (ref), v17 (ref), v28 (ref)
        if v56 and v49.current ~= v56 then
            v15.logUpsellEvent(l_EventTypes_0.SocialUpsellShown, {
                upsellPurpose = if v24 then v47.upsellPurpose else nil, 
                upsellEntrySurface = v47.upsellEntrySurface, 
                upsellStage = v57, 
                upsellImpressionId = v56, 
                upsellComponent = if v23 then v17.Modal else nil, 
                upsellEntryComponent = if v28 then v47.upsellEntryComponent else nil
            });
            v49.current = v56;
        end;
    end, {
        v47.upsellEntrySurface, 
        if v24 then v47.upsellPurpose else nil, 
        v56, 
        v57, 
        if v28 then v47.upsellEntryComponent else nil
    });
    local v64 = v3.useCallback(function(v63) --[[ Line: 214 ]]
        -- upvalues: v15 (ref), l_EventTypes_0 (ref), v24 (ref), v47 (copy), v57 (copy), v56 (copy), v23 (ref), v17 (ref), v28 (ref)
        v15.logUpsellEvent(l_EventTypes_0.SocialUpsellButtonClick, {
            upsellPurpose = if v24 then v47.upsellPurpose else nil, 
            upsellEntrySurface = v47.upsellEntrySurface, 
            upsellStage = v57, 
            upsellImpressionId = v56, 
            upsellComponent = if v23 then v17.Modal else nil, 
            btn = v63, 
            upsellEntryComponent = if v28 then v47.upsellEntryComponent else nil
        });
    end, {
        v47.upsellEntrySurface, 
        if v24 then v47.upsellPurpose else nil, 
        v56, 
        v57, 
        if v28 then v47.upsellEntryComponent else nil
    });
    local v65 = v3.useCallback(function() --[[ Line: 238 ]]
        -- upvalues: v64 (copy), v19 (ref), v47 (copy)
        v64(v19.UPSELL_OVERLAY_BUTTON_ACTION.Primary);
        v47.primaryAction.onActivated();
    end, {
        v47.primaryAction, 
        v64
    });
    local v66 = v3.useCallback(function() --[[ Line: 250 ]]
        -- upvalues: v64 (copy), v19 (ref), v48 (copy), v47 (copy)
        v64(v19.UPSELL_OVERLAY_BUTTON_ACTION.Dismiss);
        v48.closeSocialOverlay();
        if v47.onClose then
            v47.onClose();
        end;
    end, {
        v64, 
        v47.onClose, 
        v48.closeSocialOverlay
    });
    local v68 = v3.useMemo(function() --[[ Line: 264 ]]
        -- upvalues: v47 (copy), l_ButtonVariant_0 (ref), v65 (copy), v51 (copy)
        local v67 = {};
        table.insert(v67, {
            text = v47.primaryAction.text, 
            variant = l_ButtonVariant_0.Emphasis, 
            onActivated = v65, 
            ref = v51
        });
        return v67;
    end, {
        v65, 
        v47.primaryAction, 
        v51
    });
    return v3.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Medium, 
        hasBackdrop = true, 
        closeOnClickOutside = true, 
        onClose = v66, 
        ref = v54
    }, {
        DialogContent = v3.createElement(l_Dialog_0.Content, {}, {
            Content = v3.createElement(l_View_0, {
                tag = "col auto-y size-full-0 gap-medium padding-top-xlarge", 
                LayoutOrder = 1
            }, {
                Image = if v47.imageId and v62 then v3.createElement(l_Image_0, {
                    tag = "size-full-full self-center content-emphasis", 
                    Image = v47.imageId, 
                    aspectRatio = 1.7777777777777777, 
                    sizeConstraint = {
                        MaxSize = v50
                    }
                }) else nil, 
                Badge = if v60 then v3.createElement(v30, {
                    LayoutOrder = 1, 
                    icon = if l_FFlagEnableSocialUpsellUIFixes_0 then {
                        variant = v2.Enums.IconVariant.Filled, 
                        position = v2.Enums.IconPosition.Left, 
                        name = l_IconName_0.Clock
                    } else l_IconName_0.Clock, 
                    text = v60, 
                    variant = l_BadgeVariant_0.Neutral
                }) else nil, 
                TextContainer = v3.createElement(l_View_0, {
                    tag = "col gap-medium size-full-0 auto-y padding-right-xxlarge padding-bottom-xsmall", 
                    LayoutOrder = 2
                }, {
                    Title = if v47.title then v3.createElement(l_View_0, {
                        tag = "size-full-0 auto-y", 
                        LayoutOrder = 2
                    }, {
                        TitleText = v3.createElement(l_Text_0, {
                            Text = v47.title, 
                            tag = "size-full-0 auto-y content-emphasis text-wrap text-align-x-left text-heading-medium"
                        })
                    }) else nil, 
                    BodyText = if v47.bodyText then v3.createElement(l_Text_0, {
                        tag = "size-full-0 auto-y text-wrap text-align-x-left text-body-medium", 
                        Text = v47.bodyText, 
                        LayoutOrder = 3
                    }) else nil
                })
            })
        }), 
        DialogActions = v3.createElement(l_Dialog_0.Actions, {
            LayoutOrder = v60 and 3 or 4, 
            actions = v68
        })
    });
end;