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
local function v32(v17) --[[ Line: 32 ]] --[[ Name: TrustedFriendsVPCPrologue ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_useTCAnalytics_0 (copy), v1 (copy), l_EventNames_0 (copy), l_NavigateBack_0 (copy), l_FFlagTCUpdateProfileCTAButton_0 (copy), l_FStringConnectionGraphCoreAmpNameSpace_0 (copy), l_Contexts_0 (copy), l_OpenAmpWizardContainer_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_ButtonVariant_0 (copy)
    local v18 = l_useNavigation_0();
    local v19 = l_useDispatch_0();
    local v20 = l_useLocalization_0({
        cancel = "CommonUI.Controls.Action.Cancel", 
        ask = "Feature.Friends.Label.Ask", 
        askYourParent = "Feature.Friends.Label.AskYourParent", 
        vpcRequired = "Feature.Friends.Label.AddConnectionVPC"
    });
    local l_fireAnalyticsEvent_0 = l_useTCAnalytics_0({
        friendId = v17.userId
    }).fireAnalyticsEvent;
    local v22 = v1.useCallback(function() --[[ Line: 47 ]]
        -- upvalues: v18 (copy)
        v18.pop();
    end, {
        v18
    });
    local v23 = v1.useCallback(function() --[[ Line: 51 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v22 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TrustedFriendsVPCCancelClicked);
        v22();
    end, {
        v22, 
        l_fireAnalyticsEvent_0
    });
    local v26 = v1.useCallback(function(_, _) --[[ Line: 56 ]]
        -- upvalues: v19 (copy), l_NavigateBack_0 (ref), l_FFlagTCUpdateProfileCTAButton_0 (ref), v17 (copy)
        v19(l_NavigateBack_0(true));
        if l_FFlagTCUpdateProfileCTAButton_0 and v17.completionCallback then
            v17.completionCallback();
        end;
    end, {
        v19, 
        if l_FFlagTCUpdateProfileCTAButton_0 then v17.completionCallback else nil
    });
    local v31 = v1.useCallback(function() --[[ Line: 64 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v22 (copy), l_FStringConnectionGraphCoreAmpNameSpace_0 (ref), v17 (copy), l_Contexts_0 (ref), v19 (copy), l_OpenAmpWizardContainer_0 (ref), v26 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TrustedFriendsVPCAskClicked);
        v22();
        local l_l_FStringConnectionGraphCoreAmpNameSpace_0_0 = l_FStringConnectionGraphCoreAmpNameSpace_0;
        local v28 = {
            targetUserId = v17.userId
        };
        local v29 = {
            {
                name = "targetUser", 
                type = "UserId", 
                value = v17.userId
            }
        };
        local l_TrustedFriendsVPCPrologue_0 = l_Contexts_0.TrustedFriendsVPCPrologue;
        v19(l_OpenAmpWizardContainer_0("TriggerTrustedFriendVPCRecourse", v26, v28, l_TrustedFriendsVPCPrologue_0, v29, l_l_FStringConnectionGraphCoreAmpNameSpace_0_0));
    end, {
        v19, 
        l_fireAnalyticsEvent_0, 
        v22
    });
    return v1.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Small
    }, {
        Title = v1.createElement(l_Dialog_0.Title, {
            LayoutOrder = 1, 
            text = v20.askYourParent
        }), 
        Content = v1.createElement(l_Dialog_0.Content, {
            LayoutOrder = 2
        }, {
            Text = v1.createElement(l_Dialog_0.Text, {
                Text = v20.vpcRequired
            })
        }), 
        Buttons = v1.createElement(l_Dialog_0.Actions, {
            LayoutOrder = 3, 
            actions = {
                {
                    text = v20.ask, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = v31
                }, 
                {
                    text = v20.cancel, 
                    variant = l_ButtonVariant_0.Standard, 
                    onActivated = v23
                }
            }
        })
    });
end;
return {
    Screen = function(v33) --[[ Line: 118 ]]
        -- upvalues: v1 (copy), v32 (copy)
        return v1.createElement(v32, {
            userId = v33.navigation.getParam("userId")
        });
    end
};