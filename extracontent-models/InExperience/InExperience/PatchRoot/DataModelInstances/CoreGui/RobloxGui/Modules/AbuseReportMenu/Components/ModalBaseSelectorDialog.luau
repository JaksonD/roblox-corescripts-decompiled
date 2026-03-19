local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.React);
local l_ScrollingListTable_0 = v3.App.Table.ScrollingListTable;
local l_CellHeadDetail_0 = v3.App.Table.CellHeadDetail;
local l_Cell_0 = v3.App.Table.Cell;
local l_CellTailDescription_0 = v3.App.Table.CellTailDescription;
local l_ModalWindow_0 = v3.App.Dialog.Modal.ModalWindow;
local v10 = require(l_CorePackages_0.Packages.Dash);
local v11 = require(l_CorePackages_0.Packages.Cryo);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_IconButton_0 = v3.App.Button.IconButton;
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
local l_OpenTypeSupport_0 = v3.Utility.OpenTypeSupport;
local l_Images_0 = v3.App.ImageSet.Images;
local l_CoreScriptsRootProvider_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v18 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusRoot_0 = v18.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v18.FocusNavigableSurfaceIdentifierEnum;
local v21 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v22 = require(l_script_FirstAncestor_0.Flags.GetFFlagModalSelectorCloseButton);
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = v21.GetFFlagLuaAppEnableOpenTypeSupport;
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v25 = nil;
local v26 = nil;
local v27 = nil;
if l_isInExperienceUIVREnabled_0 then
    v25 = require(l_CorePackages_0.Workspace.Packages.Responsive);
    local v28 = require(l_CorePackages_0.Workspace.Packages.VrSpatialUi);
    v26 = v28.UIManager;
    v27 = v28.Constants.PanelType;
end;
local function v42(v29) --[[ Line: 62 ]] --[[ Name: ModalBaseSelectorDialog ]]
    -- upvalues: l_useTokens_0 (copy), l_useStyle_0 (copy), l_isInExperienceUIVREnabled_0 (copy), v25 (ref), v26 (ref), v27 (ref), v4 (copy), v22 (copy), v11 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), l_ScrollingListTable_0 (copy), v10 (copy), l_Cell_0 (copy), l_CellHeadDetail_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy), l_CellTailDescription_0 (copy), l_ModalWindow_0 (copy)
    local v30 = l_useTokens_0();
    local v31 = l_useStyle_0();
    local l_Theme_0 = v31.Theme;
    local l_Space_500_0 = v31.Tokens.Global.Space_500;
    local v34 = nil;
    if l_isInExperienceUIVREnabled_0 then
        local v35 = v25.useIsSpatial();
        local l_viewportHeight_0 = v29.viewportHeight;
        if v35 then
            l_viewportHeight_0 = v26.getInstance():getPanelObject(v27.MoreMenu).AbsoluteSize.Y;
        end;
        v34 = math.min(#v29.cellData * v30.Size.Size_1000, l_viewportHeight_0 - 80 - 24);
    else
        v34 = math.min(#v29.cellData * v30.Size.Size_1000, v29.viewportHeight - 80 - 24);
    end;
    local v37 = v34 + 24;
    local v38 = 0;
    local v39 = 0;
    local v40 = {
        Paddings = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 12), 
            PaddingBottom = UDim.new(0, 12), 
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12)
        })
    };
    if v22() then
        v37 = v34 + 48 + l_Space_500_0;
        v38 = 12;
        v39 = -36;
        v40 = v11.Dictionary.join(v40, {
            Layout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = 0
            }), 
            Header = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_Space_500_0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                Layout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right
                }), 
                CloseButton = v4.createElement(l_IconButton_0, {
                    size = UDim2.fromOffset(0, 0), 
                    iconSize = l_IconSize_0.Medium, 
                    icon = l_Images_0["icons/navigation/close"], 
                    onActivated = function() --[[ Line: 119 ]] --[[ Name: onActivated ]]
                        -- upvalues: v29 (copy)
                        v29.onClose();
                    end
                })
            }), 
            Divider = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = v31.Theme.Divider.Transparency, 
                BackgroundColor3 = v31.Theme.Divider.Color, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            })
        });
    end;
    v40 = v11.Dictionary.join(v40, {
        SelectorFrame = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, v39), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            Paddings = v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v38)
            }), 
            ModalSelector = v4.createElement(l_ScrollingListTable_0, {
                selectable = false, 
                size = UDim2.new(1, 0, 1, 0), 
                cells = v10.map(v29.cellData, function(v41) --[[ Line: 148 ]]
                    -- upvalues: v4 (ref), l_Cell_0 (ref), l_CellHeadDetail_0 (ref), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_OpenTypeSupport_0 (ref), l_CellTailDescription_0 (ref), v30 (copy), v29 (copy)
                    return v4.createElement(l_Cell_0, {
                        head = v4.createElement(l_CellHeadDetail_0, {
                            labelText = v41.label, 
                            subLabelText = v41.subLabel, 
                            openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil
                        }), 
                        tail = v4.createElement(l_CellTailDescription_0, {
                            text = "", 
                            showArrow = false
                        }), 
                        background = v4.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            Size = UDim2.fromScale(1, 1)
                        }), 
                        size = UDim2.new(1, 0, 0, v30.Size.Size_1000), 
                        userInteractionEnabled = true, 
                        onActivated = function() --[[ Line: 167 ]] --[[ Name: onActivated ]]
                            -- upvalues: v29 (ref), v41 (copy)
                            v29.onSelect(v41.label, v41.subLabel, v41.identifier);
                            v29.onClose();
                        end
                    });
                end)
            })
        })
    });
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 0, 0)
    }, {
        Overlay = if v29.isShown then v4.createElement("TextButton", {
            Selectable = false, 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ZIndex = 10, 
            Text = "", 
            [v4.Event.Activated] = function() --[[ Line: 194 ]]
                -- upvalues: v29 (copy)
                v29.onClose();
            end
        }, {
            Modal = v4.createElement(l_ModalWindow_0, {
                isFullHeight = false, 
                screenSize = Vector2.new(v29.viewportWidth, v29.viewportHeight)
            }, {
                ModalContent = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v37), 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 20)
                }, v40)
            })
        }) else nil
    });
end;
DialogWrapper = function(v43) --[[ Line: 215 ]] --[[ Name: DialogWrapper ]]
    -- upvalues: v4 (copy), l_CoreScriptsRootProvider_0 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v42 (copy)
    return v4.createElement(l_CoreScriptsRootProvider_0, {}, {
        FocusNavigationCoreScriptsWrapper = v4.createElement(l_FocusRoot_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
            isIsolated = true, 
            isAutoFocusRoot = true
        }, {
            DialogContainer = v4.createElement(v42, v43)
        })
    });
end;
return DialogWrapper;