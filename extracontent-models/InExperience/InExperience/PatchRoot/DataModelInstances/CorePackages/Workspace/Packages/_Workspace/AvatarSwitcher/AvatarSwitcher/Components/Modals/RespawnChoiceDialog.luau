local l_SessionService_0 = game:GetService("SessionService");
local l_Parent_0 = script:FindFirstAncestor("AvatarSwitcher").Parent;
local v2 = require(l_Parent_0.Foundation);
local l_Orientation_0 = v2.Enums.Orientation;
local l_Dialog_0 = v2.Dialog;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_DialogSize_0 = v2.Enums.DialogSize;
local v7 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v9 = require(l_Parent_0.AvatarExperienceAnalytics);
local l_addUnifiedEventLogging_0 = v9.addUnifiedEventLogging;
local l_UnifiedEventLogEnums_0 = v9.UnifiedEventLogEnums;
local l_UnifiedLoggingSurface_0 = require(l_Parent_0.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface;
return function(v13) --[[ Line: 31 ]] --[[ Name: RespawnChoiceDialog ]]
    -- upvalues: v7 (copy), l_useLocalization_0 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_UnifiedLoggingSurface_0 (copy), l_SessionService_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_Orientation_0 (copy), l_ButtonVariant_0 (copy)
    local v14 = v7.useRef(nil);
    local v15 = v7.useRef(nil);
    local v16 = l_useLocalization_0({
        headerText = "Feature.AvatarSwitcher.Heading.RespawnToSwitch", 
        contentText = "Feature.AvatarSwitcher.Label.RespawnLater", 
        respawnText = "Feature.AvatarSwitcher.Action.Respawn", 
        respawnLaterText = "Feature.AvatarSwitcher.Action.RespawnLater"
    });
    v7.useEffect(function() --[[ Line: 42 ]]
        -- upvalues: l_addUnifiedEventLogging_0 (ref), v14 (copy), l_UnifiedEventLogEnums_0 (ref), l_UnifiedLoggingSurface_0 (ref), l_SessionService_0 (ref), v15 (copy)
        l_addUnifiedEventLogging_0(v14, {
            action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
            surface = l_UnifiedLoggingSurface_0.IN_EXPERIENCE_AVATAR_SWITCHER, 
            elementName = "CONFIRM_SWITCH_AVATAR_BUTTON"
        }, {
            sessionTagName = l_SessionService_0:GetSessionTag("level2a")
        });
        l_addUnifiedEventLogging_0(v15, {
            action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
            surface = l_UnifiedLoggingSurface_0.IN_EXPERIENCE_AVATAR_SWITCHER, 
            elementName = "DEFER_SWITCH_AVATAR_BUTTON"
        }, {
            sessionTagName = l_SessionService_0:GetSessionTag("level2a")
        });
    end, {});
    return v7.createElement(l_Dialog_0.Root, {
        disablePortal = false, 
        size = l_DialogSize_0.Small, 
        hasBackdrop = true, 
        onClose = v13.onClose
    }, {
        DialogTitle = v7.createElement(l_Dialog_0.Title, {
            text = v16.headerText
        }), 
        DialogContent = v7.createElement(l_Dialog_0.Content, nil, {
            DialogText = v7.createElement(l_Dialog_0.Text, {
                Text = v16.contentText
            })
        }), 
        DialogActions = v7.createElement(l_Dialog_0.Actions, {
            orientation = l_Orientation_0.Vertical, 
            actions = {
                {
                    text = v16.respawnText, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = v13.onConfirm, 
                    ref = v14
                }, 
                {
                    text = v16.respawnLaterText, 
                    variant = l_ButtonVariant_0.Standard, 
                    onActivated = v13.onDefer, 
                    ref = v15
                }
            }
        })
    });
end;