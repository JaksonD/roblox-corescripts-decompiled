local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local v6 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v7 = require(l_script_FirstAncestor_0.Common.Constants);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useNavigationProps_0 = require(l_Parent_0.RobloxAppNavigation).useNavigationProps;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v12 = require(l_script_FirstAncestor_0.Utils.FocusNavigatorWrapper);
local v13 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileFixFocusNavigation);
return function() --[[ Line: 18 ]] --[[ Name: EditSocialNetworksErrorModal ]]
    -- upvalues: l_useNavigationProps_0 (copy), l_useNavigation_0 (copy), l_useScreenSize_0 (copy), l_useLocalization_0 (copy), v6 (copy), v7 (copy), v13 (copy), v12 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v16 = l_useNavigationProps_0(function(_, v15) --[[ Line: 19 ]]
        return {
            errorCode = v15.errorCode
        };
    end);
    local v17 = l_useNavigation_0();
    local v18 = l_useScreenSize_0();
    local v19 = l_useLocalization_0({
        title = v6.SocialNetworksError, 
        InvalidFacebook = v6.InvalidFacebook, 
        InvalidX = v6.InvalidX, 
        InvalidYouTube = v6.InvalidYouTube, 
        InvalidTwitch = v6.InvalidTwitch, 
        InvalidGuilded = v6.InvalidGuilded, 
        OK = v6.OK
    });
    local v20 = ({
        [v7.SocialNetworksErrorCodes.Facebook] = v19.InvalidFacebook, 
        [v7.SocialNetworksErrorCodes.Twitter] = v19.InvalidX, 
        [v7.SocialNetworksErrorCodes.YouTube] = v19.InvalidYouTube, 
        [v7.SocialNetworksErrorCodes.Twitch] = v19.InvalidTwitch, 
        [v7.SocialNetworksErrorCodes.Guilded] = v19.InvalidGuilded
    })[v16.errorCode];
    local function v21() --[[ Line: 45 ]] --[[ Name: onClose ]]
        -- upvalues: v17 (copy)
        v17.goBack();
    end;
    if v13 then
        return v12({
            onClose = v21
        }, {
            v2.createElement(l_InteractiveAlert_0, {
                screenSize = v18, 
                title = v19.title, 
                bodyText = v20, 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = v21, 
                                text = v19.OK
                            }
                        }
                    }
                }
            })
        });
    else
        return v2.createElement(l_InteractiveAlert_0, {
            screenSize = v18, 
            title = v19.title, 
            bodyText = v20, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v21, 
                            text = v19.OK
                        }
                    }
                }
            }
        });
    end;
end;