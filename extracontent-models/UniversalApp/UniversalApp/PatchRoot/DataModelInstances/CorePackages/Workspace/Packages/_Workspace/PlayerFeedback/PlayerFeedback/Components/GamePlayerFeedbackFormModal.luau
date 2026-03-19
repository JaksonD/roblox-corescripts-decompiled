local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayerFeedback");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_PartialPageModal_0 = v3.App.Dialog.Modal.PartialPageModal;
local l_VerticalScrollView_0 = v3.App.Container.VerticalScrollView;
local l_Checkbox_0 = v3.App.InputButton.Checkbox;
local l_ButtonStack_0 = v3.App.Button.ButtonStack;
local v10 = require(l_Parent_0.Cryo);
local v11 = require(l_Parent_0.ArgCheck);
local v12 = require(l_Parent_0.t);
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local v14 = require(l_Parent_0.GenericAbuseReporting);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v19 = require(l_Parent_0.RoactServiceTags);
local l_AppEventIngestService_0 = v19.AppEventIngestService;
local l_RoactNetworking_0 = v19.RoactNetworking;
local v22 = require(l_Parent_0.ToastRodux);
local l_SetNetworkingErrorToast_0 = require(l_Parent_0.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast;
local l_SetCurrentToastMessage_0 = v22.Actions.SetCurrentToastMessage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_GetFFlagEdpPlayerFeedbackCommentsOnly_0 = require(l_Parent_0.SharedFlags).GetFFlagEdpPlayerFeedbackCommentsOnly;
local l_UserInputService_0 = game:GetService("UserInputService");
local v30 = require(l_script_FirstAncestor_0.Thunks.SubmitGamePlayerFeedback);
local _ = require(l_script_FirstAncestor_0.Types);
local v32 = require(l_script_FirstAncestor_0.Analytics.Events.PlayerFeedbackEvents);
local l_AbuseVector_0 = v14.Enums.AbuseVector;
local l_OpenDynamicAbuseReport_0 = v14.Thunks.OpenDynamicAbuseReport;
local l_FFlagEnableAbuseReportRevampFlow_0 = require(l_Parent_0.SharedFlags).FFlagEnableAbuseReportRevampFlow;
local v36 = game:DefineFastFlag("EnableAbuseReportRevampFeedback", false);
local l_FFlagAddThumbnailSelectorReport_0 = require(l_Parent_0.SharedFlags).FFlagAddThumbnailSelectorReport;
local v38 = game:DefineFastFlag("AddThumbnailReportToPlayerFeedback", false);
local l_useState_0 = v2.useState;
local l_useEffect_0 = v2.useEffect;
local function v53(v41) --[[ Line: 65 ]] --[[ Name: CategoryCheckboxes ]]
    -- upvalues: v2 (copy), v10 (copy), l_Checkbox_0 (copy)
    local l_category_0 = v41.category;
    local l_selectedCategoryIds_0 = v41.selectedCategoryIds;
    local l_onOptionSelected_0 = v41.onOptionSelected;
    local v45 = {
        layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, -8)
        })
    };
    local v50 = v2.useCallback(function(v46) --[[ Line: 77 ]]
        -- upvalues: v10 (ref), l_selectedCategoryIds_0 (copy), l_onOptionSelected_0 (copy)
        return function(v47) --[[ Line: 78 ]]
            -- upvalues: v10 (ref), l_selectedCategoryIds_0 (ref), v46 (copy), l_onOptionSelected_0 (ref)
            local v48 = nil;
            v48 = if v47 then v10.List.join(l_selectedCategoryIds_0, {
                v46
            }) else v10.List.filter(l_selectedCategoryIds_0, function(v49) --[[ Line: 83 ]]
                -- upvalues: v46 (ref)
                return v49 ~= v46;
            end);
            l_onOptionSelected_0(v48);
        end;
    end, {
        l_selectedCategoryIds_0
    });
    for v51, v52 in ipairs(l_category_0.options) do
        v45["Checkbox" .. v51] = v2.createElement(l_Checkbox_0, {
            text = v52.label, 
            isSelected = v10.List.find(l_selectedCategoryIds_0, v52.id) ~= nil, 
            onActivated = v50(v52.id), 
            size = UDim2.new(1, 0, 0, 36), 
            layoutOrder = v51
        });
    end;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v41.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 0)
    }, v45);
