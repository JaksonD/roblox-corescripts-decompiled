local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Map_0 = v2.Map;
local l_Object_0 = v2.Object;
local l_Set_0 = v2.Set;
local l_console_0 = v2.console;
local function _(v9) --[[ Line: 33 ]] --[[ Name: isIndexTruthy ]]
    local v10 = false;
    if v9 ~= nil then
        v10 = v9 ~= 1;
    end;
    return v10;
end;
local v12 = require(l_Parent_0.Interaction.Batchinator);
local v13 = require(script.Parent.FillRateHelper);
local v15 = {
    findNodeHandle = function(_) --[[ Line: 44 ]] --[[ Name: findNodeHandle ]]
        warn("ReactNative.findNodeHandle is not implemented");
    end
};
local v16 = nil;
local v17 = require(l_Parent_0.Components.ScrollView.ScrollView);
local v18 = require(l_Parent_0.StyleSheet.StyleSheet);
local v19 = require(l_Parent_0.Components.View.View);
local v20 = require(script.Parent.ViewabilityHelper);
local function v21(...) --[[ Line: 62 ]]
    return {};
end;
local v22 = require(l_Parent_0.Utilities.infoLog);
local v23 = require(l_Parent_0.jsUtils.invariant);
local v24 = require(script.Parent.VirtualizeUtils);
local l_keyExtractor_0 = v24.keyExtractor;
local l_computeWindowedRenderLimits_0 = v24.computeWindowedRenderLimits;
local v27 = require(l_Parent_1.React);
local _ = require(l_Parent_0.Components.ScrollView.ScrollView);
local v29 = require(script.Parent.VirtualizedListContext);
local l_VirtualizedListCellContextProvider_0 = v29.VirtualizedListCellContextProvider;
local l_VirtualizedListContext_0 = v29.VirtualizedListContext;
local l_VirtualizedListContextProvider_0 = v29.VirtualizedListContextProvider;
local v33 = nil;
local v34 = nil;
local v35 = nil;
v16 = function(v36) --[[ Line: 102 ]] --[[ Name: RefreshControl ]]
    -- upvalues: v27 (copy)
    return v27.createElement("Frame", {
        Name = "RCTRefreshControl"
    }, v36.children);
end;
local v37 = false;
local v38 = "";
local function _(v39) --[[ Line: 400 ]] --[[ Name: horizontalOrDefault ]]
    if v39 == nil then
        return false;
    else
        return v39;
    end;
end;
local function _(v41) --[[ Line: 405 ]] --[[ Name: initialNumToRenderOrDefault ]]
    if v41 == nil then
        return 10;
    else
        return v41;
    end;
end;
local function _(v43) --[[ Line: 410 ]] --[[ Name: maxToRenderPerBatchOrDefault ]]
    if v43 == nil then
        return 10;
    else
        return v43;
    end;
end;
local function _(v45) --[[ Line: 415 ]] --[[ Name: onEndReachedThresholdOrDefault ]]
    if v45 == nil then
        return 2;
    else
        return v45;
    end;
end;
local function _(v47) --[[ Line: 420 ]] --[[ Name: scrollEventThrottleOrDefault ]]
    if v47 == nil then
        return 50;
    else
        return v47;
    end;
end;
local function _(v49) --[[ Line: 425 ]] --[[ Name: windowSizeOrDefault ]]
    if v49 == nil then
        return 21;
    else
        return v49;
    end;
end;
local function _(v51) --[[ Line: 436 ]] --[[ Name: compareItemDataOrDefault ]]
    if v51 == nil then
        return function(v52, v53) --[[ Line: 438 ]]
            return v52 == v53;
        end;
    else
        return v51;
    end;
