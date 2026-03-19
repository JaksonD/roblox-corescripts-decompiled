local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v8 = require(l_Modules_0.LuaApp.withLocalization);
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_Modules_0.LuaApp.AppPage);
local v11 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v11.Style.withStyle;
local l_InteractiveAlert_0 = v11.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v11.App.Button.Enum.ButtonType;
local l_LinkButton_0 = v11.App.Button.LinkButton;
local l_Images_0 = v11.App.ImageSet.Images;
local l_ImageSetLabel_0 = v11.Core.ImageSet.ImageSetLabel;
local v18 = require(l_Modules_0.Luobu.Actions.SetAgreedUserAgreements);
local v19 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v20 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v21 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v22 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v23 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v24 = v3.PureComponent:extend("UserAgreementsPrompt");
v24.validateProps = v9.strictInterface({
    agreements = v9.array(v9.strictInterface({
        id = v9.string, 
        agreementType = v9.string, 
        clientType = v9.string, 
        displayUrl = v9.string, 
        regulationType = v9.string
    })), 
    context = v9.optional(v9.string), 
    screenSize = v9.Vector2, 
    closePrompt = v9.callback, 
    setAgreedUserAgreements = v9.callback, 
    navigateDown = v9.callback, 
    showSecondPrompt = v9.callback, 
    shouldShowCameraPermissionInAgreementsPrompt = v9.boolean, 
    guiService = v9.table
});
v24.init = function(v25) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: l_AppStorageService_0 (copy), v19 (copy), v23 (copy), v3 (copy), l_LinkButton_0 (copy), v10 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    v25.getLocalizationKeys = function() --[[ Line: 56 ]]
        -- upvalues: v25 (copy)
        local v26 = {
            title = "Luobu.Authentication.UserAgreementsPrompt.Title", 
            bodyTextPart1 = "Luobu.Authentication.UserAgreementsPrompt.BodyText.Part1", 
            bodyTextPart2 = "Luobu.Authentication.UserAgreementsPrompt.BodyText.Part2", 
            permissionDesc = "Luobu.Authentication.UserAgreementsPrompt.Permissions.Description", 
            permissionStorageTitle = "Luobu.Authentication.UserAgreementsPrompt.Permissions.Storage.Title", 
            permissionStorageDesc = "Luobu.Authentication.UserAgreementsPrompt.Permissions.Storage.Description", 
            permissionNetworkTitle = "Luobu.Authentication.UserAgreementsPrompt.Permissions.Network.Title", 
            permissionNetworkDesc = "Luobu.Authentication.UserAgreementsPrompt.Permissions.Network.Description", 
            permissionCameraTitle = "Luobu.Authentication.UserAgreementsPrompt.Permissions.Camera.Title", 
            permissionCameraDesc = "Luobu.Authentication.UserAgreementsPrompt.Permissions.Camera.Description", 
            consentButton = "Luobu.Authentication.UserAgreementsPrompt.Button.Consent", 
            dissentButton = "Luobu.Authentication.UserAgreementsPrompt.Button.Dissent"
        };
        for _, v28 in pairs(v25.props.agreements) do
            v26[v28.agreementType] = "Luobu.Authentication.Login.Label.Agreement." .. v28.agreementType;
        end;
        return v26;
    end;
    v25.onConsent = function() --[[ Line: 79 ]]
        -- upvalues: v25 (copy), l_AppStorageService_0 (ref)
        local l_closePrompt_0 = v25.props.closePrompt;
        local l_agreements_0 = v25.props.agreements;
        local l_setAgreedUserAgreements_0 = v25.props.setAgreedUserAgreements;
        local v32 = {};
        for _, v34 in ipairs(l_agreements_0) do
            table.insert(v32, v34.id);
        end;
        l_setAgreedUserAgreements_0(v32);
        l_AppStorageService_0:SetItem("HasAgreedRequiredPermissions", (tostring(true)));
        l_closePrompt_0();
    end;
    v25.onDissent = function(v35) --[[ Line: 93 ]]
        -- upvalues: v25 (copy), v19 (ref), v23 (ref)
        if v25.props.context == v19.UserAgreementsSecondPrompt then
            v25.props.guiService:BroadcastNotification("", v23.NATIVE_EXIT);
            return;
        else
            local l_agreements_1 = v25.props.agreements;
            v25.props.showSecondPrompt(l_agreements_1, v35);
            return;
        end;
    end;
    v25.renderAgreementsListItems = function(v37) --[[ Line: 105 ]]
        -- upvalues: v25 (copy), v3 (ref), l_LinkButton_0 (ref), v10 (ref)
        local l_agreements_2 = v25.props.agreements;
        local l_navigateDown_0 = v25.props.navigateDown;
        local v40 = {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        };
        local v41 = 1;
        for _, v43 in ipairs(l_agreements_2) do
            local v44 = v37[v43.agreementType] or v43.displayUrl;
            v40[v43.agreementType] = v3.createElement("Frame", {
                LayoutOrder = v41, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                v3.createElement(l_LinkButton_0, {
                    text = "\226\128\162 " .. v44, 
                    fontStyle = "CaptionHeader", 
                    minPaddingY = 5, 
                    onActivated = function() --[[ Line: 127 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_navigateDown_0 (copy), v10 (ref), v43 (copy), v44 (copy)
                        l_navigateDown_0({
                            name = v10.GenericWebPage, 
                            detail = v43.displayUrl, 
                            extraProps = {
                                title = v44
                            }
                        });
                    end
                })
            });
            v41 = v41 + 1;
        end;
        return v40;
    end;
    v25.renderMiddleContent = function(v45, v46, v47) --[[ Line: 143 ]]
        -- upvalues: l_AppStorageService_0 (ref), v25 (copy), v3 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref)
        local v48 = l_AppStorageService_0:GetItem("HasAgreedRequiredPermissions") ~= tostring(true);
        local l_shouldShowCameraPermissionInAgreementsPrompt_0 = v25.props.shouldShowCameraPermissionInAgreementsPrompt;
        local l_Theme_0 = v46.Theme;
        local l_Font_0 = v46.Font;
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Agreements = v3.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Prefix = v3.createElement("Frame", {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 12)
                }, {
                    PrefixText = v3.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        Text = v45.bodyTextPart1, 
                        Font = l_Font_0.CaptionHeader.Font, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextWrapped = true
                    }), 
                    Padding = v3.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 12)
                    })
                }), 
                AgreementsList = v3.createElement("Frame", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    AutomaticSize = Enum.AutomaticSize.XY
                }, v47), 
                Suffix = v3.createElement("Frame", {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 12)
                }, {
                    Padding = v3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 12)
                    }), 
                    PrefixText = v3.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        Text = v45.bodyTextPart2, 
                        Font = l_Font_0.CaptionHeader.Font, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextWrapped = true
                    })
                })
            }), 
            Permissions = v48 and v3.createElement("Frame", {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Description = v3.createElement("Frame", {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 12), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    DescriptionText = v3.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        Text = v45.bodyTextPart1, 
                        Font = l_Font_0.CaptionHeader.Font, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextWrapped = true
                    }), 
                    Padding = v3.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 12)
                    })
                }), 
                Permissions = v3.createElement("Frame", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    Layout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    StoragePermission = v3.createElement("Frame", {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        Layout = v3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        Icon = v3.createElement(l_ImageSetLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            Image = l_Images_0["icons/menu/memory"], 
                            Size = UDim2.new(0, 30, 0, 30), 
                            ScaleType = Enum.ScaleType.Stretch
                        }), 
                        Content = v3.createElement("Frame", {
                            LayoutOrder = 2, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, -30, 0, 36)
                        }, {
                            Layout = v3.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                                SortOrder = Enum.SortOrder.LayoutOrder
                            }), 
                            Title = v3.createElement("TextLabel", {
                                Size = UDim2.new(1, 0, 0, 12), 
                                BackgroundTransparency = 1, 
                                Text = v45.permissionStorageTitle, 
                                Font = l_Font_0.CaptionHeader.Font, 
                                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextYAlignment = Enum.TextYAlignment.Center, 
                                TextWrapped = true
                            }), 
                            DescriptionText = v3.createElement("TextLabel", {
                                Size = UDim2.new(1, 0, 0, 24), 
                                BackgroundTransparency = 1, 
                                Text = v45.permissionStorageDesc, 
                                Font = l_Font_0.CaptionBody.Font, 
                                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextYAlignment = Enum.TextYAlignment.Center, 
                                TextWrapped = true
                            }), 
                            Padding = v3.createElement("UIPadding", {
                                PaddingBottom = UDim.new(0, 12)
                            })
                        })
                    }), 
                    NetworkPermission = v3.createElement("Frame", {
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        Layout = v3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        Icon = v3.createElement(l_ImageSetLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            Image = l_Images_0["icons/menu/mobile"], 
                            Size = UDim2.new(0, 30, 0, 30), 
                            ScaleType = Enum.ScaleType.Stretch
                        }), 
                        Content = v3.createElement("Frame", {
                            LayoutOrder = 2, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, -30, 0, 36)
                        }, {
                            Layout = v3.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                                SortOrder = Enum.SortOrder.LayoutOrder
                            }), 
                            Title = v3.createElement("TextLabel", {
                                Size = UDim2.new(1, 0, 0, 12), 
                                BackgroundTransparency = 1, 
                                Text = v45.permissionNetworkTitle, 
                                Font = l_Font_0.CaptionHeader.Font, 
                                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextYAlignment = Enum.TextYAlignment.Center, 
                                TextWrapped = true
                            }), 
                            DescriptionText = v3.createElement("TextLabel", {
                                Size = UDim2.new(1, 0, 0, 24), 
                                BackgroundTransparency = 1, 
                                Text = v45.permissionNetworkDesc, 
                                Font = l_Font_0.CaptionBody.Font, 
                                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextYAlignment = Enum.TextYAlignment.Center, 
                                TextWrapped = true
                            }), 
                            Padding = l_shouldShowCameraPermissionInAgreementsPrompt_0 and v3.createElement("UIPadding", {
                                PaddingBottom = UDim.new(0, 12)
                            })
                        })
                    }), 
                    CameraPermission = l_shouldShowCameraPermissionInAgreementsPrompt_0 and v3.createElement("Frame", {
                        LayoutOrder = 3, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        Layout = v3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        Icon = v3.createElement(l_ImageSetLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            Image = l_Images_0["icons/menu/mobile"], 
                            Size = UDim2.new(0, 30, 0, 30), 
                            ScaleType = Enum.ScaleType.Stretch
                        }), 
                        Content = v3.createElement("Frame", {
                            LayoutOrder = 2, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, -30, 0, 36)
                        }, {
                            Layout = v3.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                                SortOrder = Enum.SortOrder.LayoutOrder
                            }), 
                            Title = v3.createElement("TextLabel", {
                                Size = UDim2.new(1, 0, 0, 12), 
                                BackgroundTransparency = 1, 
                                Text = v45.permissionCameraTitle, 
                                Font = l_Font_0.CaptionHeader.Font, 
                                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextYAlignment = Enum.TextYAlignment.Center, 
                                TextWrapped = true
                            }), 
                            DescriptionText = v3.createElement("TextLabel", {
                                Size = UDim2.new(1, 0, 0, 24), 
                                BackgroundTransparency = 1, 
                                Text = v45.permissionCameraDesc, 
                                Font = l_Font_0.CaptionBody.Font, 
                                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextYAlignment = Enum.TextYAlignment.Center, 
                                TextWrapped = true
                            })
                        })
                    })
                })
            })
        });
    end;
