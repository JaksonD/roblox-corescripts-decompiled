local v0 = nil;
pcall(function() --[[ Line: 5 ]]
    -- upvalues: v0 (ref)
    v0 = game:GetService("RbxAnalyticsService");
end);
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local l_Core_0 = l_Parent_2.Core;
local v6 = require(l_Parent_3.Roact);
local v7 = require(l_Parent_3.t);
local v8 = require(l_Parent_3.Cryo);
local l_Skeleton_0 = require(l_Parent_3.Foundation).Skeleton;
local v10 = require(l_Parent_0.Enum.DebugProps);
local v11 = require(l_Parent_0.Enum.LoadingStrategy);
local v12 = require(l_Parent_2.Core.Style.withStyle);
local v13 = require(l_Parent_1.Loading.getClosestRadius);
local v14 = require(l_Parent_2.App.ImageSet.Images);
local v15 = require(l_Parent_2.Core.ImageSet.ImageSetComponent);
local v16 = require(l_Core_0.ImageSet.Validator.validateImageSetData);
local v17 = require(l_Parent_2.App.Context.ContentProvider);
local v18 = v6.PureComponent:extend("LoadableImage");
v18.validateProps = v7.strictInterface({
    AnchorPoint = v7.optional(v7.Vector2), 
    BackgroundColor3 = v7.optional(v7.Color3), 
    BackgroundTransparency = v7.optional(v7.number), 
    cornerRadius = v7.optional(v7.UDim), 
    Image = v7.optional(v7.union(v7.string, v16)), 
    ImageColor3 = v7.optional(v7.Color3), 
    ImageTransparency = v7.optional(v7.number), 
    ImageRectOffset = v7.optional(v7.union(v7.Vector2, v7.table)), 
    ImageRectSize = v7.optional(v7.union(v7.Vector2, v7.table)), 
    LayoutOrder = v7.optional(v7.integer), 
    loadingImage = v7.optional(v7.union(v7.string, v7.table)), 
    loadingStrategy = v7.optional(v11.isEnumValue), 
    loadingTimeout = v7.optional(v7.numberPositive), 
    renderOnLoading = v7.optional(v7.callback), 
    renderOnFailed = v7.optional(v7.callback), 
    MaxSize = v7.optional(v7.Vector2), 
    MinSize = v7.optional(v7.Vector2), 
    onLoaded = v7.optional(v7.callback), 
    Position = v7.optional(v7.UDim2), 
    ScaleType = v7.optional(v7.enum(Enum.ScaleType)), 
    Size = v7.UDim2, 
    TileSize = v7.optional(v7.UDim2), 
    useShimmerAnimationWhileLoading = v7.optional(v7.boolean), 
    showFailedStateWhenLoadingFailed = v7.optional(v7.boolean), 
    ZIndex = v7.optional(v7.integer), 
    shouldHandleReloads = v7.optional(v7.boolean), 
    contentProvider = v7.union(v7.instanceOf("ContentProvider"), v7.table), 
    [v10.forceLoading] = v7.optional(v7.boolean), 
    [v10.forceFailed] = v7.optional(v7.boolean)
});
v18.defaultProps = {
    BackgroundTransparency = 0, 
    cornerRadius = UDim.new(0, 0), 
    MaxSize = Vector2.new(1e999, 1e999), 
    MinSize = Vector2.new(0, 0), 
    useShimmerAnimationWhileLoading = false, 
    showFailedStateWhenLoadingFailed = false, 
    loadingStrategy = v11.Default, 
    loadingTimeout = 30, 
    shouldHandleReloads = false
};
v18.init = function(v19) --[[ Line: 114 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy)
    v19.currentImageLoadIndex = 0;
    v19:setState({
        eagerRetrying = false
    });
    v19.imageRef = v6.createRef();
    v19._isMounted = false;
end;
v18.renderShimmer = function(v20, v21, v22, v23) --[[ Line: 124 ]] --[[ Name: renderShimmer ]]
    -- upvalues: v6 (copy), l_Skeleton_0 (copy), v13 (copy)
    return v6.createElement("Frame", {
        AnchorPoint = v20.props.AnchorPoint, 
        BorderSizePixel = 0, 
        BackgroundColor3 = v21.PlaceHolder.Color, 
        BackgroundTransparency = v21.PlaceHolder.Transparency, 
        LayoutOrder = v20.props.LayoutOrder, 
        Position = v20.props.Position, 
        Size = v20.props.Size, 
        ZIndex = v20.props.ZIndex
    }, {
        Shimmer = v6.createElement(l_Skeleton_0, {
            Size = UDim2.fromScale(1, 1), 
            radius = v13(v23.Semantic.Radius, v20.props.cornerRadius)
        }), 
        UISizeConstraint = v22, 
        UICorner = v6.createElement("UICorner", {
            CornerRadius = v20.props.cornerRadius
        }) or nil
    });
end;
v18.defaultRenderOnFail = function(v24, v25, v26) --[[ Line: 146 ]] --[[ Name: defaultRenderOnFail ]]
    -- upvalues: v14 (copy), v6 (copy), v15 (copy)
    local l_cornerRadius_0 = v24.props.cornerRadius;
    local v28 = v14["icons/status/imageunavailable"];
    local v29 = v28.ImageRectSize / v14.ImagesResolutionScale;
    return v6.createElement("Frame", {
        AnchorPoint = v24.props.AnchorPoint, 
        BorderSizePixel = 0, 
        BackgroundColor3 = v25.PlaceHolder.Color, 
        BackgroundTransparency = v25.PlaceHolder.Transparency, 
        LayoutOrder = v24.props.LayoutOrder, 
        Position = v24.props.Position, 
        Size = v24.props.Size, 
        ZIndex = v24.props.ZIndex
    }, {
        EmptyIcon = v6.createElement(v15.Label, {
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Image = v28, 
            ImageColor3 = v25.UIDefault.Color, 
            ImageTransparency = v25.UIDefault.Transparency, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, v29.X, 0, v29.Y)
        }, {
            UICorner = l_cornerRadius_0 ~= UDim.new(0, 0) and v6.createElement("UICorner", {
                CornerRadius = l_cornerRadius_0
            }) or nil
        }), 
        UISizeConstraint = v26, 
        UICorner = l_cornerRadius_0 ~= UDim.new(0, 0) and v6.createElement("UICorner", {
            CornerRadius = l_cornerRadius_0
        }) or nil
    });
