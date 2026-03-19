local l_script_FirstAncestor_0 = script:FindFirstAncestor("LandingPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.UserLib);
local l_getRbxthumbWithTypeSizeAndOptions_0 = v4.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Constants_0 = v4.Utils.Constants;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_GetFFlagEnableAccountCarouselEvents_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAccountCarouselEvents;
local v9 = require(l_Parent_0.AuthAnalytics);
local l_EventStreamConstants_0 = v9.EventStreamConstants;
local l_authButtonClick_0 = v9.Events.authButtonClick;
local l_AccountCarouselAvatarScaleFactor_0 = require(l_script_FirstAncestor_0.Constants.LandingPageConstants).Common.AccountCarouselAvatarScaleFactor;
return (v2.forwardRef(function(v13, v14) --[[ Line: 36 ]]
    -- upvalues: l_useLocalization_0 (copy), v2 (copy), v3 (copy), l_GetFFlagEnableAccountCarouselEvents_0 (copy), l_authButtonClick_0 (copy), l_EventStreamConstants_0 (copy), l_AccountCarouselAvatarScaleFactor_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy)
    local v15 = l_useLocalization_0({
        signedOut = "Authentication.AccountPicker.Label.SignedOut"
    });
    local v16 = "@" .. v13.accountInfo.username;
    if not v13.accountInfo.has_valid_session then
        v16 = "@" .. v13.accountInfo.username .. " \226\128\162 " .. v15.signedOut;
    end;
    return v2.createElement(v3.View, {
        ref = v14, 
        onActivated = function() --[[ Line: 46 ]] --[[ Name: onActivated ]]
            -- upvalues: l_GetFFlagEnableAccountCarouselEvents_0 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v13 (copy)
            if l_GetFFlagEnableAccountCarouselEvents_0() then
                l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreen, l_EventStreamConstants_0.Button.AccountPickerAccountSelected, v13.accountInfo.user_id, nil);
            end;
            v13.onActivated();
        end, 
        Size = UDim2.new(0, v13.avatarSize.X.Offset * l_AccountCarouselAvatarScaleFactor_0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        tag = "col align-x-center padding-bottom-large", 
        onAbsoluteSizeChanged = function(_) --[[ Line: 60 ]] --[[ Name: onAbsoluteSizeChanged ]]
            -- upvalues: v13 (copy), l_AccountCarouselAvatarScaleFactor_0 (ref)
            local v18 = v13.avatarSize.Y.Offset * l_AccountCarouselAvatarScaleFactor_0 + 40 + 40;
            v13.setAvatarElementHeightForParent(v18);
        end, 
        stateLayer = {
            affordance = v3.Enums.StateLayerAffordance.None
        }
    }, {
        AvatarImage = v2.createElement(v3.Image, {
            Size = v13.avatarSize, 
            ImageRect = v13.avatarSize, 
            Image = l_getRbxthumbWithTypeSizeAndOptions_0(tostring(v13.accountInfo.user_id), l_Constants_0.RbxthumbTypes.Avatar, 352), 
            ScaleType = Enum.ScaleType.Crop, 
            LayoutOrder = 1, 
            scale = if v13.isHighlighted then l_AccountCarouselAvatarScaleFactor_0 else 1, 
            imageStyle = if not v13.isHighlighted then {
                Transparency = 0.5
            } else {}
        }), 
        DisplayName = v2.createElement(v3.Text, {
            Text = v13.accountInfo.display_name, 
            textStyle = {
                Transparency = v13.isHighlighted and 0 or 1
            }, 
            LayoutOrder = 3, 
            tag = "auto-xy text-align-x-center text-heading-medium content-emphasis"
        }), 
        Username = v2.createElement(v3.Text, {
            Text = v16, 
            textStyle = {
                Transparency = v13.isHighlighted and 0 or 1
            }, 
            LayoutOrder = 4, 
            tag = "auto-xy text-align-x-center text-body-medium content-muted padding-bottom-large"
        })
    });
end));