end;
v24.render = function(v52) --[[ Line: 440 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v8 (copy), v3 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local l_screenSize_0 = v52.props.screenSize;
    return l_withStyle_0(function(v54) --[[ Line: 443 ]]
        -- upvalues: v8 (ref), v52 (copy), v3 (ref), l_InteractiveAlert_0 (ref), l_ButtonType_0 (ref), l_screenSize_0 (copy)
        return v8(v52.getLocalizationKeys())(function(v55) --[[ Line: 444 ]]
            -- upvalues: v52 (ref), v3 (ref), l_InteractiveAlert_0 (ref), v54 (copy), l_ButtonType_0 (ref), l_screenSize_0 (ref)
            local v56 = v52.renderAgreementsListItems(v55);
            return v3.createElement(l_InteractiveAlert_0, {
                title = v55.title, 
                middleContent = function() --[[ Line: 448 ]] --[[ Name: middleContent ]]
                    -- upvalues: v52 (ref), v55 (copy), v54 (ref), v56 (copy)
                    return v52.renderMiddleContent(v55, v54, v56);
                end, 
                buttonStackInfo = {
                    buttons = {
                        {
                            props = {
                                onActivated = function() --[[ Line: 455 ]] --[[ Name: onActivated ]]
                                    -- upvalues: v52 (ref), v56 (copy)
                                    v52.onDissent(v56);
                                end, 
                                text = v55.dissentButton
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = v52.onConsent, 
                                text = v55.consentButton
                            }
                        }
                    }
                }, 
                position = UDim2.fromScale(0.5, 0.5), 
                screenSize = l_screenSize_0
            });
        end);
    end);
end;
v24 = v4.connect(function(v57) --[[ Line: 477 ]]
    return {
        screenSize = v57.ScreenSize
    };
end, function(v58) --[[ Line: 481 ]]
    -- upvalues: v21 (copy), v18 (copy), v22 (copy), v20 (copy), v19 (copy)
    return {
        closePrompt = function() --[[ Line: 483 ]] --[[ Name: closePrompt ]]
            -- upvalues: v58 (copy), v21 (ref)
            v58(v21());
        end, 
        setAgreedUserAgreements = function(v59) --[[ Line: 486 ]] --[[ Name: setAgreedUserAgreements ]]
            -- upvalues: v58 (copy), v18 (ref)
            return v58(v18(v59));
        end, 
        navigateDown = function(v60) --[[ Line: 489 ]] --[[ Name: navigateDown ]]
            -- upvalues: v58 (copy), v22 (ref)
            v58(v22(v60));
        end, 
        showSecondPrompt = function(v61, v62) --[[ Line: 492 ]] --[[ Name: showSecondPrompt ]]
            -- upvalues: v58 (copy), v20 (ref), v19 (ref)
            v58(v20(v19.UserAgreementsSecondPrompt, {
                agreements = v61, 
                agreementsListItems = v62
            }));
        end
    };
end)(v24);
v24 = l_RoactAppPolicy_0.connect(function(v63, _) --[[ Line: 501 ]]
    return {
        shouldShowCameraPermissionInAgreementsPrompt = v63.getShouldShowCameraPermissionInAgreementsPrompt()
    };
end)(v24);
return l_RoactServices_0.connect({
    guiService = l_AppGuiService_0
})(v24);