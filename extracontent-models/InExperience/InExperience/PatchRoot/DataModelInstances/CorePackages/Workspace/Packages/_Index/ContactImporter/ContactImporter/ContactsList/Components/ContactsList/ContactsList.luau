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
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local l_FStringCanAccessTrustedContactsAmpFeature_0 = require(l_Parent_0.SharedFlags).FStringCanAccessTrustedContactsAmpFeature;
local l_FStringCanAccessTrustedContactsAmpNameSpace_0 = require(l_Parent_0.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace;
local l_AmpApiProvider_0 = require(l_Parent_0.AmpUpsell).AmpApiProvider;
local l_AmpEnums_0 = require(l_Parent_0.AmpUpsell).AmpEnums;
local l_UserInputService_0 = v2.UserInputService;
return function(v46) --[[ Line: 92 ]] --[[ Name: ContactsList ]]
    -- upvalues: l_useAppPolicy_0 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v15 (copy), l_FFlagQRCodeCopyUpdates_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v32 (copy), v31 (copy), l_Dash_0 (copy), l_EventNames_0 (copy), l_React_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v36 (copy), l_uprankContactsWithEmoji_0 (copy), v37 (copy), l_IXPService_0 (copy), v38 (copy), l_AmpApiProvider_0 (copy), l_FStringCanAccessTrustedContactsAmpFeature_0 (copy), l_FStringCanAccessTrustedContactsAmpNameSpace_0 (copy), l_AmpEnums_0 (copy), l_Roact_0 (copy), v16 (copy), v17 (copy), l_StyledTextLabel_0 (copy), l_ButtonType_0 (copy), l_UserInputService_0 (copy), l_FFlagAddFriendsBannersNewUI_IXP_0 (copy), v21 (copy), l_SectionList_0 (copy), v18 (copy), l_InputLabel_0 (copy), l_InputLabelSize_0 (copy), v24 (copy), v20 (copy), v19 (copy), l_FullPageModal_0 (copy), l_HorizontalPageMargin_0 (copy)
    local v48 = l_useAppPolicy_0(function(v47) --[[ Line: 93 ]]
        return v47.getWebViewSupport();
    end);
    local v49 = l_useStyle_0();
    local v50 = l_useDispatch_0();
    local v51 = l_useLocalization_0({
        fromContactsText = v15.ON_ROBLOX, 
        inviteToRobloxText = v15.INVITE_TO_ROBLOX, 
        contactsListBlurb = v15.CONTACTS_LIST_DESCRIPTION, 
        contactsListTCEducationBlurb = if l_FFlagQRCodeCopyUpdates_0 then v15.ADD_CONTACTS_AS_TRUSTED_CONNECTION_DESCRIPTION else nil, 
        contactsListTFEducationBlurb = if l_FFlagConnectionsToFriendsRename_0 then v15.ADD_CONTACTS_AS_TRUSTED_FRIENDS_DESCRIPTION else nil, 
        connectWithFriends = v15.CONTACTS_LIST_TITLE, 
        closeModal = v15.CLOSE_MODAL, 
        goToAddFriends = v15.GO_TO_ADD_FRIENDS, 
        searchContacts = v15.SEARCH_CONTACTS, 
        learnMore = "Feature.Chat.Action.LearnMore"
    });
    local v52 = if v32 then v31.useIsRemoveCloseButtonExperimentEnabled({
        isExposureEnabled = true
    }) else false;
    local function v57(v53, v54, v55) --[[ Line: 120 ]]
        -- upvalues: l_Dash_0 (ref)
        local v56 = if #v54 ~= 0 then {
            {
                isSectionDivider = true
            }
        } else nil;
        l_Dash_0.append(v53, v54, v56, v55);
    end;
    local function v58() --[[ Line: 125 ]]
        -- upvalues: v46 (copy), l_EventNames_0 (ref)
        v46.closeModal(l_EventNames_0.CloseContactListButton);
    end;
    local function v59() --[[ Line: 129 ]]
        -- upvalues: v46 (copy), l_EventNames_0 (ref)
        v46.closeModal(l_EventNames_0.CloseContactListCross);
    end;
    local v60 = l_React_0.useCallback(function() --[[ Line: 133 ]]
        -- upvalues: v50 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v50(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = "https://en.help.roblox.com/hc/en-us/articles/37725513985812", 
            extraProps = {
                title = ""
            }
        }, nil));
    end, {
        v50
    });
    local v61, v62 = l_React_0.useState("");
    local function _(v63) --[[ Line: 145 ]]
        -- upvalues: l_Dash_0 (ref), v61 (copy)
        return l_Dash_0.filter(v63, function(v64) --[[ Line: 146 ]]
            -- upvalues: v61 (ref)
            if v64.contactName ~= nil then
                if not v64.contactName:match("^%s*$") then
                    return string.find(string.lower(v64.contactName or ""), string.lower(v61)) ~= nil;
                else
                    return false;
                end;
            else
                return string.find(string.lower(v64.contactName or ""), string.lower(v61)) ~= nil;
            end;
        end);
    end;
    local v66 = if v36 then l_React_0.useMemo(function() --[[ Line: 160 ]]
        -- upvalues: l_uprankContactsWithEmoji_0 (ref), v46 (copy)
        return l_uprankContactsWithEmoji_0(v46.matchedContacts);
    end, {
        v46.matchedContacts
    }) else nil;
    local v67 = if v36 then l_React_0.useMemo(function() --[[ Line: 165 ]]
        -- upvalues: l_uprankContactsWithEmoji_0 (ref), v46 (copy)
        return l_uprankContactsWithEmoji_0(v46.deviceContacts);
    end, {
        v46.deviceContacts
    }) else nil;
    local v68 = {};
    local v69 = {};
    if v36 then
        v68 = l_Dash_0.filter(v66, function(v70) --[[ Line: 146 ]]
            -- upvalues: v61 (copy)
            if v70.contactName ~= nil then
                if not v70.contactName:match("^%s*$") then
                    return string.find(string.lower(v70.contactName or ""), string.lower(v61)) ~= nil;
                else
                    return false;
                end;
            else
                return string.find(string.lower(v70.contactName or ""), string.lower(v61)) ~= nil;
            end;
        end);
    else
        local l_matchedContacts_0 = v46.matchedContacts;
        v68 = l_Dash_0.filter(l_matchedContacts_0, function(v72) --[[ Line: 146 ]]
            -- upvalues: v61 (copy)
            if v72.contactName ~= nil then
                if not v72.contactName:match("^%s*$") then
                    return string.find(string.lower(v72.contactName or ""), string.lower(v61)) ~= nil;
                else
                    return false;
                end;
            else
                return string.find(string.lower(v72.contactName or ""), string.lower(v61)) ~= nil;
            end;
        end);
    end;
    if v36 then
        v69 = l_Dash_0.filter(v67, function(v73) --[[ Line: 146 ]]
            -- upvalues: v61 (copy)
            if v73.contactName ~= nil then
                if not v73.contactName:match("^%s*$") then
                    return string.find(string.lower(v73.contactName or ""), string.lower(v61)) ~= nil;
                else
                    return false;
                end;
            else
                return string.find(string.lower(v73.contactName or ""), string.lower(v61)) ~= nil;
            end;
        end);
    else
        local l_deviceContacts_0 = v46.deviceContacts;
        v69 = l_Dash_0.filter(l_deviceContacts_0, function(v75) --[[ Line: 146 ]]
            -- upvalues: v61 (copy)
            if v75.contactName ~= nil then
                if not v75.contactName:match("^%s*$") then
                    return string.find(string.lower(v75.contactName or ""), string.lower(v61)) ~= nil;
                else
                    return false;
                end;
            else
                return string.find(string.lower(v75.contactName or ""), string.lower(v61)) ~= nil;
            end;
        end);
    end;
    if v37 then
        l_React_0.useEffect(function() --[[ Line: 180 ]]
            -- upvalues: l_IXPService_0 (ref), v38 (ref)
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v38);
        end, {});
    end;
    local v76, v77 = l_React_0.useState(false);
    if l_FFlagQRCodeCopyUpdates_0 then
        l_React_0.useEffect(function() --[[ Line: 188 ]]
            -- upvalues: l_AmpApiProvider_0 (ref), l_FStringCanAccessTrustedContactsAmpFeature_0 (ref), l_FStringCanAccessTrustedContactsAmpNameSpace_0 (ref), l_AmpEnums_0 (ref), v77 (copy)
            if l_AmpApiProvider_0.upsellFeatureAccess(l_FStringCanAccessTrustedContactsAmpFeature_0, {}, l_FStringCanAccessTrustedContactsAmpNameSpace_0).access == l_AmpEnums_0.AccessResponseEnum.Granted then
                v77(true);
            end;
        end);
    end;
    local v78 = {};
    v57(v78, v68, v69);
    local v79 = {};
    if #v68 > 0 then
        table.insert(v79, {
            data = v68, 
            title = v51.fromContactsText, 
            sectionNumber = #v79 + 1
        });
    end;
    if #v69 > 0 then
        table.insert(v79, {
            data = v69, 
            title = v51.inviteToRobloxText, 
            sectionNumber = #v79 + 1
        });
    end;
    local function _() --[[ Line: 217 ]]
        -- upvalues: v46 (copy)
        return #v46.matchedContacts + #v46.deviceContacts == 0;
    end;
    local function v84(v81) --[[ Line: 221 ]]
        -- upvalues: l_Roact_0 (ref), v49 (copy), v16 (ref), v51 (copy), v46 (copy), v17 (ref)
        local l_item_0 = v81.item;
        if l_item_0.isSectionDivider then
            local v83 = v81.index ~= 1;
            return l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 24)
            }, {
                divider = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, v83 and 0.5 or 0.5, 0), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v49.Theme.Divider.Color, 
                    BackgroundTransparency = v49.Theme.Divider.Transparency
                })
            });
        elseif l_item_0.isMatchedContact then
            return l_Roact_0.createElement(v16, {
                contactName = l_item_0.contactName, 
                contactId = l_item_0.contactId, 
                contextualInfo = v51.fromContactsText, 
                hasDivider = true, 
                hasSentRequest = l_item_0.hasSentRequest, 
                requestFriendship = v46.requestFriendship, 
                openProfilePeekView = v46.openProfilePeekView, 
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
    local function v86(v85) --[[ Line: 260 ]]
        -- upvalues: l_Roact_0 (ref), l_StyledTextLabel_0 (ref), v49 (copy)
        if v85.section then
            return l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                layout = l_Roact_0.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                padding = if v85.section.sectionNumber ~= 1 then l_Roact_0.createElement("Frame", {
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
                        fontStyle = v49.Font.Header2, 
                        colorStyle = v49.Theme.TextDefault, 
                        text = v85.section.title or ""
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
                    BackgroundColor3 = v49.Theme.Divider.Color, 
                    BackgroundTransparency = v49.Theme.Divider.Transparency
                })
            });
        end;
    end;
    local function v88(v87) --[[ Line: 305 ]]
        -- upvalues: v46 (copy), l_ButtonType_0 (ref), l_Dash_0 (ref), v52 (copy), v58 (copy)
        if v46.isFetching then
            return {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        isLoading = true, 
                        onActivated = l_Dash_0.noop
                    }
                }
            };
        elseif v46.showAddFriendsButton and #v46.matchedContacts + #v46.deviceContacts == 0 then
            if v52 then
                return {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v46.onAddFriendsActivated, 
                            text = v87.goToAddFriends
                        }
                    }
                };
            else
                return {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v46.onAddFriendsActivated, 
                            text = v87.goToAddFriends
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v58, 
                            text = v87.closeModal
                        }
                    }
                };
            end;
        elseif v52 then
            return {};
        else
            return {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v58, 
                        text = v87.closeModal
                    }
                }
            };
        end;
    end;
    local l_Y_0 = l_UserInputService_0.StatusBarSize.Y;
    local v90 = if l_FFlagAddFriendsBannersNewUI_IXP_0 then v21.useIsVisible() else nil;
    local v91 = {
        layout = l_Roact_0.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        }), 
        contactsSyncWarning = if l_FFlagAddFriendsBannersNewUI_IXP_0 and v90 then l_React_0.createElement(v21.Component, {
            layoutOrder = -1
        }) else nil
    };
    local v92 = l_React_0.createRef();
    local function v94(v93) --[[ Line: 381 ]]
        -- upvalues: v62 (copy)
        v62(v93);
    end;
    local v95 = if #v78 ~= 0 then l_Roact_0.createElement(l_SectionList_0, {
        ref = v92, 
        sections = v79, 
        renderSectionHeader = if #v68 > 0 then v86 else nil, 
        renderItem = v84, 
        initialNumToRender = 15, 
        CanvasSize = UDim2.new(1, 0, 0, #v78 * 73), 
        contentContainerStyle = {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, 
        style = {
            BackgroundTransparency = 1, 
            ScrollBarThickness = 0, 
            LayoutOrder = 8, 
            Size = UDim2.new(1, 0, 1, -80 - (v52 and 0 or 48) - 36 - 16), 
            ElasticBehavior = Enum.ElasticBehavior.Always
        }
    }) else l_Roact_0.createElement(v18, {
        errorTextKey = v15.NO_RESULTS, 
        layoutOrder = 8
    });
    local v96 = {
        layout = l_Roact_0.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        }), 
        contactsSyncWarning = if l_FFlagAddFriendsBannersNewUI_IXP_0 and v90 then l_React_0.createElement(v21.Component, {
            layoutOrder = -1
        }) else nil, 
        spacer1 = if l_FFlagAddFriendsBannersNewUI_IXP_0 and v90 then nil else l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 24), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }), 
        descriptionFrame = if l_FFlagAddFriendsBannersNewUI_IXP_0 and v90 then nil else l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 80), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            textLayout = l_Roact_0.createElement("UIListLayout", {
                HorizontalAlignment = if l_FFlagQRCodeCopyUpdates_0 and v76 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            descriptionText = l_Roact_0.createElement(l_StyledTextLabel_0, {
                text = if l_FFlagQRCodeCopyUpdates_0 and v76 then if l_FFlagConnectionsToFriendsRename_0 then v51.contactsListTFEducationBlurb else v51.contactsListTCEducationBlurb else v51.contactsListBlurb, 
                automaticSize = Enum.AutomaticSize.Y, 
                colorStyle = v49.Theme.TextDefault, 
                fontStyle = v49.Font.Body, 
                lineHeight = 1, 
                size = UDim2.new(1, 0, 0, 0), 
                maxSize = Vector2.new(0, 80), 
                textXAlignment = if l_FFlagQRCodeCopyUpdates_0 and v76 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center, 
                textYAlignment = Enum.TextYAlignment.Center, 
                layoutOrder = 1
            }), 
            LearnMoreWebLink = v48 and l_React_0.createElement(l_InputLabel_0, {
                LayoutOrder = 2, 
                tag = "auto-y size-full-0", 
                RichText = true, 
                Text = ("<u>%*</u>"):format(v51.learnMore), 
                size = l_InputLabelSize_0.Large, 
                onActivated = v60
            })
        }), 
        spacer2 = if l_FFlagAddFriendsBannersNewUI_IXP_0 and v90 then nil else l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 24), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }), 
        searchBarContainer = l_Roact_0.createElement(v24, {
            height = 36, 
            layoutOrder = 4, 
            textChangeCallback = v94
        }), 
        spacer4 = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 16), 
            BackgroundTransparency = 1, 
            LayoutOrder = 7
        }), 
        contactsList = v95
    };
    if v46.isFetching then
        for _, v98 in {
            1, 
            2, 
            3
        } do
            v91["glimmer" .. v98] = l_Roact_0.createElement(v20, {
                layoutOrder = v98
            });
        end;
    elseif v46.hasUploadError and #v46.matchedContacts + #v46.deviceContacts == 0 then
        v91.errorModal = l_Roact_0.createElement(v19);
    elseif #v46.matchedContacts + #v46.deviceContacts == 0 then
        v91.emptyList = l_Roact_0.createElement(v18);
    else
        v91 = v96;
    end;
    return l_Roact_0.createElement(l_FullPageModal_0, {
        title = v51.connectWithFriends, 
        screenSize = v46.screenSize, 
        marginSize = 0, 
        distanceFromTop = l_Y_0, 
        onCloseClicked = v59, 
        buttonStackProps = {
            buttons = v88(v51), 
            buttonHeight = v52 and 0 or 48, 
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
            }, v91), 
            gradientFrame = l_Roact_0.createElement("Frame", {
                Position = UDim2.new(0, 0, 1, v52 and 0 or -24), 
                Size = UDim2.new(1, 0, 0, 24), 
                BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                ZIndex = 2
            }, {
                gradient = l_Roact_0.createElement("UIGradient", {
                    Rotation = 270, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, v49.Theme.BackgroundUIDefault.Color), 
                        ColorSequenceKeypoint.new(1, v49.Theme.BackgroundUIDefault.Color)
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