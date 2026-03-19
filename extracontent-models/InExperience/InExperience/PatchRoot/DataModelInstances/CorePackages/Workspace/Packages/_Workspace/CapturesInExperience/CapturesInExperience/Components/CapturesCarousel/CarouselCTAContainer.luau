local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.RoactUtils);
local v4 = require(l_Parent_1.SocialStopwatch);
local v5 = require(l_Parent_1.UIBlox);
local l_IconButton_0 = v5.App.Button.IconButton;
local l_Images_0 = v5.App.ImageSet.Images;
local l_useStyle_0 = v5.Core.Style.useStyle;
local v9 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useRef_0 = v2.useRef;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local v13 = require(l_Parent_0.App.CapturesPolicy);
local v14 = require(l_Parent_0.Enums.CaptureType);
local v15 = require(l_Parent_0.Constants);
local v16 = require(l_Parent_0.Actions.DeleteWarningModalOpened);
local v17 = require(l_Parent_0.Analytics.EventNames);
local v18 = require(l_Parent_0.Enums.ExternalShareSourceType);
local v19 = require(l_Parent_0.Utils.getIsDeleteWarningModalOptedOut);
local v20 = require(l_Parent_0.Utils.getSaveToStoragePermission);
local v21 = require(l_Parent_0.Thunks.ShareCapture);
local _ = require(l_Parent_0.Types);
local v23 = require(l_Parent_0.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript);
local v24 = UDim.new(0.12, 0);
local v25 = UDim2.fromOffset(36, 36);
local v26 = UDim.new(0, 8);
return (v13.connect(function(v27) --[[ Line: 214 ]]
    return {
        enableShareCaptureCTA = v27.enableShareCaptureCTA()
    };
end)(function(v28) --[[ Line: 48 ]]
    -- upvalues: v9 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), l_useRef_0 (copy), l_useSelector_0 (copy), v15 (copy), v2 (copy), v20 (copy), v23 (copy), v14 (copy), v17 (copy), v4 (copy), v21 (copy), v18 (copy), v19 (copy), v16 (copy), v26 (copy), v24 (copy), l_IconButton_0 (copy), l_Images_0 (copy), v25 (copy)
    local v29 = v9();
    local v30 = l_useDispatch_0();
    local v31 = l_useStyle_0();
    local v32 = l_useRef_0(0);
    local v35 = l_useSelector_0(function(v33) --[[ Line: 55 ]]
        -- upvalues: v15 (ref)
        local l_SelectedCaptureIndex_0 = v33[v15.RoduxKey].Carousel.SelectedCaptureIndex;
        return v33[v15.RoduxKey].Captures[l_SelectedCaptureIndex_0];
    end);
    local v36 = v2.useCallback(function() --[[ Line: 60 ]]
        -- upvalues: v28 (copy), v32 (copy)
        if v28.isDisabled then
            return true;
        elseif DateTime.now().UnixTimestampMillis - v32.current < 500 then
            return true;
        else
            return false;
        end;
    end, {
        v28.isDisabled
    });
    local v37 = v2.useCallback(function() --[[ Line: 74 ]]
        -- upvalues: v32 (copy)
        v32.current = DateTime.now().UnixTimestampMillis;
    end, {});
    local v38 = v2.useCallback(function() --[[ Line: 79 ]]
        -- upvalues: v36 (copy), v20 (ref), v23 (ref), v35 (copy), v28 (copy), v30 (copy), v37 (copy), v14 (ref), v29 (copy), v17 (ref)
        if v36() then
            return;
        else
            v20(if v23 then {
                v35
            } else v35, v28.openPermissionModal, v30);
            v37();
            if if v23 then v35.CaptureType == Enum.CaptureType.Video else v35.type == v14.Video then
                v29.fireEvent(v17.CapturesCarouselVideoSaveToExternalStorageActivated);
                return;
            else
                v29.fireEvent(v17.CapturesCarouselSaveToExternalStorageActivated);
                return;
            end;
        end;
    end, {
        v35, 
        v36, 
        v37, 
        v28.openPermissionModal
    });
    local v39 = v2.useCallback(function() --[[ Line: 101 ]]
        -- upvalues: v36 (copy), v37 (copy), v23 (ref), v35 (copy), v14 (ref), v29 (copy), v17 (ref), v4 (ref), v30 (copy), v21 (ref), v18 (ref)
        if v36() then
            return;
        else
            v37();
            if if v23 then v35.CaptureType == Enum.CaptureType.Video else v35.type == v14.Video then
                v29.fireEvent(v17.CapturesCarouselVideoShareActivated);
            else
                v29.fireEvent(v17.CapturesCarouselShareActivated);
            end;
            if v4.Stopwatch.get(v4.Events.CaptureShared) == nil then
                v4.Stopwatch.start(v4.Events.CaptureShared);
            end;
            v30(v21(v35, v18.CapturesCarousel));
            return;
        end;
    end, {
        v35, 
        v28.isDisabled, 
        v36, 
        v37
    });
    local v40 = v2.useCallback(function() --[[ Line: 125 ]]
        -- upvalues: v36 (copy), v37 (copy), v23 (ref), v35 (copy), v14 (ref), v29 (copy), v17 (ref), v19 (ref), v28 (copy), v30 (copy), v16 (ref)
        if v36() then
            return;
        else
            v37();
            if if v23 then v35.CaptureType == Enum.CaptureType.Video else v35.type == v14.Video then
                v29.fireEvent(v17.CapturesVideoDeleteActivatedInCarousel);
            else
                v29.fireEvent(v17.CapturesDeleteActivatedInCarousel);
            end;
            if v19() then
                assert(v28.deleteItem ~= nil, "props.deleteItem should not be nil");
                v28.deleteItem();
                return;
            else
                v30(v16());
                return;
            end;
        end;
    end, {
        v35, 
        v28.deleteItem, 
        v28.isDisabled, 
        v36, 
        v37
    });
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.None, 
        BackgroundColor3 = v31.Theme.BackgroundContrast.Color, 
        BackgroundTransparency = v31.Theme.BackgroundContrast.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v28.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, v28.height), 
        ZIndex = v28.ZIndex
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = v26
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12)
        }), 
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = v24, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        SaveButton = if v23 then v2.createElement(l_IconButton_0, {
            backgroundColor = v31.Theme.BackgroundUIContrast, 
            icon = l_Images_0["icons/actions/download_medium"], 
            layoutOrder = 1, 
            onActivated = v38, 
            showBackground = false, 
            size = v25
        }) else v2.createElement(l_IconButton_0, {
            backgroundColor = v31.Theme.BackgroundUIContrast, 
            icon = l_Images_0["icons/actions/download_medium"], 
            layoutOrder = 1, 
            onActivated = v38, 
            showBackground = false, 
            size = v25
        }), 
        ShareButton = v28.enableShareCaptureCTA and v2.createElement(l_IconButton_0, {
            backgroundColor = v31.Theme.BackgroundUIContrast, 
            icon = l_Images_0["icons/actions/share"], 
            layoutOrder = 2, 
            onActivated = v39, 
            showBackground = false, 
            size = v25
        }), 
        DeleteButton = v2.createElement(l_IconButton_0, {
            icon = l_Images_0["icons/actions/edit/delete"], 
            layoutOrder = 4, 
            onActivated = v40, 
            showBackground = false, 
            size = v25
        })
    });
end));