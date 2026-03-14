local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dash);
local v3 = require(l_Parent_1.Foundation);
local v4 = require(l_Parent_1.Localization);
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.RoactUtils);
local v7 = require(l_Parent_1.RobloxAppHooks);
local v8 = require(l_Parent_1.UIBlox);
local l_Images_0 = v8.App.ImageSet.Images;
local l_ImageSetButton_0 = v8.Core.ImageSet.ImageSetButton;
local l_GridView_0 = v8.App.Grid.GridView;
local l_useStyle_0 = v8.Core.Style.useStyle;
local l_ScrollBarVisibility_0 = v3.Enums.ScrollBarVisibility;
local l_ScrollView_0 = v3.ScrollView;
local l_Text_0 = v3.Text;
local l_View_0 = v3.View;
local v17 = require(l_Parent_0.Analytics.useAnalytics);
local l_useCallback_0 = v5.useCallback;
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_useScreenSize_0 = v7.useScreenSize;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local l_useState_0 = v5.useState;
local v24 = require(l_Parent_0.Hooks.useTopbarInsetHeight);
local v25 = require(l_Parent_0.Actions.CaptureManagerClosed);
local v26 = require(l_Parent_0.Components.CaptureManager.CaptureManagerItem);
local v27 = require(l_Parent_0.Components.CaptureManager.CaptureManagerCTAContainer);
local v28 = require(l_Parent_0.Constants);
local v29 = require(l_Parent_0.Thunks.DeleteCaptures);
local v30 = require(l_Parent_0.Components.Common.DeleteWarningModal);
local v31 = require(l_Parent_0.Analytics.EventNames);
local v32 = require(l_Parent_0.Components.Common.PermissionModal);
local v33 = require(l_Parent_0.Components.Common.ShowMoreButton);
local v34 = require(l_Parent_0.Components.Common.ToastContainer);
local _ = require(l_Parent_0.Types);
local v36 = require(l_Parent_0.Actions.UpdateSelectedCaptures);
local v37 = UDim2.fromOffset(32, 32);
local function _(v38) --[[ Line: 66 ]] --[[ Name: getItemsPerRow ]]
    return (math.clamp(math.floor(v38 / 90), 1, 3));
end;
local function _(v40, v41) --[[ Line: 70 ]] --[[ Name: getGalleryItemSize ]]
    local v42 = math.clamp(math.floor(v41 / 90), 1, 3);
    local v43 = (v41 - 4 * (v42 - 1)) / v42;
    local v44 = v43 * v40;
    return Vector2.new(math.floor(v43), (math.floor(v44)));
end;
local function v48(v46, v47) --[[ Line: 80 ]] --[[ Name: renderItem ]]
    -- upvalues: v5 (copy), v26 (copy)
    return v5.createElement(v26, {
        capture = v46, 
        captureIndex = v47
    });