end;
local v55 = v27.PureComponent:extend("VirtualizedList");
v55.contextType = l_VirtualizedListContext_0;
v55.init = function(v56, v57) --[[ Line: 661 ]] --[[ Name: init ]]
    -- upvalues: l_Map_0 (copy), v23 (copy), v13 (copy), l_Boolean_0 (copy), l_computeWindowedRenderLimits_0 (copy), v12 (copy), l_Array_0 (copy), v20 (copy), l_Object_0 (copy), l_Set_0 (copy), l_console_0 (copy), v33 (ref), v27 (copy), v19 (copy), v17 (copy), v16 (ref), v22 (copy)
    v56.props = v57;
    v56._viewabilityTuples = {};
    v56._averageCellLength = 0;
    v56._cellKeysToChildListKeys = l_Map_0.new();
    v56._cellRefs = {};
    v56._frames = {};
    v56._footerLength = 0;
    v56._hasDoneInitialScroll = false;
    v56._hasInteracted = false;
    v56._hasMore = false;
    v56._hasWarned = {};
    v56._headerLength = 0;
    v56._hiPriInProgress = false;
    v56._highestMeasuredFrameIndex = 1;
    v56._indicesToKeys = l_Map_0.new();
    v56._nestedChildLists = l_Map_0.new();
    v56._offsetFromParentVirtualizedList = 0;
    v56._prevParentOffset = 0;
    v56._scrollMetrics = {
        contentLength = 0, 
        dOffset = 0, 
        dt = 10, 
        offset = 0, 
        timestamp = 0, 
        velocity = 0, 
        visibleLength = 0
    };
    v56._scrollRef = nil;
    v56._sentEndForContentLength = 0;
    v56._totalCellLength = 0;
    v56._totalCellsMeasured = 0;
    v56._canvasPosition = Vector2.new(0, 0);
    v56._canvasSize = UDim2.new(0, 0, 0, 0);
    v56._invertedCanvasLength = v56.props.getItemLayout and 0 or v56.props.invertedCanvasLength or 1000;
    v56._getFrameMetrics = function(v58) --[[ Line: 703 ]]
        -- upvalues: v56 (copy), v23 (ref)
        local l_data_0 = v56.props.data;
        local l_getItem_0 = v56.props.getItem;
        local l_getItemCount_0 = v56.props.getItemCount;
        local l_getItemLayout_0 = v56.props.getItemLayout;
        v23(v58 <= l_getItemCount_0(l_data_0), "Tried to get frame for out of range index " .. tostring(v58));
        local v63 = l_getItem_0(l_data_0, v58);
        local v64 = if v63 ~= nil then v56._frames[v56:_keyExtractor(v63, v58)] else v63;
        if (not v64 or v64.index ~= v58) and l_getItemLayout_0 then
            v64 = l_getItemLayout_0(l_data_0, v58);
        end;
        return v64;
    end;
    local l_v23_0 = v23;
    local l_windowSize_0 = v57.windowSize;
    l_v23_0((l_windowSize_0 == nil and 21 or l_windowSize_0) > 0, "VirtualizedList: The windowSize prop must be present and set to a value greater than 0.");
    v56._fillRateHelper = v13.new(v56._getFrameMetrics);
    v56._updateCellsToRender = function() --[[ Line: 741 ]]
        -- upvalues: v56 (copy), l_Boolean_0 (ref), l_computeWindowedRenderLimits_0 (ref)
        local l_data_1 = v56.props.data;
        local l_getItemCount_1 = v56.props.getItemCount;
        local l_onEndReachedThreshold_0 = v56.props.onEndReachedThreshold;
        local v70 = l_onEndReachedThreshold_0 == nil and 2 or l_onEndReachedThreshold_0;
        local v71 = v56:_isVirtualizationDisabled();
        v56:_updateViewableItems(l_data_1);
        if not l_Boolean_0.toJSBoolean(l_data_1) then
            return;
        else
            v56:setState(function(v72) --[[ Line: 750 ]]
                -- upvalues: v56 (ref), v71 (copy), l_Boolean_0 (ref), l_computeWindowedRenderLimits_0 (ref), v70 (copy), l_getItemCount_1 (copy), l_data_1 (copy)
                local v73 = nil;
                local l_contentLength_0 = v56._scrollMetrics.contentLength;
                local l_offset_0 = v56._scrollMetrics.offset;
                local l_visibleLength_0 = v56._scrollMetrics.visibleLength;
                if not v71 then
                    if l_visibleLength_0 > 0 and l_contentLength_0 > 0 then
                        local l_initialScrollIndex_0 = v56.props.initialScrollIndex;
                        local v78 = false;
                        if l_initialScrollIndex_0 ~= nil then
                            v78 = l_initialScrollIndex_0 ~= 1;
                        end;
                        if not v78 or l_Boolean_0.toJSBoolean(v56._scrollMetrics.offset) then
                            v78 = l_computeWindowedRenderLimits_0;
                            l_initialScrollIndex_0 = v56.props.data;
                            local l_getItemCount_2 = v56.props.getItemCount;
                            local l_maxToRenderPerBatch_0 = v56.props.maxToRenderPerBatch;
                            local v81 = l_maxToRenderPerBatch_0 == nil and 10 or l_maxToRenderPerBatch_0;
                            local l_windowSize_1 = v56.props.windowSize;
                            v73 = v78(l_initialScrollIndex_0, l_getItemCount_2, v81, l_windowSize_1 == nil and 21 or l_windowSize_1, v72, v56._getFrameMetricsApprox, v56._scrollMetrics);
                        end;
                    end;
                else
                    local v83;
                    if l_contentLength_0 - l_visibleLength_0 - l_offset_0 < v70 * l_visibleLength_0 then
                        local l_maxToRenderPerBatch_1 = v56.props.maxToRenderPerBatch;
                        v83 = l_maxToRenderPerBatch_1 == nil and 10 or l_maxToRenderPerBatch_1;
                    else
                        v83 = 0;
                    end;
                    v73 = {
                        first = 1, 
                        last = math.min(v72.last + v83, l_getItemCount_1(l_data_1))
                    };
                end;
                if v73 ~= nil and v56._nestedChildLists.size > 0 then
                    local l_first_0 = v73.first;
                    local l_last_0 = v73.last;
                    local l_l_first_0_0 = l_first_0;
                    while l_l_first_0_0 <= l_last_0 do
                        local v88 = v56._indicesToKeys:get(l_l_first_0_0);
                        local v89 = if l_Boolean_0.toJSBoolean(v88) then v56._cellKeysToChildListKeys:get(v88) else v88;
                        if l_Boolean_0.toJSBoolean(v89) then
                            local v90 = false;
                            for _, v92 in ipairs(v89) do
                                local v93 = v56._nestedChildLists:get(v92);
                                if v93 and v93.ref and v93.ref:hasMore() then
                                    v90 = true;
                                    break;
                                end;
                            end;
                            if v90 then
                                v73.last = l_l_first_0_0;
                                break;
                            else
                                l_l_first_0_0 = l_l_first_0_0 + 1;
                            end;
                        end;
                    end;
                end;
                if v73 ~= nil and v73.first == v72.first and v73.last == v72.last then
                    v73 = nil;
                end;
                return v73;
            end);
            return;
        end;
    end;
    v56._updateCellsToRenderBatcher = v12.new(v56._updateCellsToRender, v56.props.updateCellsBatchingPeriod == nil and 50 or v56.props.updateCellsBatchingPeriod);
    if v56.props.viewabilityConfigCallbackPairs then
        v56._viewabilityTuples = l_Array_0.map(v56.props.viewabilityConfigCallbackPairs, function(v94) --[[ Line: 833 ]]
            -- upvalues: v20 (ref)
            return {
                viewabilityHelper = v20.new(v94.viewabilityConfig), 
                onViewableItemsChanged = v94.onViewableItemsChanged
            };
        end);
    else
        l_v23_0 = v56.props.onViewableItemsChanged;
        local l_viewabilityConfig_0 = v56.props.viewabilityConfig;
        if l_v23_0 then
            table.insert(v56._viewabilityTuples, {
                viewabilityHelper = v20.new(l_viewabilityConfig_0), 
                onViewableItemsChanged = l_v23_0
            });
        end;
    end;
    l_v23_0 = {};
    l_windowSize_0 = v56.props.initialScrollIndex;
    local v96 = false;
    if l_windowSize_0 ~= nil then
        v96 = l_windowSize_0 ~= 1;
    end;
    l_v23_0.first = if v96 then v56.props.initialScrollIndex else 1;
    l_windowSize_0 = v56.props.getItemCount(v56.props.data) + 1;
    local l_initialScrollIndex_1 = v56.props.initialScrollIndex;
    local v98 = false;
    if l_initialScrollIndex_1 ~= nil then
        v98 = l_initialScrollIndex_1 ~= 1;
    end;
    local v99 = if v98 then v56.props.initialScrollIndex else 1;
    l_initialScrollIndex_1 = v56.props.initialNumToRender;
    l_v23_0.last = math.min(l_windowSize_0, v99 + (l_initialScrollIndex_1 == nil and 10 or l_initialScrollIndex_1)) - 1;
    l_v23_0.firstItemTracked = if v56.props.data and v56.props.getItemCount(v56.props.data) > 0 then v56.props.getItem(v56.props.data, 1) else l_Object_0.None;
    l_v23_0.scrollPositionDelta = 0;
    if v56:_isNestedWithSameOrientation() then
        local v100 = v56.context.getNestedChildState(v56:_getListKey());
        if l_Boolean_0.toJSBoolean(v100) then
            l_v23_0 = v100;
            v56.state = v100;
            v56._frames = v100.frames;
        end;
    end;
    v56.state = l_v23_0;
    v56._getScrollMetrics = function() --[[ Line: 874 ]]
        -- upvalues: v56 (copy)
        return v56._scrollMetrics;
    end;
    v56._getOutermostParentListRef = function() --[[ Line: 878 ]]
        -- upvalues: v56 (copy)
        if v56:_isNestedWithSameOrientation() then
            return v56.context.getOutermostParentListRef();
        else
            return v56;
        end;
    end;
    v56._getNestedChildState = function(v101) --[[ Line: 886 ]]
        -- upvalues: v56 (copy)
        local v102 = v56._nestedChildLists:get(v101);
        if v102 then
            return v102.state;
        else
            return v102;
        end;
    end;
    v56._registerAsNestedChild = function(v103) --[[ Line: 891 ]]
        -- upvalues: v56 (copy), l_Set_0 (ref), l_console_0 (ref), v33 (ref), l_Object_0 (ref), l_Boolean_0 (ref)
        local v104 = v56._cellKeysToChildListKeys:get(v103.cellKey) or l_Set_0.new();
        v104:add(v103.key);
        v56._cellKeysToChildListKeys:set(v103.cellKey, v104);
        local v105 = v56._nestedChildLists:get(v103.key);
        if v105 and v105.ref ~= nil then
            l_console_0.error("A VirtualizedList contains a cell which itself contains " .. "more than one VirtualizedList of the same orientation as the parent " .. "list. You must pass a unique listKey prop to each sibling list.\n\n" .. v33(l_Object_0.assign({}, v103, {
                horizontal = l_Boolean_0.toJSBoolean(v103.ref.props.horizontal)
            })));
        end;
        v56._nestedChildLists:set(v103.key, {
            ref = v103.ref, 
            state = nil
        });
        if v56._hasInteracted then
            v103.ref:recordInteraction();
        end;
        return nil;
    end;
    v56._unregisterAsNestedChild = function(v106) --[[ Line: 923 ]]
        -- upvalues: v56 (copy)
        v56._nestedChildLists:set(v106.key, {
            ref = nil, 
            state = v106.state
        });
    end;
    v56._onUpdateSeparators = function(v107, v108) --[[ Line: 930 ]]
        -- upvalues: l_Array_0 (ref), v56 (copy), l_Boolean_0 (ref)
        l_Array_0.forEach(v107, function(v109) --[[ Line: 931 ]]
            -- upvalues: v56 (ref), l_Boolean_0 (ref), v108 (copy)
            local v110 = false;
            if v109 ~= nil then
                v110 = v56._cellRefs[tostring(v109)];
            end;
            if l_Boolean_0.toJSBoolean(v110) then
                return v110:updateSeparatorProps(v108);
            else
                return;
            end;
        end);
    end;
    v56._getSpacerKey = function(v111) --[[ Line: 939 ]]
        if v111 then
            return "height";
        else
            return "width";
        end;
    end;
    v56._captureScrollRef = function(v112) --[[ Line: 943 ]]
        -- upvalues: v56 (copy)
        v56._scrollRef = v112;
    end;
    v56._defaultRenderScrollComponent = function(v113) --[[ Line: 947 ]]
        -- upvalues: v56 (copy), v27 (ref), v19 (ref), v23 (ref), v17 (ref), l_Object_0 (ref), v16 (ref)
        local l_onRefresh_0 = v113.onRefresh;
        if v56:_isNestedWithSameOrientation() then
            return v27.createElement(v19, v113);
        elseif l_onRefresh_0 then
            v23(typeof(v113.refreshing) == "boolean", "`refreshing` prop must be set as a boolean in order to use `onRefresh`, but got `" .. (v113.refreshing == nil and "undefined" or tostring(v113.refreshing) .. "`"));
            return v27.createElement(v17, l_Object_0.assign(table.clone(v113), {
                refreshControl = if v113.refreshControl == nil then v27.createElement(v16, {
                    refreshing = v113.refreshing, 
                    onRefresh = l_onRefresh_0, 
                    progressViewOffset = v113.progressViewOffset
                }) else v113.refreshControl
            }));
        else
            return v27.createElement(v17, v113);
        end;
    end;
    v56._onCellUnmount = function(v115) --[[ Line: 977 ]]
        -- upvalues: v56 (copy), l_Object_0 (ref)
        local v116 = v56._frames[v115];
        if v116 ~= nil then
            v56._frames[v115] = l_Object_0.assign({}, v116, {
                inLayout = false
            });
        end;
    end;
    v56._onLayout = function(v117) --[[ Line: 984 ]]
        -- upvalues: v56 (copy)
        if v56:_isNestedWithSameOrientation() then
            v56:measureLayoutRelativeToContainingList();
        else
            v56._scrollMetrics.visibleLength = v56:_selectLength({
                width = v117.AbsoluteSize.X, 
                height = v117.AbsoluteSize.Y
            });
        end;
        if v56.props.onLayout then
            v56.props.onLayout(v117);
        end;
        v56:_scheduleCellsToRenderUpdate();
        v56:_maybeCallOnEndReached();
    end;
    v56._onLayoutEmpty = function(v118) --[[ Line: 1002 ]]
        -- upvalues: v56 (copy)
        if v56.props.onLayout then
            v56.props.onLayout(v118);
        end;
    end;
    v56._onLayoutFooter = function(v119) --[[ Line: 1008 ]]
        -- upvalues: v56 (copy)
        v56:_triggerRemeasureForChildListsInCell(v56:_getFooterCellKey());
        v56._footerLength = v56:_selectLength({
            height = v119.AbsoluteSize.Y, 
            width = v119.AbsoluteSize.X
        });
    end;
    v56._onLayoutHeader = function(v120) --[[ Line: 1016 ]]
        -- upvalues: v56 (copy)
        v56._headerLength = v56:_selectLength({
            height = v120.AbsoluteSize.Y, 
            width = v120.AbsoluteSize.X
        });
    end;
    v56._onContentSizeChange = function(v121, v122) --[[ Line: 1023 ]]
        -- upvalues: v56 (copy)
        if v121 > 0 and v122 > 0 and v56.props.initialScrollIndex ~= nil and v56.props.initialScrollIndex > 1 and not v56._hasDoneInitialScroll then
            if v56.props.contentOffset == nil then
                v56:scrollToIndex({
                    animated = false, 
                    index = v56.props.initialScrollIndex
                });
            end;
            v56._hasDoneInitialScroll = true;
        elseif v56.props.inverted and v121 > 0 and v122 > 0 and not v56._hasDoneInitialScroll then
            v56._hasDoneInitialScroll = true;
            task.defer(function() --[[ Line: 1038 ]]
                -- upvalues: v56 (ref)
                while v56:getScrollRef() == nil do
                    task.wait();
                end;
                if v56.props.contentOffset == nil then
                    local l_current_0 = v56:getScrollRef()._nativeRef.current;
                    if v56.props.horizontal then
                        l_current_0.CanvasPosition = Vector2.new(l_current_0.AbsoluteCanvasSize.X, l_current_0.CanvasPosition.Y);
                        return;
                    else
                        l_current_0.CanvasPosition = Vector2.new(l_current_0.CanvasPosition.X, l_current_0.AbsoluteCanvasSize.Y);
                    end;
                end;
            end);
        end;
        if v56.props.onContentSizeChange then
            v56.props.onContentSizeChange(v121, v122);
        end;
        v56._scrollMetrics.contentLength = v56:_selectLength({
            height = v122, 
            width = v121
        });
        v56:_scheduleCellsToRenderUpdate();
        v56:_maybeCallOnEndReached();
    end;
    v56._convertParentScrollMetrics = function(v124) --[[ Line: 1070 ]]
        -- upvalues: v56 (copy)
        local v125 = v124.offset - v56._offsetFromParentVirtualizedList;
        local l_visibleLength_1 = v124.visibleLength;
        local v127 = v125 - v56._scrollMetrics.offset;
        local l_contentLength_1 = v56._scrollMetrics.contentLength;
        return {
            visibleLength = l_visibleLength_1, 
            contentLength = l_contentLength_1, 
            offset = v125, 
            dOffset = v127
        };
    end;
    v56._onScroll = function(v129) --[[ Line: 1091 ]]
        -- upvalues: v56 (copy), l_Boolean_0 (ref), v22 (ref)
        v56._nestedChildLists:forEach(function(v130) --[[ Line: 1092 ]]
            -- upvalues: v129 (copy)
            if v130.ref then
                v130.ref._onScroll(v129);
            end;
        end);
        if v56.props.onScroll then
            v56.props.onScroll(v129);
        end;
        local v131 = os.clock();
        local v132 = v129:GetChildren()[1];
        local v133 = v56:_selectLength({
            height = v129.AbsoluteSize.Y, 
            width = v129.AbsoluteSize.X
        });
        local v134 = v56:_selectLength({
            height = v132.AbsoluteSize.Y, 
            width = v132.AbsoluteSize.X
        });
        local v135 = if v56.props.inverted then v56:_selectOffset({
            x = v129.AbsoluteCanvasSize.X - v129.CanvasPosition.X - v133, 
            y = v129.AbsoluteCanvasSize.Y - v129.CanvasPosition.Y - v133
        }) else v56:_selectOffset({
            x = v129.CanvasPosition.X, 
            y = v129.CanvasPosition.Y
        });
        local v136 = v135 - v56._scrollMetrics.offset;
        if v56:_isNestedWithSameOrientation() then
            if v56._scrollMetrics.contentLength == 0 then
                return;
            else
                local v137 = v56._convertParentScrollMetrics({
                    v133, 
                    v135
                });
                v133 = v137.visibleLength;
                v134 = v137.contentLength;
                v135 = v137.offset;
                v136 = v137.dOffset;
            end;
        end;
        local v138 = if l_Boolean_0.toJSBoolean(v56._scrollMetrics.timestamp) then math.max(1, (v131 - v56._scrollMetrics.timestamp) * 1000) else 1;
        local v139 = v136 / v138;
        if v138 > 500 and v56._scrollMetrics.dt > 500 and 5 * v133 < v134 and not v56._hasWarned.perf then
            v22("VirtualizedList: You have a large list that is slow to update - make sure your renderItem function renders components that follow React performance best practices like PureComponent, shouldComponentUpdate, etc.", {
                dt = v138, 
                prevDt = v56._scrollMetrics.dt, 
                contentLength = v134
            });
            v56._hasWarned.perf = true;
        end;
        v56._scrollMetrics = {
            contentLength = v134, 
            dt = v138, 
            dOffset = v136, 
            offset = v135, 
            timestamp = v131, 
            velocity = v139, 
            visibleLength = v133
        };
        local l_scrollPositionDelta_0 = v56.state.scrollPositionDelta;
        if l_scrollPositionDelta_0 > 0 then
            v56:setState(function(v141) --[[ Line: 1160 ]]
                -- upvalues: l_scrollPositionDelta_0 (copy)
                return {
                    scrollPositionDelta = 0, 
                    first = v141.first + l_scrollPositionDelta_0, 
                    last = v141.last + l_scrollPositionDelta_0
                };
            end);
        end;
        v56:_updateViewableItems(v56.props.data);
        if not v56.props then
            return;
        else
            v56:_maybeCallOnEndReached();
            if v139 ~= 0 then
                v56._fillRateHelper:activate();
            end;
            v56:_computeBlankness();
            v56:_scheduleCellsToRenderUpdate();
            return;
        end;
    end;
    v56._onScrollBeginDrag = function(v142) --[[ Line: 1180 ]]
        -- upvalues: v56 (copy), l_Array_0 (ref)
        v56._nestedChildLists:forEach(function(v143) --[[ Line: 1181 ]]
            -- upvalues: v142 (copy)
            if v143.ref then
                v143.ref._onScrollBeginDrag(v142);
            end;
        end);
        l_Array_0.forEach(v56._viewabilityTuples, function(v144) --[[ Line: 1186 ]]
            v144.viewabilityHelper:recordInteraction();
        end);
        v56._hasInteracted = true;
        if v56.props.onScrollBeginDrag then
            v56.props.onScrollBeginDrag(v142);
        end;
    end;
    v56._onScrollEndDrag = function(v145) --[[ Line: 1195 ]]
        -- upvalues: v56 (copy), l_Boolean_0 (ref)
        v56._nestedChildLists:forEach(function(v146) --[[ Line: 1196 ]]
            -- upvalues: v145 (copy)
            if v146.ref then
                v146.ref._onScrollEndDrag(v145);
            end;
        end);
        if l_Boolean_0.toJSBoolean(nil) then
            v56._scrollMetrics.velocity = v56:_selectOffset(nil);
        end;
        v56:_computeBlankness();
        if v56.props.onScrollEndDrag then
            v56.props.onScrollEndDrag(v145);
        end;
    end;
    v56._onMomentumScrollBegin = function(v147) --[[ Line: 1214 ]]
        -- upvalues: v56 (copy)
        v56._nestedChildLists:forEach(function(v148) --[[ Line: 1215 ]]
            -- upvalues: v147 (copy)
            if v148.ref then
                v148.ref._onMomentumScrollBegin(v147);
            end;
        end);
        if v56.props.onMomentumScrollBegin then
            v56.props.onMomentumScrollBegin(v147);
        end;
    end;
    v56._onMomentumScrollEnd = function(v149) --[[ Line: 1225 ]]
        -- upvalues: v56 (copy)
        v56._nestedChildLists:forEach(function(v150) --[[ Line: 1226 ]]
            -- upvalues: v149 (copy)
            if v150.ref then
                v150.ref._onMomentumScrollEnd(v149);
            end;
        end);
        v56._scrollMetrics.velocity = 0;
        v56:_computeBlankness();
        if v56.props.onMomentumScrollEnd then
            v56.props.onMomentumScrollEnd(v149);
        end;
    end;
    v56._createViewToken = function(v151, v152) --[[ Line: 1238 ]]
        -- upvalues: v56 (copy)
        local l_data_2 = v56.props.data;
        local v154 = v56.props.getItem(l_data_2, v151);
        return {
            index = v151, 
            item = v154, 
            key = v56:_keyExtractor(v154, v151), 
            isViewable = v152
        };
    end;
    v56._getFrameMetricsApprox = function(v155) --[[ Line: 1253 ]]
        -- upvalues: v56 (copy), v23 (ref)
        local v156 = v56._getFrameMetrics(v155);
        if v156 ~= nil and v156.index == v155 then
            return v156;
        else
            local l_getItemLayout_1 = v56.props.getItemLayout;
            v23(not l_getItemLayout_1, "Should not have to estimate frames when a measurement metrics function is provided");
            return {
                length = v56._averageCellLength, 
                offset = v56._averageCellLength * (v155 - 1)
            };
        end;
    end;
