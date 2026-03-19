local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_Roact_0 = v2.Roact;
local l_React_0 = v2.React;
local l_UIBlox_0 = v2.UIBlox;
local l_useLocalization_0 = v2.useLocalization;
local l_useStyle_0 = v2.useStyle;
local l_FullPageModal_0 = l_UIBlox_0.App.Dialog.Modal.FullPageModal;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_HorizontalPageMargin_0 = l_UIBlox_0.App.Container.HorizontalPageMargin;
local l_SectionList_0 = v2.SectionList;
local v15 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v16 = require(l_script_FirstAncestor_0.ContactsList.Components.ContactsListEntry);
local v17 = require(l_script_FirstAncestor_0.ContactsList.Components.ContactsListInviteEntry);
local v18 = require(l_script_FirstAncestor_0.ContactsList.Components.ContactsEmptyList);
local v19 = require(l_script_FirstAncestor_0.ContactsList.Components.ContactsUploadErrorModal);
local v20 = require(l_script_FirstAncestor_0.ContactsList.Components.ContactsGlimmer);
local v21 = require(l_script_FirstAncestor_0.ContactsList.Components.ContactsSyncWarningMessage);
local l_EventNames_0 = require(l_script_FirstAncestor_0.Analytics).EventNames;
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local v24 = require(l_script_FirstAncestor_0.ContactsList.Components.ContactsListSearchBar);
local l_Dash_0 = v2.Dash;
local v26 = require(l_Parent_0.Foundation);
local l_InputLabel_0 = v26.InputLabel;
local l_InputLabelSize_0 = v26.Enums.InputLabelSize;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v31 = require(l_script_FirstAncestor_0.Flags.ContactImportButtonsIXP);
local v32 = game:DefineFastFlag("ContactImportButtonsExperimentEnabled", false);
local l_FFlagAddFriendsBannersNewUI_IXP_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsBannersNewUI_IXP;
local l_IXPService_0 = game:GetService("IXPService");
local l_uprankContactsWithEmoji_0 = require(l_script_FirstAncestor_0.Utils).uprankContactsWithEmoji;
local v36 = require(l_script_FirstAncestor_0.Flags.FFlagContactsListEmojiSorting);
local v37 = game:DefineFastFlag("ContactsListEmojiSortingIxpEnabled", false);
local v38 = game:DefineFastString("ContactsListEmojiSortingIxpLayer", "Social.ContactListEmojiSorting");
local l_FFlagQRCodeCopyUpdates_0 = require(l_Parent_0.SharedFlags).FFlagQRCodeCopyUpdates;
local l_UserInputService_0 = v2.UserInputService;
return function(v41) --[[ Line: 87 ]] --[[ Name: ContactsList ]]
    -- upvalues: l_useAppPolicy_0 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v15 (copy), l_FFlagQRCodeCopyUpdates_0 (copy), v32 (copy), v31 (copy), l_Dash_0 (copy), l_EventNames_0 (copy), l_React_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v36 (copy), l_uprankContactsWithEmoji_0 (copy), v37 (copy), l_IXPService_0 (copy), v38 (copy), l_Roact_0 (copy), v16 (copy), v17 (copy), l_StyledTextLabel_0 (copy), l_ButtonType_0 (copy), l_UserInputService_0 (copy), l_FFlagAddFriendsBannersNewUI_IXP_0 (copy), v21 (copy), l_SectionList_0 (copy), v18 (copy), l_InputLabel_0 (copy), l_InputLabelSize_0 (copy), v24 (copy), v20 (copy), v19 (copy), l_FullPageModal_0 (copy), l_HorizontalPageMargin_0 (copy)
    local v43 = l_useAppPolicy_0(function(v42) --[[ Line: 88 ]]
        return v42.getWebViewSupport();
    end);
    local v44 = l_useStyle_0();
    local v45 = l_useDispatch_0();
    local v46 = l_useLocalization_0({
        fromContactsText = v15.ON_ROBLOX, 
        inviteToRobloxText = v15.INVITE_TO_ROBLOX, 
        contactsListBlurb = if l_FFlagQRCodeCopyUpdates_0 then v15.ADD_CONTACTS_AS_TRUSTED_CONNECTION_DESCRIPTION else v15.CONTACTS_LIST_DESCRIPTION, 
        connectWithFriends = v15.CONTACTS_LIST_TITLE, 
        closeModal = v15.CLOSE_MODAL, 
        goToAddFriends = v15.GO_TO_ADD_FRIENDS, 
        searchContacts = v15.SEARCH_CONTACTS, 
        learnMore = "Feature.Chat.Action.LearnMore"
    });
    local v47 = if v32 then v31.useIsRemoveCloseButtonExperimentEnabled({
        isExposureEnabled = true
    }) else false;
    local function v52(v48, v49, v50) --[[ Line: 111 ]]
        -- upvalues: l_Dash_0 (ref)
        local v51 = if #v49 ~= 0 then {
            {
                isSectionDivider = true
            }
        } else nil;
        l_Dash_0.append(v48, v49, v51, v50);
    end;
    local function v53() --[[ Line: 116 ]]
        -- upvalues: v41 (copy), l_EventNames_0 (ref)
        v41.closeModal(l_EventNames_0.CloseContactListButton);
    end;
    local function v54() --[[ Line: 120 ]]
        -- upvalues: v41 (copy), l_EventNames_0 (ref)
        v41.closeModal(l_EventNames_0.CloseContactListCross);
    end;
    local v55 = l_React_0.useCallback(function() --[[ Line: 124 ]]
        -- upvalues: v45 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v45(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = "https://en.help.roblox.com/hc/en-us/articles/37725513985812", 
            extraProps = {
                title = ""
            }
        }, nil));
    end, {
        v45
    });
    local v56, v57 = l_React_0.useState("");
    local function _(v58) --[[ Line: 136 ]]
        -- upvalues: l_Dash_0 (ref), v56 (copy)
        return l_Dash_0.filter(v58, function(v59) --[[ Line: 137 ]]
            -- upvalues: v56 (ref)
            if v59.contactName ~= nil then
                if not v59.contactName:match("^%s*$") then
                    return string.find(string.lower(v59.contactName or ""), string.lower(v56)) ~= nil;
                else
                    return false;
                end;
            else
                return string.find(string.lower(v59.contactName or ""), string.lower(v56)) ~= nil;
            end;
        end);
    end;
    local v61 = if v36 then l_React_0.useMemo(function() --[[ Line: 151 ]]
        -- upvalues: l_uprankContactsWithEmoji_0 (ref), v41 (copy)
        return l_uprankContactsWithEmoji_0(v41.matchedContacts);
    end, {
        v41.matchedContacts
    }) else nil;
    local v62 = if v36 then l_React_0.useMemo(function() --[[ Line: 156 ]]
        -- upvalues: l_uprankContactsWithEmoji_0 (ref), v41 (copy)
        return l_uprankContactsWithEmoji_0(v41.deviceContacts);
    end, {
        v41.deviceContacts
    }) else nil;
    local v63 = {};
    local v64 = {};
    if v36 then
        v63 = l_Dash_0.filter(v61, function(v65) --[[ Line: 137 ]]
            -- upvalues: v56 (copy)
            if v65.contactName ~= nil then
                if not v65.contactName:match("^%s*$") then
                    return string.find(string.lower(v65.contactName or ""), string.lower(v56)) ~= nil;
                else
                    return false;
                end;
            else
                return string.find(string.lower(v65.contactName or ""), string.lower(v56)) ~= nil;
            end;
        end);
    else
        local l_matchedContacts_0 = v41.matchedContacts;
        v63 = l_Dash_0.filter(l_matchedContacts_0, function(v67) --[[ Line: 137 ]]
            -- upvalues: v56 (copy)
            if v67.contactName ~= nil then
                if not v67.contactName:match("^%s*$") then
                    return string.find(string.lower(v67.contactName or ""), string.lower(v56)) ~= nil;
                else
                    return false;
                end;
            else
                return string.find(string.lower(v67.contactName or ""), string.lower(v56)) ~= nil;
            end;
        end);
    end;
    if v36 then
        v64 = l_Dash_0.filter(v62, function(v68) --[[ Line: 137 ]]
            -- upvalues: v56 (copy)
            if v68.contactName ~= nil then
                if not v68.contactName:match("^%s*$") then
                    return string.find(string.lower(v68.contactName or ""), string.lower(v56)) ~= nil;
                else
                    return false;
                end;
            else
                return string.find(string.lower(v68.contactName or ""), string.lower(v56)) ~= nil;
            end;
        end);
    else
        local l_deviceContacts_0 = v41.deviceContacts;
        v64 = l_Dash_0.filter(l_deviceContacts_0, function(v70) --[[ Line: 137 ]]
            -- upvalues: v56 (copy)
            if v70.contactName ~= nil then
                if not v70.contactName:match("^%s*$") then
                    return string.find(string.lower(v70.contactName or ""), string.lower(v56)) ~= nil;
                else
                    return false;
                end;
            else
                return string.find(string.lower(v70.contactName or ""), string.lower(v56)) ~= nil;
            end;
        end);
    end;
    if v37 then
        l_React_0.useEffect(function() --[[ Line: 171 ]]
            -- upvalues: l_IXPService_0 (ref), v38 (ref)
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v38);
        end, {});
    end;
    local v71 = {};
    v52(v71, v63, v64);
    local v72 = {};
    if #v63 > 0 then
        table.insert(v72, {
            data = v63, 
            title = v46.fromContactsText, 
            sectionNumber = #v72 + 1
        });
    end;
    if #v64 > 0 then
        table.insert(v72, {
            data = v64, 
            title = v46.inviteToRobloxText, 
            sectionNumber = #v72 + 1
        });
    end;
    local function _() --[[ Line: 197 ]]
        -- upvalues: v41 (copy)
        return #v41.matchedContacts + #v41.deviceContacts == 0;
    end;
    local function v77(v74) --[[ Line: 201 ]]
        -- upvalues: l_Roact_0 (ref), v44 (copy), v16 (ref), v46 (copy), v41 (copy), v17 (ref)
        local l_item_0 = v74.item;
        if l_item_0.isSectionDivider then
            local v76 = v74.index ~= 1;
            return l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 24)
            }, {
                divider = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, v76 and 0.5 or 0.5, 0), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v44.Theme.Divider.Color, 
                    BackgroundTransparency = v44.Theme.Divider.Transparency
                })
            });
        elseif l_item_0.isMatchedContact then
            return l_Roact_0.createElement(v16, {
                contactName = l_item_0.contactName, 
                contactId = l_item_0.contactId, 
                contextualInfo = v46.fromContactsText, 
                hasDivider = true, 
                hasSentRequest = l_item_0.hasSentRequest, 
                requestFriendship = v41.requestFriendship, 
                openProfilePeekView = v41.openProfilePeekView, 
                headshotThumbnailUrl = l_item_0.headshotThumbnailUrl, 
                avatarThumbnailUrl = l_item_0.avatarThumbnailUrl
            });
        else
            return l_Roact_0.createElement(v17, {
                contactName = l_item_0.contactName, 
                deviceContactId = l_item_0.deviceContactId, 
                hasDivider = true, 
                phoneNumber = l_item_0.phoneNumber, 
                hasSentRequest = l_item_0.hasSentRequest
            });
        end;
    end;
    local function v79(v78) --[[ Line: 240 ]]
        -- upvalues: l_Roact_0 (ref), l_StyledTextLabel_0 (ref), v44 (copy)
        if v78.section then
            return l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                layout = l_Roact_0.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                padding = if v78.section.sectionNumber ~= 1 then l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 24), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }) else nil; 
                l_Roact_0.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 24), 
                    BackgroundTransparency = 1
                }, {
                    sectionHeaderTextLabel = l_Roact_0.createElement(l_StyledTextLabel_0, {
                        fontStyle = v44.Font.Header2, 
                        colorStyle = v44.Theme.TextDefault, 
                        text = v78.section.title or ""
                    })
                })
            });
        else
            return l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 24)
            }, {
                divider = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 0.5, 0), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v44.Theme.Divider.Color, 
                    BackgroundTransparency = v44.Theme.Divider.Transparency
                })
            });
        end;
    end;
    local function v81(v80) --[[ Line: 285 ]]
        -- upvalues: v41 (copy), l_ButtonType_0 (ref), l_Dash_0 (ref), v47 (copy), v53 (copy)
        if v41.isFetching then
            return {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        isLoading = true, 
                        onActivated = l_Dash_0.noop
                    }
                }
            };
        elseif v41.showAddFriendsButton and #v41.matchedContacts + #v41.deviceContacts == 0 then
            if v47 then
                return {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v41.onAddFriendsActivated, 
                            text = v80.goToAddFriends
                        }
                    }
                };
            else
                return {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v41.onAddFriendsActivated, 
                            text = v80.goToAddFriends
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v53, 
                            text = v80.closeModal
                        }
                    }
                };
            end;
        elseif v47 then
            return {};
        else
            return {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v53, 
                        text = v80.closeModal
                    }
                }
            };
        end;
    end;
    local l_Y_0 = l_UserInputService_0.StatusBarSize.Y;
    local v83 = if l_FFlagAddFriendsBannersNewUI_IXP_0 then v21.useIsVisible() else nil;
    local v84 = {
        layout = l_Roact_0.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        }), 
        contactsSyncWarning = if l_FFlagAddFriendsBannersNewUI_IXP_0 and v83 then l_React_0.createElement(v21.Component, {
            layoutOrder = -1
        }) else nil
    };
    local v85 = l_React_0.createRef();
    local function v87(v86) --[[ Line: 361 ]]
        -- upvalues: v57 (copy)
        v57(v86);
    end;
    local v88 = if #v71 ~= 0 then l_Roact_0.createElement(l_SectionList_0, {
        ref = v85, 
        sections = v72, 
        renderSectionHeader = if #v63 > 0 then v79 else nil, 
        renderItem = v77, 
        initialNumToRender = 15, 
        CanvasSize = UDim2.new(1, 0, 0, #v71 * 73), 
        contentContainerStyle = {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, 
        style = {
            BackgroundTransparency = 1, 
            ScrollBarThickness = 0, 
            LayoutOrder = 8, 
            Size = UDim2.new(1, 0, 1, -80 - (v47 and 0 or 48) - 36 - 16), 
            ElasticBehavior = Enum.ElasticBehavior.Always
        }
    }) else l_Roact_0.createElement(v18, {
        errorTextKey = v15.NO_RESULTS, 
        layoutOrder = 8
    });
    local v89 = {
        layout = l_Roact_0.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        }), 
        contactsSyncWarning = if l_FFlagAddFriendsBannersNewUI_IXP_0 and v83 then l_React_0.createElement(v21.Component, {
            layoutOrder = -1
        }) else nil, 
        spacer1 = if l_FFlagAddFriendsBannersNewUI_IXP_0 and v83 then nil else l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 24), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }), 
        descriptionFrame = if l_FFlagAddFriendsBannersNewUI_IXP_0 and v83 then nil else l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 80), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            textLayout = l_Roact_0.createElement("UIListLayout", {
                HorizontalAlignment = if l_FFlagQRCodeCopyUpdates_0 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            descriptionText = l_Roact_0.createElement(l_StyledTextLabel_0, {
                text = v46.contactsListBlurb, 
                automaticSize = Enum.AutomaticSize.Y, 
                colorStyle = v44.Theme.TextDefault, 
                fontStyle = v44.Font.Body, 
                lineHeight = 1, 
                size = UDim2.new(1, 0, 0, 0), 
                maxSize = Vector2.new(0, 80), 
                textXAlignment = if l_FFlagQRCodeCopyUpdates_0 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center, 
                textYAlignment = Enum.TextYAlignment.Center, 
                layoutOrder = 1
            }), 
            LearnMoreWebLink = v43 and l_React_0.createElement(l_InputLabel_0, {
                LayoutOrder = 2, 
                tag = "auto-y size-full-0", 
                RichText = true, 
                Text = ("<u>%*</u>"):format(v46.learnMore), 
                size = l_InputLabelSize_0.Large, 
                onActivated = v55
            })
        }), 
        spacer2 = if l_FFlagAddFriendsBannersNewUI_IXP_0 and v83 then nil else l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 24), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }), 
        searchBarContainer = l_Roact_0.createElement(v24, {
            height = 36, 
            layoutOrder = 4, 
            textChangeCallback = v87
        }), 
        spacer4 = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 16), 
            BackgroundTransparency = 1, 
            LayoutOrder = 7
        }), 
        contactsList = v88
    };
    if v41.isFetching then
        for _, v91 in {
            1, 
            2, 
            3
        } do
            v84["glimmer" .. v91] = l_Roact_0.createElement(v20, {
                layoutOrder = v91
            });
        end;
    elseif v41.hasUploadError and #v41.matchedContacts + #v41.deviceContacts == 0 then
        v84.errorModal = l_Roact_0.createElement(v19);
    elseif #v41.matchedContacts + #v41.deviceContacts == 0 then
        v84.emptyList = l_Roact_0.createElement(v18);
    else
        v84 = v89;
    end;
    return l_Roact_0.createElement(l_FullPageModal_0, {
        title = v46.connectWithFriends, 
        screenSize = v41.screenSize, 
        marginSize = 0, 
        distanceFromTop = l_Y_0, 
        onCloseClicked = v54, 
        buttonStackProps = {
            buttons = v81(v46), 
            buttonHeight = v47 and 0 or 48, 
            forcedFillDirection = Enum.FillDirection.Vertical
        }
    }, {
        hpm = l_Roact_0.createElement(l_HorizontalPageMargin_0, {
            size = UDim2.new(1, 0, 1, 0), 
            position = UDim2.new(0, 0, 0, 0), 
            backgroundTransparency = 1
        }, {
            contentFrame = l_Roact_0.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1
            }, v84), 
            gradientFrame = l_Roact_0.createElement("Frame", {
                Position = UDim2.new(0, 0, 1, v47 and 0 or -24), 
                Size = UDim2.new(1, 0, 0, 24), 
                BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                ZIndex = 2
            }, {
                gradient = l_Roact_0.createElement("UIGradient", {
                    Rotation = 270, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, v44.Theme.BackgroundUIDefault.Color), 
                        ColorSequenceKeypoint.new(1, v44.Theme.BackgroundUIDefault.Color)
                    }), 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0), 
                        NumberSequenceKeypoint.new(1, 1)
                    })
                })
            })
        })
    });
end;