local l_script_FirstAncestor_0 = script:FindFirstAncestor("TrustedContacts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_OpenAmpWizardContainer_0 = require(l_Parent_0.AmpUpsell).OpenAmpWizardContainer;
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local v8 = require(l_Parent_0.Foundation);
local l_ButtonVariant_0 = v8.Enums.ButtonVariant;
local l_Dialog_0 = v8.Dialog;
local l_DialogSize_0 = v8.Enums.DialogSize;
local v12 = require(script.Parent.Parent.Parent.Analytics);
local l_useTCAnalytics_0 = v12.useTCAnalytics;
local l_EventNames_0 = v12.EventNames;
local l_Contexts_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Contexts;
local l_FStringConnectionGraphCoreAmpNameSpace_0 = require(l_Parent_0.SharedFlags).FStringConnectionGraphCoreAmpNameSpace;
local l_FFlagTCUpdateProfileCTAButton_0 = require(l_Parent_0.SharedFlags).FFlagTCUpdateProfileCTAButton;
local l_FFlagTCUnifyNavigationEntry_0 = require(l_Parent_0.SharedFlags).FFlagTCUnifyNavigationEntry;
local v19 = game:DefineFastFlag("TCUpdateProfileCTAButtonFix", false);
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local function v37(v22) --[[ Line: 40 ]] --[[ Name: TrustedFriendsVPCPrologue ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_useTCAnalytics_0 (copy), v2 (copy), l_FFlagTCUnifyNavigationEntry_0 (copy), l_EventNames_0 (copy), l_NavigateBack_0 (copy), l_FFlagTCUpdateProfileCTAButton_0 (copy), l_FStringConnectionGraphCoreAmpNameSpace_0 (copy), l_Contexts_0 (copy), l_OpenAmpWizardContainer_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_ButtonVariant_0 (copy)
    local v23 = l_useNavigation_0();
    local v24 = l_useDispatch_0();
    local v25 = l_useLocalization_0({
        cancel = "CommonUI.Controls.Action.Cancel", 
        ask = "Feature.Friends.Label.Ask", 
        askYourParent = "Feature.Friends.Label.AskYourParent", 
        vpcRequired = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.AddFriendVPC" or "Feature.Friends.Label.AddConnectionVPC"
    });
    local l_fireAnalyticsEvent_0 = l_useTCAnalytics_0({
        friendId = v22.userId
    }).fireAnalyticsEvent;
    local v27 = v2.useCallback(function() --[[ Line: 57 ]]
        -- upvalues: l_FFlagTCUnifyNavigationEntry_0 (ref), v22 (copy), v23 (copy)
        if l_FFlagTCUnifyNavigationEntry_0 then
            v22.externalNavigation.closeModal();
            return;
        else
            v23.pop();
            return;
        end;
    end, {
        v23, 
        v22.externalNavigation
    });
    local v28 = v2.useCallback(function() --[[ Line: 65 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v27 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TrustedFriendsVPCCancelClicked);
        v27();
    end, {
        v27, 
        l_fireAnalyticsEvent_0
    });
    local v31 = v2.useCallback(function(_, _) --[[ Line: 70 ]]
        -- upvalues: l_FFlagTCUnifyNavigationEntry_0 (ref), v24 (copy), l_NavigateBack_0 (ref), l_FFlagTCUpdateProfileCTAButton_0 (ref), v22 (copy)
        if not l_FFlagTCUnifyNavigationEntry_0 then
            v24(l_NavigateBack_0(true));
        end;
        if l_FFlagTCUpdateProfileCTAButton_0 and v22.completionCallback then
            v22.completionCallback();
        end;
    end, {
        v24, 
        if l_FFlagTCUpdateProfileCTAButton_0 then v22.completionCallback else nil
    });
    local v36 = v2.useCallback(function() --[[ Line: 82 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v27 (copy), l_FStringConnectionGraphCoreAmpNameSpace_0 (ref), v22 (copy), l_Contexts_0 (ref), l_FFlagTCUnifyNavigationEntry_0 (ref), v31 (copy), v24 (copy), l_OpenAmpWizardContainer_0 (ref)
        l_fireAnalyticsEvent_0(l_EventNames_0.TrustedFriendsVPCAskClicked);
        v27();
        local l_l_FStringConnectionGraphCoreAmpNameSpace_0_0 = l_FStringConnectionGraphCoreAmpNameSpace_0;
        local v33 = {
            targetUserId = v22.userId
        };
        local v34 = {
            {
                name = "targetUser", 
                type = "UserId", 
                value = v22.userId
            }
        };
        local l_TrustedFriendsVPCPrologue_0 = l_Contexts_0.TrustedFriendsVPCPrologue;
        if l_FFlagTCUnifyNavigationEntry_0 then
            v22.externalNavigation.openAmpWizard({
                featureName = "TriggerTrustedFriendVPCRecourse", 
                completionCallback = v31, 
                recourseData = v33, 
                entryPointEventCtx = l_TrustedFriendsVPCPrologue_0, 
                extraParameters = v34, 
                nameSpace = l_l_FStringConnectionGraphCoreAmpNameSpace_0_0
            });
            return;
        else
            v24(l_OpenAmpWizardContainer_0("TriggerTrustedFriendVPCRecourse", v31, v33, l_TrustedFriendsVPCPrologue_0, v34, l_l_FStringConnectionGraphCoreAmpNameSpace_0_0));
            return;
        end;
    end, {
        v24, 
        l_fireAnalyticsEvent_0, 
        v27, 
        if l_FFlagTCUnifyNavigationEntry_0 then v22.externalNavigation.openAmpWizard else nil
    });
    return v2.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Small
    }, {
        Title = v2.createElement(l_Dialog_0.Title, {
            LayoutOrder = 1, 
            text = v25.askYourParent
        }), 
        Content = v2.createElement(l_Dialog_0.Content, {
            LayoutOrder = 2
        }, {
            Text = v2.createElement(l_Dialog_0.Text, {
                Text = v25.vpcRequired
            })
        }), 
        Buttons = v2.createElement(l_Dialog_0.Actions, {
            LayoutOrder = 3, 
            actions = {
                {
                    text = v25.ask, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = v36
                }, 
                {
                    text = v25.cancel, 
                    variant = l_ButtonVariant_0.Standard, 
                    onActivated = v28
                }
            }
        })
    });
end;
return {
    Screen = function(v38) --[[ Line: 150 ]]
        -- upvalues: v2 (copy), v37 (copy), v19 (copy), l_FFlagTCUnifyNavigationEntry_0 (copy)
        return v2.createElement(v37, {
            userId = v38.navigation.getParam("userId"), 
            completionCallback = if v19 then v38.navigation.getParam("completionCallback") else nil, 
            externalNavigation = if l_FFlagTCUnifyNavigationEntry_0 then v38.screenProps.externalNavigation else nil
        });
    end
};