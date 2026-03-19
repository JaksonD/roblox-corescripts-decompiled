local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.AppChatNetworking);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_script_FirstAncestor_0.LuaAppNavigationContext);
local v6 = require(l_Parent_0.React);
local v7 = require(l_script_FirstAncestor_0.Utils.getDeepValue2);
local l_memo_0 = v6.memo;
local l_useCallback_0 = v6.useCallback;
local l_useContext_0 = v6.useContext;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v6.useEffect;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v17 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_AccessResponseEnum_0 = require(l_Parent_0.AmpUpsell).AmpEnums.AccessResponseEnum;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v22 = require(l_script_FirstAncestor_0.Conversations.Thunks.refreshAllUnfilteredThreadsDetails);
local v23 = require(l_script_FirstAncestor_0.Components.UnfilteredThreadsAMPFeatureName);
local v24 = require(script.Parent.Parent.ConversationModal.ConversationModal);
local v25 = {
    showNetworkErrorToast = function() --[[ Line: 42 ]] --[[ Name: showNetworkErrorToast ]]

    end, 
    onHeightChanged = function() --[[ Line: 43 ]] --[[ Name: onHeightChanged ]]

    end
};
local v26 = {
    pending_state_phone_verify = true, 
    pending_state_ineligible = true
};
local v27 = {
    pending_state_phone_verify = "ConversationPvUpsell", 
    pending_state_ineligible = "ConversationIneligibleModal"
};
PendingStateModalContainer = function(v28) --[[ Line: 57 ]] --[[ Name: PendingStateModalContainer ]]
    -- upvalues: v4 (copy), v25 (copy), l_useLocalUserId_0 (copy), v17 (copy), l_useContext_0 (copy), v5 (copy), l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), v7 (copy), v27 (copy), v26 (copy), l_useEffectOnMount_0 (copy), l_useEffect_0 (copy), v3 (copy), l_useCallback_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v23 (copy), l_NavigateBack_0 (copy), l_AccessResponseEnum_0 (copy), v22 (copy), v6 (copy), v24 (copy)
    local v29 = v4.Dictionary.union(v25, v28);
    local v30 = l_useLocalUserId_0();
    local v31 = v17();
    local v32 = l_useContext_0(v5);
    local v33 = l_useNavigation_0();
    local v34 = l_useDispatch_0();
    local v36 = l_useSelector_0(function(v35) --[[ Line: 66 ]]
        -- upvalues: v7 (ref), v29 (copy)
        return v7(v35, (("ChatAppReducer.Modals.pendingStateModals.%*"):format(v29.conversationId)));
    end) or {};
    local l_modal_variant_0 = v36.modal_variant;
    local v38 = v7(v36, "modal_layout.id");
    local v39 = v7(v36, "modal_layout.seen_record_action");
    local v40 = v27[l_modal_variant_0];
    local v41 = v26[l_modal_variant_0];
    local v42 = v7(v36, "modal_layout.buttons");
    local v43 = v42 and v42[1];
    local v44 = v42 and v42[2];
    l_useEffectOnMount_0(function() --[[ Line: 79 ]]
        -- upvalues: v31 (copy), v41 (copy), v40 (copy), v29 (copy)
        if v31 and v41 and v40 then
            v31.fireAnalyticsEvent(("%*Rendered"):format(v40), {
                conversationId = v29.conversationId
            });
        end;
    end);
    l_useEffect_0(function() --[[ Line: 88 ]]
        -- upvalues: v41 (copy), v34 (copy), v3 (ref), v39 (copy), v38 (copy)
        if v41 then
            v34(v3.rodux.RecordModalSequenceResponse.API(v39, "pending_state_modal", v38)):catch(function(v45) --[[ Line: 96 ]]
                warn("Error in PendingStateModalContainer -> RecordModalSequenceResponse seen: " .. tostring(v45));
            end);
        end;
    end, {
        v34, 
        v41, 
        v39, 
        v38, 
        v29.conversationId
    });
    local v48 = l_useCallback_0(function(v46, v47) --[[ Line: 110 ]]
        -- upvalues: v34 (copy), v3 (ref)
        return v34(v3.rodux.RemoveUserFromConversation.API(v47, v46));
    end, {
        v34
    });
    local v49 = l_useCallback_0(function() --[[ Line: 114 ]]
        -- upvalues: v31 (copy), v40 (copy), v29 (copy), v33 (copy), v32 (copy)
        if v31 and v40 then
            v31.fireAnalyticsEvent(("%*LearnMoreClicked"):format(v40), {
                conversationId = v29.conversationId
            });
        end;
        if v33 then
            v32.navigateToUnfilteredThreadsLearnMore(v33.navigate);
            return;
        else
            v32.navigateToUnfilteredThreadsLearnMore();
            return;
        end;
    end, {
        v32, 
        v31, 
        v40, 
        v29.conversationId, 
        v33
    });
    local v52 = l_useCallback_0(function() --[[ Line: 126 ]]
        -- upvalues: v31 (copy), v40 (copy), v29 (copy), v34 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v23 (ref), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), v22 (ref)
        if v31 and v40 then
            v31.fireAnalyticsEvent(("%*ContinueClicked"):format(v40), {
                conversationId = v29.conversationId
            });
        end;
        v34(l_NavigateDown_0({
            name = l_AppPage_0.AmpWizardContainer, 
            extraProps = {
                featureName = v23, 
                completionCallback = function(v50, _) --[[ Line: 136 ]] --[[ Name: completionCallback ]]
                    -- upvalues: v34 (ref), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), v31 (ref), v40 (ref), v29 (ref), v22 (ref)
                    v34(l_NavigateBack_0(true));
                    if v50 == l_AccessResponseEnum_0.Granted then
                        if v31 and v40 then
                            v31.fireAnalyticsEvent(("%*Succeeded"):format(v40), {
                                conversationId = v29.conversationId
                            });
                        end;
                        v34(v22(v29.conversationId));
                        return;
                    else
                        if v31 and v40 then
                            v31.fireAnalyticsEvent(("%*Failed"):format(v40), {
                                conversationId = v29.conversationId
                            });
                        end;
                        return;
                    end;
                end
            }
        }));
    end, {
        v34, 
        v40, 
        v31, 
        v29.conversationId
    });
    local v53 = l_useCallback_0(function() --[[ Line: 158 ]]
        -- upvalues: v31 (copy), v40 (copy), v29 (copy), v48 (copy), v30 (copy)
        if v31 and v40 then
            v31.fireAnalyticsEvent(("%*LeftGroup"):format(v40), {
                conversationId = v29.conversationId
            });
        end;
        if v29.conversationId then
            v48(v30, v29.conversationId):catch(function() --[[ Line: 166 ]]
                -- upvalues: v29 (ref)
                v29.showNetworkErrorToast();
            end);
        end;
    end, {
        v30, 
        v29.conversationId, 
        v40, 
        v31, 
        v48, 
        v29.showNetworkErrorToast
    });
    local v54 = ({
        pending_state_phone_verify = v52, 
        pending_state_ineligible = v49
    })[l_modal_variant_0];
    if v41 then
        return v6.createElement(v24, {
            bodyText = v7(v36, "modal_layout.body.text"), 
            acceptText = if v44 and v54 then v44.text else nil, 
            denyText = if v43 then v43.text else nil, 
            layoutOrder = v29.layoutOrder, 
            onAccepted = v54, 
            onDenied = v53, 
            onHeightChanged = v29.onHeightChanged
        });
    else
        if l_modal_variant_0 ~= "none" and l_modal_variant_0 ~= nil and not v26[l_modal_variant_0] then
            warn("Unsupported PendingStateModal variant: " .. l_modal_variant_0);
        end;
        return nil;
    end;
end;
return l_memo_0(PendingStateModalContainer);