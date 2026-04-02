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
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatNudgeToChatUpsellEnabled);
local v19 = require(l_Parent_0.AppChatNetworking);
local l_ModalSequence_0 = v19.Constants.ModalSequence;
local v21 = {
    chatLandingModal = {}, 
    conversationTopModals = {}, 
    conversationTopModalsDismissed = if l_FFlagAppChatEnableDoubleOptIn_0 then nil else {}, 
    conversationOverlays = {}, 
    pendingStateModals = {}, 
    conversationBottomModals = {}
};
return v3.createReducer(v21, {
    [v19.rodux.GetChatLandingModal.Succeeded.name] = function(v22, v23) --[[ Line: 47 ]]
        -- upvalues: v2 (copy)
        local l_responseBody_0 = v23.responseBody;
        return v2.Dictionary.join(v22, {
            chatLandingModal = l_responseBody_0
        });
    end, 
    [v19.rodux.GetConversationTopModal.Succeeded.name] = if l_FFlagAppChatEnableDoubleOptIn_0 then nil else function(v25, v26) --[[ Line: 61 ]]
        -- upvalues: v8 (copy), v2 (copy)
        local v27 = v26.postBody and v26.postBody.conversation_id;
        local v28 = v26.postBody and v26.postBody.friend_id;
        if v28 and not v27 then
            v27 = v8.getFriendConversationId({
                v28
            });
        end;
        if not v27 then
            return v25;
        else
            return v2.Dictionary.join(v25, {
                conversationTopModals = v2.Dictionary.join(v25.conversationTopModals, {
                    [v27] = v26.responseBody
                })
            });
        end;
    end, 
    [v19.rodux.GetModalSequence.Succeeded.name] = function(v29, v30) --[[ Line: 85 ]]
        -- upvalues: v8 (copy), l_ModalSequence_0 (copy), v2 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (copy), l_FFlagEnableAEGIS2AppChatConversationBanner_0 (copy), v18 (copy), v4 (copy)
        local v31 = v30.postBody and v30.postBody.conversation_id;
        local v32 = v30.postBody and v30.postBody.friend_id;
        if v32 and not v31 then
            v31 = v8.getFriendConversationId({
                v32
            });
        end;
        if v30.postBody.modal_sequence == l_ModalSequence_0.ConversationOverlay then
            if not v31 then
                return v29;
            else
                return v2.Dictionary.join(v29, {
                    conversationOverlays = v2.Dictionary.join(v29.conversationOverlays, {
                        [v31] = v30.responseBody
                    })
                });
            end;
        elseif v30.postBody.modal_sequence == l_ModalSequence_0.ConversationTopModal and l_FFlagAppChatEnableDoubleOptIn_0 then
            if not v31 then
                return v29;
            else
                return v2.Dictionary.join(v29, {
                    conversationTopModals = v2.Dictionary.join(v29.conversationTopModals, {
                        [v31] = v30.responseBody
                    })
                });
            end;
        elseif v30.postBody.modal_sequence == l_ModalSequence_0.ConversationBottomModal and (l_FFlagEnableAEGIS2AppChatConversationBanner_0 or v18) then
            if not v31 then
                return v29;
            else
                return v2.Dictionary.join(v29, {
                    conversationBottomModals = v2.Dictionary.join(v29.conversationBottomModals, {
                        [v31] = v30.responseBody
                    })
                });
            end;
        else
            v4:warning((("GetModalSequence.Succeeded with unsupported modal sequence: %*"):format(v30.postBody.modal_sequence)));
            return v29;
        end;
    end, 
    [v5.name] = if l_FFlagAppChatEnableDoubleOptIn_0 then nil else function(v33, v34) --[[ Line: 143 ]]
        -- upvalues: v2 (copy)
        local l_conversationId_0 = v34.conversationId;
        local l_modalVariant_0 = v34.modalVariant;
        if not l_conversationId_0 or not l_modalVariant_0 then
            return v33;
        else
            return v2.Dictionary.join(v33, {
                conversationTopModalsDismissed = v2.Dictionary.join(v33.conversationTopModalsDismissed, {
                    [l_conversationId_0] = v2.Dictionary.join(v33.conversationTopModalsDismissed[l_conversationId_0] or {}, {
                        [l_modalVariant_0] = true
                    })
                })
            });
        end;
    end, 
    [v9.name] = function(v37, v38) --[[ Line: 161 ]]
        -- upvalues: l_ModalSequence_0 (copy), v2 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (copy)
        local l_key_0 = v38.key;
        local l_modalSequence_0 = v38.modalSequence;
        if l_modalSequence_0 == l_ModalSequence_0.ConversationOverlay then
            if not l_key_0 then
                return v37;
            else
                return v2.Dictionary.join(v37, {
                    conversationOverlays = v2.Dictionary.join(v37.conversationOverlays, {
                        [l_key_0] = v2.None
                    })
                });
            end;
        elseif l_modalSequence_0 == l_ModalSequence_0.ConversationTopModal and l_FFlagAppChatEnableDoubleOptIn_0 then
            if not l_key_0 then
                return v37;
            else
                return v2.Dictionary.join(v37, {
                    conversationTopModals = v2.Dictionary.join(v37.conversationTopModals, {
                        [l_key_0] = v2.None
                    })
                });
            end;
        else
            return v37;
        end;
    end, 
    [v10.name] = function(v41, v42) --[[ Line: 186 ]]
        -- upvalues: l_FFlagEnableAEGIS2AppChatConversationBanner_0 (copy), l_ModalSequence_0 (copy), v4 (copy), v2 (copy)
        local l_modalSequence_1 = v42.modalSequence;
        if l_FFlagEnableAEGIS2AppChatConversationBanner_0 and l_modalSequence_1 == l_ModalSequence_0.ConversationBottomModal then
            v4:debug("Removing all modals of sequence:ConversationBottomModal from the store");
            local v44 = {};
            for v45, _ in v41.conversationBottomModals do
                v44[v45] = v2.None;
            end;
            return v2.Dictionary.join(v41, {
                conversationBottomModals = v2.Dictionary.join(v41.conversationBottomModals, v44)
            });
        else
            v4:warning((("DismissedAllConversationModalsForSequence received unsupported modal sequence: %* "):format(l_modalSequence_1)));
            return v41;
        end;
    end, 
    [v19.rodux.GetPendingStateModal.Succeeded.name] = function(v47, v48) --[[ Line: 207 ]]
        -- upvalues: v2 (copy)
        local v49 = v48.postBody and v48.postBody.conversation_id;
        if not v49 then
            return v47;
        else
            return v2.Dictionary.join(v47, {
                pendingStateModals = v2.Dictionary.join(v47.pendingStateModals, {
                    [v49] = v48.responseBody
                })
            });
        end;
    end, 
    [v6.name] = function(v50, v51) --[[ Line: 226 ]]
        -- upvalues: v2 (copy)
        local l_conversationId_1 = v51.conversationId;
        if not l_conversationId_1 then
            return v50;
        else
            return v2.Dictionary.join(v50, {
                conversationTopModals = v2.Dictionary.join(v50.conversationTopModals, {
                    [l_conversationId_1] = v2.None
                }), 
                pendingStateModals = v2.Dictionary.join(v50.pendingStateModals, {
                    [l_conversationId_1] = v2.None
                }), 
                conversationBottomModals = v2.Dictionary.join(v50.conversationBottomModals, {
                    [l_conversationId_1] = v2.None
                })
            });
        end;
    end, 
    [v7.name] = function(v53, v54) --[[ Line: 244 ]]
        -- upvalues: v2 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (copy)
        local l_oldFriendConversationId_0 = v54.oldFriendConversationId;
        local l_newConversationId_0 = v54.newConversationId;
        if not l_oldFriendConversationId_0 or not l_newConversationId_0 then
            return v53;
        else
            local l_v53_0 = v53;
            if v53.conversationTopModals[l_oldFriendConversationId_0] then
                l_v53_0 = v2.Dictionary.join(l_v53_0, {
                    conversationTopModals = v2.Dictionary.join(l_v53_0.conversationTopModals, {
                        [l_newConversationId_0] = v53.conversationTopModals[l_oldFriendConversationId_0], 
                        [l_oldFriendConversationId_0] = v2.None
                    })
                });
            end;
            if not l_FFlagAppChatEnableDoubleOptIn_0 and v53.conversationTopModalsDismissed[l_oldFriendConversationId_0] then
                l_v53_0 = v2.Dictionary.join(l_v53_0, {
                    conversationTopModalsDismissed = v2.Dictionary.join(l_v53_0.conversationTopModalsDismissed, {
                        [l_newConversationId_0] = v53.conversationTopModalsDismissed[l_oldFriendConversationId_0], 
                        [l_oldFriendConversationId_0] = v2.None
                    })
                });
            end;
            if v53.conversationOverlays[l_oldFriendConversationId_0] then
                l_v53_0 = v2.Dictionary.join(l_v53_0, {
                    conversationOverlays = v2.Dictionary.join(l_v53_0.conversationOverlays, {
                        [l_newConversationId_0] = v53.conversationOverlays[l_oldFriendConversationId_0], 
                        [l_oldFriendConversationId_0] = v2.None
                    })
                });
            end;
            if v53.conversationBottomModals[l_oldFriendConversationId_0] then
                l_v53_0 = v2.Dictionary.join(l_v53_0, {
                    conversationBottomModals = v2.Dictionary.join(l_v53_0.conversationBottomModals, {
                        [l_newConversationId_0] = v53.conversationBottomModals[l_oldFriendConversationId_0], 
                        [l_oldFriendConversationId_0] = v2.None
                    })
                });
            end;
            return l_v53_0;
        end;
    end, 
    DEBUG_ShowChatLandingAgeVerifiedTimedModal = v12 and function(v58) --[[ Line: 293 ]]
        -- upvalues: v2 (copy), v19 (copy)
        return v2.Dictionary.union(v58, {
            chatLandingModal = {
                modal_variant = v19.Constants.ChatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal, 
                modal_layout = {
                    id = "asdf", 
                    header = {
                        text = "FAE Title", 
                        additional_content = {
                            {
                                type = v19.Constants.ModalContentType.Countdown, 
                                text = "14 days left"
                            }
                        }
                    }, 
                    body = {
                        text = "FAE debug Body", 
                        additional_content = {
                            {
                                type = v19.Constants.ModalContentType.Link, 
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
    DEBUG_ShowAppChatFaeUpsell = v11 and function(v59) --[[ Line: 341 ]]
        -- upvalues: v2 (copy), v19 (copy)
        return v2.Dictionary.union(v59, {
            chatLandingModal = {
                modal_variant = v19.Constants.ChatLandingModalVariant.AgeAssuranceUpsell, 
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
                                type = v19.Constants.ModalContentType.Link, 
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
    DEBUG_ShowNewTCOverlay = (not not l_FFlagTCUpsellModalEnabled_DEV_0 or l_FFlagDebugEnableTCDoubleOptIn_DEV_0) and function(v60, v61) --[[ Line: 375 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v60, {
            conversationOverlays = v2.Dictionary.join(v60.conversationOverlays, {
                [v61.conversationId] = {
                    modal_variant = v61.modalVariant, 
                    modal_layout = {
                        id = "asdf", 
                        seen_record_action = "none", 
                        dismissed_record_action = "none"
                    }
                }
            })
        });
    end or nil, 
    DEBUG_ShowNewTopModal = l_FFlagDebugEnableTCDoubleOptIn_DEV_0 and function(v62, v63) --[[ Line: 391 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v62, {
            conversationTopModals = v2.Dictionary.join(v62.conversationTopModals, {
                [v63.conversationId] = {
                    modal_variant = v63.modalVariant, 
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
    DEBUG_ShowNudgeToChatUpsellOverlay = v13 and function(v64, v65) --[[ Line: 415 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v64, {
            conversationBottomModals = v2.Dictionary.join(v64.conversationBottomModals, {
                [v65.conversationId] = {
                    modal_variant = v65.modalVariant, 
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
                            }, 
                            {
                                text = "View Details", 
                                action = {
                                    type = "open_fae_view_details"
                                }
                            }
                        }, 
                        dismissible = false, 
                        seen_record_action = "none", 
                        dismissed_record_action = "none"
                    }
                }
            })
        });
    end or nil, 
    DEBUG_DismissChatLandingModal = (not not v11 or v12) and function(v66) --[[ Line: 438 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v66, {
            chatLandingModal = v2.None
        });
    end or nil
});