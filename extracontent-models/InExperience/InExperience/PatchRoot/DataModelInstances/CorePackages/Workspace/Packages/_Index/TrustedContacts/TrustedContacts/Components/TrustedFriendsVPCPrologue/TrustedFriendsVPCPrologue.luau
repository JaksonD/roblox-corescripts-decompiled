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
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local function v33(v18) --[[ Line: 33 ]] --[[ Name: TrustedFriendsVPCPrologue ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_useTCAnalytics_0 (copy), v1 (copy), l_EventNames_0 (copy), l_NavigateBack_0 (copy), l_FFlagTCUpdateProfileCTAButton_0 (copy), l_FStringConnectionGraphCoreAmpNameSpace_0 (copy), l_Contexts_0 (copy), l_OpenAmpWizardContainer_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_ButtonVariant_0 (copy)
    local v19 = l_useNavigation_0();
    local v20 = l_useDispatch_0();
    local v21 = l_useLocalization_0({
        cancel = "CommonUI.Controls.Action.Cancel", 
        ask = "Feature.Friends.Label.Ask", 
        askYourParent = "Feature.Friends.Label.AskYourParent", 
        vpcRequired = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.AddFriendVPC" or "Feature.Friends.Label.AddConnectionVPC"
    });
    local l_fireAnalyticsEvent_0 = l_useTCAnalytics_0({
        friendId = v18.userId
    }).fireAnalyticsEvent;
    local v23 = v1.useCallback(function() --[[ Line: 50 ]]
        -- upvalues: v19 (copy)
        v19.pop();
    end, {
        v19
    });
    local v24 = v1.useCallback(function() --[[ Line: 54 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v23 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TrustedFriendsVPCCancelClicked);
        v23();
    end, {
        v23, 
        l_fireAnalyticsEvent_0
    });
    local v27 = v1.useCallback(function(_, _) --[[ Line: 59 ]]
        -- upvalues: v20 (copy), l_NavigateBack_0 (ref), l_FFlagTCUpdateProfileCTAButton_0 (ref), v18 (copy)
        v20(l_NavigateBack_0(true));
        if l_FFlagTCUpdateProfileCTAButton_0 and v18.completionCallback then
            v18.completionCallback();
        end;
    end, {
        v20, 
        if l_FFlagTCUpdateProfileCTAButton_0 then v18.completionCallback else nil
    });
    local v32 = v1.useCallback(function() --[[ Line: 67 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v23 (copy), l_FStringConnectionGraphCoreAmpNameSpace_0 (ref), v18 (copy), l_Contexts_0 (ref), v20 (copy), l_OpenAmpWizardContainer_0 (ref), v27 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TrustedFriendsVPCAskClicked);
        v23();
        local l_l_FStringConnectionGraphCoreAmpNameSpace_0_0 = l_FStringConnectionGraphCoreAmpNameSpace_0;
        local v29 = {
            targetUserId = v18.userId
        };
        local v30 = {
            {
                name = "targetUser", 
                type = "UserId", 
                value = v18.userId
            }
        };
        local l_TrustedFriendsVPCPrologue_0 = l_Contexts_0.TrustedFriendsVPCPrologue;
        v20(l_OpenAmpWizardContainer_0("TriggerTrustedFriendVPCRecourse", v27, v29, l_TrustedFriendsVPCPrologue_0, v30, l_l_FStringConnectionGraphCoreAmpNameSpace_0_0));
    end, {
        v20, 
        l_fireAnalyticsEvent_0, 
        v23
    });
    return v1.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Small
    }, {
        Title = v1.createElement(l_Dialog_0.Title, {
            LayoutOrder = 1, 
            text = v21.askYourParent
        }), 
        Content = v1.createElement(l_Dialog_0.Content, {
            LayoutOrder = 2
        }, {
            Text = v1.createElement(l_Dialog_0.Text, {
                Text = v21.vpcRequired
            })
        }), 
        Buttons = v1.createElement(l_Dialog_0.Actions, {
            LayoutOrder = 3, 
            actions = {
                {
                    text = v21.ask, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = v32
                }, 
                {
                    text = v21.cancel, 
                    variant = l_ButtonVariant_0.Standard, 
                    onActivated = v24
                }
            }
        })
    });
end;
return {
    Screen = function(v34) --[[ Line: 121 ]]
        -- upvalues: v1 (copy), v33 (copy)
        return v1.createElement(v33, {
            userId = v34.navigation.getParam("userId")
        });
    end
};