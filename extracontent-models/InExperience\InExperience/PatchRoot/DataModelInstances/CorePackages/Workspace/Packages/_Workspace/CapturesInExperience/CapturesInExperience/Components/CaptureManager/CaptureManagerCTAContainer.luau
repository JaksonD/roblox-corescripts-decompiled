local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Localization);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_1.SocialStopwatch);
local v6 = require(l_Parent_1.UIBlox);
local l_IconButton_0 = v6.App.Button.IconButton;
local l_IconSize_0 = v6.App.Constant.IconSize;
local l_Images_0 = v6.App.ImageSet.Images;
local l_useStyle_0 = v6.Core.Style.useStyle;
local v11 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_useRef_0 = v3.useRef;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local v16 = require(l_Parent_0.App.CapturesPolicy);
local v17 = require(l_Parent_0.Enums.CaptureType);
local v18 = require(l_Parent_0.Constants);
local v19 = require(l_Parent_0.Actions.DeleteWarningModalOpened);
local v20 = require(l_Parent_0.Analytics.EventNames);
local v21 = require(l_Parent_0.Enums.ExternalShareSourceType);
local v22 = require(l_Parent_0.Utils.getIsDeleteWarningModalOptedOut);
local v23 = require(l_Parent_0.Utils.getSaveToStoragePermission);
local v24 = require(l_Parent_0.Thunks.ShareCapture);
local _ = require(l_Parent_0.Types);
local v26 = game:DefineFastInt("CapturesSaveToExternalStorageLimit", 10);
local v27 = require(l_Parent_0.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript);
local v28 = UDim2.new(0.33, 0, 0, 36);
return (v16.connect(function(v29) --[[ Line: 279 ]]
    return {
        enableShareCaptureCTA = v29.enableShareCaptureCTA()
    };
end)(function(v30) --[[ Line: 55 ]]
    -- upvalues: v11 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), l_useRef_0 (copy), l_useSelector_0 (copy), v18 (copy), v3 (copy), v26 (copy), l_useLocalization_0 (copy), v27 (copy), v17 (copy), v23 (copy), v20 (copy), v5 (copy), v24 (copy), v21 (copy), v22 (copy), v19 (copy), l_IconButton_0 (copy), l_Images_0 (copy), l_IconSize_0 (copy), v28 (copy)
    local v31 = v11();
    local v32 = l_useDispatch_0();
    local v33 = l_useStyle_0();
    local v34 = l_useRef_0(0);
    local v36 = l_useSelector_0(function(v35) --[[ Line: 62 ]]
        -- upvalues: v18 (ref)
        return v35[v18.RoduxKey].CaptureManager.SelectedCaptures;
    end);
    local v37, v38 = v3.useState(false);
    local v39 = #v36;
    local v40 = true;
    if #v36 ~= 0 then
        v40 = #v36 > 1;
    end;
    local v41 = true;
    if #v36 ~= 0 then
        v41 = #v36 > v26;
    end;
    local v42 = #v36 == 0;
    local v43 = if v30.isHorizontal then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical;
    local v44 = if v30.isHorizontal then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center;
    local v45 = if v30.isHorizontal then UDim2.new(0, v30.width - 279, 0, v30.height) else UDim2.new(1, 0, 0, 38);
    local v46 = if v30.isHorizontal then UDim2.new(0, 279, 0, v30.height) else UDim2.new(1, 0, 0, 44);
    local v47 = l_useLocalization_0({
        selectCaptureLabel = "Feature.Captures.Label.SelectCapture", 
        oneCaptureSelectedLabel = "Feature.Captures.Label.OneCaptureSelected", 
        multipleCapturesSelectedLabel = {
            "Feature.Captures.Label.MultipleCapturesSelected"; 
            numberOfCaptures = v39
        }
    });
    v3.useEffect(function() --[[ Line: 90 ]]
        -- upvalues: v27 (ref), v36 (copy), v17 (ref), v38 (copy)
        local v48 = false;
        if v27 then
            for _, v50 in v36 do
                if v50.CaptureType == Enum.CaptureType.Video then
                    v48 = true;
                    break;
                end;
            end;
        else
            for _, v52 in v36 do
                if v52.type == v17.Video then
                    v48 = true;
                    break;
                end;
            end;
        end;
        v38(v48);
    end, {
        v36
    });
    local v53 = v3.useCallback(function() --[[ Line: 110 ]]
        -- upvalues: v39 (copy), v47 (copy)
        if v39 == 0 then
            return v47.selectCaptureLabel;
        elseif v39 == 1 then
            return v47.oneCaptureSelectedLabel;
        else
            return v47.multipleCapturesSelectedLabel;
        end;
    end, {
        v39
    });
    local v54 = v3.useCallback(function() --[[ Line: 120 ]]
        -- upvalues: v30 (copy), v34 (copy)
        if v30.isDisabled then
            return true;
        elseif DateTime.now().UnixTimestampMillis - v34.current < 500 then
            return true;
        else
            return false;
        end;
    end, {
        v30.isDisabled
    });
    local v55 = v3.useCallback(function() --[[ Line: 134 ]]
        -- upvalues: v34 (copy)
        v34.current = DateTime.now().UnixTimestampMillis;
    end, {});
    local v56 = v3.useCallback(function() --[[ Line: 138 ]]
        -- upvalues: v54 (copy), v36 (copy), v23 (ref), v30 (copy), v32 (copy), v31 (copy), v20 (ref), v55 (copy)
        if v54() or #v36 == 0 then
            return;
        else
            v23(v36, v30.openPermissionModal, v32);
            v31.fireEvent(v20.CapturesManagerBulkSaveToExternalStorageActivated);
            v55();
            return;
        end;
    end, {
        v36, 
        v54, 
        v55, 
        v30.openPermissionModal
    });
    local v58 = v3.useCallback(function() --[[ Line: 149 ]]
        -- upvalues: v54 (copy), v40 (copy), v36 (copy), v55 (copy), v37 (copy), v31 (copy), v20 (ref), v5 (ref), v32 (copy), v24 (ref), v21 (ref)
        if v54() or v40 then
            return;
        else
            local v57 = v36[1];
            v55();
            if v37 then
                v31.fireEvent(v20.CapturesManagerShareVideoActivated);
            end;
            v31.fireEvent(v20.CapturesManagerShareActivated);
            if not v5.Stopwatch.get(v5.Events.CaptureShared) then
                v5.Stopwatch.start(v5.Events.CaptureShared);
            end;
            v32(v24(v57, v21.CapturesManager));
            return;
        end;
    end, {
        v54, 
        v40, 
        v37, 
        v30.isDisabled, 
        v55, 
        v36
    });
    local v59 = v3.useCallback(function() --[[ Line: 177 ]]
        -- upvalues: v54 (copy), v42 (copy), v55 (copy), v31 (copy), v20 (ref), v22 (ref), v30 (copy), v32 (copy), v19 (ref)
        if v54() or v42 then
            return;
        else
            v55();
            v31.fireEvent(v20.CapturesDeleteActivatedInCaptureManager);
            if v22() then
                assert(v30.deleteItem ~= nil, "props.deleteItem should not be nil");
                v30.deleteItem();
                return;
            else
                v32(v19());
                return;
            end;
        end;
    end, {
        v54, 
        v42, 
        v30.deleteItem, 
        v30.isDisabled, 
        v55
    });
    return v3.createElement("Frame", {
        BackgroundColor3 = v33.Theme.BackgroundContrast.Color, 
        BackgroundTransparency = v33.Theme.BackgroundContrast.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v30.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, v30.height), 
        ZIndex = v30.ZIndex
    }, {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = v43, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Padding = v3.createElement("UIPadding", {
            PaddingRight = UDim.new(0, 16)
        }), 
        CapturesLabel = v3.createElement("TextLabel", {
            AnchorPoint = Vector2.new(1, 0.5), 
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundTransparency = 1, 
            Font = v33.Font.Header2.Font, 
            LayoutOrder = 1, 
            Position = UDim2.new(1, 0, 1, 0), 
            Size = v45, 
            Text = v53(), 
            TextColor3 = v33.Theme.TextEmphasis.Color, 
            TextSize = v33.Font.BaseSize * v33.Font.CaptionHeader.RelativeSize, 
            TextXAlignment = v44, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 1
        }), 
        CTAContainer = v3.createElement("Frame", {
            BackgroundColor3 = v33.Theme.BackgroundContrast.Color, 
            BackgroundTransparency = v33.Theme.BackgroundContrast.Transparency, 
            BorderSizePixel = 0, 
            LayoutOrder = v30.LayoutOrder, 
            Size = v46, 
            ZIndex = v30.ZIndex
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            BulkSaveButton = v3.createElement(l_IconButton_0, {
                backgroundColor = v33.Theme.BackgroundUIContrast, 
                icon = l_Images_0["icons/actions/download_medium"], 
                iconSize = l_IconSize_0.Medium, 
                isDisabled = v41, 
                layoutOrder = 1, 
                onActivated = v56, 
                size = v28
            }), 
            BulkShareButton = v30.enableShareCaptureCTA and v3.createElement(l_IconButton_0, {
                backgroundColor = v33.Theme.BackgroundUIContrast, 
                icon = l_Images_0["icons/actions/share"], 
                iconSize = l_IconSize_0.Medium, 
                isDisabled = v40, 
                layoutOrder = 1, 
                onActivated = v58, 
                size = v28
            }), 
            BulkDeleteButton = v3.createElement(l_IconButton_0, {
                icon = l_Images_0["icons/actions/edit/delete"], 
                iconSize = l_IconSize_0.Medium, 
                isDisabled = v42, 
                layoutOrder = 2, 
                onActivated = v59, 
                size = v28
            })
        })
    });
end));