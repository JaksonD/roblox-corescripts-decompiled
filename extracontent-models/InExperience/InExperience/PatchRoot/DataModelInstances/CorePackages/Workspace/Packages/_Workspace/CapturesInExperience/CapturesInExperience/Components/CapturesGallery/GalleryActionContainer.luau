local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local v3 = require(l_Parent_1.Localization);
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RoactUtils);
local v6 = require(l_Parent_1.UIBlox);
local v7 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_IconButton_0 = v6.App.Button.IconButton;
local l_IconSize_0 = v6.App.ImageSet.Enum.IconSize;
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = v6.Core.Control.Interactable;
local l_TooltipOrientation_0 = v6.App.Dialog.Enum.TooltipOrientation;
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_withTooltip_0 = v6.App.Dialog.TooltipV2.withTooltip;
local v19 = require(l_Parent_0.Actions.CaptureManagerOpened);
local v20 = require(l_Parent_0.App.CapturesPolicy);
local v21 = require(l_Parent_0.Constants);
local v22 = require(l_Parent_0.Analytics.EventNames);
local v23 = require(l_Parent_0.Utils.getCaptureStorageUsage);
local v24 = require(l_Parent_0.Hooks.usePingLazyRenderResizing);
return (v20.connect(function(v25) --[[ Line: 200 ]]
    return {
        enableCapturesBulkManagement = v25.enableCapturesBulkManagement()
    };
end)(function(v26) --[[ Line: 44 ]]
    -- upvalues: v7 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), v4 (copy), l_useLocalization_0 (copy), l_useSelector_0 (copy), v21 (copy), v22 (copy), v19 (copy), v23 (copy), v24 (copy), l_IconButton_0 (copy), l_Images_0 (copy), l_IconSize_0 (copy), l_withTooltip_0 (copy), l_TooltipOrientation_0 (copy), l_CoreGui_0 (copy), l_Interactable_0 (copy), l_ImageSetLabel_0 (copy)
    local v27 = v7();
    local v28 = l_useStyle_0();
    local v29 = l_useDispatch_0();
    local l_Color_0 = v28.Theme.TextDefault.Color;
    local l_Font_0 = v28.Font.CaptionBody.Font;
    local v32 = v28.Font.BaseSize * v28.Font.CaptionBody.RelativeSize;
    local v33, v34 = v4.useState(false);
    local v35 = l_useLocalization_0({
        oneCaptureLabel = "Feature.Captures.Label.OneCapture", 
        multipleCapturesLabel = {
            "Feature.Captures.Label.CaptureCounts"; 
            numberOfCaptures = v26.itemCount
        }, 
        tooltipTitle = "Feature.Captures.Title.CaptureStorageTooltipTitle", 
        tooltipBody = "Feature.Captures.Label.CaptureStorageTooltipLabel"
    });
    local v37 = l_useSelector_0(function(v36) --[[ Line: 65 ]]
        -- upvalues: v21 (ref)
        return v36[v21.RoduxKey].Captures;
    end);
    local v39 = l_useSelector_0(function(v38) --[[ Line: 69 ]]
        -- upvalues: v21 (ref)
        return v38[v21.RoduxKey].Carousel.IsOpen;
    end);
    v4.useEffect(function() --[[ Line: 73 ]]
        -- upvalues: v39 (copy), v34 (copy)
        if v39 then
            v34(false);
        end;
    end, {
        v39
    });
    local v40 = v4.useCallback(function() --[[ Line: 79 ]]
        -- upvalues: v34 (copy), v27 (copy), v22 (ref), v29 (copy), v19 (ref)
        v34(false);
        v27.fireEvent(v22.CapturesManagerOpened);
        v29(v19());
    end, {});
    local v42 = v4.useCallback(function(_) --[[ Line: 85 ]]
        -- upvalues: v34 (copy), v33 (copy)
        v34(not v33);
    end, {
        v33
    });
    local v43 = v4.useMemo(function() --[[ Line: 89 ]]
        -- upvalues: v23 (ref), v37 (copy)
        return v23(v37);
    end, {
        v37
    });
    local v44 = if v26.itemCount == 1 then v35.oneCaptureLabel else v35.multipleCapturesLabel;
    if not v26.enableCapturesBulkManagement then
        return nil;
    else
        local v45 = ("%*%*%*"):format(v44, v43 ~= "" and ", " or "", v43);
        local v46 = v4.useRef(nil);
        v24(v46, v45);
        return v4.createElement("Frame", {
            BackgroundColor3 = v28.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = v28.Theme.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            LayoutOrder = v26.LayoutOrder, 
            Size = UDim2.new(1, 0, 0, 36)
        }, {
            GridLayout = v4.createElement("UIGridLayout", {
                CellSize = UDim2.new(0.5, -4, 0, 36), 
                FillDirection = Enum.FillDirection.Horizontal, 
                FillDirectionMaxCells = 2, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            IconFrame = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 0)
            }, {
                ListLayout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                SettingIcon = v4.createElement(l_IconButton_0, {
                    icon = l_Images_0["icons/common/settings"], 
                    iconSize = l_IconSize_0.Medium, 
                    onActivated = v40, 
                    showBackground = false, 
                    size = UDim2.fromOffset(36, 36)
                })
            }), 
            TextFrame = v4.createElement("Frame", {
                BackgroundTransparency = 1
            }, {
                ListLayout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Padding = UDim.new(0, 4), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                ItemCountAndStorageSpaceLabel = v4.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.X, 
                    BackgroundTransparency = 1, 
                    Font = l_Font_0, 
                    LayoutOrder = 1, 
                    Size = UDim2.fromOffset(0, 20), 
                    Text = v45, 
                    TextColor3 = l_Color_0, 
                    TextSize = v32, 
                    TextWrapped = false, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    ref = v46
                }), 
                InfoIconWithTooltip = l_withTooltip_0({
                    headerText = v35.tooltipTitle, 
                    bodyText = v35.tooltipBody
                }, {
                    preferredOrientation = l_TooltipOrientation_0.Bottom, 
                    guiTarget = l_CoreGui_0, 
                    DisplayOrder = 100, 
                    active = v33
                }, function(v47) --[[ Line: 174 ]]
                    -- upvalues: v34 (copy), v4 (ref), l_Interactable_0 (ref), v42 (copy), l_ImageSetLabel_0 (ref), l_Images_0 (ref)
                    local function v49(v48) --[[ Line: 175 ]]
                        -- upvalues: v34 (ref), v47 (copy)
                        v34(false);
                        v47(v48);
                    end;
                    return v4.createElement(l_Interactable_0, {
                        AnchorPoint = Vector2.new(1, 0.5), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2, 
                        Position = UDim2.fromScale(1, 0.5), 
                        Size = UDim2.fromOffset(16, 16), 
                        [v4.Change.AbsolutePosition] = v49, 
                        [v4.Change.AbsoluteSize] = v49, 
                        [v4.Event.Activated] = v42
                    }, {
                        InfoIcon = v4.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.fromScale(1, 1), 
                            BackgroundTransparency = 1, 
                            Image = l_Images_0["icons/actions/info_small"]
                        })
                    });
                end)
            })
        });
    end;
end));