end;
v18.isImageNonNil = function(v30) --[[ Line: 182 ]] --[[ Name: isImageNonNil ]]
    -- upvalues: v6 (copy)
    local v31 = false;
    if v30.props.Image ~= v6.None then
        v31 = v30.props.Image ~= nil;
    end;
    return v31;
end;
v18.getCurrentImageAssetFetchStatus = function(v32, v33) --[[ Line: 186 ]] --[[ Name: getCurrentImageAssetFetchStatus ]]
    local v34 = v33[v32:getAssetFetchStatusStateKey(v32.currentImageLoadIndex)];
    if v34 == nil then
        v34 = Enum.AssetFetchStatus.None;
    end;
    return v34;
end;
v18.isLoadingComplete = function(v35, v36) --[[ Line: 196 ]] --[[ Name: isLoadingComplete ]]
    local v37 = v35:getCurrentImageAssetFetchStatus(v36);
    if v37 == Enum.AssetFetchStatus.None or v37 == Enum.AssetFetchStatus.Loading then
        return false;
    elseif (v37 == Enum.AssetFetchStatus.Failure or v37 == Enum.AssetFetchStatus.TimedOut) and v36.eagerRetrying then
        return false;
    else
        return true;
    end;
end;
v18.render = function(v38) --[[ Line: 209 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v6 (copy), v12 (copy), v11 (copy), v15 (copy)
    local l_AnchorPoint_0 = v38.props.AnchorPoint;
    local l_LayoutOrder_0 = v38.props.LayoutOrder;
    local l_Size_0 = v38.props.Size;
    local l_Position_0 = v38.props.Position;
    local l_BackgroundColor3_0 = v38.props.BackgroundColor3;
    local l_BackgroundTransparency_0 = v38.props.BackgroundTransparency;
    local l_cornerRadius_1 = v38.props.cornerRadius;
    local l_ScaleType_0 = v38.props.ScaleType;
    local l_ZIndex_0 = v38.props.ZIndex;
    local l_Image_0 = v38.props.Image;
    local l_ImageTransparency_0 = v38.props.ImageTransparency;
    local l_ImageRectOffset_0 = v38.props.ImageRectOffset;
    local l_ImageRectSize_0 = v38.props.ImageRectSize;
    local l_ImageColor3_0 = v38.props.ImageColor3;
    local l_MaxSize_0 = v38.props.MaxSize;
    local l_MinSize_0 = v38.props.MinSize;
    local l_renderOnLoading_0 = v38.props.renderOnLoading;
    local l_renderOnFailed_0 = v38.props.renderOnFailed;
    local l_loadingImage_0 = v38.props.loadingImage;
    local l_loadingStrategy_0 = v38.props.loadingStrategy;
    local l_useShimmerAnimationWhileLoading_0 = v38.props.useShimmerAnimationWhileLoading;
    local l_showFailedStateWhenLoadingFailed_0 = v38.props.showFailedStateWhenLoadingFailed;
    local v61 = v38:isImageNonNil() and v38:isLoadingComplete(v38.state);
    local v62 = v38:getCurrentImageAssetFetchStatus(v38.state);
    local v63 = v62 ~= Enum.AssetFetchStatus.None;
    local v64 = v62 == Enum.AssetFetchStatus.Failure;
    local v65 = false;
    if v38.props[v10.forceLoading] then
        v61 = false;
    end;
    if v38.props[v10.forceFailed] then
        v64 = true;
    end;
    if l_MaxSize_0.X ~= 1e999 or l_MaxSize_0.Y ~= 1e999 or l_MinSize_0.X ~= 0 or l_MinSize_0.Y ~= 0 then
        v65 = true;
    end;
    local v66 = v65 and v6.createElement("UISizeConstraint", {
        MaxSize = l_MaxSize_0, 
        MinSize = l_MinSize_0
    });
    return v12(function(v67) --[[ Line: 257 ]]
        -- upvalues: v64 (ref), l_renderOnFailed_0 (copy), l_showFailedStateWhenLoadingFailed_0 (copy), v38 (copy), v66 (copy), v61 (ref), l_renderOnLoading_0 (copy), l_loadingStrategy_0 (copy), v11 (ref), l_useShimmerAnimationWhileLoading_0 (copy), v63 (copy), v6 (ref), v15 (ref), l_AnchorPoint_0 (copy), l_BackgroundColor3_0 (copy), l_BackgroundTransparency_0 (copy), l_Image_0 (copy), l_loadingImage_0 (copy), l_ImageTransparency_0 (copy), l_ImageRectOffset_0 (copy), l_ImageRectSize_0 (copy), l_ImageColor3_0 (copy), l_LayoutOrder_0 (copy), l_Position_0 (copy), l_ScaleType_0 (copy), l_Size_0 (copy), l_ZIndex_0 (copy), l_cornerRadius_1 (copy)
        local l_Theme_0 = v67.Theme;
        local l_Tokens_0 = v67.Tokens;
        if v64 and l_renderOnFailed_0 then
            return l_renderOnFailed_0();
        elseif v64 and l_showFailedStateWhenLoadingFailed_0 then
            return v38:defaultRenderOnFail(l_Theme_0, v66);
        elseif not v61 and l_renderOnLoading_0 and l_loadingStrategy_0 ~= v11.Default then
            return l_renderOnLoading_0();
        elseif not v61 and l_useShimmerAnimationWhileLoading_0 and l_loadingStrategy_0 ~= v11.Default then
            return v38:renderShimmer(l_Theme_0, v66, l_Tokens_0);
        else
            local v70 = v61 or l_loadingStrategy_0 == v11.Default;
            local v71 = nil;
            if not v61 and l_renderOnLoading_0 and l_loadingStrategy_0 == v11.Default then
                v71 = l_renderOnLoading_0();
            end;
            local v72 = nil;
            if not v61 and l_useShimmerAnimationWhileLoading_0 and l_loadingStrategy_0 == v11.Default and v63 then
                v72 = v38:renderShimmer(l_Theme_0, v66, l_Tokens_0);
            end;
            return v6.createElement(v15.Label, {
                AnchorPoint = l_AnchorPoint_0, 
                BackgroundColor3 = l_BackgroundColor3_0 or l_Theme_0.PlaceHolder.Color, 
                BackgroundTransparency = l_BackgroundTransparency_0 or l_Theme_0.PlaceHolder.Transparency, 
                BorderSizePixel = 0, 
                Image = v70 and l_Image_0 or l_loadingImage_0, 
                ImageTransparency = l_ImageTransparency_0, 
                ImageRectOffset = l_ImageRectOffset_0, 
                ImageRectSize = l_ImageRectSize_0, 
                ImageColor3 = v70 and l_ImageColor3_0 or nil, 
                LayoutOrder = l_LayoutOrder_0, 
                Position = l_Position_0, 
                ScaleType = l_ScaleType_0, 
                TileSize = v38.props.TileSize, 
                Size = l_Size_0, 
                ZIndex = l_ZIndex_0, 
                [v6.Ref] = v38.imageRef
            }, {
                UISizeConstraint = v66, 
                UICorner = l_cornerRadius_1 ~= UDim.new(0, 0) and v6.createElement("UICorner", {
                    CornerRadius = l_cornerRadius_1
                }) or nil, 
                OnLoading = v71, 
                Shimmer = v72
            });
        end;
    end);
end;
v18.maybeCallOnLoaded = function(v73, v74) --[[ Line: 321 ]] --[[ Name: maybeCallOnLoaded ]]
    if v73.props.onLoaded then
        local v75 = v73:isLoadingComplete(v74);
        local v76 = v73:isLoadingComplete(v73.state);
        if not v75 and v76 then
            v73.props.onLoaded();
        end;
    end;
end;
v18.didUpdate = function(v77, v78, v79) --[[ Line: 331 ]] --[[ Name: didUpdate ]]
    if v78.Image ~= v77.props.Image then
        v77:loadImage();
    end;
    v77:maybeCallOnLoaded(v79);
end;
v18.didMount = function(v80) --[[ Line: 338 ]] --[[ Name: didMount ]]
    v80._isMounted = true;
    v80:loadImage();
end;
v18.willUnmount = function(v81) --[[ Line: 346 ]] --[[ Name: willUnmount ]]
    v81._isMounted = false;
    v81:dropConnections();
end;
v18.isTerminalStatus = function(_, v83) --[[ Line: 351 ]] --[[ Name: isTerminalStatus ]]
    local v84 = true;
    if v83 ~= Enum.AssetFetchStatus.Success then
        v84 = true;
        if v83 ~= Enum.AssetFetchStatus.Failure then
            v84 = v83 == Enum.AssetFetchStatus.TimedOut;
        end;
    end;
    return v84;
end;
v18.getImageUri = function(v85) --[[ Line: 361 ]] --[[ Name: getImageUri ]]
    if v85.props.Image then
        if typeof(v85.props.Image) == "string" then
            return v85.props.Image;
        else
            return v85.props.Image.Image;
        end;
    else
        return nil;
    end;
end;
v18.awaitImageLoaded = function(v86, v87, v88) --[[ Line: 375 ]] --[[ Name: awaitImageLoaded ]]
    if v86:isTerminalStatus(v88) then
        return;
    else
        local v89 = v86:getImageUri();
        local function v91(v90) --[[ Line: 386 ]]
            -- upvalues: v86 (copy), v87 (copy), v89 (copy)
            v86:updateAssetFetchStatusForImageLoadIndex(v90, v87, v89);
            v86:maybeReportCounter("Await", v90);
            if v86:isTerminalStatus(v90) and v86.awaitImageLoadedConnection then
                v86.awaitImageLoadedConnection:Disconnect();
                v86.awaitImageLoadedConnection = nil;
            end;
        end;
        if v89 == "" then
            local l_Success_0 = Enum.AssetFetchStatus.Success;
            v86:updateAssetFetchStatusForImageLoadIndex(l_Success_0, v87, v89);
            v86:maybeReportCounter("Await", l_Success_0);
            if v86:isTerminalStatus(l_Success_0) and v86.awaitImageLoadedConnection then
                v86.awaitImageLoadedConnection:Disconnect();
                v86.awaitImageLoadedConnection = nil;
            end;
            return;
        else
            v86.awaitImageLoadedConnection = v86.props.contentProvider:GetAssetFetchStatusChangedSignal(v89):Connect(v91);
            return;
        end;
    end;
end;
v18.maybeReportCounter = function(_, v94, v95) --[[ Line: 404 ]] --[[ Name: maybeReportCounter ]]
    -- upvalues: v0 (ref)
    pcall(function() --[[ Line: 407 ]]
        -- upvalues: v94 (copy), v95 (copy), v0 (ref)
        local v96 = "UIBlox_LoadableImage_" .. v94 .. "_" .. tostring(v95);
        v0:ReportCounter(v96);
    end);
end;
v18.preloadImageWithRetryLogic = function(v97, v98) --[[ Line: 419 ]] --[[ Name: preloadImageWithRetryLogic ]]
    local v99 = v97:getImageUri();
    local v100 = 0;
    local l_None_0 = Enum.AssetFetchStatus.None;
    while true do
        if not v97._isMounted then
            return;
        else
            if v100 > 0 then
                task.wait(math.pow(2, v100 - 1) * 1.5);
            end;
            v97.props.contentProvider:PreloadAsync({
                v99
            }, function(_, v103) --[[ Line: 434 ]]
                -- upvalues: v97 (copy), v99 (copy), l_None_0 (ref), v98 (copy)
                local v104 = v97:getImageUri();
                if v97._isMounted and v104 == v99 then
                    v97:maybeReportCounter("PreloadAsync", v103);
                    l_None_0 = v103;
                    v97:updateAssetFetchStatusForImageLoadIndex(v103, v98, v99);
                end;
            end);
            local v105 = v97:getImageUri();
            if not v97._isMounted or v105 ~= v99 then
                return;
            else
                if l_None_0 ~= Enum.AssetFetchStatus.Success then
                    v100 = v100 + 1;
                    if (l_None_0 ~= Enum.AssetFetchStatus.Failure or v100 <= 3) and (l_None_0 ~= Enum.AssetFetchStatus.TimedOut or v100 <= 5) then
                        v97:setState({
                            eagerRetrying = true
                        });
                        continue;
                    end;
                end;
                v97:setState({
                    eagerRetrying = false
                });
                return;
            end;
        end;
    end;
end;
v18.getAssetFetchStatusStateKey = function(_, v107) --[[ Line: 481 ]] --[[ Name: getAssetFetchStatusStateKey ]]
    return "assetFetchStatus_" .. tostring(v107);
end;
v18.updateAssetFetchStatusForImageLoadIndex = function(v108, v109, v110, _) --[[ Line: 485 ]] --[[ Name: updateAssetFetchStatusForImageLoadIndex ]]
    v108:setState({
        [v108:getAssetFetchStatusStateKey(v110)] = v109
    });
end;
v18.dropConnections = function(v112) --[[ Line: 492 ]] --[[ Name: dropConnections ]]
    if v112.listenForReloadsConnection then
        v112.listenForReloadsConnection:Disconnect();
        v112.listenForReloadsConnection = nil;
    end;
    if v112.awaitImageLoadedConnection then
        v112.awaitImageLoadedConnection:Disconnect();
        v112.awaitImageLoadedConnection = nil;
    end;
end;
v18.loadImage = function(v113) --[[ Line: 503 ]] --[[ Name: loadImage ]]
    -- upvalues: v11 (copy)
    local v114 = v113.currentImageLoadIndex + 1;
    v113.currentImageLoadIndex = v114;
    local v115 = v113:getImageUri();
    local l_loadingStrategy_1 = v113.props.loadingStrategy;
    v113:dropConnections();
    if v115 == nil then
        v113:updateAssetFetchStatusForImageLoadIndex(Enum.AssetFetchStatus.Success, v114, v115);
        v113:setState({
            eagerRetrying = false
        });
        return;
    else
        local l_AssetFetchStatus_0 = v113.props.contentProvider:GetAssetFetchStatus(v115);
        v113:maybeReportCounter("InitialStatus", l_AssetFetchStatus_0);
        v113:updateAssetFetchStatusForImageLoadIndex(l_AssetFetchStatus_0, v114, v115);
        if v113.props.shouldHandleReloads then
            v113.listenForReloadsConnection = v113.props.contentProvider:GetAssetFetchStatusChangedSignal(v115):Connect(function(v118, _) --[[ Line: 534 ]]
                -- upvalues: v113 (copy), v114 (copy), v115 (copy)
                v113:maybeReportCounter("Reloads", v118);
                v113:updateAssetFetchStatusForImageLoadIndex(v118, v114, v115);
            end);
        end;
        if l_loadingStrategy_1 == v11.Eager then
            task.spawn(function() --[[ Line: 543 ]]
                -- upvalues: v113 (copy), v114 (copy)
                v113:preloadImageWithRetryLogic(v114);
            end);
            return;
        else
            if l_loadingStrategy_1 == v11.Default then
                v113:awaitImageLoaded(v114, l_AssetFetchStatus_0);
            end;
            return;
        end;
    end;
end;
return function(v120) --[[ Line: 551 ]]
    -- upvalues: v6 (copy), v17 (copy), v8 (copy), v18 (copy)
    return v6.createElement(v17.Consumer, {
        render = function(v121) --[[ Line: 553 ]] --[[ Name: render ]]
            -- upvalues: v8 (ref), v120 (copy), v6 (ref), v18 (ref)
            local v122 = v8.Dictionary.join(v120, {
                contentProvider = v121
            });
            return v6.createElement(v18, v122);
        end
    });
end;