end;
v55.scrollToEnd = function(v158, v159) --[[ Line: 1274 ]] --[[ Name: scrollToEnd ]]
    -- upvalues: l_console_0 (copy)
    local v160 = v159 == nil or v159.animated;
    local v161 = v158.props.getItemCount(v158.props.data);
    local v162 = v158._getFrameMetricsApprox(v161);
    local v163 = v158.props.inverted and 0 or math.max(0, v162.offset + v162.length + v158._footerLength - v158._scrollMetrics.visibleLength);
    if v158._scrollRef == nil then
        return;
    elseif v158._scrollRef.scrollTo == nil then
        l_console_0.warn("No scrollTo method provided. This may be because you have two nested VirtualizedLists with the same orientation, or because you are using a custom component that does not implement scrollTo.");
        return;
    else
        local l_scrollTo_0 = v158._scrollRef.scrollTo;
        local l_horizontal_0 = v158.props.horizontal;
        l_scrollTo_0(if l_horizontal_0 ~= nil and l_horizontal_0 then {
            x = v163, 
            animated = v160
        } else {
            y = v163, 
            animated = v160
        });
        return;
    end;
end;
v55.scrollToIndex = function(v166, v167) --[[ Line: 1304 ]] --[[ Name: scrollToIndex ]]
    -- upvalues: v23 (copy), l_Boolean_0 (copy), l_console_0 (copy)
    local l_data_3 = v166.props.data;
    local l_horizontal_1 = v166.props.horizontal;
    local l_getItemCount_3 = v166.props.getItemCount;
    local l_getItemLayout_2 = v166.props.getItemLayout;
    local l_onScrollToIndexFailed_0 = v166.props.onScrollToIndexFailed;
    local l_animated_0 = v167.animated;
    local l_index_0 = v167.index;
    local l_viewOffset_0 = v167.viewOffset;
    local l_viewPosition_0 = v167.viewPosition;
    v23(l_index_0 >= 1, ("scrollToIndex out of range: requested index %d but minimum is 1"):format(l_index_0));
    v23(l_getItemCount_3(l_data_3) >= 1, ("scrollToIndex out of range: item length %d but minimum is 1"):format(l_getItemCount_3(l_data_3)));
    v23(l_index_0 <= l_getItemCount_3(l_data_3), ("scrollToIndex out of range: requested index %d is out of 1 to %d"):format(l_index_0, l_getItemCount_3(l_data_3)));
    if not l_getItemLayout_2 and v166._highestMeasuredFrameIndex < l_index_0 then
        v23(l_Boolean_0.toJSBoolean(l_onScrollToIndexFailed_0), "scrollToIndex should be used in conjunction with getItemLayout or onScrollToIndexFailed, otherwise there is no way to know the location of offscreen indices or handle failures.");
        l_onScrollToIndexFailed_0({
            averageItemLength = v166._averageCellLength, 
            highestMeasuredFrameIndex = v166._highestMeasuredFrameIndex, 
            index = l_index_0
        });
        return;
    else
        local v177 = if v166:getScrollRef() then v166:getScrollRef()._nativeRef.current else nil;
        if v177 == nil then
            return;
        else
            local l_AbsoluteCanvasSize_0 = v177.AbsoluteCanvasSize;
            local l_AbsoluteSize_0 = v177.AbsoluteSize;
            local v180 = v166._getFrameMetricsApprox(l_index_0);
            local v181 = math.max(0, if v166.props.inverted then (if l_horizontal_1 then l_AbsoluteCanvasSize_0.X else l_AbsoluteCanvasSize_0.Y) - (if l_horizontal_1 then l_AbsoluteSize_0.X else l_AbsoluteSize_0.Y) - v180.offset - (l_Boolean_0.toJSBoolean(l_viewPosition_0) and l_viewPosition_0 or 0) * (v166._scrollMetrics.visibleLength - v180.length) else v180.offset - (l_Boolean_0.toJSBoolean(l_viewPosition_0) and l_viewPosition_0 or 0) * (v166._scrollMetrics.visibleLength - v180.length)) - (l_Boolean_0.toJSBoolean(l_viewOffset_0) and l_viewOffset_0 or 0);
            if v166._scrollRef == nil then
                return;
            elseif v166._scrollRef.scrollTo == nil then
                l_console_0.warn("No scrollTo method provided. This may be because you have two nested VirtualizedLists with the same orientation, or because you are using a custom component that does not implement scrollTo.");
                return;
            else
                v166._scrollRef.scrollTo(if l_horizontal_1 then {
                    x = v181, 
                    animated = l_animated_0
                } else {
                    y = v181, 
                    animated = l_animated_0
                });
                return;
            end;
        end;
    end;
end;
v55.scrollToItem = function(v182, v183) --[[ Line: 1395 ]] --[[ Name: scrollToItem ]]
    -- upvalues: l_Object_0 (copy)
    local l_item_0 = v183.item;
    local l_data_4 = v182.props.data;
    local l_getItem_1 = v182.props.getItem;
    local v187 = v182.props.getItemCount(l_data_4);
    local v188 = 1;
    while true do
        if v188 <= v187 then
            if l_getItem_1(l_data_4, v188) == l_item_0 then
                v182:scrollToIndex(l_Object_0.assign({}, v183, {
                    index = v188
                }));
                return;
            else
                v188 = v188 + 1;
            end;
        else
            return;
        end;
    end;
