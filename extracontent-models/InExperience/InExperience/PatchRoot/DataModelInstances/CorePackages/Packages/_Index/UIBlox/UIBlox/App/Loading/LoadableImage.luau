local v0 = nil;
pcall(function() --[[ Line: 5 ]]
    -- upvalues: v0 (ref)
    v0 = game:GetService("RbxAnalyticsService");
end);
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_1.Core;
local v5 = require(l_Parent_2.Roact);
local v6 = require(l_Parent_2.t);
local v7 = require(l_Parent_2.Cryo);
local v8 = require(l_Parent_0.ShimmerPanel);
local v9 = require(l_Parent_0.Enum.DebugProps);
local v10 = require(l_Parent_0.Enum.LoadingStrategy);
local v11 = require(l_Parent_1.Core.Style.withStyle);
local v12 = require(l_Parent_1.App.ImageSet.Images);
local v13 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v14 = require(l_Core_0.ImageSet.Validator.validateImageSetData);
local v15 = require(l_Parent_1.App.Context.ContentProvider);
local v16 = v5.PureComponent:extend("LoadableImage");
v16.validateProps = v6.strictInterface({
    AnchorPoint = v6.optional(v6.Vector2), 
    BackgroundColor3 = v6.optional(v6.Color3), 
    BackgroundTransparency = v6.optional(v6.number), 
    cornerRadius = v6.optional(v6.UDim), 
    Image = v6.optional(v6.union(v6.string, v14)), 
    ImageColor3 = v6.optional(v6.Color3), 
    ImageTransparency = v6.optional(v6.number), 
    ImageRectOffset = v6.optional(v6.union(v6.Vector2, v6.table)), 
    ImageRectSize = v6.optional(v6.union(v6.Vector2, v6.table)), 
    LayoutOrder = v6.optional(v6.integer), 
    loadingImage = v6.optional(v6.union(v6.string, v6.table)), 
    loadingStrategy = v6.optional(v10.isEnumValue), 
    loadingTimeout = v6.optional(v6.numberPositive), 
    renderOnLoading = v6.optional(v6.callback), 
    renderOnFailed = v6.optional(v6.callback), 
    MaxSize = v6.optional(v6.Vector2), 
    MinSize = v6.optional(v6.Vector2), 
    onLoaded = v6.optional(v6.callback), 
    Position = v6.optional(v6.UDim2), 
    ScaleType = v6.optional(v6.enum(Enum.ScaleType)), 
    Size = v6.UDim2, 
    TileSize = v6.optional(v6.UDim2), 
    useShimmerAnimationWhileLoading = v6.optional(v6.boolean), 
    showFailedStateWhenLoadingFailed = v6.optional(v6.boolean), 
    ZIndex = v6.optional(v6.integer), 
    shouldHandleReloads = v6.optional(v6.boolean), 
    contentProvider = v6.union(v6.instanceOf("ContentProvider"), v6.table), 
    [v9.forceLoading] = v6.optional(v6.boolean), 
    [v9.forceFailed] = v6.optional(v6.boolean)
});
v16.defaultProps = {
    BackgroundTransparency = 0, 
    cornerRadius = UDim.new(0, 0), 
    MaxSize = Vector2.new(1e999, 1e999), 
    MinSize = Vector2.new(0, 0), 
    useShimmerAnimationWhileLoading = false, 
    showFailedStateWhenLoadingFailed = false, 
    loadingStrategy = v10.Default, 
    loadingTimeout = 30, 
    shouldHandleReloads = false
};
v16.init = function(v17) --[[ Line: 112 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v17.currentImageLoadIndex = 0;
    v17:setState({
        eagerRetrying = false
    });
    v17.imageRef = v5.createRef();
    v17._isMounted = false;
end;
v16.renderShimmer = function(v18, v19, v20) --[[ Line: 122 ]] --[[ Name: renderShimmer ]]
    -- upvalues: v5 (copy), v8 (copy)
    return v5.createElement("Frame", {
        AnchorPoint = v18.props.AnchorPoint, 
        BorderSizePixel = 0, 
        BackgroundColor3 = v19.PlaceHolder.Color, 
        BackgroundTransparency = v19.PlaceHolder.Transparency, 
        LayoutOrder = v18.props.LayoutOrder, 
        Position = v18.props.Position, 
        Size = v18.props.Size, 
        ZIndex = v18.props.ZIndex
    }, {
        Shimmer = v5.createElement(v8, {
            Size = UDim2.new(1, 0, 1, 0), 
            cornerRadius = v18.props.cornerRadius
        }), 
        UISizeConstraint = v20, 
        UICorner = v5.createElement("UICorner", {
            CornerRadius = v18.props.cornerRadius
        }) or nil
    });
end;
v16.defaultRenderOnFail = function(v21, v22, v23) --[[ Line: 144 ]] --[[ Name: defaultRenderOnFail ]]
    -- upvalues: v12 (copy), v5 (copy), v13 (copy)
    local l_cornerRadius_0 = v21.props.cornerRadius;
    local v25 = v12["icons/status/imageunavailable"];
    local v26 = v25.ImageRectSize / v12.ImagesResolutionScale;
    return v5.createElement("Frame", {
        AnchorPoint = v21.props.AnchorPoint, 
        BorderSizePixel = 0, 
        BackgroundColor3 = v22.PlaceHolder.Color, 
        BackgroundTransparency = v22.PlaceHolder.Transparency, 
        LayoutOrder = v21.props.LayoutOrder, 
        Position = v21.props.Position, 
        Size = v21.props.Size, 
        ZIndex = v21.props.ZIndex
    }, {
        EmptyIcon = v5.createElement(v13.Label, {
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Image = v25, 
            ImageColor3 = v22.UIDefault.Color, 
            ImageTransparency = v22.UIDefault.Transparency, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, v26.X, 0, v26.Y)
        }, {
            UICorner = l_cornerRadius_0 ~= UDim.new(0, 0) and v5.createElement("UICorner", {
                CornerRadius = l_cornerRadius_0
            }) or nil
        }), 
        UISizeConstraint = v23, 
        UICorner = l_cornerRadius_0 ~= UDim.new(0, 0) and v5.createElement("UICorner", {
            CornerRadius = l_cornerRadius_0
        }) or nil
    });
end;
v16.isImageNonNil = function(v27) --[[ Line: 180 ]] --[[ Name: isImageNonNil ]]
    -- upvalues: v5 (copy)
    local v28 = false;
    if v27.props.Image ~= v5.None then
        v28 = v27.props.Image ~= nil;
    end;
    return v28;
end;
v16.getCurrentImageAssetFetchStatus = function(v29, v30) --[[ Line: 184 ]] --[[ Name: getCurrentImageAssetFetchStatus ]]
    local v31 = v30[v29:getAssetFetchStatusStateKey(v29.currentImageLoadIndex)];
    if v31 == nil then
        v31 = Enum.AssetFetchStatus.None;
    end;
    return v31;
end;
v16.isLoadingComplete = function(v32, v33) --[[ Line: 194 ]] --[[ Name: isLoadingComplete ]]
    local v34 = v32:getCurrentImageAssetFetchStatus(v33);
    if v34 == Enum.AssetFetchStatus.None or v34 == Enum.AssetFetchStatus.Loading then
        return false;
    elseif (v34 == Enum.AssetFetchStatus.Failure or v34 == Enum.AssetFetchStatus.TimedOut) and v33.eagerRetrying then
        return false;
    else
        return true;
    end;
end;
v16.render = function(v35) --[[ Line: 207 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v5 (copy), v11 (copy), v10 (copy), v13 (copy)
    local l_AnchorPoint_0 = v35.props.AnchorPoint;
    local l_LayoutOrder_0 = v35.props.LayoutOrder;
    local l_Size_0 = v35.props.Size;
    local l_Position_0 = v35.props.Position;
    local l_BackgroundColor3_0 = v35.props.BackgroundColor3;
    local l_BackgroundTransparency_0 = v35.props.BackgroundTransparency;
    local l_cornerRadius_1 = v35.props.cornerRadius;
    local l_ScaleType_0 = v35.props.ScaleType;
    local l_ZIndex_0 = v35.props.ZIndex;
    local l_Image_0 = v35.props.Image;
    local l_ImageTransparency_0 = v35.props.ImageTransparency;
    local l_ImageRectOffset_0 = v35.props.ImageRectOffset;
    local l_ImageRectSize_0 = v35.props.ImageRectSize;
    local l_ImageColor3_0 = v35.props.ImageColor3;
    local l_MaxSize_0 = v35.props.MaxSize;
    local l_MinSize_0 = v35.props.MinSize;
    local l_renderOnLoading_0 = v35.props.renderOnLoading;
    local l_renderOnFailed_0 = v35.props.renderOnFailed;
    local l_loadingImage_0 = v35.props.loadingImage;
    local l_loadingStrategy_0 = v35.props.loadingStrategy;
    local l_useShimmerAnimationWhileLoading_0 = v35.props.useShimmerAnimationWhileLoading;
    local l_showFailedStateWhenLoadingFailed_0 = v35.props.showFailedStateWhenLoadingFailed;
    local v58 = v35:isImageNonNil() and v35:isLoadingComplete(v35.state);
    local v59 = v35:getCurrentImageAssetFetchStatus(v35.state);
    local v60 = v59 ~= Enum.AssetFetchStatus.None;
    local v61 = v59 == Enum.AssetFetchStatus.Failure;
    local v62 = false;
    if v35.props[v9.forceLoading] then
        v58 = false;
    end;
    if v35.props[v9.forceFailed] then
        v61 = true;
    end;
    if l_MaxSize_0.X ~= 1e999 or l_MaxSize_0.Y ~= 1e999 or l_MinSize_0.X ~= 0 or l_MinSize_0.Y ~= 0 then
        v62 = true;
    end;
    local v63 = v62 and v5.createElement("UISizeConstraint", {
        MaxSize = l_MaxSize_0, 
        MinSize = l_MinSize_0
    });
    return v11(function(v64) --[[ Line: 255 ]]
        -- upvalues: v61 (ref), l_renderOnFailed_0 (copy), l_showFailedStateWhenLoadingFailed_0 (copy), v35 (copy), v63 (copy), v58 (ref), l_renderOnLoading_0 (copy), l_loadingStrategy_0 (copy), v10 (ref), l_useShimmerAnimationWhileLoading_0 (copy), v60 (copy), v5 (ref), v13 (ref), l_AnchorPoint_0 (copy), l_BackgroundColor3_0 (copy), l_BackgroundTransparency_0 (copy), l_Image_0 (copy), l_loadingImage_0 (copy), l_ImageTransparency_0 (copy), l_ImageRectOffset_0 (copy), l_ImageRectSize_0 (copy), l_ImageColor3_0 (copy), l_LayoutOrder_0 (copy), l_Position_0 (copy), l_ScaleType_0 (copy), l_Size_0 (copy), l_ZIndex_0 (copy), l_cornerRadius_1 (copy)
        local l_Theme_0 = v64.Theme;
        if v61 and l_renderOnFailed_0 then
            return l_renderOnFailed_0();
        elseif v61 and l_showFailedStateWhenLoadingFailed_0 then
            return v35:defaultRenderOnFail(l_Theme_0, v63);
        elseif not v58 and l_renderOnLoading_0 and l_loadingStrategy_0 ~= v10.Default then
            return l_renderOnLoading_0();
        elseif not v58 and l_useShimmerAnimationWhileLoading_0 and l_loadingStrategy_0 ~= v10.Default then
            return v35:renderShimmer(l_Theme_0, v63);
        else
            local v66 = v58 or l_loadingStrategy_0 == v10.Default;
            local v67 = nil;
            if not v58 and l_renderOnLoading_0 and l_loadingStrategy_0 == v10.Default then
                v67 = l_renderOnLoading_0();
            end;
            local v68 = nil;
            if not v58 and l_useShimmerAnimationWhileLoading_0 and l_loadingStrategy_0 == v10.Default and v60 then
                v68 = v35:renderShimmer(l_Theme_0, v63);
            end;
            return v5.createElement(v13.Label, {
                AnchorPoint = l_AnchorPoint_0, 
                BackgroundColor3 = l_BackgroundColor3_0 or l_Theme_0.PlaceHolder.Color, 
                BackgroundTransparency = l_BackgroundTransparency_0 or l_Theme_0.PlaceHolder.Transparency, 
                BorderSizePixel = 0, 
                Image = v66 and l_Image_0 or l_loadingImage_0, 
                ImageTransparency = l_ImageTransparency_0, 
                ImageRectOffset = l_ImageRectOffset_0, 
                ImageRectSize = l_ImageRectSize_0, 
                ImageColor3 = v66 and l_ImageColor3_0 or nil, 
                LayoutOrder = l_LayoutOrder_0, 
                Position = l_Position_0, 
                ScaleType = l_ScaleType_0, 
                TileSize = v35.props.TileSize, 
                Size = l_Size_0, 
                ZIndex = l_ZIndex_0, 
                [v5.Ref] = v35.imageRef
            }, {
                UISizeConstraint = v63, 
                UICorner = l_cornerRadius_1 ~= UDim.new(0, 0) and v5.createElement("UICorner", {
                    CornerRadius = l_cornerRadius_1
                }) or nil, 
                OnLoading = v67, 
                Shimmer = v68
            });
        end;
    end);
end;
v16.maybeCallOnLoaded = function(v69, v70) --[[ Line: 318 ]] --[[ Name: maybeCallOnLoaded ]]
    if v69.props.onLoaded then
        local v71 = v69:isLoadingComplete(v70);
        local v72 = v69:isLoadingComplete(v69.state);
        if not v71 and v72 then
            v69.props.onLoaded();
        end;
    end;
end;
v16.didUpdate = function(v73, v74, v75) --[[ Line: 328 ]] --[[ Name: didUpdate ]]
    if v74.Image ~= v73.props.Image then
        v73:loadImage();
    end;
    v73:maybeCallOnLoaded(v75);
end;
v16.didMount = function(v76) --[[ Line: 335 ]] --[[ Name: didMount ]]
    v76._isMounted = true;
    v76:loadImage();
end;
v16.willUnmount = function(v77) --[[ Line: 343 ]] --[[ Name: willUnmount ]]
    v77._isMounted = false;
    v77:dropConnections();
end;
v16.isTerminalStatus = function(_, v79) --[[ Line: 348 ]] --[[ Name: isTerminalStatus ]]
    local v80 = true;
    if v79 ~= Enum.AssetFetchStatus.Success then
        v80 = true;
        if v79 ~= Enum.AssetFetchStatus.Failure then
            v80 = v79 == Enum.AssetFetchStatus.TimedOut;
        end;
    end;
    return v80;
end;
v16.getImageUri = function(v81) --[[ Line: 358 ]] --[[ Name: getImageUri ]]
    if v81.props.Image then
        if typeof(v81.props.Image) == "string" then
            return v81.props.Image;
        else
            return v81.props.Image.Image;
        end;
    else
        return nil;
    end;
end;
v16.awaitImageLoaded = function(v82, v83, v84) --[[ Line: 372 ]] --[[ Name: awaitImageLoaded ]]
    if v82:isTerminalStatus(v84) then
        return;
    else
        local v85 = v82:getImageUri();
        local function v87(v86) --[[ Line: 383 ]]
            -- upvalues: v82 (copy), v83 (copy), v85 (copy)
            v82:updateAssetFetchStatusForImageLoadIndex(v86, v83, v85);
            v82:maybeReportCounter("Await", v86);
            if v82:isTerminalStatus(v86) and v82.awaitImageLoadedConnection then
                v82.awaitImageLoadedConnection:Disconnect();
                v82.awaitImageLoadedConnection = nil;
            end;
        end;
        if v85 == "" then
            local l_Success_0 = Enum.AssetFetchStatus.Success;
            v82:updateAssetFetchStatusForImageLoadIndex(l_Success_0, v83, v85);
            v82:maybeReportCounter("Await", l_Success_0);
            if v82:isTerminalStatus(l_Success_0) and v82.awaitImageLoadedConnection then
                v82.awaitImageLoadedConnection:Disconnect();
                v82.awaitImageLoadedConnection = nil;
            end;
            return;
        else
            v82.awaitImageLoadedConnection = v82.props.contentProvider:GetAssetFetchStatusChangedSignal(v85):Connect(v87);
            return;
        end;
    end;
end;
v16.maybeReportCounter = function(_, v90, v91) --[[ Line: 401 ]] --[[ Name: maybeReportCounter ]]
    -- upvalues: v0 (ref)
    pcall(function() --[[ Line: 404 ]]
        -- upvalues: v90 (copy), v91 (copy), v0 (ref)
        local v92 = "UIBlox_LoadableImage_" .. v90 .. "_" .. tostring(v91);
        v0:ReportCounter(v92);
    end);
end;
v16.preloadImageWithRetryLogic = function(v93, v94) --[[ Line: 416 ]] --[[ Name: preloadImageWithRetryLogic ]]
    local v95 = v93:getImageUri();
    local v96 = 0;
    local l_None_0 = Enum.AssetFetchStatus.None;
    while true do
        if not v93._isMounted then
            return;
        else
            if v96 > 0 then
                task.wait(math.pow(2, v96 - 1) * 1.5);
            end;
            v93.props.contentProvider:PreloadAsync({
                v95
            }, function(_, v99) --[[ Line: 431 ]]
                -- upvalues: v93 (copy), v95 (copy), l_None_0 (ref), v94 (copy)
                local v100 = v93:getImageUri();
                if v93._isMounted and v100 == v95 then
                    v93:maybeReportCounter("PreloadAsync", v99);
                    l_None_0 = v99;
                    v93:updateAssetFetchStatusForImageLoadIndex(v99, v94, v95);
                end;
            end);
            local v101 = v93:getImageUri();
            if not v93._isMounted or v101 ~= v95 then
                return;
            else
                if l_None_0 ~= Enum.AssetFetchStatus.Success then
                    v96 = v96 + 1;
                    if (l_None_0 ~= Enum.AssetFetchStatus.Failure or v96 <= 3) and (l_None_0 ~= Enum.AssetFetchStatus.TimedOut or v96 <= 5) then
                        v93:setState({
                            eagerRetrying = true
                        });
                        continue;
                    end;
                end;
                v93:setState({
                    eagerRetrying = false
                });
                return;
            end;
        end;
    end;
end;
v16.getAssetFetchStatusStateKey = function(_, v103) --[[ Line: 478 ]] --[[ Name: getAssetFetchStatusStateKey ]]
    return "assetFetchStatus_" .. tostring(v103);
end;
v16.updateAssetFetchStatusForImageLoadIndex = function(v104, v105, v106, _) --[[ Line: 482 ]] --[[ Name: updateAssetFetchStatusForImageLoadIndex ]]
    v104:setState({
        [v104:getAssetFetchStatusStateKey(v106)] = v105
    });
end;
v16.dropConnections = function(v108) --[[ Line: 489 ]] --[[ Name: dropConnections ]]
    if v108.listenForReloadsConnection then
        v108.listenForReloadsConnection:Disconnect();
        v108.listenForReloadsConnection = nil;
    end;
    if v108.awaitImageLoadedConnection then
        v108.awaitImageLoadedConnection:Disconnect();
        v108.awaitImageLoadedConnection = nil;
    end;
end;
v16.loadImage = function(v109) --[[ Line: 500 ]] --[[ Name: loadImage ]]
    -- upvalues: v10 (copy)
    local v110 = v109.currentImageLoadIndex + 1;
    v109.currentImageLoadIndex = v110;
    local v111 = v109:getImageUri();
    local l_loadingStrategy_1 = v109.props.loadingStrategy;
    v109:dropConnections();
    if v111 == nil then
        v109:updateAssetFetchStatusForImageLoadIndex(Enum.AssetFetchStatus.Success, v110, v111);
        v109:setState({
            eagerRetrying = false
        });
        return;
    else
        local l_AssetFetchStatus_0 = v109.props.contentProvider:GetAssetFetchStatus(v111);
        v109:maybeReportCounter("InitialStatus", l_AssetFetchStatus_0);
        v109:updateAssetFetchStatusForImageLoadIndex(l_AssetFetchStatus_0, v110, v111);
        if v109.props.shouldHandleReloads then
            v109.listenForReloadsConnection = v109.props.contentProvider:GetAssetFetchStatusChangedSignal(v111):Connect(function(v114, _) --[[ Line: 531 ]]
                -- upvalues: v109 (copy), v110 (copy), v111 (copy)
                v109:maybeReportCounter("Reloads", v114);
                v109:updateAssetFetchStatusForImageLoadIndex(v114, v110, v111);
            end);
        end;
        if l_loadingStrategy_1 == v10.Eager then
            task.spawn(function() --[[ Line: 540 ]]
                -- upvalues: v109 (copy), v110 (copy)
                v109:preloadImageWithRetryLogic(v110);
            end);
            return;
        else
            if l_loadingStrategy_1 == v10.Default then
                v109:awaitImageLoaded(v110, l_AssetFetchStatus_0);
            end;
            return;
        end;
    end;
end;
return function(v116) --[[ Line: 548 ]]
    -- upvalues: v5 (copy), v15 (copy), v7 (copy), v16 (copy)
    return v5.createElement(v15.Consumer, {
        render = function(v117) --[[ Line: 550 ]] --[[ Name: render ]]
            -- upvalues: v7 (ref), v116 (copy), v5 (ref), v16 (ref)
            local v118 = v7.Dictionary.join(v116, {
                contentProvider = v117
            });
            return v5.createElement(v16, v118);
        end
    });
end;