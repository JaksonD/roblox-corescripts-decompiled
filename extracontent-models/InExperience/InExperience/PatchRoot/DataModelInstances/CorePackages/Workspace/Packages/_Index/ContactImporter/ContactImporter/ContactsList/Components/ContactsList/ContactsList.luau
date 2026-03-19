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
local l_FStringCanAccessTrustedContactsAmpFeature_0 = require(l_Parent_0.SharedFlags).FStringCanAccessTrustedContactsAmpFeature;
local l_FStringCanAccessTrustedContactsAmpNameSpace_0 = require(l_Parent_0.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace;
local l_AmpApiProvider_0 = require(l_Parent_0.AmpUpsell).AmpApiProvider;
local l_AmpEnums_0 = require(l_Parent_0.AmpUpsell).AmpEnums;
local l_UserInputService_0 = v2.UserInputService;
return function(v45) --[[ Line: 91 ]] --[[ Name: ContactsList ]]
    -- upvalues: l_useAppPolicy_0 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v15 (copy), l_FFlagQRCodeCopyUpdates_0 (copy), v32 (copy), v31 (copy), l_Dash_0 (copy), l_EventNames_0 (copy), l_React_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v36 (copy), l_uprankContactsWithEmoji_0 (copy), v37 (copy), l_IXPService_0 (copy), v38 (copy), l_AmpApiProvider_0 (copy), l_FStringCanAccessTrustedContactsAmpFeature_0 (copy), l_FStringCanAccessTrustedContactsAmpNameSpace_0 (copy), l_AmpEnums_0 (copy), l_Roact_0 (copy), v16 (copy), v17 (copy), l_StyledTextLabel_0 (copy), l_ButtonType_0 (copy), l_UserInputService_0 (copy), l_FFlagAddFriendsBannersNewUI_IXP_0 (copy), v21 (copy), l_SectionList_0 (copy), v18 (copy), l_InputLabel_0 (copy), l_InputLabelSize_0 (copy), v24 (copy), v20 (copy), v19 (copy), l_FullPageModal_0 (copy), l_HorizontalPageMargin_0 (copy)
    local v47 = l_useAppPolicy_0(function(v46) --[[ Line: 92 ]]
        return v46.getWebViewSupport();
    end);
    local v48 = l_useStyle_0();
    local v49 = l_useDispatch_0();
    local v50 = l_useLocalization_0({
        fromContactsText = v15.ON_ROBLOX, 
        inviteToRobloxText = v15.INVITE_TO_ROBLOX, 
        contactsListBlurb = v15.CONTACTS_LIST_DESCRIPTION, 
        contactsListTCEducationBlurb = if l_FFlagQRCodeCopyUpdates_0 then v15.ADD_CONTACTS_AS_TRUSTED_CONNECTION_DESCRIPTION else nil, 
        connectWithFriends = v15.CONTACTS_LIST_TITLE, 
        closeModal = v15.CLOSE_MODAL, 
        goToAddFriends = v15.GO_TO_ADD_FRIENDS, 
        searchContacts = v15.SEARCH_CONTACTS, 
        learnMore = "Feature.Chat.Action.LearnMore"
    });
    local v51 = if v32 then v31.useIsRemoveCloseButtonExperimentEnabled({
        isExposureEnabled = true
    }) else false;
    local function v56(v52, v53, v54) --[[ Line: 116 ]]
        -- upvalues: l_Dash_0 (ref)
        local v55 = if #v53 ~= 0 then {
            {
                isSectionDivider = true
            }
        } else nil;
        l_Dash_0.append(v52, v53, v55, v54);
    end;
    local function v57() --[[ Line: 121 ]]
        -- upvalues: v45 (copy), l_EventNames_0 (ref)
        v45.closeModal(l_EventNames_0.CloseContactListButton);
    end;
    local function v58() --[[ Line: 125 ]]
        -- upvalues: v45 (copy), l_EventNames_0 (ref)
        v45.closeModal(l_EventNames_0.CloseContactListCross);
    end;
    local v59 = l_React_0.useCallback(function() --[[ Line: 129 ]]
        -- upvalues: v49 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v49(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = "https://en.help.roblox.com/hc/en-us/articles/37725513985812", 
            extraProps = {
                title = ""
            }
        }, nil));
    end, {
        v49
    });
    local v60, v61 = l_React_0.useState("");
    local function _(v62) --[[ Line: 141 ]]
        -- upvalues: l_Dash_0 (ref), v60 (copy)
        return l_Dash_0.filter(v62, function(v63) --[[ Line: 142 ]]
            -- upvalues: v60 (ref)
            if v63.contactName ~= nil then
                if not v63.contactName:match("^%s*$") then
                    return string.find(string.lower(v63.contactName or ""), string.lower(v60)) ~= nil;
                else
                    return false;
                end;
            else
                return string.find(string.lower(v63.contactName or ""), string.lower(v60)) ~= nil;
            end;
        end);
    end;
    local v65 = if v36 then l_React_0.useMemo(function() --[[ Line: 156 ]]
        -- upvalues: l_uprankContactsWithEmoji_0 (ref), v45 (copy)
        return l_uprankContactsWithEmoji_0(v45.matchedContacts);
    end, {
        v45.matchedContacts
    }) else nil;
    local v66 = if v36 then l_React_0.useMemo(function() --[[ Line: 161 ]]
        -- upvalues: l_uprankContactsWithEmoji_0 (ref), v45 (copy)
        return l_uprankContactsWithEmoji_0(v45.deviceContacts);
    end, {
        v45.deviceContacts
    }) else nil;
    local v67 = {};
    local v68 = {};
    if v36 then
        v67 = l_Dash_0.filter(v65, function(v69) --[[ Line: 142 ]]
            -- upvalues: v60 (copy)
            if v69.contactName ~= nil then
                if not v69.contactName:match("^%s*$") then
                    return string.find(string.lower(v69.contactName or ""), string.lower(v60)) ~= nil;
                else
                    return false;
                end;
            else
                return string.find(string.lower(v69.contactName or ""), string.lower(v60)) ~= nil;
            end;
        end);
    else
        local l_matchedContacts_0 = v45.matchedContacts;
        v67 = l_Dash_0.filter(l_matchedContacts_0, function(v71) --[[ Line: 142 ]]
            -- upvalues: v60 (copy)
            if v71.contactName ~= nil then
                if not v71.contactName:match("^%s*$") then
                    return string.find(string.lower(v71.contactName or ""), string.lower(v60)) ~= nil;
                else
                    return false;
                end;
            else
                return string.find(string.lower(v71.contactName or ""), string.lower(v60)) ~= nil;
            end;
        end);
    end;
    if v36 then
        v68 = l_Dash_0.filter(v66, function(v72) --[[ Line: 142 ]]
            -- upvalues: v60 (copy)
            if v72.contactName ~= nil then
                if not v72.contactName:match("^%s*$") then
                    return string.find(string.lower(v72.contactName or ""), string.lower(v60)) ~= nil;
                else
                    return false;
                end;
            else
                return string.find(string.lower(v72.contactName or ""), string.lower(v60)) ~= nil;
            end;
        end);
    else
        local l_deviceContacts_0 = v45.deviceContacts;
        v68 = l_Dash_0.filter(l_deviceContacts_0, function(v74) --[[ Line: 142 ]]
            -- upvalues: v60 (copy)
            if v74.contactName ~= nil then
                if not v74.contactName:match("^%s*$") then
                    return string.find(string.lower(v74.contactName or ""), string.lower(v60)) ~= nil;
                else
                    return false;
                end;
            else
                return string.find(string.lower(v74.contactName or ""), string.lower(v60)) ~= nil;
            end;
        end);
    end;
    if v37 then
        l_React_0.useEffect(function() --[[ Line: 176 ]]
            -- upvalues: l_IXPService_0 (ref), v38 (ref)
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v38);
        end, {});
    end;
    local v75, v76 = l_React_0.useState(false);
    if l_FFlagQRCodeCopyUpdates_0 then
        l_React_0.useEffect(function() --[[ Line: 184 ]]
            -- upvalues: l_AmpApiProvider_0 (ref), l_FStringCanAccessTrustedContactsAmpFeature_0 (ref), l_FStringCanAccessTrustedContactsAmpNameSpace_0 (ref), l_AmpEnums_0 (ref), v76 (copy)
            if l_AmpApiProvider_0.upsellFeatureAccess(l_FStringCanAccessTrustedContactsAmpFeature_0, {}, l_FStringCanAccessTrustedContactsAmpNameSpace_0).access == l_AmpEnums_0.AccessResponseEnum.Granted then
                v76(true);
            end;
        end);
    end;
    local v77 = {};
    v56(v77, v67, v68);
    local v78 = {};
    if #v67 > 0 then
        table.insert(v78, {
            data = v67, 
            title = v50.fromContactsText, 
            sectionNumber = #v78 + 1
        });
    end;
    if #v68 > 0 then
        table.insert(v78, {
            data = v68, 
            title = v50.inviteToRobloxText, 
            sectionNumber = #v78 + 1
        });
    end;
    local function _() --[[ Line: 213 ]]
        -- upvalues: v45 (copy)
        return #v45.matchedContacts + #v45.deviceContacts == 0;
    end;
    local function v83(v80) --[[ Line: 217 ]]
        -- upvalues: l_Roact_0 (ref), v48 (copy), v16 (ref), v50 (copy), v45 (copy), v17 (ref)
        local l_item_0 = v80.item;
        if l_item_0.isSectionDivider then
            local v82 = v80.index ~= 1;
            return l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 24)
            }, {
                divider = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, v82 and 0.5 or 0.5, 0), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v48.Theme.Divider.Color, 
                    BackgroundTransparency = v48.Theme.Divider.Transparency
                })
            });
        elseif l_item_0.isMatchedContact then
            return l_Roact_0.createElement(v16, {
                contactName = l_item_0.contactName, 
                contactId = l_item_0.contactId, 
                contextualInfo = v50.fromContactsText, 
                hasDivider = true, 
                hasSentRequest = l_item_0.hasSentRequest, 
                requestFriendship = v45.requestFriendship, 
                openProfilePeekView = v45.openProfilePeekView, 
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
    local function v85(v84) --[[ Line: 256 ]]
        -- upvalues: l_Roact_0 (ref), l_StyledTextLabel_0 (ref), v48 (copy)
        if v84.section then
            return l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                layout = l_Roact_0.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                padding = if v84.section.sectionNumber ~= 1 then l_Roact_0.createElement("Frame", {
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
                        fontStyle = v48.Font.Header2, 
                        colorStyle = v48.Theme.TextDefault, 
                        text = v84.section.title or ""
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
                    BackgroundColor3 = v48.Theme.Divider.Color, 
                    BackgroundTransparency = v48.Theme.Divider.Transparency
                })
            });
        end;
    end;
    local function v87(v86) --[[ Line: 301 ]]
        -- upvalues: v45 (copy), l_ButtonType_0 (ref), l_Dash_0 (ref), v51 (copy), v57 (copy)
        if v45.isFetching then
            return {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        isLoading = true, 
                        onActivated = l_Dash_0.noop
                    }
                }
            };
        elseif v45.showAddFriendsButton and #v45.matchedContacts + #v45.deviceContacts == 0 then
            if v51 then
                return {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v45.onAddFriendsActivated, 
                            text = v86.goToAddFriends
                        }
                    }
                };
            else
                return {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v45.onAddFriendsActivated, 
                            text = v86.goToAddFriends
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v57, 
                            text = v86.closeModal
                        }
                    }
                };
            end;
        elseif v51 then
            return {};
        else
            return {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v57, 
                        text = v86.closeModal
                    }
                }
            };
        end;
    end;
    local l_Y_0 = l_UserInputService_0.StatusBarSize.Y;
    local v89 = if l_FFlagAddFriendsBannersNewUI_IXP_0 then v21.useIsVisible() else nil;
    local v90 = {
        layout = l_Roact_0.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        }), 
        contactsSyncWarning = if l_FFlagAddFriendsBannersNewUI_IXP_0 and v89 then l_React_0.createElement(v21.Component, {
            layoutOrder = -1
        }) else nil
    };
    local v91 = l_React_0.createRef();
    local function v93(v92) --[[ Line: 377 ]]
        -- upvalues: v61 (copy)
        v61(v92);
    end;
    local v94 = if #v77 ~= 0 then l_Roact_0.createElement(l_SectionList_0, {
        ref = v91, 
        sections = v78, 
        renderSectionHeader = if #v67 > 0 then v85 else nil, 
        renderItem = v83, 
        initialNumToRender = 15, 
        CanvasSize = UDim2.new(1, 0, 0, #v77 * 73), 
        contentContainerStyle = {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, 
        style = {
            BackgroundTransparency = 1, 
            ScrollBarThickness = 0, 
            LayoutOrder = 8, 
            Size = UDim2.new(1, 0, 1, -80 - (v51 and 0 or 48) - 36 - 16), 
            ElasticBehavior = Enum.ElasticBehavior.Always
        }
    }) else l_Roact_0.createElement(v18, {
        errorTextKey = v15.NO_RESULTS, 
        layoutOrder = 8
    });
    local v95 = {
        layout = l_Roact_0.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        }), 
        contactsSyncWarning = if l_FFlagAddFriendsBannersNewUI_IXP_0 and v89 then l_React_0.createElement(v21.Component, {
            layoutOrder = -1
        }) else nil, 
        spacer1 = if l_FFlagAddFriendsBannersNewUI_IXP_0 and v89 then nil else l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 24), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }), 
        descriptionFrame = if l_FFlagAddFriendsBannersNewUI_IXP_0 and v89 then nil else l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 80), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            textLayout = l_Roact_0.createElement("UIListLayout", {
                HorizontalAlignment = if l_FFlagQRCodeCopyUpdates_0 and v75 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            descriptionText = l_Roact_0.createElement(l_StyledTextLabel_0, {
                text = if l_FFlagQRCodeCopyUpdates_0 and v75 then v50.contactsListTCEducationBlurb else v50.contactsListBlurb, 
                automaticSize = Enum.AutomaticSize.Y, 
                colorStyle = v48.Theme.TextDefault, 
                fontStyle = v48.Font.Body, 
                lineHeight = 1, 
                size = UDim2.new(1, 0, 0, 0), 
                maxSize = Vector2.new(0, 80), 
                textXAlignment = if l_FFlagQRCodeCopyUpdates_0 and v75 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center, 
                textYAlignment = Enum.TextYAlignment.Center, 
                layoutOrder = 1
            }), 
            LearnMoreWebLink = v47 and l_React_0.createElement(l_InputLabel_0, {
                LayoutOrder = 2, 
                tag = "auto-y size-full-0", 
                RichText = true, 
                Text = ("<u>%*</u>"):format(v50.learnMore), 
                size = l_InputLabelSize_0.Large, 
                onActivated = v59
            })
        }), 
        spacer2 = if l_FFlagAddFriendsBannersNewUI_IXP_0 and v89 then nil else l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 24), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }), 
        searchBarContainer = l_Roact_0.createElement(v24, {
            height = 36, 
            layoutOrder = 4, 
            textChangeCallback = v93
        }), 
        spacer4 = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 16), 
            BackgroundTransparency = 1, 
            LayoutOrder = 7
        }), 
        contactsList = v94
    };
    if v45.isFetching then
        for _, v97 in {
            1, 
            2, 
            3
        } do
            v90["glimmer" .. v97] = l_Roact_0.createElement(v20, {
                layoutOrder = v97
            });
        end;
    elseif v45.hasUploadError and #v45.matchedContacts + #v45.deviceContacts == 0 then
        v90.errorModal = l_Roact_0.createElement(v19);
    elseif #v45.matchedContacts + #v45.deviceContacts == 0 then
        v90.emptyList = l_Roact_0.createElement(v18);
    else
        v90 = v95;
    end;
    return l_Roact_0.createElement(l_FullPageModal_0, {
        title = v50.connectWithFriends, 
        screenSize = v45.screenSize, 
        marginSize = 0, 
        distanceFromTop = l_Y_0, 
        onCloseClicked = v58, 
        buttonStackProps = {
            buttons = v87(v50), 
            buttonHeight = v51 and 0 or 48, 
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
            }, v90), 
            gradientFrame = l_Roact_0.createElement("Frame", {
                Position = UDim2.new(0, 0, 1, v51 and 0 or -24), 
                Size = UDim2.new(1, 0, 0, 24), 
                BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                ZIndex = 2
            }, {
                gradient = l_Roact_0.createElement("UIGradient", {
                    Rotation = 270, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, v48.Theme.BackgroundUIDefault.Color), 
                        ColorSequenceKeypoint.new(1, v48.Theme.BackgroundUIDefault.Color)
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