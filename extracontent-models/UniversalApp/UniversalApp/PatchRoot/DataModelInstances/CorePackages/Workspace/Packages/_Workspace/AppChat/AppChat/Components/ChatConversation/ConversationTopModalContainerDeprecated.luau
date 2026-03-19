local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.React);
local v6 = require(l_script_FirstAncestor_0.Utils.getDeepValue2);
local l_memo_0 = v5.memo;
local v8 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_useCallback_0 = v5.useCallback;
local v10 = require(l_script_FirstAncestor_0.Hooks.useConversationTopModal);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v5.useEffect;
local l_useRef_0 = v5.useRef;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_AccessResponseEnum_0 = require(l_Parent_0.AmpUpsell).AmpEnums.AccessResponseEnum;
local v17 = require(l_Parent_0.AppChatNetworking);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v20 = require(l_script_FirstAncestor_0.Conversations.Actions.DismissedConversationTopModal);
local v21 = require(l_script_FirstAncestor_0.EnumScreens);
local v22 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v25 = require(l_script_FirstAncestor_0.Conversations.Thunks.refreshAllUnfilteredThreadsDetails);
local v26 = require(l_script_FirstAncestor_0.Components.UnfilteredThreadsAMPFeatureName);
local v27 = require(script.Parent.ConversationModal.ConversationModal);
local v28 = require(script.Parent.ConversationBanner.ConversationBannerDeprecated);
local v30 = {
    conversation = {}, 
    navigateToScreen = function(...) --[[ Line: 46 ]] --[[ Name: navigateToScreen ]]

    end, 
    setModalHeight = function(_) --[[ Line: 47 ]] --[[ Name: setModalHeight ]]

    end
};
local v31 = {
    conversation_banner_group_phone_verification = true, 
    conversation_banner_group_duplicate_upgrade = true, 
    conversation_banner_learn_more = true, 
    conversation_banner_one_to_one_phone_verification = true
};
local l_CreateUnfilteredChatPartialModal_0 = v21.CreateUnfilteredChatPartialModal;
local l_LearnMorePartialModal_0 = v21.LearnMorePartialModal;
local v34 = {
    conversation_banner_group_phone_verification = "ConversationPvBanner", 
    conversation_banner_one_to_one_phone_verification = "ConversationPvBanner", 
    conversation_banner_group_duplicate_upgrade = "ConversationUpgradeBanner", 
    conversation_banner_learn_more = "ConversationLearnMoreBanner"
};
return l_memo_0(function(v35) --[[ Line: 67 ]] --[[ Name: ConversationTopModalContainer ]]
    -- upvalues: v4 (copy), v30 (copy), l_useStyle_0 (copy), v8 (copy), l_useDispatch_0 (copy), l_useRef_0 (copy), l_useEffect_0 (copy), l_useSelector_0 (copy), v6 (copy), v10 (copy), v34 (copy), v31 (copy), l_useCallback_0 (copy), v22 (copy), v17 (copy), v20 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v26 (copy), l_NavigateBack_0 (copy), l_AccessResponseEnum_0 (copy), v25 (copy), l_CreateUnfilteredChatPartialModal_0 (copy), l_LearnMorePartialModal_0 (copy), v5 (copy), v28 (copy), v27 (copy), v2 (copy)
    local v36 = v4.Dictionary.union(v30, v35);
    local v37 = l_useStyle_0();
    local v38 = v8();
    local v39 = l_useDispatch_0();
    local l_Size_500_0 = v37.Tokens.Global.Size_500;
    local v41 = l_useRef_0(v36.setModalHeight);
    l_useEffect_0(function() --[[ Line: 76 ]]
        -- upvalues: v41 (copy), v36 (copy)
        v41.current = v36.setModalHeight;
    end, {
        v36.setModalHeight
    });
    l_useEffect_0(function() --[[ Line: 79 ]]
        -- upvalues: v41 (copy)
        return function() --[[ Line: 80 ]]
            -- upvalues: v41 (ref)
            if v41.current then
                v41.current(0);
            end;
        end;
    end, {});
    local v43 = l_useSelector_0(function(v42) --[[ Line: 87 ]]
        -- upvalues: v6 (ref), v36 (copy)
        return v6(v42, (("ChatAppReducer.Modals.conversationTopModalsDismissed.%*"):format(v36.conversation.id))) or {};
    end);
    local v44 = v10(v36.conversation.id) or {};
    local l_modal_variant_0 = v44.modal_variant;
    local v46 = v6(v44, "modal_layout.id");
    local v47 = v6(v44, "modal_layout.seen_record_action");
    local v48 = v6(v44, "modal_layout.dismiss_record_action");
    local v49 = v34[l_modal_variant_0];
    local v50 = v31[l_modal_variant_0] and not v43[l_modal_variant_0];
    local v51 = v6(v44, "modal_layout.buttons");
    local v52 = v51 and v51[1];
    local v53 = v51 and v51[2];
    local v54 = l_useCallback_0(function() --[[ Line: 103 ]]
        -- upvalues: v38 (copy), v49 (copy), v22 (ref), v36 (copy)
        if v38 and v49 then
            v38.fireAnalyticsEvent(v22[("%*ActionClicked"):format(v49)], {
                conversationId = v36.conversation.id
            });
        end;
    end, {
        v38, 
        v49, 
        v36.conversation.id
    });
    local v56 = l_useCallback_0(function() --[[ Line: 111 ]]
        -- upvalues: v39 (copy), v17 (ref), v48 (copy), v46 (copy), v20 (ref), v36 (copy), l_modal_variant_0 (copy)
        v39(v17.rodux.RecordModalSequenceResponse.API(v48, "conversation_top_modal", v46)):catch(function(v55) --[[ Line: 118 ]]
            warn("Error in ConversationTopModalContainer -> RecordModalSequenceResponse dismissed: " .. tostring(v55));
        end);
        v39(v20(v36.conversation.id, l_modal_variant_0));
    end, {
        v39, 
        v48, 
        l_modal_variant_0, 
        v46, 
        v36.conversation.id
    });
    local v59 = l_useCallback_0(function() --[[ Line: 123 ]]
        -- upvalues: v54 (copy), v39 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v26 (ref), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), v25 (ref), v36 (copy)
        v54();
        v39(l_NavigateDown_0({
            name = l_AppPage_0.AmpWizardContainer, 
            extraProps = {
                featureName = v26, 
                completionCallback = function(v57, _) --[[ Line: 129 ]] --[[ Name: completionCallback ]]
                    -- upvalues: v39 (ref), l_NavigateBack_0 (ref), l_AccessResponseEnum_0 (ref), v25 (ref), v36 (ref)
                    v39(l_NavigateBack_0(true));
                    if v57 == l_AccessResponseEnum_0.Granted then
                        v39(v25(v36.conversation.id));
                    end;
                end
            }
        }));
    end, {
        v54, 
        v39, 
        v36.conversation.id
    });
    local v60 = l_useCallback_0(function() --[[ Line: 140 ]]
        -- upvalues: v54 (copy), v36 (copy), l_CreateUnfilteredChatPartialModal_0 (ref)
        v54();
        v36.navigateToScreen(l_CreateUnfilteredChatPartialModal_0, {}, true);
    end, {
        v36.navigateToScreen, 
        v54
    });
    local v61 = l_useCallback_0(function() --[[ Line: 144 ]]
        -- upvalues: v54 (copy), v36 (copy), l_LearnMorePartialModal_0 (ref)
        v54();
        v36.navigateToScreen(l_LearnMorePartialModal_0, {}, true);
    end, {
        v36.navigateToScreen, 
        v54
    });
    l_useEffect_0(function() --[[ Line: 150 ]]
        -- upvalues: v50 (copy), v39 (copy), v17 (ref), v47 (copy), v46 (copy)
        if v50 then
            v39(v17.rodux.RecordModalSequenceResponse.API(v47, "conversation_top_modal", v46)):catch(function(v62) --[[ Line: 158 ]]
                warn("Error in ConversationTopModalContainer -> RecordModalSequenceResponse seen: " .. tostring(v62));
            end);
        end;
    end, {
        v39, 
        v50, 
        v47, 
        v46, 
        v36.conversation.id
    });
    l_useEffect_0(function() --[[ Line: 175 ]]
        -- upvalues: v50 (copy), v38 (copy), v49 (copy), v22 (ref), v36 (copy)
        if v50 and v38 and v49 then
            v38.fireAnalyticsEvent(v22[("%*Rendered"):format(v49)], {
                conversationId = v36.conversation.id
            });
        end;
    end, {
        v50, 
        v38, 
        v49, 
        v36.conversation.id
    });
    local v63 = ({
        conversation_banner_group_phone_verification = v59, 
        conversation_banner_one_to_one_phone_verification = v59, 
        conversation_banner_group_duplicate_upgrade = v60
    })[l_modal_variant_0];
    local v64 = nil;
    if v50 then
        v64 = if l_modal_variant_0 == "conversation_banner_learn_more" then v5.createElement(v28, {
            actionText = if v52 then v52.text else nil, 
            bodyText = v6(v44, "modal_layout.body.text"), 
            height = l_Size_500_0, 
            onActivated = v61, 
            style = v37
        }) else v5.createElement(v27, {
            bodyText = v6(v44, "modal_layout.body.text"), 
            denyText = if v52 then v52.text else nil, 
            acceptText = if v53 and v63 then v53.text else nil, 
            paddingTop = v37.Tokens.Global.Space_150, 
            paddingBottom = v37.Tokens.Global.Space_150, 
            verticalSpacing = v37.Tokens.Global.Space_150, 
            onAccepted = v63, 
            onDenied = v56, 
            style = v37
        });
    elseif l_modal_variant_0 ~= "none" and l_modal_variant_0 ~= nil and not v31[l_modal_variant_0] then
        warn("Unsupported ConversationTopModal variant: " .. l_modal_variant_0);
    end;
    return v5.createElement(v2.View, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0), 
        LayoutOrder = v36.layoutOrder, 
        onAbsoluteSizeChanged = function(v65) --[[ Line: 229 ]] --[[ Name: onAbsoluteSizeChanged ]]
            -- upvalues: v36 (copy)
            v36.setModalHeight(v65.AbsoluteSize.Y);
        end
    }, {
        conversationTopModal = v64
    });
end);