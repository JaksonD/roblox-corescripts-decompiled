local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Rodux);
local v4 = require(l_script_FirstAncestor_0.Logger);
local v5 = require(l_script_FirstAncestor_0.Conversations.Actions.DismissedConversationTopModal);
local v6 = require(l_script_FirstAncestor_0.Conversations.Actions.RemovedConversation);
local v7 = require(l_script_FirstAncestor_0.Conversations.Actions.FriendConversationCreated);
local v8 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v9 = require(l_script_FirstAncestor_0.Conversations.Actions.DismissedChatModal);
local v10 = require(l_script_FirstAncestor_0.Conversations.Actions.DismissedAllConversationModalsForSequence);
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatFae);
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAEGIS1AppChatBanner);
local l_FFlagTCUpsellModalEnabled_DEV_0 = require(l_Parent_0.SharedFlags).FFlagTCUpsellModalEnabled_DEV;
local l_FFlagDebugEnableTCDoubleOptIn_DEV_0 = require(l_Parent_0.SharedFlags).FFlagDebugEnableTCDoubleOptIn_DEV;
local l_FFlagAppChatEnableDoubleOptIn_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableDoubleOptIn;
local l_FFlagEnableAEGIS2AppChatConversationBanner_0 = require(l_Parent_0.SharedFlags).FFlagEnableAEGIS2AppChatConversationBanner;
local v17 = require(l_Parent_0.AppChatNetworking);
local l_ModalSequence_0 = v17.Constants.ModalSequence;
local v19 = {
    chatLandingModal = {}, 
    conversationTopModals = {}, 
    conversationTopModalsDismissed = if l_FFlagAppChatEnableDoubleOptIn_0 then nil else {}, 
    conversationOverlays = {}, 
    pendingStateModals = {}, 
    conversationBottomModals = {}
};
return v3.createReducer(v19, {
    [v17.rodux.GetChatLandingModal.Succeeded.name] = function(v20, v21) --[[ Line: 45 ]]
        -- upvalues: v2 (copy)
        local l_responseBody_0 = v21.responseBody;
        return v2.Dictionary.join(v20, {
            chatLandingModal = l_responseBody_0
        });
    end, 
    [v17.rodux.GetConversationTopModal.Succeeded.name] = if l_FFlagAppChatEnableDoubleOptIn_0 then nil else function(v23, v24) --[[ Line: 59 ]]
        -- upvalues: v8 (copy), v2 (copy)
        local v25 = v24.postBody and v24.postBody.conversation_id;
        local v26 = v24.postBody and v24.postBody.friend_id;
        if v26 and not v25 then
            v25 = v8.getFriendConversationId({
                v26
            });
        end;
        if not v25 then
            return v23;
        else
            return v2.Dictionary.join(v23, {
                conversationTopModals = v2.Dictionary.join(v23.conversationTopModals, {
                    [v25] = v24.responseBody
                })
            });
        end;
    end, 
    [v17.rodux.GetModalSequence.Succeeded.name] = function(v27, v28) --[[ Line: 83 ]]
        -- upvalues: v8 (copy), l_ModalSequence_0 (copy), v2 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (copy), l_FFlagEnableAEGIS2AppChatConversationBanner_0 (copy), v4 (copy)
        local v29 = v28.postBody and v28.postBody.conversation_id;
        local v30 = v28.postBody and v28.postBody.friend_id;
        if v30 and not v29 then
            v29 = v8.getFriendConversationId({
                v30
            });
        end;
        if v28.postBody.modal_sequence == l_ModalSequence_0.ConversationOverlay then
            if not v29 then
                return v27;
            else
                return v2.Dictionary.join(v27, {
                    conversationOverlays = v2.Dictionary.join(v27.conversationOverlays, {
                        [v29] = v28.responseBody
                    })
                });
            end;
        elseif v28.postBody.modal_sequence == l_ModalSequence_0.ConversationTopModal and l_FFlagAppChatEnableDoubleOptIn_0 then
            if not v29 then
                return v27;
            else
                return v2.Dictionary.join(v27, {
                    conversationTopModals = v2.Dictionary.join(v27.conversationTopModals, {
                        [v29] = v28.responseBody
                    })
                });
            end;
        elseif v28.postBody.modal_sequence == l_ModalSequence_0.ConversationBottomModal and l_FFlagEnableAEGIS2AppChatConversationBanner_0 then
            if not v29 then
                return v27;
            else
                return v2.Dictionary.join(v27, {
                    conversationBottomModals = v2.Dictionary.join(v27.conversationBottomModals, {
                        [v29] = v28.responseBody
                    })
                });
            end;
        else
            v4:warning((("GetModalSequence.Succeeded with unsupported modal sequence: %*"):format(v28.postBody.modal_sequence)));
            return v27;
        end;
    end, 
    [v5.name] = if l_FFlagAppChatEnableDoubleOptIn_0 then nil else function(v31, v32) --[[ Line: 141 ]]
        -- upvalues: v2 (copy)
        local l_conversationId_0 = v32.conversationId;
        local l_modalVariant_0 = v32.modalVariant;
        if not l_conversationId_0 or not l_modalVariant_0 then
            return v31;
        else
            return v2.Dictionary.join(v31, {
                conversationTopModalsDismissed = v2.Dictionary.join(v31.conversationTopModalsDismissed, {
                    [l_conversationId_0] = v2.Dictionary.join(v31.conversationTopModalsDismissed[l_conversationId_0] or {}, {
                        [l_modalVariant_0] = true
                    })
                })
            });
        end;
    end, 
    [v9.name] = function(v35, v36) --[[ Line: 159 ]]
        -- upvalues: l_ModalSequence_0 (copy), v2 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (copy)
        local l_key_0 = v36.key;
        local l_modalSequence_0 = v36.modalSequence;
        if l_modalSequence_0 == l_ModalSequence_0.ConversationOverlay then
            if not l_key_0 then
                return v35;
            else
                return v2.Dictionary.join(v35, {
                    conversationOverlays = v2.Dictionary.join(v35.conversationOverlays, {
                        [l_key_0] = v2.None
                    })
                });
            end;
        elseif l_modalSequence_0 == l_ModalSequence_0.ConversationTopModal and l_FFlagAppChatEnableDoubleOptIn_0 then
            if not l_key_0 then
                return v35;
            else
                return v2.Dictionary.join(v35, {
                    conversationTopModals = v2.Dictionary.join(v35.conversationTopModals, {
                        [l_key_0] = v2.None
                    })
                });
            end;
        else
            return v35;
        end;
    end, 
    [v10.name] = function(v39, v40) --[[ Line: 184 ]]
        -- upvalues: l_FFlagEnableAEGIS2AppChatConversationBanner_0 (copy), l_ModalSequence_0 (copy), v4 (copy), v2 (copy)
        local l_modalSequence_1 = v40.modalSequence;
        if l_FFlagEnableAEGIS2AppChatConversationBanner_0 and l_modalSequence_1 == l_ModalSequence_0.ConversationBottomModal then
            v4:debug("Removing all modals of sequence:ConversationBottomModal from the store");
            local v42 = {};
            for v43, _ in v39.conversationBottomModals do
                v42[v43] = v2.None;
            end;
            return v2.Dictionary.join(v39, {
                conversationBottomModals = v2.Dictionary.join(v39.conversationBottomModals, v42)
            });
        else
            v4:warning((("DismissedAllConversationModalsForSequence received unsupported modal sequence: %* "):format(l_modalSequence_1)));
            return v39;
        end;
    end, 
    [v17.rodux.GetPendingStateModal.Succeeded.name] = function(v45, v46) --[[ Line: 205 ]]
        -- upvalues: v2 (copy)
        local v47 = v46.postBody and v46.postBody.conversation_id;
        if not v47 then
            return v45;
        else
            return v2.Dictionary.join(v45, {
                pendingStateModals = v2.Dictionary.join(v45.pendingStateModals, {
                    [v47] = v46.responseBody
                })
            });
        end;
    end, 
    [v6.name] = function(v48, v49) --[[ Line: 224 ]]
        -- upvalues: v2 (copy)
        local l_conversationId_1 = v49.conversationId;
        if not l_conversationId_1 then
            return v48;
        else
            return v2.Dictionary.join(v48, {
                conversationTopModals = v2.Dictionary.join(v48.conversationTopModals, {
                    [l_conversationId_1] = v2.None
                }), 
                pendingStateModals = v2.Dictionary.join(v48.pendingStateModals, {
                    [l_conversationId_1] = v2.None
                }), 
                conversationBottomModals = v2.Dictionary.join(v48.conversationBottomModals, {
                    [l_conversationId_1] = v2.None
                })
            });
        end;
    end, 
    [v7.name] = function(v51, v52) --[[ Line: 242 ]]
        -- upvalues: v2 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (copy)
        local l_oldFriendConversationId_0 = v52.oldFriendConversationId;
        local l_newConversationId_0 = v52.newConversationId;
        if not l_oldFriendConversationId_0 or not l_newConversationId_0 then
            return v51;
        else
            local l_v51_0 = v51;
            if v51.conversationTopModals[l_oldFriendConversationId_0] then
                l_v51_0 = v2.Dictionary.join(l_v51_0, {
                    conversationTopModals = v2.Dictionary.join(l_v51_0.conversationTopModals, {
                        [l_newConversationId_0] = v51.conversationTopModals[l_oldFriendConversationId_0], 
                        [l_oldFriendConversationId_0] = v2.None
                    })
                });
            end;
            if not l_FFlagAppChatEnableDoubleOptIn_0 and v51.conversationTopModalsDismissed[l_oldFriendConversationId_0] then
                l_v51_0 = v2.Dictionary.join(l_v51_0, {
                    conversationTopModalsDismissed = v2.Dictionary.join(l_v51_0.conversationTopModalsDismissed, {
                        [l_newConversationId_0] = v51.conversationTopModalsDismissed[l_oldFriendConversationId_0], 
                        [l_oldFriendConversationId_0] = v2.None
                    })
                });
            end;
            if v51.conversationOverlays[l_oldFriendConversationId_0] then
                l_v51_0 = v2.Dictionary.join(l_v51_0, {
                    conversationOverlays = v2.Dictionary.join(l_v51_0.conversationOverlays, {
                        [l_newConversationId_0] = v51.conversationOverlays[l_oldFriendConversationId_0], 
                        [l_oldFriendConversationId_0] = v2.None
                    })
                });
            end;
            if v51.conversationBottomModals[l_oldFriendConversationId_0] then
                l_v51_0 = v2.Dictionary.join(l_v51_0, {
                    conversationBottomModals = v2.Dictionary.join(l_v51_0.conversationBottomModals, {
                        [l_newConversationId_0] = v51.conversationBottomModals[l_oldFriendConversationId_0], 
                        [l_oldFriendConversationId_0] = v2.None
                    })
                });
            end;
            return l_v51_0;
        end;
    end, 
    DEBUG_ShowChatLandingAgeVerifiedTimedModal = v12 and function(v56) --[[ Line: 291 ]]
        -- upvalues: v2 (copy), v17 (copy)
        return v2.Dictionary.union(v56, {
            chatLandingModal = {
                modal_variant = v17.Constants.ChatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal, 
                modal_layout = {
                    id = "asdf", 
                    header = {
                        text = "FAE Title", 
                        additional_content = {
                            {
                                type = v17.Constants.ModalContentType.Countdown, 
                                text = "14 days left"
                            }
                        }
                    }, 
                    body = {
                        text = "FAE debug Body", 
                        additional_content = {
                            {
                                type = v17.Constants.ModalContentType.Link, 
                                text = "Learn more"
                            }
                        }
                    }, 
                    buttons = {
                        {
                            text = "Continue", 
                            action = {
                                type = "open_fae_upsell"
                            }
                        }, 
                        {
                            text = "View Details", 
                            action = {
                                type = "open_fae_view_details"
                            }
                        }
                    }, 
                    dismissible = true, 
                    seen_record_action = "none", 
                    dismissed_record_action = "none"
                }
            }
        });
    end or nil, 
    DEBUG_ShowAppChatFaeUpsell = v11 and function(v57) --[[ Line: 339 ]]
        -- upvalues: v2 (copy), v17 (copy)
        return v2.Dictionary.union(v57, {
            chatLandingModal = {
                modal_variant = v17.Constants.ChatLandingModalVariant.AgeAssuranceUpsell, 
                modal_layout = {
                    id = "asdf", 
                    label = {
                        text = "New"
                    }, 
                    header = {
                        text = "FAE Title"
                    }, 
                    body = {
                        text = "FAE debug Body", 
                        additional_content = {
                            {
                                type = v17.Constants.ModalContentType.Link, 
                                text = "Learn more"
                            }
                        }
                    }, 
                    buttons = {
                        {
                            text = "Continue"
                        }
                    }, 
                    seen_record_action = "none", 
                    dismissed_record_action = "none"
                }
            }
        });
    end or nil, 
    DEBUG_ShowNewTCOverlay = (not not l_FFlagTCUpsellModalEnabled_DEV_0 or l_FFlagDebugEnableTCDoubleOptIn_DEV_0) and function(v58, v59) --[[ Line: 373 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v58, {
            conversationOverlays = v2.Dictionary.join(v58.conversationOverlays, {
                [v59.conversationId] = {
                    modal_variant = v59.modalVariant, 
                    modal_layout = {
                        id = "asdf", 
                        seen_record_action = "none", 
                        dismissed_record_action = "none"
                    }
                }
            })
        });
    end or nil, 
    DEBUG_ShowNewTopModal = l_FFlagDebugEnableTCDoubleOptIn_DEV_0 and function(v60, v61) --[[ Line: 389 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v60, {
            conversationTopModals = v2.Dictionary.join(v60.conversationTopModals, {
                [v61.conversationId] = {
                    modal_variant = v61.modalVariant, 
                    modal_layout = {
                        id = "", 
                        body = {
                            text = "Add Trusted Connection"
                        }, 
                        buttons = {
                            {
                                text = "Add"
                            }
                        }, 
                        seen_record_action = "none", 
                        dismissed_record_action = "none"
                    }
                }
            })
        });
    end or nil, 
    DEBUG_DismissChatLandingModal = (not not v11 or v12) and function(v62) --[[ Line: 413 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v62, {
            chatLandingModal = v2.None
        });
    end or nil
});