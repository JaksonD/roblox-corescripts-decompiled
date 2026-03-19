local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local v3 = require(l_script_FirstAncestor_0.Common.Constants);
local v4 = require(l_Parent_0.NavigationRodux);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local l_RoactRodux_0 = v2.RoactRodux;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_LoadableImage_0 = l_UIBlox_0.App.Loading.LoadableImage;
local v15 = require(l_script_FirstAncestor_0.Flags.getFFlagContactsListEntryUpdatedTruncationFix);
local l_NavigateDown_0 = v4.Thunks.NavigateDown;
local v17 = l_Roact_0.PureComponent:extend("ContactsListEntry");
v17.defaultProps = {
    contextualInfo = "", 
    contactName = "", 
    hasDivider = false
};
v17.init = function(v18) --[[ Line: 56 ]] --[[ Name: init ]]
    -- upvalues: l_AppPage_0 (copy), v3 (copy)
    v18:setState({
        clicked = false, 
        contactNameOffset = 0
    });
    v18.addButtonSizeChanged = function(v19) --[[ Line: 62 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            contactNameOffset = 0 - (v19.AbsoluteSize.X + 10)
        });
    end;
    v18.requestContactFriendship = function() --[[ Line: 68 ]]
        -- upvalues: v18 (copy)
        local l_props_0 = v18.props;
        l_props_0.requestFriendship(l_props_0.contactId);
    end;
    v18.openProfilePeekView = function() --[[ Line: 73 ]]
        -- upvalues: v18 (copy), l_AppPage_0 (ref), v3 (ref)
        local l_props_1 = v18.props;
        v18.props.navigateToProfile({
            name = l_AppPage_0.ProfilePlatform, 
            detail = l_props_1.contactId, 
            extraProps = {
                profileType = v3.CONTACT
            }
        });
    end;
end;
v17.render = function(v22) --[[ Line: 87 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_Roact_0 (copy), l_LoadableImage_0 (copy), v15 (copy), l_StyledTextLabel_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_Images_0 (copy)
    local l_props_2 = v22.props;
    local v24 = not l_props_2.hasSentRequest;
    return l_withStyle_0(function(v25) --[[ Line: 91 ]]
        -- upvalues: l_Roact_0 (ref), l_props_2 (copy), v22 (copy), l_LoadableImage_0 (ref), v15 (ref), l_StyledTextLabel_0 (ref), v24 (copy), l_Button_0 (ref), l_ButtonType_0 (ref), l_Images_0 (ref)
        return l_Roact_0.createElement("Frame", {
            Name = l_props_2.deviceContactId, 
            Size = UDim2.new(1, 0, 0, 72), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = v22.props.layoutOrder
        }, {
            entryContent = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                layout = l_Roact_0.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 1)
                }), 
                headshotThumbnailContainer = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(0, 64, 0, 64), 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1
                }, {
                    l_Roact_0.createElement("ImageButton", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        [l_Roact_0.Event.Activated] = v22.openProfilePeekView
                    }, {
                        headshotThumbnailImage = l_Roact_0.createElement(l_LoadableImage_0, {
                            Size = UDim2.new(0, 64, 0, 64), 
                            Image = l_props_2.headshotThumbnailUrl, 
                            onLoaded = function() --[[ Line: 122 ]] --[[ Name: onLoaded ]]

                            end, 
                            BackgroundTransparency = 1, 
                            useShimmerAnimationWhileLoading = true, 
                            showFailedStateWhenLoadingFailed = true
                        })
                    })
                }), 
                headshotPadding = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(0, 12, 1, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }), 
                middleTextGroup = l_Roact_0.createElement("TextButton", {
                    Size = UDim2.new(1, -123, 1, 0), 
                    Text = "", 
                    BackgroundTransparency = 1, 
                    [l_Roact_0.Event.Activated] = v22.openProfilePeekView, 
                    LayoutOrder = 3
                }, {
                    layout = l_Roact_0.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    contactNameLabel = if v15() then l_Roact_0.createElement(l_StyledTextLabel_0, {
                        size = UDim2.new(1, v22.state.contactNameOffset, 0, 20), 
                        colorStyle = v25.Theme.TextEmphasis, 
                        fontStyle = v25.Font.Header2, 
                        lineHeight = 1, 
                        text = l_props_2.contactName, 
                        fluidSizing = false, 
                        richText = false, 
                        textWrapped = false, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Bottom, 
                        textTruncate = Enum.TextTruncate.AtEnd, 
                        layoutOrder = 1
                    }) else l_Roact_0.createElement(l_StyledTextLabel_0, {
                        automaticSize = Enum.AutomaticSize.Y, 
                        colorStyle = v25.Theme.TextEmphasis, 
                        fontStyle = v25.Font.Header2, 
                        lineHeight = 1, 
                        text = l_props_2.contactName, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Bottom, 
                        layoutOrder = 1
                    })
                }), 
                requestContactButton = if v24 then l_Roact_0.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    icon = l_Images_0["icons/actions/friends/friendAdd"], 
                    size = UDim2.fromOffset(44, 36), 
                    onActivated = v22.requestContactFriendship, 
                    layoutOrder = 4, 
                    [l_Roact_0.Change.AbsoluteSize] = if v15() then v22.addButtonSizeChanged else nil
                }) else l_Roact_0.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.Secondary, 
                    icon = l_Images_0["icons/actions/friends/friendpending"], 
                    size = UDim2.fromOffset(44, 36), 
                    onActivated = function() --[[ Line: 192 ]] --[[ Name: onActivated ]]

                    end, 
                    isDisabled = true, 
                    layoutOrder = 4, 
                    [l_Roact_0.Change.AbsoluteSize] = if v15() then v22.addButtonSizeChanged else nil
                })
            }), 
            divider = if l_props_2.hasDivider then l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                BorderSizePixel = 0, 
                BackgroundColor3 = v25.Theme.Divider.Color, 
                BackgroundTransparency = v25.Theme.Divider.Transparency
            }) else nil
        });
    end);
end;
return l_RoactRodux_0.connect(nil, function(v26) --[[ Line: 214 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: l_NavigateDown_0 (copy)
    return {
        navigateToProfile = function(v27) --[[ Line: 216 ]] --[[ Name: navigateToProfile ]]
            -- upvalues: v26 (copy), l_NavigateDown_0 (ref)
            v26(l_NavigateDown_0(v27));
        end
    };
end)(v17);