end;
v55.scrollToOffset = function(v189, v190) --[[ Line: 1424 ]] --[[ Name: scrollToOffset ]]
    -- upvalues: l_console_0 (copy)
    local v191 = if v189:getScrollRef() then v189:getScrollRef()._nativeRef.current else nil;
    if v191 == nil then
        return;
    else
        local l_animated_1 = v190.animated;
        local l_offset_1 = v190.offset;
        if v189._scrollRef == nil then
            return;
        else
            if v189.props.inverted then
                local l_AbsoluteCanvasSize_1 = v191.AbsoluteCanvasSize;
                local l_AbsoluteSize_1 = v191.AbsoluteSize;
                l_offset_1 = (if v189.props.horizontal then l_AbsoluteCanvasSize_1.X else l_AbsoluteCanvasSize_1.Y) - l_offset_1 - if v189.props.horizontal then l_AbsoluteSize_1.X else l_AbsoluteSize_1.Y;
            end;
            if v189._scrollRef.scrollTo == nil then
                l_console_0.warn("No scrollTo method provided. This may be because you have two nested VirtualizedLists with the same orientation, or because you are using a custom component that does not implement scrollTo.");
                return;
            else
                local l_scrollTo_1 = v189._scrollRef.scrollTo;
                local l_horizontal_2 = v189.props.horizontal;
                l_scrollTo_1(if l_horizontal_2 ~= nil and l_horizontal_2 then {
                    x = l_offset_1, 
                    animated = l_animated_1
                } else {
                    y = l_offset_1, 
                    animated = l_animated_1
                });
                return;
            end;
        end;
    end;
end;
v55.recordInteraction = function(v198) --[[ Line: 1470 ]] --[[ Name: recordInteraction ]]
    -- upvalues: l_Array_0 (copy)
    v198._nestedChildLists:forEach(function(v199) --[[ Line: 1471 ]]
        if v199.ref then
            v199.ref:recordInteraction();
        end;
    end);
    l_Array_0.forEach(v198._viewabilityTuples, function(v200) --[[ Line: 1476 ]]
        v200.viewabilityHelper:recordInteraction();
    end);
    v198:_updateViewableItems(v198.props.data);
end;
v55.flashScrollIndicators = function(v201) --[[ Line: 1482 ]] --[[ Name: flashScrollIndicators ]]
    if v201._scrollRef == nil then
        return;
    else
        v201._scrollRef:flashScrollIndicators();
        return;
    end;
end;
v55.getScrollResponder = function(v202) --[[ Line: 1495 ]] --[[ Name: getScrollResponder ]]
    if v202._scrollRef and v202._scrollRef.getScrollResponder then
        return v202._scrollRef:getScrollResponder();
    else
        return nil;
    end;
end;
v55.getScrollableNode = function(v203) --[[ Line: 1503 ]] --[[ Name: getScrollableNode ]]
    -- upvalues: v15 (copy)
    if v203._scrollRef and v203._scrollRef.getScrollableNode then
        return v203._scrollRef:getScrollableNode();
    else
        return v15.findNodeHandle(v203._scrollRef);
    end;
end;
v55.getScrollRef = function(v204) --[[ Line: 1511 ]] --[[ Name: getScrollRef ]]
    if v204._scrollRef and v204._scrollRef.getScrollRef then
        return v204._scrollRef:getScrollRef();
    else
        return v204._scrollRef;
    end;
end;
v55.setNativeProps = function(v205, v206) --[[ Line: 1519 ]] --[[ Name: setNativeProps ]]
    if v205._scrollRef then
        v205._scrollRef:setNativeProps(v206);
    end;
end;
v55._getCellKey = function(v207) --[[ Line: 1525 ]] --[[ Name: _getCellKey ]]
    if v207.context and v207.context.cellKey then
        return v207.context.cellKey;
    else
        return "rootList";
    end;
end;
v55._getListKey = function(v208) --[[ Line: 1529 ]] --[[ Name: _getListKey ]]
    -- upvalues: l_Boolean_0 (copy)
    if l_Boolean_0.toJSBoolean(v208.props.listKey) then
        return v208.props.listKey;
    else
        return (v208:_getCellKey());
    end;
end;
v55._getDebugInfo = function(v209) --[[ Line: 1533 ]] --[[ Name: _getDebugInfo ]]
    local v210 = {
        listKey = v209:_getListKey(), 
        cellKey = v209:_getCellKey()
    };
    local l_horizontal_3 = v209.props.horizontal;
    v210.horizontal = l_horizontal_3 ~= nil and l_horizontal_3;
    v210.parent = if v209.context then v209.context.debugInfo else nil;
    return v210;
end;
v55.hasMore = function(v212) --[[ Line: 1542 ]] --[[ Name: hasMore ]]
    return v212._hasMore;
end;
v55.componentDidMount = function(v213) --[[ Line: 1546 ]] --[[ Name: componentDidMount ]]
    if v213:_isNestedWithSameOrientation() then
        v213.context.registerAsNestedChild({
            cellKey = v213:_getCellKey(), 
            key = v213:_getListKey(), 
            ref = v213, 
            parentDebugInfo = v213.context.debugInfo
        });
    end;
end;
v55.componentWillUnmount = function(v214) --[[ Line: 1561 ]] --[[ Name: componentWillUnmount ]]
    -- upvalues: l_Array_0 (copy)
    if v214:_isNestedWithSameOrientation() then
        v214.context.unregisterAsNestedChild({
            key = v214:_getListKey(), 
            state = {
                first = v214.state.first, 
                last = v214.state.last, 
                frames = v214._frames
            }
        });
    end;
    v214:_updateViewableItems(nil);
    v214._updateCellsToRenderBatcher:dispose({
        abort = true
    });
    l_Array_0.forEach(v214._viewabilityTuples, function(v215) --[[ Line: 1570 ]]
        v215.viewabilityHelper:dispose();
    end);
    v214._fillRateHelper:deactivateAndFlush();
end;
v55.getDerivedStateFromProps = function(v216, v217) --[[ Line: 1576 ]]
    -- upvalues: l_console_0 (copy), l_Object_0 (copy)
    local l_data_5 = v216.data;
    local l_getItemCount_4 = v216.getItemCount;
    local l_maintainVisibleContentPosition_0 = v216.maintainVisibleContentPosition;
    local l_firstItemTracked_0 = v217.firstItemTracked;
    local l_scrollPositionDelta_1 = v217.scrollPositionDelta;
    local l_compareItemData_0 = v216.compareItemData;
    local v226 = l_compareItemData_0 == nil and function(v224, v225) --[[ Line: 438 ]]
        return v224 == v225;
    end or l_compareItemData_0;
    l_compareItemData_0 = if l_data_5 and l_getItemCount_4(l_data_5) > 0 then v216.getItem(l_data_5, 1) else nil;
    local function v231(v227, v228) --[[ Line: 1583 ]] --[[ Name: findItem ]]
        -- upvalues: v226 (copy)
        local v229 = nil;
        for v230 = 1, #v227 do
            if v226(v227[v230], v228) then
                v229 = v230;
                break;
            end;
        end;
        if v229 == nil then
            return 1;
        else
            return v229;
        end;
    end;
    if l_maintainVisibleContentPosition_0 and l_scrollPositionDelta_1 == 0 and l_firstItemTracked_0 ~= nil and l_compareItemData_0 ~= nil then
        l_scrollPositionDelta_1 = v226(l_firstItemTracked_0, l_compareItemData_0) and 0 or v231(l_data_5, l_firstItemTracked_0) - 1;
    end;
    local v232 = l_getItemCount_4(l_data_5);
    local l_maxToRenderPerBatch_2 = v216.maxToRenderPerBatch;
    local v234 = l_maxToRenderPerBatch_2 == nil and 10 or l_maxToRenderPerBatch_2;
    l_maxToRenderPerBatch_2 = math.max(1, (math.min(v217.first, v232 - v234)));
    if v232 > 0 and v232 < l_maxToRenderPerBatch_2 + l_scrollPositionDelta_1 then
        l_scrollPositionDelta_1 = 0;
        l_console_0.warn("WARNING: maintainVisibleContentPosition failed because scrollPositionDelta was out of bounds. This could indicate that items in `data` are getting removed, items are getting added to the middle of `data`, or a different `data` array is getting passed in. Consider changing the `key` prop of the List if the `data` prop is significantly altered.");
    end;
    if l_scrollPositionDelta_1 > 0 then
        for v235 = 1, math.min(l_scrollPositionDelta_1, v232) do
            v216.getItem(l_data_5, v235).shouldResizeOnMount = true;
        end;
    end;
    return {
        first = l_maxToRenderPerBatch_2, 
        last = math.max(1, (math.min(v217.last, v232))), 
        firstItemTracked = l_compareItemData_0 or l_Object_0.None, 
        scrollPositionDelta = l_scrollPositionDelta_1
    };
