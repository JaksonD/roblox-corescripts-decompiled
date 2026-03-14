local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Common.Enums);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v5 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_StyledTextLabel_0 = v5.App.Text.StyledTextLabel;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigationProps_0 = require(l_Parent_0.RobloxAppNavigation).useNavigationProps;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v14 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v18 = require(l_script_FirstAncestor_0.Networking.getProfilePlatform);
local v19 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v20 = require(l_script_FirstAncestor_0.Hooks.getAvailableCommunityComponents);
return function() --[[ Line: 29 ]]
    -- upvalues: l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), v19 (copy), l_useScreenSize_0 (copy), l_useLocalization_0 (copy), v14 (copy), l_useNavigationProps_0 (copy), v2 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_UrlBuilder_0 (copy), v18 (copy), v20 (copy), v3 (copy), l_InteractiveAlert_0 (copy), l_StyledTextLabel_0 (copy), l_ButtonType_0 (copy)
    local v21 = l_useStyle_0();
    local v22 = l_useDispatch_0();
    local v23 = l_useNavigation_0();
    local v24 = v19();
    local v25 = l_useScreenSize_0();
    local l_profileType_0 = v24.profileType;
    local l_profileId_0 = v24.profileId;
    local v28 = l_useLocalization_0({
        continue = v14.Continue, 
        cancel = v14.Cancel, 
        verificationRequired = v14.VerificationRequired, 
        contentTextHigh = v14.ContentTextHigh, 
        contentTextMedium = v14.ContentTextMedium, 
        contentTextLow = v14.ContentTextLow
    });
    local v31 = l_useNavigationProps_0(function(_, v30) --[[ Line: 48 ]]
        return {
            disabledReason = v30.disabledReason
        };
    end);
    local v32 = v2.useCallback(function() --[[ Line: 54 ]]
        -- upvalues: v22 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), v28 (copy), v23 (copy), v18 (ref), l_profileType_0 (copy), l_profileId_0 (copy), v20 (ref)
        v22(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = l_UrlBuilder_0.static.settings.account(), 
            extraProps = {
                title = v28.verificationRequired, 
                onClose = function() --[[ Line: 60 ]] --[[ Name: onClose ]]
                    -- upvalues: v23 (ref), v22 (ref), v18 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v20 (ref)
                    v23.goBack();
                    v22(v18.API({
                        profileType = l_profileType_0, 
                        profileId = l_profileId_0, 
                        components = v20(), 
                        includeComponentOrdering = true
                    }));
                end
            }
        }));
    end, {
        v22, 
        v28, 
        v23
    });
    local v33 = v2.useCallback(function() --[[ Line: 73 ]]
        -- upvalues: v23 (copy)
        v23.goBack();
    end, {
        v23
    });
    local v34 = {
        [v3.DisabledReasons.InsufficientVerificationLevelHigh] = v28.contentTextHigh, 
        [v3.DisabledReasons.InsufficientVerificationLevelMedium] = v28.contentTextMedium, 
        [v3.DisabledReasons.InsufficientVerificationLevelLow] = v28.contentTextLow
    };
    return v2.createElement(l_InteractiveAlert_0, {
        title = v28.verificationRequired, 
        screenSize = v25, 
        middleContent = function() --[[ Line: 87 ]] --[[ Name: middleContent ]]
            -- upvalues: v2 (ref), l_StyledTextLabel_0 (ref), v34 (copy), v31 (copy), v21 (copy)
            return v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                Content = v2.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 1, 
                    text = v34[v31.disabledReason], 
                    fontStyle = v21.Font.Body, 
                    colorStyle = v21.Theme.TextDefault, 
                    size = UDim2.fromScale(1, 0), 
                    automaticSize = Enum.AutomaticSize.Y, 
                    fluidSizing = false
                })
            });
        end, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = v33, 
                        text = v28.cancel
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v32, 
                        text = v28.continue
                    }
                }
            }, 
            forcedFillDirection = Enum.FillDirection.Horizontal
        }
    });
end;