end;
return function(_) --[[ Line: 87 ]]
    -- upvalues: v17 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), v24 (copy), l_useSelector_0 (copy), v28 (copy), l_useLocalization_0 (copy), v5 (copy), l_useState_0 (copy), l_useScreenSize_0 (copy), l_useCallback_0 (copy), v25 (copy), v29 (copy), v36 (copy), v31 (copy), v2 (copy), l_View_0 (copy), l_ImageSetButton_0 (copy), l_Images_0 (copy), v37 (copy), l_Text_0 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy), l_GridView_0 (copy), v48 (copy), v33 (copy), v27 (copy), v30 (copy), v32 (copy), v34 (copy)
    local v50 = v17();
    local v51 = l_useDispatch_0();
    local v52 = l_useStyle_0();
    local v53 = v24();
    local v55 = l_useSelector_0(function(v54) --[[ Line: 94 ]]
        -- upvalues: v28 (ref)
        return v54[v28.RoduxKey].Captures;
    end);
    local v57 = l_useSelector_0(function(v56) --[[ Line: 98 ]]
        -- upvalues: v28 (ref)
        return v56[v28.RoduxKey].CaptureManager.SelectedCaptures;
    end);
    local v59 = l_useSelector_0(function(v58) --[[ Line: 102 ]]
        -- upvalues: v28 (ref)
        return v58[v28.RoduxKey].CaptureManager.IsOpen;
    end);
    local v60 = l_useLocalization_0({
        cancelSelectAllAction = "Feature.Captures.Action.CancelSelectAllCaptures", 
        selectAllAction = "Feature.Captures.Action.SelectAllCaptures"
    });
    local v61 = v5.useRef(nil);
    local v62, v63 = l_useState_0(Vector2.new(0, 0));
    local v64, v65 = l_useState_0(false);
    local v66, v67 = l_useState_0(false);
    local v68, v69 = v5.useState(24);
    local v70 = if #v57 == 0 then v60.selectAllAction else v60.cancelSelectAllAction;
    local v71 = l_useScreenSize_0();
    v5.useEffect(function() --[[ Line: 121 ]]
        -- upvalues: v61 (copy), v63 (copy)
        if v61.current then
            v63(v61.current.AbsoluteSize);
        end;
    end, {});
    local v73 = l_useCallback_0(function(v72) --[[ Line: 127 ]]
        -- upvalues: v63 (copy)
        v63(v72.AbsoluteSize);
    end, {});
    local v74 = l_useCallback_0(function() --[[ Line: 131 ]]
        -- upvalues: v65 (copy), v51 (copy), v25 (ref)
        v65(false);
        v51(v25());
    end, {});
    local v75 = l_useCallback_0(function() --[[ Line: 136 ]]
        -- upvalues: v67 (copy)
        v67(true);
    end, {});
    local v76 = l_useCallback_0(function() --[[ Line: 140 ]]
        -- upvalues: v67 (copy)
        v67(false);
    end, {});
    local v77 = l_useCallback_0(function() --[[ Line: 144 ]]
        -- upvalues: v51 (copy), v29 (ref), v57 (copy)
        v51(v29(v57));
    end, {
        v57
    });
    local v78 = l_useCallback_0(function() --[[ Line: 148 ]]
        -- upvalues: v57 (copy), v51 (copy), v36 (ref), v55 (copy), v50 (copy), v31 (ref)
        if #v57 == 0 then
            v51(v36(v55));
            v50.fireEvent(v31.CapturesManagerSelectAllActivated);
            return;
        else
            v51(v36({}));
            return;
        end;
    end, {
        v57, 
        v55
    });
    local v79 = v5.useCallback(function() --[[ Line: 157 ]]
        -- upvalues: v69 (copy), v68 (copy)
        v69(v68 + 24);
    end, {
        v68
    });
    local v81 = v5.useMemo(function() --[[ Line: 161 ]]
        -- upvalues: v55 (copy), v68 (copy), v2 (ref)
        local v80 = math.min(#v55, v68);
        return v2.slice(v55, 1, v80);
    end, {
        v55, 
        v68
    });
    if not v59 then
        return nil;
    else
        local v82 = false;
        if v62.X > 0 then
            v82 = v62.Y > 0;
        end;
        local v83 = math.clamp(v71.Y / v71.X, 0.42857142857142855, 1);
        local l_Y_0 = v62.Y;
        local v85 = v62.X - 41;
        local l_v85_0 = v85;
        local v87 = math.clamp(math.floor(l_v85_0 / 90), 1, 3);
        local v88 = (l_v85_0 - 4 * (v87 - 1)) / v87;
        local v89 = v88 * v83;
        local v90 = Vector2.new(math.floor(v88), (math.floor(v89)));
        l_v85_0 = l_Y_0 < v85;
        v87 = l_v85_0 and 44 or 82;
        v88 = (v90.Y + 4) * math.ceil(#v55 / math.clamp(math.floor(v85 / 90), 1, 3));
        v89 = v5.createElement;
        local l_l_View_0_0 = l_View_0;
        local v92 = {
            BorderSizePixel = 0, 
            onAbsoluteSizeChanged = v73, 
            Position = UDim2.fromOffset(0, -v53), 
            ref = v61, 
            Size = UDim2.new(1, 0, 1, v53), 
            tag = "bg-surface-100"
        };
        local v93 = {};
        local l_createElement_0 = v5.createElement;
        local l_l_View_0_1 = l_View_0;
        local v96 = {
            tag = "bg-action-subtle size-full padding-bottom-small padding-right-small padding-left-xxlarge padding-top-xxlarge gap-xsmall col align-x-center align-y-top"
        };
        local v97 = {
            TitleFrame = v5.createElement(l_View_0, {
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, 32), 
                tag = "bg-action-subtle", 
                ZIndex = 2
            }, {
                CloseButton = v5.createElement(l_ImageSetButton_0, {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = l_Images_0["icons/navigation/close"], 
                    ImageColor3 = v52.Theme.IconEmphasis.Color, 
                    ImageTransparency = v52.Theme.IconEmphasis.Transparency, 
                    Position = UDim2.new(0, 0, 0.5, 0), 
                    Size = v37, 
                    [v5.Event.Activated] = v74
                }), 
                SelectOrDeselectAllButton = v5.createElement(l_Text_0, {
                    LayoutOrder = 1, 
                    onActivated = v78, 
                    Position = UDim2.new(1, -16, 0.5, 2), 
                    tag = "auto-x anchor-center-right bg-action-subtle size-0-full text-defaults text-align-x-center text-align-y-center text-title-large", 
                    Text = v70, 
                    ZIndex = 2
                })
            })
        };
        local l_createElement_1 = v5.createElement;
        local l_l_ScrollView_0_0 = l_ScrollView_0;
        local v100 = {
            BorderSizePixel = 0, 
            LayoutOrder = 2, 
            scroll = {
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                CanvasSize = UDim2.fromScale(1, 0), 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                scrollBarVisibility = l_ScrollBarVisibility_0.None
            }, 
            Size = UDim2.new(1, 0, 1, -(v87 + 40)), 
            tag = "bg-action-subtle gap-xsmall col align-x-center align-y-top"
        };
        local v101 = {
            GridView = v82 and v5.createElement(l_GridView_0, {
                itemPadding = Vector2.new(4, 4), 
                items = v81, 
                itemSize = v90, 
                LayoutOrder = 1, 
                maxHeight = v88, 
                renderItem = v48, 
                Size = UDim2.fromScale(1, 0.9)
            })
        };
        local v102 = false;
        if v68 < #v55 then
            v102 = v5.createElement(v33, {
                buttonHeight = 40, 
                LayoutOrder = 2, 
                onActivated = v79
            });
        end;
        v101.ShowMoreButton = v102;
        v97.ScrollingFrame = l_createElement_1(l_l_ScrollView_0_0, v100, v101);
        v97.CTAContainer = v5.createElement(v27, {
            deleteItem = v77, 
            height = v87, 
            isDisabled = v64, 
            isHorizontal = l_v85_0, 
            LayoutOrder = 3, 
            openPermissionModal = v75, 
            width = v85, 
            ZIndex = 2
        });
        v93.CaptureManagerContainer = l_createElement_0(l_l_View_0_1, v96, v97);
        v93.DeleteWarningModal = v5.createElement(v30, {
            deleteItem = v77, 
            zIndex = 3
        });
        v93.PermissionModal = v5.createElement(v32, {
            closeModal = v76, 
            visible = v66, 
            zIndex = 3
        });
        v93.ToastsFrame = v5.createElement(l_View_0, {
            tag = "bg-action-subtle size-full", 
            ZIndex = v28.ZIndex.Toasts
        }, {
            ToastContainer = v5.createElement(v34)
        });
        return v89(l_l_View_0_0, v92, v93);
    end;
end;