end;
v55._pushCells = function(v236, v237, v238, v239, v240, v241, v242) --[[ Line: 1639 ]] --[[ Name: _pushCells ]]
    -- upvalues: v27 (copy), v35 (ref)
    local l_CellRendererComponent_0 = v236.props.CellRendererComponent;
    local l_ItemSeparatorComponent_0 = v236.props.ItemSeparatorComponent;
    local l_data_6 = v236.props.data;
    local l_getItem_2 = v236.props.getItem;
    local l_getItemCount_5 = v236.props.getItemCount;
    local l_horizontal_4 = v236.props.horizontal;
    local v249 = v236.props.ListHeaderComponent and 1 or 0;
    local v250 = l_getItemCount_5(l_data_6);
    local v251 = nil;
    v241 = math.min(v250, v241);
    local l_v240_0 = v240;
    while l_v240_0 <= v241 do
        local v253 = l_getItem_2(l_data_6, l_v240_0);
        local v254 = v236:_keyExtractor(v253, l_v240_0);
        v236._indicesToKeys:set(l_v240_0, v254);
        if v239:has(l_v240_0 + v249) then
            table.insert(v238, #v237);
        end;
        local l_l_v240_0_0 = l_v240_0;
        table.insert(v237, v27.createElement(v35, {
            CellRendererComponent = l_CellRendererComponent_0, 
            ItemSeparatorComponent = if l_v240_0 < v250 then l_ItemSeparatorComponent_0 else nil, 
            cellKey = v254, 
            fillRateHelper = v236._fillRateHelper, 
            horizontal = l_horizontal_4, 
            index = l_v240_0, 
            inversionStyle = v242, 
            item = v253, 
            key = v254, 
            prevCellKey = v251, 
            onUpdateSeparators = v236._onUpdateSeparators, 
            onLayout = function(v256) --[[ Line: 1687 ]] --[[ Name: onLayout ]]
                -- upvalues: v236 (copy), v254 (copy), l_l_v240_0_0 (copy)
                return v236:_onCellLayout(v256, v254, l_l_v240_0_0);
            end, 
            onUnmount = v236._onCellUnmount, 
            parentProps = v236.props, 
            ref = function(v257) --[[ Line: 1692 ]] --[[ Name: ref ]]
                -- upvalues: v236 (copy), v254 (copy)
                v236._cellRefs[tostring(v254)] = v257;
            end
        }));
        v251 = v254;
        l_v240_0 = l_v240_0 + 1;
    end;
end;
v55._isVirtualizationDisabled = function(v258) --[[ Line: 1702 ]] --[[ Name: _isVirtualizationDisabled ]]
    if v258.props.disableVirtualization ~= nil then
        return v258.props.disableVirtualization;
    else
        return false;
    end;
end;
v55._isNestedWithSameOrientation = function(v259) --[[ Line: 1706 ]] --[[ Name: _isNestedWithSameOrientation ]]
    -- upvalues: l_Boolean_0 (copy)
    local l_context_0 = v259.context;
    local v261 = false;
    if l_context_0 ~= nil then
        local v262 = l_Boolean_0.toJSBoolean(l_context_0.horizontal);
        local l_horizontal_5 = v259.props.horizontal;
        v261 = v262 == (l_horizontal_5 ~= nil and l_horizontal_5);
    end;
    return v261;
end;
v55._keyExtractor = function(v264, v265, v266) --[[ Line: 1712 ]] --[[ Name: _keyExtractor ]]
    -- upvalues: l_keyExtractor_0 (copy), v37 (ref), l_Boolean_0 (copy), v38 (ref)
    if v264.props.keyExtractor ~= nil then
        return v264.props.keyExtractor(v265, v266);
    else
        local v267 = l_keyExtractor_0(v265, v266);
        if v267 == tostring(v266) then
            v37 = true;
            if v265.type ~= nil and l_Boolean_0.toJSBoolean(v265.type.displayName) then
                v38 = v265.type.displayName;
            end;
        end;
        return v267;
    end;
end;
v55.render = function(v268) --[[ Line: 1727 ]] --[[ Name: render ]]
    -- upvalues: v21 (copy), l_console_0 (copy), v34 (ref), l_Set_0 (copy), v27 (copy), l_VirtualizedListCellContextProvider_0 (copy), v19 (copy), v18 (copy), v37 (ref), v38 (ref), l_Object_0 (copy), l_VirtualizedListContextProvider_0 (copy), v17 (copy)
    if _G.__DEV__ then
        local v269 = v21(v268.props.contentContainerStyle);
        if v269 ~= nil and v269.flexWrap == "wrap" then
            l_console_0.warn("`flexWrap: `wrap`` is not supported with the `VirtualizedList` components.Consider using `numColumns` with `FlatList` instead.");
        end;
    end;
    local l_ListEmptyComponent_0 = v268.props.ListEmptyComponent;
    local l_ListFooterComponent_0 = v268.props.ListFooterComponent;
    local l_ListHeaderComponent_0 = v268.props.ListHeaderComponent;
    local l_data_7 = v268.props.data;
    local l_horizontal_6 = v268.props.horizontal;
    local v275 = v268:_isVirtualizationDisabled();
    local v276;
    if v268.props.inverted then
        local l_horizontal_7 = v268.props.horizontal;
        v276 = if l_horizontal_7 ~= nil and l_horizontal_7 then v34.horizontallyInverted else v34.verticallyInverted;
    else
        v276 = nil;
    end;
    local v278 = {};
    local v279 = l_Set_0.new(v268.props.stickyHeaderIndices);
    local v280 = {};
    if l_ListHeaderComponent_0 then
        if v279:has(0) then
            table.insert(v280, 0);
        end;
        local v281 = if v27.isValidElement(l_ListHeaderComponent_0) then l_ListHeaderComponent_0 else v27.createElement(l_ListHeaderComponent_0, nil);
        table.insert(v278, v27.createElement(l_VirtualizedListCellContextProvider_0, {
            cellKey = v268:_getCellKey() .. "-header", 
            key = "$header", 
            Name = "$header"
        }, v27.createElement(v19, {
            Name = "ListHeaderComponent", 
            onLayout = v268._onLayoutHeader, 
            style = v18.compose(v276, v268.props.ListHeaderComponentStyle), 
            LayoutOrder = v268.props.inverted and 999999998 or -999999998, 
            AutomaticSize = if l_horizontal_6 then Enum.AutomaticSize.X else Enum.AutomaticSize.Y, 
            Size = if l_horizontal_6 then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0)
        }, v281)));
    end;
    local v282 = v268.props.getItemCount(l_data_7);
    if v282 > 0 then
        v37 = false;
        v38 = "";
        local v283 = v268._getSpacerKey(not l_horizontal_6);
        local l_initialScrollIndex_2 = v268.props.initialScrollIndex;
        local v285 = false;
        if l_initialScrollIndex_2 ~= nil then
            v285 = l_initialScrollIndex_2 ~= 1;
        end;
        local v286;
        if v285 then
            v286 = -1;
        else
            l_initialScrollIndex_2 = v268.props.initialNumToRender;
            v286 = (l_initialScrollIndex_2 == nil and 10 or l_initialScrollIndex_2) - 1;
        end;
        local v287 = v286 + 1;
        v286 = v268.state.first;
        v285 = v268.state.last;
        l_initialScrollIndex_2 = v268.state.scrollPositionDelta;
        if l_initialScrollIndex_2 > 0 then
            v286 = v286 + l_initialScrollIndex_2;
            v285 = v285 + l_initialScrollIndex_2;
        end;
        v268:_pushCells(v278, v280, v279, 1, v287, v276);
        local v288 = math.max(v287 + 1, v286);
        if not v275 and v287 + 1 < v286 then
            local v289 = false;
            if v279.size > 0 then
                local v290 = l_ListHeaderComponent_0 and 1 or 0;
                local v291 = v288 - 1;
                while v287 < v291 do
                    if v279:has(v291 + v290) then
                        local v292 = v268._getFrameMetricsApprox(v287);
                        local v293 = v268._getFrameMetricsApprox(v291);
                        local v294 = v293.offset - v292.offset;
                        local l_initialScrollIndex_3 = v268.props.initialScrollIndex;
                        local v296 = false;
                        if l_initialScrollIndex_3 ~= nil then
                            v296 = l_initialScrollIndex_3 ~= 1;
                        end;
                        local v297 = v294 - (v296 and 0 or v292.length);
                        table.insert(v278, v27.createElement(v19, {
                            key = "$sticky_lead", 
                            Name = "$sticky_lead", 
                            style = {
                                Size = if v283 == "height" then UDim2.new(1, 0, 0, v297) else UDim2.new(0, v297, 1, 0)
                            }
                        }));
                        v268:_pushCells(v278, v280, v279, v291, v291, v276);
                        v294 = v268._getFrameMetricsApprox(v286).offset - v293.offset + v293.length;
                        table.insert(v278, v27.createElement(v19, {
                            key = "$sticky_trail", 
                            Name = "$sticky_trail", 
                            style = {
                                Size = if v283 == "height" then UDim2.new(1, 0, 0, v294) else UDim2.new(0, v294, 1, 0)
                            }
                        }));
                        v289 = true;
                        break;
                    else
                        v291 = v291 - 1;
                    end;
                end;
            end;
            if not v289 then
                local v298 = v268._getFrameMetricsApprox(v287);
                local v299 = v268._getFrameMetricsApprox(v286).offset - (v298.offset + v298.length);
                table.insert(v278, v27.createElement(v19, {
                    key = "$lead_spacer", 
                    Name = "$lead_spacer", 
                    style = {
                        Size = if v283 == "height" then UDim2.new(1, 0, 0, v299) else UDim2.new(0, v299, 1, 0)
                    }, 
                    LayoutOrder = v268.props.inverted and 999999999 or -999999999
                }));
            end;
        end;
        v268:_pushCells(v278, v280, v279, v288, v285, v276);
        if not v268._hasWarned.keys and v37 then
            l_console_0.warn("VirtualizedList: missing keys for items, make sure to specify a key or id property on each item or provide a custom keyExtractor.", v38);
            v268._hasWarned.keys = true;
        end;
        if not v275 and v285 < v282 then
            local v300 = v268._getFrameMetricsApprox(v285);
            local v301 = if v268.props.getItemLayout then v282 else math.min(v282, v268._highestMeasuredFrameIndex);
            local v302 = v268._getFrameMetricsApprox(v301);
            local v303 = v302.offset + v302.length - (v300.offset + v300.length);
            table.insert(v278, v27.createElement(v19, {
                key = "$tail_spacer", 
                Name = "$tail_spacer", 
                style = {
                    Size = if v283 == "height" then UDim2.new(1, 0, 0, v303) else UDim2.new(0, v303, 1, 0)
                }, 
                LayoutOrder = v268.props.inverted and -999999999 or 999999999
            }));
        end;
    elseif l_ListEmptyComponent_0 then
        local v304 = if v27.isValidElement(l_ListEmptyComponent_0) then l_ListEmptyComponent_0 else v27.createElement(l_ListEmptyComponent_0, nil);
        local l_v304_0 = v304 --[[ copy: 12 -> 28 ]];
        table.insert(v278, v27.cloneElement(v304, {
            key = "$empty", 
            Name = "$empty", 
            onLayout = function(v306) --[[ Line: 1914 ]] --[[ Name: onLayout ]]
                -- upvalues: v268 (copy), l_v304_0 (copy)
                v268._onLayoutEmpty(v306);
                if l_v304_0.props.onLayout then
                    l_v304_0.props.onLayout(v306);
                end;
            end, 
            style = v18.compose(v276, v304.props.style)
        }));
    end;
    if l_ListFooterComponent_0 then
        local v307 = if v27.isValidElement(l_ListFooterComponent_0) then l_ListFooterComponent_0 else v27.createElement(l_ListFooterComponent_0, nil);
        table.insert(v278, v27.createElement(l_VirtualizedListCellContextProvider_0, {
            cellKey = v268:_getFooterCellKey(), 
            key = "$footer", 
            Name = "$footer"
        }, v27.createElement(v19, {
            Name = "ListFooterComponent", 
            onLayout = v268._onLayoutFooter, 
            style = v18.compose(v276, v268.props.ListFooterComponentStyle), 
            LayoutOrder = v268.props.inverted and -999999998 or 999999998, 
            AutomaticSize = if l_horizontal_6 then Enum.AutomaticSize.X else Enum.AutomaticSize.Y, 
            Size = if l_horizontal_6 then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0)
        }, v307)));
    end;
    if v268.props.inverted and not v268.props.getItemLayout then
        if v268:getScrollRef() ~= nil and v268:getScrollRef()._nativeRef.current ~= nil then
            local l_current_1 = v268:getScrollRef()._nativeRef.current;
            local l_CanvasPosition_0 = l_current_1.CanvasPosition;
            local v310 = v268._getFrameMetricsApprox((math.min(v268._highestMeasuredFrameIndex, v282)));
            local v311 = v310.offset + v310.length;
            local v312 = if v268.props.optimizeInvertedCanvasResize then v268._invertedCanvasLength - v268._footerLength < v311 else v311 ~= v268._invertedCanvasLength - v268._footerLength;
            if v282 <= v268._highestMeasuredFrameIndex and v311 ~= v268._invertedCanvasLength - v268._footerLength then
                local v313 = v311 + v268._footerLength - v268._invertedCanvasLength;
                v268._invertedCanvasLength = v311 + v268._footerLength;
                local v314 = if v268.props.horizontal then UDim2.new(0, v268._invertedCanvasLength, 1, 0) else UDim2.new(1, 0, 0, v268._invertedCanvasLength);
                l_current_1.CanvasSize = v314;
                v268._canvasPosition = if v268.props.horizontal then Vector2.new(l_CanvasPosition_0.X + v313, l_CanvasPosition_0.Y) else Vector2.new(l_CanvasPosition_0.X, l_CanvasPosition_0.Y + v313);
                v268._canvasSize = v314;
            elseif v312 and v268.state.scrollPositionDelta == 0 then
                local l__invertedCanvasLength_0 = v268._invertedCanvasLength;
                local l_visibleLength_2 = v268._scrollMetrics.visibleLength;
                local l_windowSize_2 = v268.props.windowSize;
                local v318 = l_visibleLength_2 * (l_windowSize_2 == nil and 21 or l_windowSize_2) * 0.5;
                local v319 = v310.offset + v268._scrollMetrics.visibleLength + v318;
                l_visibleLength_2 = v319 - l__invertedCanvasLength_0;
                v268._invertedCanvasLength = v319;
                local v320 = if v268.props.horizontal then UDim2.new(0, v268._invertedCanvasLength, 1, 0) else UDim2.new(1, 0, 0, v268._invertedCanvasLength);
                l_current_1.CanvasSize = v320;
                l_current_1.CanvasPosition = if v268.props.horizontal then Vector2.new(l_CanvasPosition_0.X + l_visibleLength_2, l_CanvasPosition_0.Y) else Vector2.new(l_CanvasPosition_0.X, l_CanvasPosition_0.Y + l_visibleLength_2);
                v268._canvasPosition = l_current_1.CanvasPosition;
                v268._canvasSize = v320;
            end;
        else
            v268._canvasPosition = if v268.props.horizontal then Vector2.new(v268._invertedCanvasLength, 0) else Vector2.new(0, v268._invertedCanvasLength);
            v268._canvasSize = if v268.props.horizontal then UDim2.new(0, v268._invertedCanvasLength, 1, 0) else UDim2.new(1, 0, 0, v268._invertedCanvasLength);
        end;
    elseif v268.props.inverted and v268.props.getItemLayout then
        local v321 = v268._getFrameMetricsApprox(v282);
        if v268:getScrollRef() ~= nil and v268:getScrollRef()._nativeRef.current ~= nil then
            local l_current_2 = v268:getScrollRef()._nativeRef.current;
            local l_CanvasPosition_1 = l_current_2.CanvasPosition;
            local l__invertedCanvasLength_1 = v268._invertedCanvasLength;
            v268._invertedCanvasLength = v321.offset + v321.length;
            if l__invertedCanvasLength_1 ~= v268._invertedCanvasLength then
                local v325 = v268._invertedCanvasLength - l__invertedCanvasLength_1;
                l_current_2.CanvasPosition = if v268.props.horizontal then l_CanvasPosition_1 + Vector2.new(v325, 0) else l_CanvasPosition_1 + Vector2.new(0, v325);
            end;
        else
            v268._invertedCanvasLength = v321.offset + v321.length;
        end;
    end;
    local l_assign_0 = l_Object_0.assign;
    local v327 = table.clone(v268.props);
    local v328 = {
        onContentSizeChange = v268._onContentSizeChange, 
        onLayout = v268._onLayout, 
        onScroll = v268._onScroll, 
        onScrollBeginDrag = v268._onScrollBeginDrag, 
        onScrollEndDrag = v268._onScrollEndDrag, 
        onMomentumScrollBegin = v268._onMomentumScrollBegin, 
        onMomentumScrollEnd = v268._onMomentumScrollEnd
    };
    local l_scrollEventThrottle_0 = v268.props.scrollEventThrottle;
    v328.scrollEventThrottle = l_scrollEventThrottle_0 == nil and 50 or l_scrollEventThrottle_0;
    v328.invertStickyHeaders = if v268.props.invertStickyHeaders ~= nil then v268.props.invertStickyHeaders else v268.props.inverted;
    v328.stickyHeaderIndices = v280;
    v328.style = v268.props.style;
    v328.layoutStyle = v276 or nil;
    v328.AutomaticCanvasSize = if not v268.props.inverted or v268.props.getItemLayout then nil else Enum.AutomaticSize.None;
    v328.CanvasSize = if v268.props.inverted then v268._canvasSize else nil;
    v328.CanvasPosition = if v268.props.inverted then v268._canvasPosition else nil;
    l_assign_0 = l_assign_0(v327, v328);
    v268._hasMore = v268.state.last < v268.props.getItemCount(v268.props.data);
    v327 = v27.createElement;
    v328 = l_VirtualizedListContextProvider_0;
    local v330 = {};
    l_scrollEventThrottle_0 = {
        cellKey = nil, 
        getScrollMetrics = v268._getScrollMetrics
    };
    local l_horizontal_8 = v268.props.horizontal;
    l_scrollEventThrottle_0.horizontal = l_horizontal_8 ~= nil and l_horizontal_8;
    l_scrollEventThrottle_0.getOutermostParentListRef = v268._getOutermostParentListRef;
    l_scrollEventThrottle_0.getNestedChildState = v268._getNestedChildState;
    l_scrollEventThrottle_0.registerAsNestedChild = v268._registerAsNestedChild;
    l_scrollEventThrottle_0.unregisterAsNestedChild = v268._unregisterAsNestedChild;
    l_scrollEventThrottle_0.debugInfo = v268:_getDebugInfo();
    v330.value = l_scrollEventThrottle_0;
    v327 = v327(v328, v330, v27.cloneElement((if v268.props.renderScrollComponent then v268.props.renderScrollComponent else v268._defaultRenderScrollComponent)(l_assign_0), {
        ref = v268._captureScrollRef
    }, v278));
    v328 = v327;
    if _G.__DEV__ then
        v328 = v27.createElement(v17.Context.Consumer, nil, function(v332) --[[ Line: 2094 ]]
            -- upvalues: v268 (copy), l_console_0 (ref), v327 (copy)
            if v332 ~= nil then
                local v333 = not v332.horizontal;
                local l_horizontal_9 = v268.props.horizontal;
                if v333 == not (l_horizontal_9 ~= nil and l_horizontal_9) and not v268._hasWarned.nesting and v268.context == nil then
                    l_console_0.error("VirtualizedLists should never be nested inside plain ScrollViews with the same orientation because it can break windowing and other functionality - use another VirtualizedList-backed container instead.");
                    v268._hasWarned.nesting = true;
                end;
            end;
            return v327;
        end);
    end;
    if v268.props.debug then
        return v27.createElement(v19, {
            style = v34.debug, 
            Name = "debug"
        }, v328, v268:_renderDebugOverlay());
    else
        return v328;
    end;
