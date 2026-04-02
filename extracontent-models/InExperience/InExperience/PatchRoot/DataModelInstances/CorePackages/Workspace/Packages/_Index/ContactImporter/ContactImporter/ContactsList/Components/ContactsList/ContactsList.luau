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
local l_FStringIsUserInTcEligibleCountryAmpFeature_0 = require(l_Parent_0.SharedFlags).FStringIsUserInTcEligibleCountryAmpFeature;
local l_FFlagTCPolicyCheckRedirect_0 = require(l_Parent_0.SharedFlags).FFlagTCPolicyCheckRedirect;
local l_FStringCanAccessTrustedContactsAmpNameSpace_0 = require(l_Parent_0.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace;
local l_AmpApiProvider_0 = require(l_Parent_0.AmpUpsell).AmpApiProvider;
local l_AmpEnums_0 = require(l_Parent_0.AmpUpsell).AmpEnums;
local l_UserInputService_0 = v2.UserInputService;
return function(v48) --[[ Line: 94 ]] --[[ Name: ContactsList ]]
    -- upvalues: l_useAppPolicy_0 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v15 (copy), l_FFlagQRCodeCopyUpdates_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v32 (copy), v31 (copy), l_Dash_0 (copy), l_EventNames_0 (copy), l_React_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v36 (copy), l_uprankContactsWithEmoji_0 (copy), v37 (copy), l_IXPService_0 (copy), v38 (copy), l_FFlagTCPolicyCheckRedirect_0 (copy), l_FStringIsUserInTcEligibleCountryAmpFeature_0 (copy), l_FStringCanAccessTrustedContactsAmpFeature_0 (copy), l_AmpApiProvider_0 (copy), l_FStringCanAccessTrustedContactsAmpNameSpace_0 (copy), l_AmpEnums_0 (copy), l_Roact_0 (copy), v16 (copy), v17 (copy), l_StyledTextLabel_0 (copy), l_ButtonType_0 (copy), l_UserInputService_0 (copy), l_FFlagAddFriendsBannersNewUI_IXP_0 (copy), v21 (copy), l_SectionList_0 (copy), v18 (copy), l_InputLabel_0 (copy), l_InputLabelSize_0 (copy), v24 (copy), v20 (copy), v19 (copy), l_FullPageModal_0 (copy), l_HorizontalPageMargin_0 (copy)
    local v50 = l_useAppPolicy_0(function(v49) --[[ Line: 95 ]]
        return v49.getWebViewSupport();
    end);
    local v51 = l_useStyle_0();
    local v52 = l_useDispatch_0();
    local v53 = l_useLocalization_0({
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
    local v54 = if v32 then v31.useIsRemoveCloseButtonExperimentEnabled({
        isExposureEnabled = true
    }) else false;
    local function v59(v55, v56, v57) --[[ Line: 122 ]]
        -- upvalues: l_Dash_0 (ref)
        local v58 = if #v56 ~= 0 then {
            {
                isSectionDivider = true
            }
        } else nil;
        l_Dash_0.append(v55, v56, v58, v57);
    end;
    local function v60() --[[ Line: 127 ]]
        -- upvalues: v48 (copy), l_EventNames_0 (ref)
        v48.closeModal(l_EventNames_0.CloseContactListButton);
    end;
    local function v61() --[[ Line: 131 ]]
        -- upvalues: v48 (copy), l_EventNames_0 (ref)
        v48.closeModal(l_EventNames_0.CloseContactListCross);
    end;
    local v62 = l_React_0.useCallback(function() --[[ Line: 135 ]]
        -- upvalues: v52 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v52(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = "https://en.help.roblox.com/hc/en-us/articles/37725513985812", 
            extraProps = {
                title = ""
            }
        }, nil));
    end, {
        v52
    });
    local v63, v64 = l_React_0.useState("");
    local function _(v65) --[[ Line: 147 ]]
        -- upvalues: l_Dash_0 (ref), v63 (copy)
        return l_Dash_0.filter(v65, function(v66) --[[ Line: 148 ]]
            -- upvalues: v63 (ref)
            if v66.contactName ~= nil then
                if not v66.contactName:match("^%s*$") then
                    return string.find(string.lower(v66.contactName or ""), string.lower(v63)) ~= nil;
                else
                    return false;
                end;
            else
                return string.find(string.lower(v66.contactName or ""), string.lower(v63)) ~= nil;
            end;
        end);
    end;
    local v68 = if v36 then l_React_0.useMemo(function() --[[ Line: 162 ]]
        -- upvalues: l_uprankContactsWithEmoji_0 (ref), v48 (copy)
        return l_uprankContactsWithEmoji_0(v48.matchedContacts);
    end, {
        v48.matchedContacts
    }) else nil;
    local v69 = if v36 then l_React_0.useMemo(function() --[[ Line: 167 ]]
        -- upvalues: l_uprankContactsWithEmoji_0 (ref), v48 (copy)
        return l_uprankContactsWithEmoji_0(v48.deviceContacts);
    end, {
        v48.deviceContacts
    }) else nil;
    local v70 = {};
    local v71 = {};
    if v36 then
        v70 = l_Dash_0.filter(v68, function(v72) --[[ Line: 148 ]]
            -- upvalues: v63 (copy)
            if v72.contactName ~= nil then
                if not v72.contactName:match("^%s*$") then
                    return string.find(string.lower(v72.contactName or ""), string.lower(v63)) ~= nil;
                else
                    return false;
                end;
            else
                return string.find(string.lower(v72.contactName or ""), string.lower(v63)) ~= nil;
            end;
        end);
    else
        local l_matchedContacts_0 = v48.matchedContacts;
        v70 = l_Dash_0.filter(l_matchedContacts_0, function(v74) --[[ Line: 148 ]]
            -- upvalues: v63 (copy)
            if v74.contactName ~= nil then
                if not v74.contactName:match("^%s*$") then
                    return string.find(string.lower(v74.contactName or ""), string.lower(v63)) ~= nil;
                else
                    return false;
                end;
            else
                return string.find(string.lower(v74.contactName or ""), string.lower(v63)) ~= nil;
            end;
        end);
    end;
    if v36 then
        v71 = l_Dash_0.filter(v69, function(v75) --[[ Line: 148 ]]
            -- upvalues: v63 (copy)
            if v75.contactName ~= nil then
                if not v75.contactName:match("^%s*$") then
                    return string.find(string.lower(v75.contactName or ""), string.lower(v63)) ~= nil;
                else
                    return false;
                end;
            else
                return string.find(string.lower(v75.contactName or ""), string.lower(v63)) ~= nil;
            end;
        end);
    else
        local l_deviceContacts_0 = v48.deviceContacts;
        v71 = l_Dash_0.filter(l_deviceContacts_0, function(v77) --[[ Line: 148 ]]
            -- upvalues: v63 (copy)
            if v77.contactName ~= nil then
                if not v77.contactName:match("^%s*$") then
                    return string.find(string.lower(v77.contactName or ""), string.lower(v63)) ~= nil;
                else
                    return false;
                end;
            else
                return string.find(string.lower(v77.contactName or ""), string.lower(v63)) ~= nil;
            end;
        end);
    end;
    if v37 then
        l_React_0.useEffect(function() --[[ Line: 182 ]]
            -- upvalues: l_IXPService_0 (ref), v38 (ref)
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v38);
        end, {});
    end;
    local v78, v79 = l_React_0.useState(false);
    if l_FFlagQRCodeCopyUpdates_0 then
        l_React_0.useEffect(function() --[[ Line: 190 ]]
            -- upvalues: l_FFlagTCPolicyCheckRedirect_0 (ref), l_FStringIsUserInTcEligibleCountryAmpFeature_0 (ref), l_FStringCanAccessTrustedContactsAmpFeature_0 (ref), l_AmpApiProvider_0 (ref), l_FStringCanAccessTrustedContactsAmpNameSpace_0 (ref), l_AmpEnums_0 (ref), v79 (copy)
            local v80 = if l_FFlagTCPolicyCheckRedirect_0 then l_FStringIsUserInTcEligibleCountryAmpFeature_0 else l_FStringCanAccessTrustedContactsAmpFeature_0;
            if l_AmpApiProvider_0.upsellFeatureAccess(v80, {}, l_FStringCanAccessTrustedContactsAmpNameSpace_0).access == l_AmpEnums_0.AccessResponseEnum.Granted then
                v79(true);
            end;
        end);
    end;
    local v81 = {};
    v59(v81, v70, v71);
    local v82 = {};
    if #v70 > 0 then
        table.insert(v82, {
            data = v70, 
            title = v53.fromContactsText, 
            sectionNumber = #v82 + 1
        });
    end;
    if #v71 > 0 then
        table.insert(v82, {
            data = v71, 
            title = v53.inviteToRobloxText, 
            sectionNumber = #v82 + 1
        });
    end;
    local function _() --[[ Line: 220 ]]
        -- upvalues: v48 (copy)
        return #v48.matchedContacts + #v48.deviceContacts == 0;
    end;
    local function v87(v84) --[[ Line: 224 ]]
        -- upvalues: l_Roact_0 (ref), v51 (copy), v16 (ref), v53 (copy), v48 (copy), v17 (ref)
        local l_item_0 = v84.item;
        if l_item_0.isSectionDivider then
            local v86 = v84.index ~= 1;
            return l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 24)
            }, {
                divider = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, v86 and 0.5 or 0.5, 0), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v51.Theme.Divider.Color, 
                    BackgroundTransparency = v51.Theme.Divider.Transparency
                })
            });
        elseif l_item_0.isMatchedContact then
            return l_Roact_0.createElement(v16, {
                contactName = l_item_0.contactName, 
                contactId = l_item_0.contactId, 
                contextualInfo = v53.fromContactsText, 
                hasDivider = true, 
                hasSentRequest = l_item_0.hasSentRequest, 
                requestFriendship = v48.requestFriendship, 
                openProfilePeekView = v48.openProfilePeekView, 
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
    local function v89(v88) --[[ Line: 263 ]]
        -- upvalues: l_Roact_0 (ref), l_StyledTextLabel_0 (ref), v51 (copy)
        if v88.section then
            return l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                layout = l_Roact_0.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                padding = if v88.section.sectionNumber ~= 1 then l_Roact_0.createElement("Frame", {
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
                        fontStyle = v51.Font.Header2, 
                        colorStyle = v51.Theme.TextDefault, 
                        text = v88.section.title or ""
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
                    BackgroundColor3 = v51.Theme.Divider.Color, 
                    BackgroundTransparency = v51.Theme.Divider.Transparency
                })
            });
        end;
    end;
    local function v91(v90) --[[ Line: 308 ]]
        -- upvalues: v48 (copy), l_ButtonType_0 (ref), l_Dash_0 (ref), v54 (copy), v60 (copy)
        if v48.isFetching then
            return {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        isLoading = true, 
                        onActivated = l_Dash_0.noop
                    }
                }
            };
        elseif v48.showAddFriendsButton and #v48.matchedContacts + #v48.deviceContacts == 0 then
            if v54 then
                return {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v48.onAddFriendsActivated, 
                            text = v90.goToAddFriends
                        }
                    }
                };
            else
                return {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v48.onAddFriendsActivated, 
                            text = v90.goToAddFriends
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v60, 
                            text = v90.closeModal
                        }
                    }
                };
            end;
        elseif v54 then
            return {};
        else
            return {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v60, 
                        text = v90.closeModal
                    }
                }
            };
        end;
    end;
    local l_Y_0 = l_UserInputService_0.StatusBarSize.Y;
    local v93 = if l_FFlagAddFriendsBannersNewUI_IXP_0 then v21.useIsVisible() else nil;
    local v94 = {
        layout = l_Roact_0.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        }), 
        contactsSyncWarning = if l_FFlagAddFriendsBannersNewUI_IXP_0 and v93 then l_React_0.createElement(v21.Component, {
            layoutOrder = -1
        }) else nil
    };
    local v95 = l_React_0.createRef();
    local function v97(v96) --[[ Line: 384 ]]
        -- upvalues: v64 (copy)
        v64(v96);
    end;
    local v98 = if #v81 ~= 0 then l_Roact_0.createElement(l_SectionList_0, {
        ref = v95, 
        sections = v82, 
        renderSectionHeader = if #v70 > 0 then v89 else nil, 
        renderItem = v87, 
        initialNumToRender = 15, 
        CanvasSize = UDim2.new(1, 0, 0, #v81 * 73), 
        contentContainerStyle = {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, 
        style = {
            BackgroundTransparency = 1, 
            ScrollBarThickness = 0, 
            LayoutOrder = 8, 
            Size = UDim2.new(1, 0, 1, -80 - (v54 and 0 or 48) - 36 - 16), 
            ElasticBehavior = Enum.ElasticBehavior.Always
        }
    }) else l_Roact_0.createElement(v18, {
        errorTextKey = v15.NO_RESULTS, 
        layoutOrder = 8
    });
    local v99 = {
        layout = l_Roact_0.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        }), 
        contactsSyncWarning = if l_FFlagAddFriendsBannersNewUI_IXP_0 and v93 then l_React_0.createElement(v21.Component, {
            layoutOrder = -1
        }) else nil, 
        spacer1 = if l_FFlagAddFriendsBannersNewUI_IXP_0 and v93 then nil else l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 24), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }), 
        descriptionFrame = if l_FFlagAddFriendsBannersNewUI_IXP_0 and v93 then nil else l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 80), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            textLayout = l_Roact_0.createElement("UIListLayout", {
                HorizontalAlignment = if l_FFlagQRCodeCopyUpdates_0 and v78 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            descriptionText = l_Roact_0.createElement(l_StyledTextLabel_0, {
                text = if l_FFlagQRCodeCopyUpdates_0 and v78 then if l_FFlagConnectionsToFriendsRename_0 then v53.contactsListTFEducationBlurb else v53.contactsListTCEducationBlurb else v53.contactsListBlurb, 
                automaticSize = Enum.AutomaticSize.Y, 
                colorStyle = v51.Theme.TextDefault, 
                fontStyle = v51.Font.Body, 
                lineHeight = 1, 
                size = UDim2.new(1, 0, 0, 0), 
                maxSize = Vector2.new(0, 80), 
                textXAlignment = if l_FFlagQRCodeCopyUpdates_0 and v78 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center, 
                textYAlignment = Enum.TextYAlignment.Center, 
                layoutOrder = 1
            }), 
            LearnMoreWebLink = v50 and l_React_0.createElement(l_InputLabel_0, {
                LayoutOrder = 2, 
                tag = "auto-y size-full-0", 
                RichText = true, 
                Text = ("<u>%*</u>"):format(v53.learnMore), 
                size = l_InputLabelSize_0.Large, 
                onActivated = v62
            })
        }), 
        spacer2 = if l_FFlagAddFriendsBannersNewUI_IXP_0 and v93 then nil else l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 24), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }), 
        searchBarContainer = l_Roact_0.createElement(v24, {
            height = 36, 
            layoutOrder = 4, 
            textChangeCallback = v97
        }), 
        spacer4 = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 16), 
            BackgroundTransparency = 1, 
            LayoutOrder = 7
        }), 
        contactsList = v98
    };
    if v48.isFetching then
        for _, v101 in {
            1, 
            2, 
            3
        } do
            v94["glimmer" .. v101] = l_Roact_0.createElement(v20, {
                layoutOrder = v101
            });
        end;
    elseif v48.hasUploadError and #v48.matchedContacts + #v48.deviceContacts == 0 then
        v94.errorModal = l_Roact_0.createElement(v19);
    elseif #v48.matchedContacts + #v48.deviceContacts == 0 then
        v94.emptyList = l_Roact_0.createElement(v18);
    else
        v94 = v99;
    end;
    return l_Roact_0.createElement(l_FullPageModal_0, {
        title = v53.connectWithFriends, 
        screenSize = v48.screenSize, 
        marginSize = 0, 
        distanceFromTop = l_Y_0, 
        onCloseClicked = v61, 
        buttonStackProps = {
            buttons = v91(v53), 
            buttonHeight = v54 and 0 or 48, 
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
            }, v94), 
            gradientFrame = l_Roact_0.createElement("Frame", {
                Position = UDim2.new(0, 0, 1, v54 and 0 or -24), 
                Size = UDim2.new(1, 0, 0, 24), 
                BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                ZIndex = 2
            }, {
                gradient = l_Roact_0.createElement("UIGradient", {
                    Rotation = 270, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, v51.Theme.BackgroundUIDefault.Color), 
                        ColorSequenceKeypoint.new(1, v51.Theme.BackgroundUIDefault.Color)
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