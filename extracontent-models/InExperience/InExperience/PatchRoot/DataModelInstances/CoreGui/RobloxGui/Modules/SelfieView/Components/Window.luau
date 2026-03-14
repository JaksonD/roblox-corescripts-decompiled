local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Packages_0 = l_CorePackages_0.Packages;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v5 = require(l_Packages_0.React);
local v6 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local v9 = require(l_Packages_0.LuauPolyfill);
local l_setTimeout_0 = v9.setTimeout;
local l_clearTimeout_0 = v9.clearTimeout;
local _ = require(script.Parent.Parent.Parent.Chrome.ChromeShared.Service.WindowSizeSignal);
local v13 = require(script.Parent.Parent.Parent.Chrome.ChromeShared.Hooks.useWindowSizeIsLarge);
local v14 = require(l_Packages_0.UIBlox);
local l_Interactable_0 = v14.Core.Control.Interactable;
local l_StyledTextLabel_0 = v14.App.Text.StyledTextLabel;
local l_useStyle_0 = v14.Core.Style.useStyle;
local l_withTooltip_0 = v14.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v14.App.Dialog.Enum.TooltipOrientation;
local l_ControlState_0 = v14.Core.Control.Enum.ControlState;
local l_Images_0 = v14.App.ImageSet.Images;
local l_ImageSetLabel_0 = v14.Core.ImageSet.ImageSetLabel;
local v23 = require(script.Parent.CameraStatusIcon);
local v24 = require(script.Parent.CameraStatusDot);
local v25 = require(script.Parent.Parent.Utils.SizingUtils);
local v26 = require(script.Parent.Parent.Utils.FaceChatUtils);
local v27 = require(script.Parent.Parent.Utils.ModelUtils);
local v28 = require(script.Parent.Parent.Hooks.useCameraOn);
local v29 = require(script.Parent.Parent.Hooks.useLocalPlayer);
local v30 = require(script.Parent.Parent.Hooks.useTrackerMessage);
local v31 = require(script.Parent.Parent.Hooks.useTooltipDismissal);
local v32 = require(l_CoreGui_0.RobloxGui.Modules.Common.Hooks.useScreenSize);
local v33 = require(script.Parent.Parent.Parent.Chrome.ChromeShared.Unibar.Constants);
local l_Chrome_0 = script.Parent.Parent.Parent.Chrome;
local v35 = if require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled() then require(l_Chrome_0.Service) else nil;
local v36 = require(l_Chrome_0.ChromeShared.Unibar.UnibarStyle);
local l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 = require(l_Chrome_0.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider;
local l_FFlagTopBarSignalizeScreenSize_0 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize;
local v39 = game:DefineFastFlag("ReactDevtoolsFixTopbar", true);
local v40 = require(l_RobloxGui_0.Modules.SelfView.Analytics).new();
local v41 = l_Images_0["icons/actions/previewShrink"];
local v42 = l_Images_0["icons/actions/previewExpand"];
local v43 = require(script.Parent.FaceClone);
return function(v44) --[[ Line: 78 ]] --[[ Name: Window ]]
    -- upvalues: l_useStyle_0 (copy), l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), v36 (copy), v33 (copy), l_useAppPolicy_0 (copy), l_useLocalization_0 (copy), v28 (copy), v30 (copy), v13 (copy), v32 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy), v25 (copy), l_useSelector_0 (copy), v5 (copy), v29 (copy), v26 (copy), v31 (copy), l_clearTimeout_0 (copy), l_setTimeout_0 (copy), v27 (copy), v40 (copy), v43 (copy), l_ControlState_0 (copy), l_Interactable_0 (copy), v23 (copy), v35 (copy), l_ImageSetLabel_0 (copy), v41 (copy), v42 (copy), l_StyledTextLabel_0 (copy), v39 (copy), l_withTooltip_0 (copy), l_CoreGui_0 (copy), l_TooltipOrientation_0 (copy), v24 (copy)
    local l_id_0 = v44.id;
    local v46 = l_useStyle_0();
    local _ = nil;
    local l_Theme_0 = v46.Theme;
    local l_Font_0 = v46.Font;
    local v50 = nil;
    v50 = if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then v36.use().CLOSE_BUTTON_FRAME else v33.CLOSE_BUTTON_FRAME;
    local v52 = l_useAppPolicy_0(function(v51) --[[ Line: 93 ]]
        return v51.getShowUpdatedCameraPath();
    end);
    local v53 = l_useLocalization_0({
        robloxPermissionErrorHeader = "CoreScripts.TopBar.RobloxPermissionErrorHeader", 
        robloxPermissionErrorBody = v52 and "CoreScripts.TopBar.RobloxPermissionErrorBodyTwo" or "CoreScripts.TopBar.RobloxPermissionErrorBody", 
        dynamicAvatarMissingErrorHeader = "CoreScripts.TopBar.DynamicAvatarMissingErrorHeader", 
        dynamicAvatarMissingErrorBody = "CoreScripts.TopBar.DynamicAvatarMissingErrorBody"
    });
    local v54 = v28();
    local v55 = v30();
    local v56 = v13(v44.windowSize);
    local v57 = v32();
    local v59 = if l_FFlagTopBarSignalizeScreenSize_0 then v25.getSize(v57, v56) else l_useSelector_0(function(v58) --[[ Line: 114 ]]
        -- upvalues: v25 (ref), v56 (copy)
        return v25.getSize(v58.displayOptions.screenSize, v56);
    end);
    v5.useEffect(function() --[[ Line: 117 ]]
        -- upvalues: v44 (copy), v59 (copy)
        v44.windowSize:requestSize(v59.X, v59.Y);
    end, {
        v59
    });
    local v60 = v29();
    local v61 = v5.useMemo(function() --[[ Line: 123 ]]
        -- upvalues: v26 (ref)
        return v26.getPermissions().userCamEligible and v26.getPermissions().placeCamEnabled;
    end);
    local v62, v63, v64, v65 = v31(2000);
    local v66, v67 = v5.useState(true);
    local v68, v69 = v5.useState(false);
    local v70, v71 = v5.useState(false);
    local v72, v73 = v5.useState(false);
    local v74 = v5.useRef(nil);
    local function v75() --[[ Line: 136 ]]
        -- upvalues: v74 (copy), l_clearTimeout_0 (ref), v67 (copy), l_setTimeout_0 (ref)
        if v74.current then
            l_clearTimeout_0(v74.current);
        end;
        v67(true);
        v74.current = l_setTimeout_0(function() --[[ Line: 141 ]]
            -- upvalues: v67 (ref)
            v67(false);
        end, 2000);
    end;
    v5.useEffect(function() --[[ Line: 145 ]]
        -- upvalues: v74 (copy), l_clearTimeout_0 (ref), v67 (copy), l_setTimeout_0 (ref)
        if v74.current then
            l_clearTimeout_0(v74.current);
        end;
        v67(true);
        v74.current = l_setTimeout_0(function() --[[ Line: 141 ]]
            -- upvalues: v67 (ref)
            v67(false);
        end, 2000);
        return function() --[[ Line: 148 ]]
            -- upvalues: v74 (ref), l_clearTimeout_0 (ref)
            if v74.current then
                l_clearTimeout_0(v74.current);
            end;
        end;
    end, {
        v74
    });
    local function v77(v76) --[[ Line: 155 ]]
        -- upvalues: v74 (copy), l_clearTimeout_0 (ref), v67 (copy), l_setTimeout_0 (ref), v26 (ref), v65 (copy), v53 (copy), v60 (copy), v27 (ref), v40 (ref)
        if v74.current then
            l_clearTimeout_0(v74.current);
        end;
        v67(true);
        v74.current = l_setTimeout_0(function() --[[ Line: 141 ]]
            -- upvalues: v67 (ref)
            v67(false);
        end, 2000);
        if not v26.getPermissions().userCamEnabled and not v76 then
            v65(v53.robloxPermissionErrorHeader, v53.robloxPermissionErrorBody);
            return;
        else
            if v60.Character and not v27.hasDynamicHead(v60.Character) and not v26.isCameraOn() and not v76 then
                v65(v53.dynamicAvatarMissingErrorHeader, v53.dynamicAvatarMissingErrorBody);
            end;
            v40:setLastCtx("SelfView");
            v26.toggleVideoAnimation();
            return;
        end;
    end;
    local v78 = v5.useCallback(function() --[[ Line: 173 ]]
        -- upvalues: v77 (copy)
        v77(false);
    end, {
        v26, 
        v27, 
        v53, 
        v60
    });
    local v79 = v5.useCallback(function() --[[ Line: 177 ]]
        -- upvalues: v74 (copy), l_clearTimeout_0 (ref), v67 (copy), l_setTimeout_0 (ref)
        if v74.current then
            l_clearTimeout_0(v74.current);
        end;
        v67(true);
        v74.current = l_setTimeout_0(function() --[[ Line: 141 ]]
            -- upvalues: v67 (ref)
            v67(false);
        end, 2000);
    end, {
        v75, 
        v66, 
        v44.windowSize
    });
    local v80 = v5.useRef(nil);
    v5.useEffect(function() --[[ Line: 182 ]]
        -- upvalues: v43 (ref), v60 (copy), v80 (copy)
        if _G.__TESTEZ_RUNNING_TEST__ then
            return;
        else
            local v81 = v43(v60, v80.current);
            return function() --[[ Line: 193 ]]
                -- upvalues: v81 (copy)
                if v81 then
                    v81();
                end;
            end;
        end;
    end, {
        v60, 
        v80
    });
    local v84 = v5.useCallback(function(_, v83) --[[ Line: 200 ]]
        -- upvalues: v71 (copy), l_ControlState_0 (ref)
        v71(v83 == l_ControlState_0.Hover);
    end, {
        v71
    });
    local v87 = v5.useCallback(function(_, v86) --[[ Line: 204 ]]
        -- upvalues: v69 (copy), l_ControlState_0 (ref)
        v69(v86 == l_ControlState_0.Hover);
    end, {
        v69
    });
    local v90 = v5.useCallback(function(_, v89) --[[ Line: 208 ]]
        -- upvalues: v73 (copy), l_ControlState_0 (ref)
        v73(v89 == l_ControlState_0.Hover);
    end, {
        v73
    });
    local v92 = v5.useCallback(function(v91) --[[ Line: 212 ]]
        -- upvalues: v5 (ref), l_Interactable_0 (ref), v70 (copy), v26 (ref), v46 (copy), v84 (copy), v78 (copy), v23 (ref)
        return v5.createElement(l_Interactable_0, {
            Size = UDim2.fromOffset(36, 36), 
            BackgroundColor3 = if v70 and v26.getPermissions().userCamEnabled then v46.Theme.BackgroundOnHover.Color else v46.Theme.BackgroundUIContrast.Color, 
            BackgroundTransparency = v46.Theme.Overlay.Transparency, 
            onStateChanged = v84, 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            [v5.Change.AbsoluteSize] = v91, 
            [v5.Change.AbsolutePosition] = v91, 
            [v5.Event.Activated] = v78
        }, {
            Corner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            CameraStatusIcon = v5.createElement(v23, {
                iconSize = UDim2.fromOffset(28, 28), 
                transparency = not v26.getPermissions().userCamEnabled and 0.5 or 0
            })
        });
    end, {
        v84, 
        v78
    });
    return v5.createElement("Frame", {
        Name = "SelfieViewFrame", 
        Active = true, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = v46.Theme.BackgroundUIDefault.Color, 
        BackgroundTransparency = 0, 
        [v5.Event.MouseEnter] = v75, 
        [v5.Event.MouseMoved] = v75, 
        ref = v80
    }, {}, {
        CloseButtonWrapper = v66 and v5.createElement("Frame", {
            ZIndex = 2, 
            BackgroundTransparency = 1, 
            Size = v50
        }, {
            CloseButtonLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            CloseButtonInteractable = v5.createElement(l_Interactable_0, {
                Size = UDim2.fromOffset(36, 36), 
                BackgroundColor3 = if v68 then v46.Theme.BackgroundOnHover.Color else v46.Theme.BackgroundUIContrast.Color, 
                BackgroundTransparency = 0.8, 
                onStateChanged = v87, 
                [v5.Event.Activated] = v35 and function() --[[ Line: 267 ]]
                    -- upvalues: v35 (ref), l_id_0 (copy)
                    v35:toggleWindow(l_id_0);
                end or nil
            }, {
                Corner = v5.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }), 
                Fragment = v5.createElement(v5.Fragment, nil, {
                    v5.createElement("Frame", {
                        Name = "X1", 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Size = UDim2.new(0, 16, 0, 2), 
                        BorderSizePixel = 0, 
                        BackgroundColor3 = v46.Theme.IconEmphasis.Color, 
                        BackgroundTransparency = 0, 
                        Rotation = 45
                    }, {
                        Corner = v5.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        })
                    }), 
                    (v5.createElement("Frame", {
                        Name = "X2", 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Size = UDim2.new(0, 16, 0, 2), 
                        BorderSizePixel = 0, 
                        BackgroundColor3 = v46.Theme.IconEmphasis.Color, 
                        BackgroundTransparency = 0, 
                        Rotation = -45
                    }, {
                        Corner = v5.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        })
                    }))
                })
            })
        }), 
        ExpandButtonWrapper = if v66 then v5.createElement("Frame", {
            ZIndex = 2, 
            BackgroundTransparency = 1, 
            Size = v50, 
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, 0, 0, 0)
        }, {
            ExpandButtonLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            ExpandButtonPadding = v5.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4), 
                PaddingLeft = UDim.new(0, 4), 
                PaddingRight = UDim.new(0, 4), 
                PaddingBottom = UDim.new(0, 4)
            }), 
            ExpandButtonInteractable = v5.createElement(l_Interactable_0, {
                Size = UDim2.fromOffset(36, 36), 
                BackgroundColor3 = if v72 then v46.Theme.BackgroundOnHover.Color else v46.Theme.BackgroundUIContrast.Color, 
                BackgroundTransparency = 0.8, 
                onStateChanged = v90, 
                [v5.Event.Activated] = v35 and function() --[[ Line: 337 ]]
                    -- upvalues: v44 (copy)
                    v44.windowSize:toggleIsLarge();
                end or nil
            }, {
                Corner = v5.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }), 
                ExpandImage = v5.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(28, 28), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Image = if v56 then v41 else v42, 
                    ImageColor3 = l_Theme_0.TextEmphasis.Color, 
                    ImageTransparency = l_Theme_0.TextEmphasis.Transparency
                })
            })
        }) else nil, 
        Corners = v5.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        ControlMessage = v5.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 1), 
            Position = UDim2.new(0.5, 0, 1, -44), 
            BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            ZIndex = 2, 
            BorderSizePixel = 0, 
            Visible = v55.visible
        }, {
            Corners = v5.createElement("UICorner", {}), 
            UIPadding = v5.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4), 
                PaddingRight = UDim.new(0, 8), 
                PaddingBottom = UDim.new(0, 4), 
                PaddingLeft = UDim.new(0, 8)
            }), 
            UIListLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical
            }), 
            Line1 = v5.createElement(l_StyledTextLabel_0, {
                text = v55.text, 
                fontStyle = l_Font_0.Footer, 
                colorStyle = l_Theme_0.TextDefault, 
                textXAlignment = Enum.TextXAlignment.Center, 
                layoutOrder = 1, 
                size = UDim2.fromOffset(46, 36), 
                TextWrapped = not v39 or nil, 
                textWrapped = v39 and true or nil
            }), 
            Line2 = v5.createElement(l_StyledTextLabel_0, {
                text = v55.status, 
                fontStyle = l_Font_0.Footer, 
                colorStyle = l_Theme_0.ContextualPrimaryContent, 
                textXAlignment = Enum.TextXAlignment.Center, 
                layoutOrder = 2, 
                size = UDim2.fromOffset(46, 12), 
                automaticSize = Enum.AutomaticSize.Y
            })
        }), 
        IconFrame = v66 and v61 and v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = v50, 
            Position = UDim2.fromScale(0.5, 1), 
            AnchorPoint = Vector2.new(0.5, 1), 
            ZIndex = 2
        }, {
            Tooltip = l_withTooltip_0({
                headerText = v62, 
                bodyText = v63, 
                textXAlignment = Enum.TextXAlignment.Left
            }, {
                guiTarget = l_CoreGui_0, 
                active = v64, 
                DisplayOrder = 101, 
                preferredOrientation = l_TooltipOrientation_0.Bottom
            }, v92), 
            Hover = v5.createElement("Frame", {
                Size = UDim2.fromOffset(32, 32), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = v46.Theme.BackgroundOnHover.Transparency, 
                BackgroundColor3 = v46.Theme.BackgroundOnHover.Color
            }, {
                Corner = v5.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 8)
                })
            })
        }) or nil, 
        CameraStatusDot = if v54 then v5.createElement(v24, {
            Position = UDim2.new(1, -12, 1, -12), 
            ZIndex = 2, 
            Size = UDim2.fromOffset(8, 8)
        }) else nil, 
        Interactable = v5.createElement(l_Interactable_0, {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            [v5.Event.Activated] = v79
        })
    });
end;