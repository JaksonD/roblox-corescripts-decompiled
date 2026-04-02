local l_Parent_0 = script:FindFirstAncestor("TrustedContacts").Parent;
local v1 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_OpenAmpWizardContainer_0 = require(l_Parent_0.AmpUpsell).OpenAmpWizardContainer;
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local v7 = require(l_Parent_0.Foundation);
local l_ButtonVariant_0 = v7.Enums.ButtonVariant;
local l_Dialog_0 = v7.Dialog;
local l_DialogSize_0 = v7.Enums.DialogSize;
local v11 = require(script.Parent.Parent.Parent.Analytics);
local l_useTCAnalytics_0 = v11.useTCAnalytics;
local l_EventNames_0 = v11.EventNames;
local l_Contexts_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Contexts;
local l_FStringConnectionGraphCoreAmpNameSpace_0 = require(l_Parent_0.SharedFlags).FStringConnectionGraphCoreAmpNameSpace;
local l_FFlagTCUpdateProfileCTAButton_0 = require(l_Parent_0.SharedFlags).FFlagTCUpdateProfileCTAButton;
local v17 = game:DefineFastFlag("TCUpdateProfileCTAButtonFix", false);
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local function v34(v19) --[[ Line: 34 ]] --[[ Name: TrustedFriendsVPCPrologue ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_useTCAnalytics_0 (copy), v1 (copy), l_EventNames_0 (copy), l_NavigateBack_0 (copy), l_FFlagTCUpdateProfileCTAButton_0 (copy), l_FStringConnectionGraphCoreAmpNameSpace_0 (copy), l_Contexts_0 (copy), l_OpenAmpWizardContainer_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_ButtonVariant_0 (copy)
    local v20 = l_useNavigation_0();
    local v21 = l_useDispatch_0();
    local v22 = l_useLocalization_0({
        cancel = "CommonUI.Controls.Action.Cancel", 
        ask = "Feature.Friends.Label.Ask", 
        askYourParent = "Feature.Friends.Label.AskYourParent", 
        vpcRequired = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.AddFriendVPC" or "Feature.Friends.Label.AddConnectionVPC"
    });
    local l_fireAnalyticsEvent_0 = l_useTCAnalytics_0({
        friendId = v19.userId
    }).fireAnalyticsEvent;
    local v24 = v1.useCallback(function() --[[ Line: 51 ]]
        -- upvalues: v20 (copy)
        v20.pop();
    end, {
        v20
    });
    local v25 = v1.useCallback(function() --[[ Line: 55 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v24 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TrustedFriendsVPCCancelClicked);
        v24();
    end, {
        v24, 
        l_fireAnalyticsEvent_0
    });
    local v28 = v1.useCallback(function(_, _) --[[ Line: 60 ]]
        -- upvalues: v21 (copy), l_NavigateBack_0 (ref), l_FFlagTCUpdateProfileCTAButton_0 (ref), v19 (copy)
        v21(l_NavigateBack_0(true));
        if l_FFlagTCUpdateProfileCTAButton_0 and v19.completionCallback then
            v19.completionCallback();
        end;
    end, {
        v21, 
        if l_FFlagTCUpdateProfileCTAButton_0 then v19.completionCallback else nil
    });
    local v33 = v1.useCallback(function() --[[ Line: 68 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v24 (copy), l_FStringConnectionGraphCoreAmpNameSpace_0 (ref), v19 (copy), l_Contexts_0 (ref), v21 (copy), l_OpenAmpWizardContainer_0 (ref), v28 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TrustedFriendsVPCAskClicked);
        v24();
        local l_l_FStringConnectionGraphCoreAmpNameSpace_0_0 = l_FStringConnectionGraphCoreAmpNameSpace_0;
        local v30 = {
            targetUserId = v19.userId
        };
        local v31 = {
            {
                name = "targetUser", 
                type = "UserId", 
                value = v19.userId
            }
        };
        local l_TrustedFriendsVPCPrologue_0 = l_Contexts_0.TrustedFriendsVPCPrologue;
        v21(l_OpenAmpWizardContainer_0("TriggerTrustedFriendVPCRecourse", v28, v30, l_TrustedFriendsVPCPrologue_0, v31, l_l_FStringConnectionGraphCoreAmpNameSpace_0_0));
    end, {
        v21, 
        l_fireAnalyticsEvent_0, 
        v24
    });
    return v1.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Small
    }, {
        Title = v1.createElement(l_Dialog_0.Title, {
            LayoutOrder = 1, 
            text = v22.askYourParent
        }), 
        Content = v1.createElement(l_Dialog_0.Content, {
            LayoutOrder = 2
        }, {
            Text = v1.createElement(l_Dialog_0.Text, {
                Text = v22.vpcRequired
            })
        }), 
        Buttons = v1.createElement(l_Dialog_0.Actions, {
            LayoutOrder = 3, 
            actions = {
                {
                    text = v22.ask, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = v33
                }, 
                {
                    text = v22.cancel, 
                    variant = l_ButtonVariant_0.Standard, 
                    onActivated = v25
                }
            }
        })
    });
end;
return {
    Screen = function(v35) --[[ Line: 122 ]]
        -- upvalues: v1 (copy), v34 (copy), v17 (copy)
        return v1.createElement(v34, {
            userId = v35.navigation.getParam("userId"), 
            completionCallback = if v17 then v35.navigation.getParam("completionCallback") else nil
        });
    end
};