end;
v55.componentDidUpdate = function(v335, v336) --[[ Line: 2120 ]] --[[ Name: componentDidUpdate ]]
    -- upvalues: l_Array_0 (copy)
    local l_data_8 = v335.props.data;
    local l_extraData_0 = v335.props.extraData;
    if l_data_8 ~= v336.data or l_extraData_0 ~= v336.extraData then
        l_Array_0.forEach(v335._viewabilityTuples, function(v339) --[[ Line: 2125 ]]
            v339.viewabilityHelper:resetViewableIndices();
        end);
    end;
    local l__hiPriInProgress_0 = v335._hiPriInProgress;
    v335:_scheduleCellsToRenderUpdate();
    if l__hiPriInProgress_0 then
        v335._hiPriInProgress = false;
    end;
end;
v55._computeBlankness = function(v341) --[[ Line: 2144 ]] --[[ Name: _computeBlankness ]]
    v341._fillRateHelper:computeBlankness(v341.props, v341.state, v341._scrollMetrics);
end;
v55._onCellLayout = function(v342, v343, v344, v345) --[[ Line: 2148 ]] --[[ Name: _onCellLayout ]]
    -- upvalues: l_console_0 (copy), l_Array_0 (copy), l_Object_0 (copy), l_Boolean_0 (copy)
    local v346 = if v342:getScrollRef() and v342:getScrollRef()._nativeRef.current then v342:getScrollRef()._nativeRef.current else v343:FindFirstAncestorOfClass("ScrollingFrame");
    if v346 == nil then
        if _G.__DEV__ then
            l_console_0.warn("CellLayout failed for index " .. tostring(v345) .. ". this may cause layout issues");
        end;
        return;
    else
        local l_AbsolutePosition_0 = v346.AbsolutePosition;
        local l_CanvasPosition_2 = v346.CanvasPosition;
        local l_AbsoluteCanvasSize_2 = v346.AbsoluteCanvasSize;
        local l_AbsoluteSize_2 = v343.AbsoluteSize;
        local l_AbsolutePosition_1 = v343.AbsolutePosition;
        local v352 = if v342.props.inverted and v342.props.horizontal then l_AbsoluteCanvasSize_2.X - l_CanvasPosition_2.X - l_AbsolutePosition_1.X - l_AbsoluteSize_2.X + l_AbsolutePosition_0.X else l_AbsolutePosition_1.X - l_AbsolutePosition_0.X + l_CanvasPosition_2.X;
        local v353 = if not v342.props.inverted or v342.props.horizontal then l_AbsolutePosition_1.Y - l_AbsolutePosition_0.Y + l_CanvasPosition_2.Y else l_AbsoluteCanvasSize_2.Y - l_CanvasPosition_2.Y - l_AbsolutePosition_1.Y - l_AbsoluteSize_2.Y + l_AbsolutePosition_0.Y;
        local v354 = {
            width = v343.AbsoluteSize.X, 
            height = v343.AbsoluteSize.Y, 
            x = v352, 
            y = v353
        };
        local v355 = {
            offset = v342:_selectOffset(v354), 
            length = v342:_selectLength(v354), 
            index = v345, 
            inLayout = true
        };
        local v356 = v342._frames[v344];
        if not v356 or math.abs(v355.offset - v356.offset) > 1 or v355.length ~= v356.length or v345 ~= v356.index then
            local v357 = v342.props.getItem(v342.props.data, v345);
            if not v356 and not v342.props.getItemLayout and typeof(v357) == "table" and v357.shouldResizeOnMount then
                v342:recalculateFrames(v342:_selectLength(v354), v344, v345);
            end;
            if v356 and not v342.props.getItemLayout and math.abs(v355.length - v356.length) >= 1 then
                if v342.props.UNSTABLE_forceSiblingLayoutUpdate then
                    local l_v343_FirstAncestorOfClass_0 = v343:FindFirstAncestorOfClass("Frame");
                    local v359 = if l_v343_FirstAncestorOfClass_0 then l_v343_FirstAncestorOfClass_0:GetChildren() else {};
                    local v360 = v342.props.getItemCount(v342.props.data);
                    l_Array_0.forEach(v359, function(v361) --[[ Line: 2215 ]]
                        -- upvalues: v345 (copy), v360 (copy), v342 (copy)
                        if not v361:IsA("GuiObject") then
                            return;
                        else
                            local v362 = math.abs(v361.LayoutOrder);
                            if v362 <= v345 or v360 < v362 then
                                return;
                            else
                                local v363 = v342.props.getItem(v342.props.data, v362);
                                if v363 == nil then
                                    return;
                                else
                                    local v364 = v342:_keyExtractor(v363, v362);
                                    v342:_onCellLayout(v361, v364, v362);
                                    return;
                                end;
                            end;
                        end;
                    end);
                else
                    l_Array_0.forEach(l_Object_0.keys(v342._frames), function(v365) --[[ Line: 2235 ]]
                        -- upvalues: v342 (copy), v345 (copy)
                        if v342._frames[v365].index <= v345 then
                            return;
                        else
                            local v366 = if v342._cellRefs[v365] then v342._cellRefs[v365]:getRef() else nil;
                            if v366 and v366.current then
                                v342:_onCellLayout(v366.current, v365, v342._frames[v365].index);
                            end;
                            return;
                        end;
                    end);
                end;
            end;
            v342._totalCellLength = v342._totalCellLength + (v355.length - if l_Boolean_0.toJSBoolean(v356) then v356.length else 0);
            v342._totalCellsMeasured = v342._totalCellsMeasured + (l_Boolean_0.toJSBoolean(v356) and 0 or 1);
            v342._averageCellLength = v342._totalCellLength / v342._totalCellsMeasured;
            v342._frames[v344] = v355;
            v342._highestMeasuredFrameIndex = math.max(v342._highestMeasuredFrameIndex, v345);
            v342:_scheduleCellsToRenderUpdate();
            if v342.props.inverted and not v342.props.getItemLayout and v342.state.last == v342.props.getItemCount(v342.props.data) and v342._highestMeasuredFrameIndex == v342.state.last then
                v342:forceUpdate();
            end;
        else
            v342._frames[v344].inLayout = true;
        end;
        v342:_triggerRemeasureForChildListsInCell(v344);
        v342:_computeBlankness();
        v342:_updateViewableItems(v342.props.data);
        return;
    end;
