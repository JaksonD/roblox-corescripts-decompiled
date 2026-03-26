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
local v13 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatNudgeToChatUpsell_DEV);
local l_FFlagTCUpsellModalEnabled_DEV_0 = require(l_Parent_0.SharedFlags).FFlagTCUpsellModalEnabled_DEV;
local l_FFlagDebugEnableTCDoubleOptIn_DEV_0 = require(l_Parent_0.SharedFlags).FFlagDebugEnableTCDoubleOptIn_DEV;
local l_FFlagAppChatEnableDoubleOptIn_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableDoubleOptIn;
local l_FFlagEnableAEGIS2AppChatConversationBanner_0 = require(l_Parent_0.SharedFlags).FFlagEnableAEGIS2AppChatConversationBanner;
local v18 = require(l_Parent_0.AppChatNetworking);
local l_ModalSequence_0 = v18.Constants.ModalSequence;
local v20 = {
    chatLandingModal = {}, 
    conversationTopModals = {}, 
    conversationTopModalsDismissed = if l_FFlagAppChatEnableDoubleOptIn_0 then nil else {}, 
    conversationOverlays = {}, 
    pendingStateModals = {}, 
    conversationBottomModals = {}
};
return v3.createReducer(v20, {
    [v18.rodux.GetChatLandingModal.Succeeded.name] = function(v21, v22) --[[ Line: 46 ]]
        -- upvalues: v2 (copy)
        local l_responseBody_0 = v22.responseBody;
        return v2.Dictionary.join(v21, {
            chatLandingModal = l_responseBody_0
        });
    end, 
    [v18.rodux.GetConversationTopModal.Succeeded.name] = if l_FFlagAppChatEnableDoubleOptIn_0 then nil else function(v24, v25) --[[ Line: 60 ]]
        -- upvalues: v8 (copy), v2 (copy)
        local v26 = v25.postBody and v25.postBody.conversation_id;
        local v27 = v25.postBody and v25.postBody.friend_id;
        if v27 and not v26 then
            v26 = v8.getFriendConversationId({
                v27
            });
        end;
        if not v26 then
            return v24;
        else
            return v2.Dictionary.join(v24, {
                conversationTopModals = v2.Dictionary.join(v24.conversationTopModals, {
                    [v26] = v25.responseBody
                })
            });
        end;
    end, 
    [v18.rodux.GetModalSequence.Succeeded.name] = function(v28, v29) --[[ Line: 84 ]]
        -- upvalues: v8 (copy), l_ModalSequence_0 (copy), v2 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (copy), l_FFlagEnableAEGIS2AppChatConversationBanner_0 (copy), v4 (copy)
        local v30 = v29.postBody and v29.postBody.conversation_id;
        local v31 = v29.postBody and v29.postBody.friend_id;
        if v31 and not v30 then
            v30 = v8.getFriendConversationId({
                v31
            });
        end;
        if v29.postBody.modal_sequence == l_ModalSequence_0.ConversationOverlay then
            if not v30 then
                return v28;
            else
                return v2.Dictionary.join(v28, {
                    conversationOverlays = v2.Dictionary.join(v28.conversationOverlays, {
                        [v30] = v29.responseBody
                    })
                });
            end;
        elseif v29.postBody.modal_sequence == l_ModalSequence_0.ConversationTopModal and l_FFlagAppChatEnableDoubleOptIn_0 then
            if not v30 then
                return v28;
            else
                return v2.Dictionary.join(v28, {
                    conversationTopModals = v2.Dictionary.join(v28.conversationTopModals, {
                        [v30] = v29.responseBody
                    })
                });
            end;
        elseif v29.postBody.modal_sequence == l_ModalSequence_0.ConversationBottomModal and l_FFlagEnableAEGIS2AppChatConversationBanner_0 then
            if not v30 then
                return v28;
            else
                return v2.Dictionary.join(v28, {
                    conversationBottomModals = v2.Dictionary.join(v28.conversationBottomModals, {
                        [v30] = v29.responseBody
                    })
                });
            end;
        else
            v4:warning((("GetModalSequence.Succeeded with unsupported modal sequence: %*"):format(v29.postBody.modal_sequence)));
            return v28;
        end;
    end, 
    [v5.name] = if l_FFlagAppChatEnableDoubleOptIn_0 then nil else function(v32, v33) --[[ Line: 142 ]]
        -- upvalues: v2 (copy)
        local l_conversationId_0 = v33.conversationId;
        local l_modalVariant_0 = v33.modalVariant;
        if not l_conversationId_0 or not l_modalVariant_0 then
            return v32;
        else
            return v2.Dictionary.join(v32, {
                conversationTopModalsDismissed = v2.Dictionary.join(v32.conversationTopModalsDismissed, {
                    [l_conversationId_0] = v2.Dictionary.join(v32.conversationTopModalsDismissed[l_conversationId_0] or {}, {
                        [l_modalVariant_0] = true
                    })
                })
            });
        end;
    end, 
    [v9.name] = function(v36, v37) --[[ Line: 160 ]]
        -- upvalues: l_ModalSequence_0 (copy), v2 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (copy)
        local l_key_0 = v37.key;
        local l_modalSequence_0 = v37.modalSequence;
        if l_modalSequence_0 == l_ModalSequence_0.ConversationOverlay then
            if not l_key_0 then
                return v36;
            else
                return v2.Dictionary.join(v36, {
                    conversationOverlays = v2.Dictionary.join(v36.conversationOverlays, {
                        [l_key_0] = v2.None
                    })
                });
            end;
        elseif l_modalSequence_0 == l_ModalSequence_0.ConversationTopModal and l_FFlagAppChatEnableDoubleOptIn_0 then
            if not l_key_0 then
                return v36;
            else
                return v2.Dictionary.join(v36, {
                    conversationTopModals = v2.Dictionary.join(v36.conversationTopModals, {
                        [l_key_0] = v2.None
                    })
                });
            end;
        else
            return v36;
        end;
    end, 
    [v10.name] = function(v40, v41) --[[ Line: 185 ]]
        -- upvalues: l_FFlagEnableAEGIS2AppChatConversationBanner_0 (copy), l_ModalSequence_0 (copy), v4 (copy), v2 (copy)
        local l_modalSequence_1 = v41.modalSequence;
        if l_FFlagEnableAEGIS2AppChatConversationBanner_0 and l_modalSequence_1 == l_ModalSequence_0.ConversationBottomModal then
            v4:debug("Removing all modals of sequence:ConversationBottomModal from the store");
            local v43 = {};
            for v44, _ in v40.conversationBottomModals do
                v43[v44] = v2.None;
            end;
            return v2.Dictionary.join(v40, {
                conversationBottomModals = v2.Dictionary.join(v40.conversationBottomModals, v43)
            });
        else
            v4:warning((("DismissedAllConversationModalsForSequence received unsupported modal sequence: %* "):format(l_modalSequence_1)));
            return v40;
        end;
    end, 
    [v18.rodux.GetPendingStateModal.Succeeded.name] = function(v46, v47) --[[ Line: 206 ]]
        -- upvalues: v2 (copy)
        local v48 = v47.postBody and v47.postBody.conversation_id;
        if not v48 then
            return v46;
        else
            return v2.Dictionary.join(v46, {
                pendingStateModals = v2.Dictionary.join(v46.pendingStateModals, {
                    [v48] = v47.responseBody
                })
            });
        end;
    end, 
    [v6.name] = function(v49, v50) --[[ Line: 225 ]]
        -- upvalues: v2 (copy)
        local l_conversationId_1 = v50.conversationId;
        if not l_conversationId_1 then
            return v49;
        else
            return v2.Dictionary.join(v49, {
                conversationTopModals = v2.Dictionary.join(v49.conversationTopModals, {
                    [l_conversationId_1] = v2.None
                }), 
                pendingStateModals = v2.Dictionary.join(v49.pendingStateModals, {
                    [l_conversationId_1] = v2.None
                }), 
                conversationBottomModals = v2.Dictionary.join(v49.conversationBottomModals, {
                    [l_conversationId_1] = v2.None
                })
            });
        end;
    end, 
    [v7.name] = function(v52, v53) --[[ Line: 243 ]]
        -- upvalues: v2 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (copy)
        local l_oldFriendConversationId_0 = v53.oldFriendConversationId;
        local l_newConversationId_0 = v53.newConversationId;
        if not l_oldFriendConversationId_0 or not l_newConversationId_0 then
            return v52;
        else
            local l_v52_0 = v52;
            if v52.conversationTopModals[l_oldFriendConversationId_0] then
                l_v52_0 = v2.Dictionary.join(l_v52_0, {
                    conversationTopModals = v2.Dictionary.join(l_v52_0.conversationTopModals, {
                        [l_newConversationId_0] = v52.conversationTopModals[l_oldFriendConversationId_0], 
                        [l_oldFriendConversationId_0] = v2.None
                    })
                });
            end;
            if not l_FFlagAppChatEnableDoubleOptIn_0 and v52.conversationTopModalsDismissed[l_oldFriendConversationId_0] then
                l_v52_0 = v2.Dictionary.join(l_v52_0, {
                    conversationTopModalsDismissed = v2.Dictionary.join(l_v52_0.conversationTopModalsDismissed, {
                        [l_newConversationId_0] = v52.conversationTopModalsDismissed[l_oldFriendConversationId_0], 
                        [l_oldFriendConversationId_0] = v2.None
                    })
                });
            end;
            if v52.conversationOverlays[l_oldFriendConversationId_0] then
                l_v52_0 = v2.Dictionary.join(l_v52_0, {
                    conversationOverlays = v2.Dictionary.join(l_v52_0.conversationOverlays, {
                        [l_newConversationId_0] = v52.conversationOverlays[l_oldFriendConversationId_0], 
                        [l_oldFriendConversationId_0] = v2.None
                    })
                });
            end;
            if v52.conversationBottomModals[l_oldFriendConversationId_0] then
                l_v52_0 = v2.Dictionary.join(l_v52_0, {
                    conversationBottomModals = v2.Dictionary.join(l_v52_0.conversationBottomModals, {
                        [l_newConversationId_0] = v52.conversationBottomModals[l_oldFriendConversationId_0], 
                        [l_oldFriendConversationId_0] = v2.None
                    })
                });
            end;
            return l_v52_0;
        end;
    end, 
    DEBUG_ShowChatLandingAgeVerifiedTimedModal = v12 and function(v57) --[[ Line: 292 ]]
        -- upvalues: v2 (copy), v18 (copy)
        return v2.Dictionary.union(v57, {
            chatLandingModal = {
                modal_variant = v18.Constants.ChatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal, 
                modal_layout = {
                    id = "asdf", 
                    header = {
                        text = "FAE Title", 
                        additional_content = {
                            {
                                type = v18.Constants.ModalContentType.Countdown, 
                                text = "14 days left"
                            }
                        }
                    }, 
                    body = {
                        text = "FAE debug Body", 
                        additional_content = {
                            {
                                type = v18.Constants.ModalContentType.Link, 
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
    DEBUG_ShowAppChatFaeUpsell = v11 and function(v58) --[[ Line: 340 ]]
        -- upvalues: v2 (copy), v18 (copy)
        return v2.Dictionary.union(v58, {
            chatLandingModal = {
                modal_variant = v18.Constants.ChatLandingModalVariant.AgeAssuranceUpsell, 
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
                                type = v18.Constants.ModalContentType.Link, 
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
    DEBUG_ShowNewTCOverlay = (not not l_FFlagTCUpsellModalEnabled_DEV_0 or l_FFlagDebugEnableTCDoubleOptIn_DEV_0) and function(v59, v60) --[[ Line: 374 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v59, {
            conversationOverlays = v2.Dictionary.join(v59.conversationOverlays, {
                [v60.conversationId] = {
                    modal_variant = v60.modalVariant, 
                    modal_layout = {
                        id = "asdf", 
                        seen_record_action = "none", 
                        dismissed_record_action = "none"
                    }
                }
            })
        });
    end or nil, 
    DEBUG_ShowNewTopModal = l_FFlagDebugEnableTCDoubleOptIn_DEV_0 and function(v61, v62) --[[ Line: 390 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v61, {
            conversationTopModals = v2.Dictionary.join(v61.conversationTopModals, {
                [v62.conversationId] = {
                    modal_variant = v62.modalVariant, 
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
    DEBUG_ShowNudgeToChatUpsellOverlay = v13 and function(v63, v64) --[[ Line: 414 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v63, {
            conversationOverlays = v2.Dictionary.join(v63.conversationOverlays, {
                [v64.conversationId] = {
                    modal_variant = v64.modalVariant, 
                    modal_layout = {
                        id = "debug-nudge-to-chat-upsell", 
                        header = {
                            text = "DebugUser has indicated they would like to chat"
                        }, 
                        body = {
                            text = "Verify your age to unlock chat with DebugUser. It only takes a moment."
                        }, 
                        buttons = {
                            {
                                text = "Verify Age", 
                                action = {
                                    type = "open_fae_upsell"
                                }
                            }
                        }, 
                        seen_record_action = "none", 
                        dismissed_record_action = "none"
                    }
                }
            })
        });
    end or nil, 
    DEBUG_DismissChatLandingModal = (not not v11 or v12) and function(v65) --[[ Line: 433 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v65, {
            chatLandingModal = v2.None
        });
    end or nil
});