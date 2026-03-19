local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local v3 = require(l_Parent_1.Promise);
local v4 = {};
local v5 = require(l_Parent_1.React);
local l_useRef_0 = v5.useRef;
local l_useState_0 = v5.useState;
local v8 = require(l_Parent_0.Components.View.View);
local v9 = require(script.Parent.FlatList);
local function _(v10) --[[ Line: 81 ]] --[[ Name: _getLength ]]
    return function(v11) --[[ Line: 82 ]]
        -- upvalues: v10 (copy)
        if v10 then
            return v11.X;
        else
            return v11.Y;
        end;
    end;
end;
v4.BidirectionalFlatList = v5.forwardRef(function(v13, v14) --[[ Line: 98 ]]
    -- upvalues: v3 (copy), l_useState_0 (copy), l_useRef_0 (copy), v5 (copy), v9 (copy), l_Object_0 (copy), v8 (copy)
    local function v15() --[[ Line: 99 ]] --[[ Name: promiseFn ]]
        -- upvalues: v3 (ref)
        return v3.resolve();
    end;
    local _ = v13.activityIndicatorColor == nil and "black" or v13.activityIndicatorColor;
    local v17 = v13.autoscrollToTopThreshold == nil and 100 or v13.autoscrollToTopThreshold;
    local l_data_0 = v13.data;
    local l_enableAutoscrollToTop_0 = v13.enableAutoscrollToTop;
    local l_FooterLoadingIndicator_0 = v13.FooterLoadingIndicator;
    local l_HeaderLoadingIndicator_0 = v13.HeaderLoadingIndicator;
    local l_ListHeaderComponent_0 = v13.ListHeaderComponent;
    local l_ListFooterComponent_0 = v13.ListFooterComponent;
    local v24 = if v13.onEndReached == nil then v15 else v13.onEndReached;
    local v25 = v13.onEndReachedThreshold == nil and 10 or v13.onEndReachedThreshold;
    local l_onScroll_0 = v13.onScroll;
    local v27 = if v13.onStartReached == nil then v15 else v13.onStartReached;
    local v28 = v13.onStartReachedThreshold == nil and 10 or v13.onStartReachedThreshold;
    local v29 = v13.showDefaultLoadingIndicators == nil or v13.showDefaultLoadingIndicators;
    local v30 = v13.enableRetryOnStartReached ~= nil and v13.enableRetryOnStartReached;
    local v31 = v13.enableRetryOnEndReached ~= nil and v13.enableRetryOnEndReached;
    local v32, v33 = l_useState_0(false);
    local v34, v35 = l_useState_0(false);
    local v36, v37 = l_useState_0(0);
    local v38 = l_useRef_0({});
    local v39 = l_useRef_0({});
    local v40 = l_useRef_0(nil);
    local v41 = l_useRef_0(nil);
    local function v45() --[[ Line: 133 ]] --[[ Name: maybeCallOnStartReached ]]
        -- upvalues: l_data_0 (copy), v38 (copy), v13 (copy), v36 (copy), v33 (copy), v3 (ref), v40 (copy), v41 (copy), v27 (copy)
        if l_data_0 and #l_data_0 > 0 and v38.current[#l_data_0] then
            return;
        else
            local v42 = if v13.inverted then v36 >= 3 else v36 >= 1;
            if not v42 then
                return;
            else
                if l_data_0 and #l_data_0 > 0 and v42 then
                    v38.current[#l_data_0] = true;
                end;
                v33(true);
                local function v44() --[[ Line: 151 ]] --[[ Name: p ]]
                    -- upvalues: v3 (ref), v40 (ref), v33 (ref)
                    return v3.new(function(v43) --[[ Line: 152 ]]
                        -- upvalues: v40 (ref), v33 (ref)
                        v40.current = nil;
                        v33(false);
                        v43();
                    end);
                end;
                if v41.current then
                    v41.current:andThen(function() --[[ Line: 160 ]]
                        -- upvalues: v40 (ref), v27 (ref), v44 (copy)
                        v40.current = v27():andThen(v44);
                    end);
                    return;
                else
                    v40.current = v27():andThen(v44);
                    return;
                end;
            end;
        end;
    end;
    local function v49() --[[ Line: 168 ]] --[[ Name: maybeCallOnEndReached ]]
        -- upvalues: l_data_0 (copy), v39 (copy), v13 (copy), v36 (copy), v35 (copy), v3 (ref), v41 (copy), v40 (copy), v24 (copy)
        if l_data_0 and #l_data_0 > 0 and v39.current[#l_data_0] then
            return;
        else
            local v46 = if v13.inverted then v36 >= 3 else v36 >= 1;
            if not v46 then
                return;
            else
                if l_data_0 and #l_data_0 > 0 and v46 then
                    v39.current[#l_data_0] = true;
                end;
                v35(true);
                local function v48() --[[ Line: 186 ]] --[[ Name: p ]]
                    -- upvalues: v3 (ref), v41 (ref), v35 (ref)
                    return v3.new(function(v47) --[[ Line: 187 ]]
                        -- upvalues: v41 (ref), v35 (ref)
                        v41.current = nil;
                        v35(false);
                        v47();
                    end);
                end;
                if v40.current then
                    v40.current:andThen(function() --[[ Line: 195 ]]
                        -- upvalues: v41 (ref), v24 (ref), v48 (copy)
                        v41.current = v24():andThen(v48);
                    end);
                    return;
                else
                    v41.current = v24():andThen(v48);
                    return;
                end;
            end;
        end;
    end;
    local function v61(v50) --[[ Line: 204 ]] --[[ Name: handleScroll ]]
        -- upvalues: v37 (copy), l_onScroll_0 (copy), v13 (copy), v28 (copy), v25 (copy), v45 (copy), v30 (copy), l_data_0 (copy), v38 (copy), v49 (copy), v31 (copy), v39 (copy)
        v37(function(v51) --[[ Line: 206 ]]
            return v51 + 1;
        end);
        if l_onScroll_0 then
            l_onScroll_0(v50);
        end;
        local v52 = v50:GetChildren()[1];
        local l_horizontal_0 = v13.horizontal;
        local l_l_horizontal_0_0 = l_horizontal_0 --[[ copy: 3 -> 8 ]];
        local function v56(v55) --[[ Line: 82 ]]
            -- upvalues: l_l_horizontal_0_0 (copy)
            if l_l_horizontal_0_0 then
                return v55.X;
            else
                return v55.Y;
            end;
        end;
        l_horizontal_0 = v56(v50.AbsoluteSize);
        local v57 = v56(v52.AbsoluteSize);
        local v58 = if v13.inverted then v56(v50.AbsoluteCanvasSize) - v56(v50.CanvasPosition) - l_horizontal_0 else v56(v50.CanvasPosition);
        local v59 = v58 < v28;
        local v60 = v57 - l_horizontal_0 - v58 < v25;
        if v59 then
            v45();
        elseif v30 and l_data_0 and #l_data_0 > 0 and v38.current[#l_data_0] then
            v38.current[#l_data_0] = false;
        end;
        if v60 then
            v49();
            return;
        else
            if v31 and l_data_0 and #l_data_0 > 0 and v39.current[#l_data_0] then
                v39.current[#l_data_0] = false;
            end;
            return;
        end;
    end;
    local function v62() --[[ Line: 247 ]] --[[ Name: renderHeaderLoadingIndicator ]]
        -- upvalues: v29 (copy), l_ListHeaderComponent_0 (copy), v5 (ref), v32 (copy), l_HeaderLoadingIndicator_0 (copy)
        if not v29 then
            if l_ListHeaderComponent_0 then
                return v5.createElement(l_ListHeaderComponent_0, nil);
            else
                return nil;
            end;
        elseif not v32 then
            return nil;
        elseif l_HeaderLoadingIndicator_0 then
            return v5.createElement(l_HeaderLoadingIndicator_0, nil);
        else
            if _G.__DEV__ then
                warn("default activity indicator not available");
            end;
            return nil;
        end;
    end;
    local function v63() --[[ Line: 277 ]] --[[ Name: renderFooterLoadingIndicator ]]
        -- upvalues: v29 (copy), l_ListFooterComponent_0 (copy), v5 (ref), v34 (copy), l_FooterLoadingIndicator_0 (copy)
        if not v29 then
            if l_ListFooterComponent_0 then
                return v5.createElement(l_ListFooterComponent_0, nil);
            else
                return nil;
            end;
        elseif not v34 then
            return nil;
        elseif l_FooterLoadingIndicator_0 then
            return v5.createElement(l_FooterLoadingIndicator_0, nil);
        else
            if _G.__DEV__ then
                warn("default activity indicator not available");
            end;
            return nil;
        end;
    end;
    return v5.createElement(v5.Fragment, nil, v5.createElement(v9, l_Object_0.assign(table.clone(v13), {
        renderItem = function(v64) --[[ Line: 314 ]] --[[ Name: renderItem ]]
            -- upvalues: v5 (ref), v8 (ref), v14 (copy), v13 (copy), l_enableAutoscrollToTop_0 (copy), v17 (copy)
            local l_item_0 = v64.item;
            return v5.createElement(v8, {
                onLayout = function(v66) --[[ Line: 317 ]] --[[ Name: onLayout ]]
                    -- upvalues: v14 (ref), v13 (ref), l_item_0 (copy), l_enableAutoscrollToTop_0 (ref), v17 (ref)
                    local v67 = if v14 and v14.current then v14.current._listRef._scrollRef.getNativeScrollRef()._nativeRef.current else nil;
                    local l_horizontal_1 = v13.horizontal;
                    local l_l_horizontal_1_0 = l_horizontal_1 --[[ copy: 3 -> 9 ]];
                    local function v71(v70) --[[ Line: 82 ]]
                        -- upvalues: l_l_horizontal_1_0 (copy)
                        if l_l_horizontal_1_0 then
                            return v70.X;
                        else
                            return v70.Y;
                        end;
                    end;
                    if l_item_0.shouldResizeOnMount and v67 then
                        l_horizontal_1 = v71(v66.AbsoluteSize);
                        if l_horizontal_1 <= 0 or v67 == nil then
                            l_item_0.shouldResizeOnMount = false;
                            return;
                        else
                            local l_CanvasPosition_0 = v67.CanvasPosition;
                            local l_AbsoluteSize_0 = v67.AbsoluteSize;
                            local l_AbsoluteCanvasSize_0 = v67.AbsoluteCanvasSize;
                            local v75 = if l_enableAutoscrollToTop_0 then v17 else nil;
                            if v75 and (if v13.inverted then v71(l_AbsoluteCanvasSize_0) - v71(l_CanvasPosition_0) - v71(l_AbsoluteSize_0) else v71(l_CanvasPosition_0)) < v75 then
                                l_item_0.shouldResizeOnMount = false;
                                v67.CanvasPosition = if v13.inverted then if v13.horizontal then Vector2.new(v71(l_AbsoluteCanvasSize_0) - v71(l_AbsoluteSize_0), v67.CanvasPosition.Y) else Vector2.new(v67.CanvasPosition.X, v71(l_AbsoluteCanvasSize_0) - v71(l_AbsoluteSize_0)) else if v13.horizontal then Vector2.new(0, v67.CanvasPosition.Y) else Vector2.new(v67.CanvasPosition.X, 0);
                                return;
                            else
                                local v76 = if v13.inverted then if v13.horizontal then Vector2.new(l_CanvasPosition_0.X - l_horizontal_1, l_CanvasPosition_0.Y) else Vector2.new(l_CanvasPosition_0.X, l_CanvasPosition_0.Y - l_horizontal_1) else if v13.horizontal then Vector2.new(l_CanvasPosition_0.X + l_horizontal_1, l_CanvasPosition_0.Y) else Vector2.new(l_CanvasPosition_0.X, l_CanvasPosition_0.Y + l_horizontal_1);
                                l_item_0.shouldResizeOnMount = false;
                                v67.CanvasPosition = v76;
                            end;
                        end;
                    end;
                end, 
                AutomaticSize = if v13.horizontal then Enum.AutomaticSize.X else Enum.AutomaticSize.Y, 
                Size = if v13.horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0), 
                BorderSizePixel = 0, 
                name = "resize"
            }, {
                child = v13.renderItem(v64)
            });
        end, 
        ref = v14, 
        ListHeaderComponent = v62, 
        ListFooterComponent = v63, 
        onEndReached = l_Object_0.None, 
        onScroll = v61, 
        maintainVisibleContentPosition = {
            autoscrollToTopThreshold = if l_enableAutoscrollToTop_0 then v17 else nil, 
            minIndexForVisible = 1
        }
    })));
end);
return v4;