end;
v55._triggerRemeasureForChildListsInCell = function(v367, v368) --[[ Line: 2281 ]] --[[ Name: _triggerRemeasureForChildListsInCell ]]
    local v369 = v367._cellKeysToChildListKeys:get(v368);
    if v369 then
        v369:forEach(function(v370) --[[ Line: 2284 ]]
            -- upvalues: v367 (copy)
            local v371 = v367._nestedChildLists:get(v370);
            if v371 and v371.ref then
                v371.ref:measureLayoutRelativeToContainingList();
            end;
        end);
    end;
end;
v55.recalculateFrames = function(v372, v373, v374, v375) --[[ Line: 2295 ]] --[[ Name: recalculateFrames ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy)
    l_Array_0.forEach(l_Object_0.keys(v372._frames), function(v376) --[[ Line: 2296 ]]
        -- upvalues: v374 (copy), v372 (copy), v375 (copy), v373 (copy)
        if v376 == v374 and v372._frames[v376].index >= v375 then
            return;
        else
            local v377 = v372._frames[v376];
            v377.index = v377.index + 1;
            v377 = v372._frames[v376];
            v377.offset = v377.offset + v373;
            return;
        end;
    end);
    v372._highestMeasuredFrameIndex = v372._highestMeasuredFrameIndex + 1;
end;
v55.measureLayoutRelativeToContainingList = function(v378) --[[ Line: 2307 ]] --[[ Name: measureLayoutRelativeToContainingList ]]
    -- upvalues: l_Boolean_0 (copy), l_console_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 2311 ]]
        -- upvalues: l_Boolean_0 (ref), v378 (copy), l_console_0 (ref)
        if not l_Boolean_0.toJSBoolean(v378._scrollRef) then
            return nil;
        else
            v378._scrollRef:measureLayout(v378.context.getOutermostParentListRef():getScrollRef(), function(v379, v380, v381, v382) --[[ Line: 2319 ]]
                -- upvalues: v378 (ref)
                v378._offsetFromParentVirtualizedList = v378:_selectOffset({
                    x = v379, 
                    y = v380
                });
                v378._scrollMetrics.contentLength = v378:_selectLength({
                    width = v381, 
                    height = v382
                });
                local v383 = v378._convertParentScrollMetrics(v378.context.getScrollMetrics());
                local v384 = true;
                if v378._scrollMetrics.visibleLength == v383.visibleLength then
                    v384 = v378._scrollMetrics.offset ~= v383.offset;
                end;
                if v384 then
                    v378._scrollMetrics.visibleLength = v383.visibleLength;
                    v378._scrollMetrics.offset = v383.offset;
                    v378._cellKeysToChildListKeys:forEach(function(v385) --[[ Line: 2333 ]]
                        -- upvalues: v378 (ref)
                        if v385 then
                            v385:forEach(function(v386) --[[ Line: 2335 ]]
                                -- upvalues: v378 (ref)
                                local v387 = v378._nestedChildLists:get(v386);
                                if v387 and v387.ref then
                                    v387.ref:measureLayoutRelativeToContainingList();
                                end;
                            end);
                        end;
                    end);
                end;
            end, function(_) --[[ Line: 2345 ]]
                -- upvalues: l_console_0 (ref)
                l_console_0.warn("VirtualizedList: Encountered an error while measuring a list's offset from its containing VirtualizedList.");
            end);
            return nil;
        end;
    end);
    if not l_status_0 then
        l_console_0.warn("measureLayoutRelativeToContainingList threw an error", l_result_0.stack);
    end;
end;
v55._getFooterCellKey = function(v391) --[[ Line: 2359 ]] --[[ Name: _getFooterCellKey ]]
    return v391:_getCellKey() .. "-footer";
end;
v55._renderDebugOverlay = function(v392) --[[ Line: 2363 ]] --[[ Name: _renderDebugOverlay ]]
    -- upvalues: l_Boolean_0 (copy), v27 (copy), v19 (copy), v34 (ref), l_Array_0 (copy)
    local v393 = v392._scrollMetrics.visibleLength / if l_Boolean_0.toJSBoolean(v392._scrollMetrics.contentLength) then v392._scrollMetrics.contentLength else 1;
    local v394 = {};
    local v395 = v392.props.getItemCount(v392.props.data);
    local v396 = 1;
    while v396 <= v395 do
        local v397 = v392._getFrameMetricsApprox(v396);
        if l_Boolean_0.toJSBoolean(v397.inLayout) then
            table.insert(v394, v397);
        end;
        v396 = v396 + 1;
    end;
    local l_offset_2 = v392._getFrameMetricsApprox(v392.state.first).offset;
    local v399 = v392._getFrameMetricsApprox(v392.state.last);
    local v400 = v399.offset + v399.length - l_offset_2;
    local l_offset_3 = v392._scrollMetrics.offset;
    local l_visibleLength_3 = v392._scrollMetrics.visibleLength;
    return v27.createElement(v19, {
        style = {
            v34.debugOverlayBase, 
            v34.debugOverlay
        }
    }, l_Array_0.map(v394, function(v403, v404) --[[ Line: 2388 ]]
        -- upvalues: v27 (ref), v19 (ref), v34 (ref), v393 (copy)
        return v27.createElement(v19, {
            key = "f" .. tostring(v404), 
            Name = "f" .. tostring(v404), 
            style = {
                v34.debugOverlayBase, 
                v34.debugOverlayFrame, 
                {
                    top = v403.offset * v393, 
                    height = v403.length * v393
                }
            }
        });
    end), v27.createElement(v19, {
        Name = "DebugOverlayLast", 
        style = {
            v34.debugOverlayBase, 
            v34.debugOverlayFrameLast, 
            {
                top = l_offset_2 * v393, 
                height = v400 * v393
            }
        }
    }), v27.createElement(v19, {
        Name = "DebugOverlayVis", 
        style = {
            v34.debugOverlayBase, 
            v34.debugOverlayFrameVis, 
            {
                top = l_offset_3 * v393, 
                height = l_visibleLength_3 * v393
            }
        }
    }));
end;
v55._selectLength = function(v405, v406) --[[ Line: 2418 ]] --[[ Name: _selectLength ]]
    local l_horizontal_10 = v405.props.horizontal;
    if not (l_horizontal_10 ~= nil and l_horizontal_10) then
        return v406.height;
    else
        return v406.width;
    end;
end;
v55._selectOffset = function(v408, v409) --[[ Line: 2425 ]] --[[ Name: _selectOffset ]]
    local l_horizontal_11 = v408.props.horizontal;
    if not (l_horizontal_11 ~= nil and l_horizontal_11) then
        return v409.y;
    else
        return v409.x;
    end;
end;
v55._maybeCallOnEndReached = function(v411) --[[ Line: 2432 ]] --[[ Name: _maybeCallOnEndReached ]]
    local l_data_9 = v411.props.data;
    local l_getItemCount_6 = v411.props.getItemCount;
    local l_onEndReached_0 = v411.props.onEndReached;
    local l_onEndReachedThreshold_1 = v411.props.onEndReachedThreshold;
    local l_contentLength_2 = v411._scrollMetrics.contentLength;
    local l_visibleLength_4 = v411._scrollMetrics.visibleLength;
    local l_offset_4 = v411._scrollMetrics.offset;
    local v419 = l_contentLength_2 - l_visibleLength_4 - l_offset_4;
    local v420 = if l_onEndReachedThreshold_1 ~= nil then l_onEndReachedThreshold_1 * l_visibleLength_4 else 2;
    if l_onEndReached_0 and v411.state.last == l_getItemCount_6(l_data_9) and v419 < v420 and v411._scrollMetrics.contentLength ~= v411._sentEndForContentLength then
        v411._sentEndForContentLength = v411._scrollMetrics.contentLength;
        l_onEndReached_0({
            distanceFromEnd = v419
        });
        return;
    else
        if v420 < v419 then
            v411._sentEndForContentLength = 0;
        end;
        return;
    end;