end;
local function _(v54) --[[ Line: 114 ]] --[[ Name: getTextLength ]]
    if utf8.len(v54) then
        return (utf8.len(utf8.nfcnormalize(v54)));
    else
        return (string.len(v54));
    end;
end;
local v56 = v11.wrap(v12.interface({
    closeCentralOverlayThunk = v12.callback, 
    universeId = v12.string, 
    playerFeedbackMetadata = v12.strictInterface({
        rootPlaceId = v12.string, 
        canSubmitReview = v12.boolean, 
        canSubmitComment = v12.boolean, 
        categoryType = v12.string, 
        category = v12.interface({
            type = v12.string, 
            label = v12.string, 
            allows_multiple_selections = v12.boolean, 
            options = v12.array(v12.interface({
                id = v12.string, 
                label = v12.string
            }))
        }), 
        comment = v12.interface({
            label = v12.string, 
            placeholder_text = v12.string, 
            minimum_length = v12.number, 
            maximum_length = v12.number
        }), 
        metadata = v12.interface({
            disclaimer_label = v12.string, 
            submit_button_label = v12.string, 
            form_title_label = v12.string
        })
    }), 
    onSubmitted = v12.optional(v12.callback)
}));
return function(v57) --[[ Line: 150 ]] --[[ Name: GamePlayerFeedbackFormModal ]]
    -- upvalues: v56 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_AppEventIngestService_0 (copy), l_useSelector_0 (copy), l_useState_0 (copy), v2 (copy), l_GetFFlagEdpPlayerFeedbackCommentsOnly_0 (copy), l_useLocalization_0 (copy), l_useEffect_0 (copy), v32 (copy), v30 (copy), l_SetCurrentToastMessage_0 (copy), l_SetNetworkingErrorToast_0 (copy), l_OpenDynamicAbuseReport_0 (copy), l_AbuseVector_0 (copy), l_FFlagAddThumbnailSelectorReport_0 (copy), v38 (copy), l_CloseCentralOverlay_0 (copy), l_AppPage_0 (copy), l_UrlBuilder_0 (copy), l_NavigateDown_0 (copy), l_UserInputService_0 (copy), l_PartialPageModal_0 (copy), l_VerticalScrollView_0 (copy), v53 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy), l_FFlagEnableAbuseReportRevampFlow_0 (copy), v36 (copy)
    assert(v56(v57));
    local v58 = l_useStyle_0();
    local v59 = l_useDispatch_0();
    local v60 = l_useRoactService_0(l_RoactNetworking_0);
    local v61 = l_useRoactService_0(l_AppEventIngestService_0);
    local l_Tokens_0 = v58.Tokens;
    local v64 = l_useSelector_0(function(v63) --[[ Line: 159 ]]
        return v63.ScreenSize;
    end);
    local v67 = l_useSelector_0(function(v65) --[[ Line: 162 ]]
        local l_GlobalGuiInset_0 = v65.GlobalGuiInset;
        return l_GlobalGuiInset_0 and l_GlobalGuiInset_0.bottom or 0;
    end);
    local v68, v69 = l_useState_0(false);
    local v70, v71 = l_useState_0(0);
    local v72 = v68 and -v70 + v67 or 0;
    local v73 = v68 and 0 or 48;
    local v74, v75 = l_useState_0(0);
    local v76 = v2.useRef(nil);
    local v77 = v2.useRef(nil);
    local v78 = v64.Y - v70 - 48 - 48 - 48 - v73;
    local l_playerFeedbackMetadata_0 = v57.playerFeedbackMetadata;
    local l_categoryType_0 = l_playerFeedbackMetadata_0.categoryType;
    local l_category_1 = l_playerFeedbackMetadata_0.category;
    local l_metadata_0 = l_playerFeedbackMetadata_0.metadata;
    local l_comment_0 = l_playerFeedbackMetadata_0.comment;
    local l_rootPlaceId_0 = l_playerFeedbackMetadata_0.rootPlaceId;
    local v85, v86 = l_useState_0("");
    local v87 = if l_GetFFlagEdpPlayerFeedbackCommentsOnly_0() then {
        "Other"
    } else {};
    local v88, v89 = l_useState_0(v87);
    local v90 = l_playerFeedbackMetadata_0.canSubmitComment and #v88 > 0;
    local v91, v92 = l_useState_0(nil);
    local v93 = l_useLocalization_0({
        commentTooLongMessage = {
            "PlayerFeedbacks.VoteForm.Message.MaxLengthCharacters"; 
            count = l_comment_0.maximum_length
        }, 
        commentTooShortMessage = {
            "PlayerFeedbacks.VoteForm.Message.MinLengthCharacters"; 
            count = l_comment_0.minimum_length
        }, 
        abuseReportPromptText = "PlayerFeedbacks.VoteForm.Message.ReportAbuseInsteadLong", 
        reportFlowPageTitle = "PlayerFeedbacks.VoteForm.Message.Action.Report"
    });
    local v94 = false;
    if #v88 > 0 then
        v94 = v91 == nil;
    end;
    if l_GetFFlagEdpPlayerFeedbackCommentsOnly_0() then
        local v95 = false;
        if #v88 > 0 then
            v95 = false;
            if (if utf8.len(v85) then utf8.len(utf8.nfcnormalize(v85)) else string.len(v85)) > 0 then
                v95 = v91 == nil;
            end;
        end;
        v94 = v95;
        local v96;
        v95, v96 = l_useState_0(false);
        local l_v95_0 = v95 --[[ copy: 35 -> 53 ]];
        local l_v96_0 = v96 --[[ copy: 36 -> 54 ]];
        l_useEffect_0(function() --[[ Line: 210 ]]
            -- upvalues: l_v95_0 (copy), v77 (copy), l_v96_0 (copy)
            task.defer(function() --[[ Line: 212 ]]
                -- upvalues: l_v95_0 (ref), v77 (ref), l_v96_0 (ref)
                if not l_v95_0 and v77.current then
                    l_v96_0(true);
                    v77.current:CaptureFocus();
                end;
            end);
        end, {
            v77, 
            v95
        });
    end;
    local v99 = v2.useCallback(function() --[[ Line: 221 ]]
        -- upvalues: v59 (copy), v57 (copy)
        v59(v57.closeCentralOverlayThunk());
    end, {
        v57.closeCentralOverlayThunk
    });
    local v100 = v2.useCallback(function() --[[ Line: 225 ]]
        -- upvalues: v32 (ref), v61 (copy), l_rootPlaceId_0 (copy), l_categoryType_0 (copy), v99 (copy)
        v32.DismissPlayerFeedbackFormModal(v61, l_rootPlaceId_0, {
            categoryType = l_categoryType_0
        });
        v99();
    end, {
        v99, 
        l_categoryType_0, 
        l_rootPlaceId_0, 
        v61
    });
    local v102 = v2.useCallback(function(v101) --[[ Line: 230 ]]
        -- upvalues: v32 (ref), v61 (copy), l_rootPlaceId_0 (copy), l_categoryType_0 (copy), v89 (copy)
        v32.TogglePlayerFeedbackFormModalReason(v61, l_rootPlaceId_0, {
            categoryType = l_categoryType_0
        });
        v89(v101);
    end, {});
    local v107 = v2.useCallback(function() --[[ Line: 240 ]]
        -- upvalues: v32 (ref), v61 (copy), l_rootPlaceId_0 (copy), l_categoryType_0 (copy), v88 (copy), l_GetFFlagEdpPlayerFeedbackCommentsOnly_0 (ref), v85 (copy), v92 (copy), v93 (copy), l_comment_0 (copy), v59 (copy), v30 (ref), v60 (copy), l_SetCurrentToastMessage_0 (ref), v57 (copy), v99 (copy), l_SetNetworkingErrorToast_0 (ref)
        v32.ClickPlayerFeedbackFormModalSubmit(v61, l_rootPlaceId_0, {
            categoryType = l_categoryType_0
        });
        if #v88 == 0 then
            return;
        else
            if l_GetFFlagEdpPlayerFeedbackCommentsOnly_0() then
                local l_v85_0 = v85;
                if (if utf8.len(l_v85_0) then utf8.len(utf8.nfcnormalize(l_v85_0)) else string.len(l_v85_0)) == 0 then
                    v32.SubmitPlayerFeedbackFailCommentValidation(v61, l_rootPlaceId_0, {
                        categoryType = l_categoryType_0, 
                        value = "CommentTooShort"
                    });
                    v92(v93.commentTooShortMessage);
                    return;
                end;
            end;
            local l_v85_1 = v85;
            if (if utf8.len(l_v85_1) then utf8.len(utf8.nfcnormalize(l_v85_1)) else string.len(l_v85_1)) > 0 then
                l_v85_1 = v85;
                if (if utf8.len(l_v85_1) then utf8.len(utf8.nfcnormalize(l_v85_1)) else string.len(l_v85_1)) < l_comment_0.minimum_length then
                    v32.SubmitPlayerFeedbackFailCommentValidation(v61, l_rootPlaceId_0, {
                        categoryType = l_categoryType_0, 
                        value = "CommentTooShort"
                    });
                    v92(v93.commentTooShortMessage);
                    return;
                end;
            end;
            l_v85_1 = v85;
            if (if utf8.len(l_v85_1) then utf8.len(utf8.nfcnormalize(l_v85_1)) else string.len(l_v85_1)) > l_comment_0.maximum_length then
                v32.SubmitPlayerFeedbackFailCommentValidation(v61, l_rootPlaceId_0, {
                    categoryType = l_categoryType_0, 
                    value = "CommentTooLong"
                });
                v92(v93.commentTooLongMessage);
                return;
            else
                v59(v30.Post(v60, l_rootPlaceId_0, l_categoryType_0, v88, v85)):andThen(function(_) --[[ Line: 280 ]]
                    -- upvalues: v59 (ref), l_SetCurrentToastMessage_0 (ref), v57 (ref), v99 (ref)
                    v59(l_SetCurrentToastMessage_0({
                        toastMessage = "PlayerFeedbacks.VoteForm.Message.SubmitSuccess"
                    }));
                    if v57.onSubmitted then
                        v57.onSubmitted();
                    end;
                    v99();
                end, function(v106) --[[ Line: 288 ]]
                    -- upvalues: v59 (ref), l_SetNetworkingErrorToast_0 (ref)
                    v59(l_SetNetworkingErrorToast_0(v106));
                end);
                return;
            end;
        end;
    end, {
        v60, 
        v61, 
        l_comment_0.maximum_length, 
        l_comment_0.minimum_length, 
        v93.commentTooShortMessage, 
        v93.commentTooLongMessage, 
        l_rootPlaceId_0, 
        l_categoryType_0, 
        v88, 
        v85, 
        v57.onSubmitted, 
        v99
    });
    l_useEffect_0(function() --[[ Line: 308 ]]
        -- upvalues: v32 (ref), v61 (copy), l_rootPlaceId_0 (copy), l_categoryType_0 (copy)
        v32.PlayerFeedbackFormModalMounted(v61, l_rootPlaceId_0, {
            categoryType = l_categoryType_0
        });
    end, {
        v61, 
        l_rootPlaceId_0, 
        l_categoryType_0
    });
    local v108 = v2.useCallback(function() --[[ Line: 312 ]]
        -- upvalues: v32 (ref), v61 (copy), l_rootPlaceId_0 (copy), l_categoryType_0 (copy)
        v32.FocusPlayerFeedbackFormModalComment(v61, l_rootPlaceId_0, {
            categoryType = l_categoryType_0
        });
    end, {
        v61, 
        l_rootPlaceId_0, 
        l_categoryType_0
    });
    local v109 = v2.useCallback(function() --[[ Line: 320 ]]
        -- upvalues: v32 (ref), v61 (copy), l_rootPlaceId_0 (copy), l_categoryType_0 (copy), v59 (copy), l_OpenDynamicAbuseReport_0 (ref), l_AbuseVector_0 (ref), l_FFlagAddThumbnailSelectorReport_0 (ref), v38 (ref), v57 (copy), l_CloseCentralOverlay_0 (ref)
        v32.ClickPlayerFeedbackFormAbuseReportPrompt(v61, l_rootPlaceId_0, {
            categoryType = l_categoryType_0
        });
        v59(l_OpenDynamicAbuseReport_0({
            abuseVector = l_AbuseVector_0.Place, 
            targetId = l_rootPlaceId_0, 
            custom = if l_FFlagAddThumbnailSelectorReport_0 and v38 then {
                universeId = v57.universeId
            } else nil, 
            onClose = function() --[[ Line: 334 ]] --[[ Name: onClose ]]
                -- upvalues: v59 (ref), l_CloseCentralOverlay_0 (ref)
                v59(l_CloseCentralOverlay_0());
            end
        }));
    end, {
        v61, 
        l_rootPlaceId_0, 
        l_categoryType_0, 
        l_rootPlaceId_0
    });
    local v111 = v2.useCallback(function() --[[ Line: 340 ]]
        -- upvalues: v32 (ref), v61 (copy), l_rootPlaceId_0 (copy), l_categoryType_0 (copy), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), v93 (copy), v59 (copy), l_NavigateDown_0 (ref), v99 (copy)
        v32.ClickPlayerFeedbackFormAbuseReportPrompt(v61, l_rootPlaceId_0, {
            categoryType = l_categoryType_0
        });
        local v110 = {
            name = l_AppPage_0.GenericWebPage, 
            detail = l_UrlBuilder_0.game.report({
                placeId = l_rootPlaceId_0
            }), 
            extraProps = {
                title = v93.reportFlowPageTitle
            }
        };
        v59(l_NavigateDown_0(v110));
        v99();
    end, {
        v61, 
        l_rootPlaceId_0, 
        l_categoryType_0, 
        v99
    });
    local v113 = v2.useCallback(function() --[[ Line: 358 ]]
        -- upvalues: v32 (ref), v61 (copy), l_rootPlaceId_0 (copy), l_categoryType_0 (copy), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), v59 (copy), l_NavigateDown_0 (ref), v99 (copy)
        v32.ClickPlayerFeedbackFormModalDisclaimer(v61, l_rootPlaceId_0, {
            categoryType = l_categoryType_0
        });
        local v112 = {
            name = l_AppPage_0.GenericWebPage, 
            detail = l_UrlBuilder_0.static.about.terms()
        };
        v59(l_NavigateDown_0(v112));
        v99();
    end, {
        v61, 
        l_rootPlaceId_0, 
        l_categoryType_0, 
        v99
    });
    local v118 = v2.useCallback(function(v114) --[[ Line: 372 ]]
        -- upvalues: v86 (copy), l_comment_0 (copy), v91 (copy), v92 (copy)
        local l_Text_0 = v114.Text;
        v86(l_Text_0);
        local v116 = if utf8.len(l_Text_0) then utf8.len(utf8.nfcnormalize(l_Text_0)) else string.len(l_Text_0);
        local v117 = true;
        if v116 ~= 0 then
            v117 = false;
            if l_comment_0.minimum_length <= v116 then
                v117 = v116 <= l_comment_0.maximum_length;
            end;
        end;
        if v91 and v117 then
            v92(nil);
        end;
    end, {
        v91, 
        l_comment_0.minimum_length, 
        l_comment_0.maximum_length
    });
    l_useEffect_0(function() --[[ Line: 384 ]]
        -- upvalues: v76 (copy), v70 (copy)
        if not v76 or not v76.current or v70 == 0 then
            return;
        else
            v76.current.CanvasPosition = Vector2.new(0, v76.current.AbsoluteCanvasSize.Y);
            return;
        end;
    end, {
        v76, 
        v70
    });
    l_useEffect_0(function() --[[ Line: 392 ]]
        -- upvalues: l_UserInputService_0 (ref), v69 (copy), v71 (copy)
        local v119 = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ Line: 395 ]]
            -- upvalues: v69 (ref), l_UserInputService_0 (ref), v71 (ref)
            v69(l_UserInputService_0.OnScreenKeyboardVisible);
            v71(l_UserInputService_0.OnScreenKeyboardVisible and l_UserInputService_0.OnScreenKeyboardSize.Y or 0);
        end);
        return function() --[[ Line: 402 ]]
            -- upvalues: v119 (ref)
            if v119 then
                v119:Disconnect();
            end;
            v119 = nil;
        end;
    end, {});
    local l_createElement_0 = v2.createElement;
    local l_l_PartialPageModal_0_0 = l_PartialPageModal_0;
    local v122 = {
        title = l_metadata_0.form_title_label, 
        screenSize = v64, 
        onCloseClicked = v100, 
        position = v68 and UDim2.new(0.5, 0, 1, v72) or nil, 
        anchorPoint = v68 and Vector2.new(0.5, 1) or nil, 
        marginSize = 0
    };
    local v123 = {};
    local l_createElement_1 = v2.createElement;
    local l_l_VerticalScrollView_0_0 = l_VerticalScrollView_0;
    local v126 = {
        size = UDim2.new(1, 0, 0, (math.min(v74 + 25, v78))), 
        useAutomaticCanvasSize = true, 
        canvasSizeY = UDim.new(), 
        elasticBehavior = Enum.ElasticBehavior.Never, 
        scrollingFrameRef = v76, 
        ref = v76
    };
    local v128 = {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, 16), 
            [v2.Change.AbsoluteContentSize] = function(v127) --[[ Line: 436 ]]
                -- upvalues: v75 (copy)
                v75(v127.AbsoluteContentSize.Y);
            end
        }), 
        ContentPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 24), 
            PaddingLeft = UDim.new(0, 24), 
            PaddingRight = UDim.new(0, 24)
        }), 
        CheckboxesLabel = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Text = l_category_1.label, 
            TextSize = v58.Font.BaseSize, 
            TextColor3 = l_Tokens_0.Semantic.Color.Text.Emphasis.Color3, 
            TextTransparency = l_Tokens_0.Semantic.Color.Text.Emphasis.Transparency, 
            Font = l_Tokens_0.Semantic.Typography.Subheader.Font, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            TextWrapped = true, 
            Size = UDim2.new(1, 0, 0, 0), 
            LayoutOrder = 0
        }), 
        CategoryCheckboxes = if l_GetFFlagEdpPlayerFeedbackCommentsOnly_0() then nil else v2.createElement(v53, {
            category = l_category_1, 
            selectedCategoryIds = v88, 
            onOptionSelected = v102, 
            layoutOrder = 1
        }), 
        CommmentLabel = if l_GetFFlagEdpPlayerFeedbackCommentsOnly_0() then nil else v90 and v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Text = l_comment_0.label, 
            TextSize = v58.Font.BaseSize, 
            TextColor3 = l_Tokens_0.Semantic.Color.Text.Emphasis.Color3, 
            TextTransparency = l_Tokens_0.Semantic.Color.Text.Emphasis.Transparency, 
            Font = l_Tokens_0.Semantic.Typography.Subheader.Font, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            TextWrapped = true, 
            Size = UDim2.new(1, 0, 0, 0), 
            LayoutOrder = 2
        }), 
        Commment = v90 and v2.createElement("Frame", {
            BorderSizePixel = 1, 
            BackgroundColor3 = l_Tokens_0.Semantic.Color.Background.Muted.Color3, 
            BackgroundTransparency = l_Tokens_0.Semantic.Color.Background.Muted.Transparency, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 3, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, l_Tokens_0.Semantic.Radius.Small)
            }), 
            UIPadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 8), 
                PaddingBottom = UDim.new(0, 8), 
                PaddingLeft = UDim.new(0, 8), 
                PaddingRight = UDim.new(0, 8)
            }), 
            TextBox = v2.createElement("TextBox", {
                Text = v85, 
                PlaceholderText = l_comment_0.placeholder_text, 
                PlaceholderColor3 = v58.Theme.TextMuted.Color, 
                Size = UDim2.new(1, 0, 0, 100), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                ClearTextOnFocus = false, 
                MultiLine = true, 
                TextWrapped = true, 
                ClipsDescendants = true, 
                OverlayNativeInput = true, 
                TextColor3 = l_Tokens_0.Semantic.Color.Text.Emphasis.Color3, 
                TextTransparency = l_Tokens_0.Semantic.Color.Text.Emphasis.Transparency, 
                BackgroundColor3 = l_Tokens_0.Semantic.Color.Background.Muted.Color3, 
                BackgroundTransparency = l_Tokens_0.Semantic.Color.Background.Muted.Transparency, 
                Font = l_Tokens_0.Semantic.Typography.Body.Font, 
                TextSize = l_Tokens_0.Semantic.Typography.Body.FontSize, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BorderSizePixel = 0, 
                ref = v77, 
                [v2.Change.Text] = v118, 
                [v2.Event.Focused] = v108
            })
        }), 
        HelperText = if v90 and v91 ~= nil then v2.createElement("TextLabel", {
            Text = v91, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextWrapped = true, 
            BackgroundTransparency = 1, 
            TextColor3 = v58.Theme.Alert.Color, 
            Font = l_Tokens_0.Component.HelperText.Base.Typography.Font, 
            TextSize = l_Tokens_0.Semantic.Typography.CaptionHeader.FontSize, 
            LineHeight = l_Tokens_0.Component.HelperText.Base.Typography.LineHeight, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 4
        }) else nil, 
        Buttons = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 5, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            ButtonStack = v2.createElement(l_ButtonStack_0, {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimaryContextual, 
                        props = {
                            onActivated = v107, 
                            isDisabled = v94 == false, 
                            text = l_metadata_0.submit_button_label
                        }
                    }
                }
            })
        }), 
        DisclaimerText = v2.createElement("TextButton", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0), 
            Font = v58.Font.CaptionHeader.Font, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            Text = l_metadata_0.disclaimer_label, 
            [v2.Event.Activated] = v113, 
            RichText = true, 
            TextSize = l_Tokens_0.Semantic.Typography.CaptionHeader.FontSize, 
            TextColor3 = v58.Theme.TextMuted.Color, 
            TextTransparency = v58.Theme.TextMuted.Transparency, 
            LineHeight = l_Tokens_0.Global.LineHeight_400, 
            LayoutOrder = 6
        })
    };
    local v129 = false;
    if l_categoryType_0 == "Downvote" then
        v129 = v2.createElement("TextButton", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            Text = v93.abuseReportPromptText, 
            [v2.Event.Activated] = if l_FFlagEnableAbuseReportRevampFlow_0 and v36 then v109 else v111, 
            RichText = true, 
            TextSize = l_Tokens_0.Semantic.Typography.CaptionHeader.FontSize, 
            TextColor3 = v58.Theme.TextMuted.Color, 
            TextTransparency = v58.Theme.TextMuted.Transparency, 
            Font = l_Tokens_0.Semantic.Typography.Body.Font, 
            LineHeight = l_Tokens_0.Global.LineHeight_400, 
            LayoutOrder = 7
        });
    end;
    v128.AbuseReportPromptText = v129;
    v123.Content = l_createElement_1(l_l_VerticalScrollView_0_0, v126, v128);
    return l_createElement_0(l_l_PartialPageModal_0_0, v122, v123);
end;