end;
v55._scheduleCellsToRenderUpdate = function(v421) --[[ Line: 2457 ]] --[[ Name: _scheduleCellsToRenderUpdate ]]
    -- upvalues: l_Boolean_0 (copy)
    local l_first_1 = v421.state.first;
    local l_last_1 = v421.state.last;
    if v421.state.scrollPositionDelta > 0 then
        return;
    else
        local l_offset_5 = v421._scrollMetrics.offset;
        local l_visibleLength_5 = v421._scrollMetrics.visibleLength;
        local l_velocity_0 = v421._scrollMetrics.velocity;
        local v427 = v421.props.getItemCount(v421.props.data);
        local v428 = false;
        local l_onEndReachedThreshold_2 = v421.props.onEndReachedThreshold;
        l_onEndReachedThreshold_2 = (l_onEndReachedThreshold_2 == nil and 2 or l_onEndReachedThreshold_2) * l_visibleLength_5 / 2;
        if l_first_1 > 1 then
            local v430 = l_offset_5 - v421._getFrameMetricsApprox(l_first_1).offset;
            v428 = v428 or v430 < 0 or l_velocity_0 < -2 and v430 < l_onEndReachedThreshold_2;
        end;
        if l_last_1 < v427 then
            local v431 = v421._getFrameMetricsApprox(l_last_1).offset - (l_offset_5 + l_visibleLength_5);
            v428 = v428 or v431 < 0 or l_velocity_0 > 2;
        end;
        if v428 and (l_Boolean_0.toJSBoolean(v421._averageCellLength) or v421.props.getItemLayout) and not v421._hiPriInProgress then
            v421._hiPriInProgress = true;
            v421._updateCellsToRenderBatcher:dispose({
                abort = true
            });
            v421._updateCellsToRender();
            return;
        else
            v421._updateCellsToRenderBatcher:schedule();
            return;
        end;
    end;
end;
v55._updateViewableItems = function(v432, v433) --[[ Line: 2504 ]] --[[ Name: _updateViewableItems ]]
    -- upvalues: l_Array_0 (copy)
    local l_getItemCount_7 = v432.props.getItemCount;
    l_Array_0.forEach(v432._viewabilityTuples, function(v435) --[[ Line: 2506 ]]
        -- upvalues: l_getItemCount_7 (copy), v433 (copy), v432 (copy)
        v435.viewabilityHelper:onUpdate(l_getItemCount_7(v433), v432._scrollMetrics.offset, v432._scrollMetrics.visibleLength, v432._getFrameMetrics, v432._createViewToken, v435.onViewableItemsChanged, v432.state);
    end);
end;
v35 = v27.Component:extend("CellRenderer");
v35.init = function(v436, v437) --[[ Line: 2567 ]] --[[ Name: init ]]
    -- upvalues: v27 (copy)
    v436.props = v437;
    v436.state = {
        separatorProps = {
            highlighted = false, 
            leadingItem = v436.props.item
        }
    };
    v436._separators = {
        highlight = function() --[[ Line: 2579 ]] --[[ Name: highlight ]]
            -- upvalues: v436 (copy)
            local l_cellKey_0 = v436.props.cellKey;
            local l_prevCellKey_0 = v436.props.prevCellKey;
            v436.props.onUpdateSeparators({
                l_cellKey_0, 
                l_prevCellKey_0
            }, {
                highlighted = true
            });
        end, 
        unhighlight = function() --[[ Line: 2583 ]] --[[ Name: unhighlight ]]
            -- upvalues: v436 (copy)
            local l_cellKey_1 = v436.props.cellKey;
            local l_prevCellKey_1 = v436.props.prevCellKey;
            v436.props.onUpdateSeparators({
                l_cellKey_1, 
                l_prevCellKey_1
            }, {
                highlighted = false
            });
        end, 
        updateProps = function(v442, v443) --[[ Line: 2587 ]] --[[ Name: updateProps ]]
            -- upvalues: v436 (copy)
            local l_cellKey_2 = v436.props.cellKey;
            local l_prevCellKey_2 = v436.props.prevCellKey;
            v436.props.onUpdateSeparators({
                if v442 == "leading" then l_prevCellKey_2 else l_cellKey_2
            }, v443);
        end
    };
    v436._nativeRef = v27.createRef();
end;
v35.getDerivedStateFromProps = function(v446, v447) --[[ Line: 2599 ]]
    -- upvalues: l_Object_0 (copy)
    return {
        separatorProps = l_Object_0.assign({}, v447.separatorProps, {
            leadingItem = v446.item
        })
    };
end;
v35.updateSeparatorProps = function(v448, v449) --[[ Line: 2603 ]] --[[ Name: updateSeparatorProps ]]
    -- upvalues: l_Object_0 (copy)
    v448:setState(function(v450) --[[ Line: 2604 ]]
        -- upvalues: l_Object_0 (ref), v449 (copy)
        return {
            separatorProps = l_Object_0.assign({}, v450.separatorProps, v449)
        };
    end);
end;
v35.componentWillUnmount = function(v451) --[[ Line: 2609 ]] --[[ Name: componentWillUnmount ]]
    v451.props.onUnmount(v451.props.cellKey);
end;
v35._renderElement = function(v452, v453, v454, v455, v456) --[[ Line: 2613 ]] --[[ Name: _renderElement ]]
    -- upvalues: l_Boolean_0 (copy), l_console_0 (copy), v27 (copy), v23 (copy)
    if l_Boolean_0.toJSBoolean(v453) and l_Boolean_0.toJSBoolean(v454) then
        l_console_0.warn("VirtualizedList: Both ListItemComponent and renderItem props are present. ListItemComponent will take precedence over renderItem.");
    end;
    if l_Boolean_0.toJSBoolean(v454) then
        return v27.createElement(v454, {
            item = v455, 
            index = v456, 
            separators = v452._separators
        });
    elseif l_Boolean_0.toJSBoolean(v453) then
        return v453({
            item = v455, 
            index = v456, 
            separators = v452._separators
        });
    else
        v23(false, "VirtualizedList: Either ListItemComponent or renderItem props are required but none were found.");
        return nil;
    end;
end;
v35.getRef = function(v457) --[[ Line: 2644 ]] --[[ Name: getRef ]]
    return v457._nativeRef;
end;
v35.render = function(v458) --[[ Line: 2649 ]] --[[ Name: render ]]
    -- upvalues: v27 (copy), l_Object_0 (copy), l_Boolean_0 (copy), v34 (ref), v19 (copy), l_VirtualizedListCellContextProvider_0 (copy)
    local l_CellRendererComponent_1 = v458.props.CellRendererComponent;
    local l_ItemSeparatorComponent_1 = v458.props.ItemSeparatorComponent;
    local l_fillRateHelper_0 = v458.props.fillRateHelper;
    local l_horizontal_12 = v458.props.horizontal;
    local l_item_1 = v458.props.item;
    local l_index_1 = v458.props.index;
    local l_inversionStyle_0 = v458.props.inversionStyle;
    local l_parentProps_0 = v458.props.parentProps;
    local l_renderItem_0 = l_parentProps_0.renderItem;
    local l_getItemLayout_3 = l_parentProps_0.getItemLayout;
    local v469 = v458:_renderElement(l_renderItem_0, l_parentProps_0.ListItemComponent, l_item_1, l_index_1);
    local v470 = if not l_getItemLayout_3 or l_parentProps_0.debug or l_fillRateHelper_0:enabled() then v458.props.onLayout else nil;
    local v471 = l_ItemSeparatorComponent_1 and v27.createElement(l_ItemSeparatorComponent_1, l_Object_0.assign(v458.state.separatorProps, {
        LayoutOrder = l_inversionStyle_0 and -1 or 1
    }));
    local v472 = if l_Boolean_0.toJSBoolean(l_inversionStyle_0) then if l_horizontal_12 then {
        v34.rowReverse, 
        l_inversionStyle_0
    } else {
        v34.columnReverse, 
        l_inversionStyle_0
    } else if l_horizontal_12 then {
        v34.row, 
        l_inversionStyle_0
    } else l_inversionStyle_0;
    local v473 = if not l_Boolean_0.toJSBoolean(l_CellRendererComponent_1) then v27.createElement(v19, {
        Name = "CellRendererView", 
        style = v472, 
        onLayout = v470, 
        LayoutOrder = if l_inversionStyle_0 then -l_index_1 else l_index_1, 
        AutomaticSize = if l_horizontal_12 then Enum.AutomaticSize.X else Enum.AutomaticSize.Y, 
        nativeRef = v458._nativeRef
    }, if v471 then v27.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        FillDirection = if l_horizontal_12 then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical
    }) else nil, v469, v471) else v27.createElement(l_CellRendererComponent_1, l_Object_0.assign(table.clone(v458.props), {
        style = v472, 
        onLayout = v470, 
        nativeRef = v458._nativeRef
    }), if v471 then v27.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        FillDirection = if l_horizontal_12 then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical
    }) else nil, v469, v471);
    return v27.createElement(l_VirtualizedListCellContextProvider_0, {
        cellKey = v458.props.cellKey
    }, v473);
end;
v33 = function(v474) --[[ Line: 2725 ]] --[[ Name: describeNestedLists ]]
    -- upvalues: l_Boolean_0 (copy)
    local v475 = "VirtualizedList trace:\n" .. ("  Child (%s):\n"):format(l_Boolean_0.toJSBoolean(v474.horizontal) and "horizontal" or "vertical") .. ("    listKey: %s\n"):format(v474.key) .. ("    cellKey: %s"):format(v474.cellKey);
    local l_parentDebugInfo_0 = v474.parentDebugInfo;
    while l_parentDebugInfo_0 do
        v475 = v475 .. ("\n  Parent (%s):\n"):format(l_parentDebugInfo_0.horizontal and "horizontal" or "vertical") .. ("    listKey: %s\n"):format(l_parentDebugInfo_0.listKey) .. ("    cellKey: %s"):format(l_parentDebugInfo_0.cellKey);
        l_parentDebugInfo_0 = l_parentDebugInfo_0.parent;
    end;
    return v475;
end;
v34 = v18.create({
    verticallyInverted = {
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Bottom
    }, 
    horizontallyInverted = {
        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, 
    row = {
        AutomaticSize = Enum.AutomaticSize.X, 
        Size = UDim2.new(0, 0, 1, 0)
    }, 
    column = {
        AutomaticSize = Enum.AutomaticSize.Y
    }, 
    rowReverse = {
        flexDirection = "row-reverse", 
        AutomaticSize = Enum.AutomaticSize.X, 
        Size = UDim2.new(0, 0, 1, 0)
    }, 
    columnReverse = {
        flexDirection = "column-reverse", 
        AutomaticSize = Enum.AutomaticSize.Y
    }, 
    debug = {
        flex = 1
    }, 
    debugOverlayBase = {
        position = "absolute", 
        top = 0, 
        right = 0
    }, 
    debugOverlay = {
        bottom = 0, 
        width = 20, 
        borderColor = "blue", 
        borderWidth = 1
    }, 
    debugOverlayFrame = {
        left = 0, 
        backgroundColor = "orange"
    }, 
    debugOverlayFrameLast = {
        left = 0, 
        borderColor = "green", 
        borderWidth = 2
    }, 
    debugOverlayFrameVis = {
        left = 0, 
        borderColor = "red", 
        borderWidth = 2
    }
});
return v55;