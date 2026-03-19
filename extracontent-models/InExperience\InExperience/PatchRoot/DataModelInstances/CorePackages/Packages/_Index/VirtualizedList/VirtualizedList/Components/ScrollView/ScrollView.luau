local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Map_0 = v2.Map;
local l_Object_0 = v2.Object;
local l_console_0 = v2.console;
local l_setTimeout_0 = v2.setTimeout;
local l_HttpService_0 = game:GetService("HttpService");
local v13 = {
    Value = {
        new = function(...) --[[ Line: 37 ]] --[[ Name: new ]]
            return {
                setOffset = function(_, _) --[[ Line: 40 ]] --[[ Name: setOffset ]]

                end, 
                interpolate = function(_, ...) --[[ Line: 43 ]] --[[ Name: interpolate ]]

                end
            };
        end
    }, 
    attachNativeEvent = function(...) --[[ Line: 49 ]] --[[ Name: attachNativeEvent ]]
        return nil;
    end
};
local v14 = {
    get = function(...) --[[ Line: 58 ]] --[[ Name: get ]]
        return {
            height = 100
        };
    end
};
local v15 = nil;
v15 = {
    OS = "roblox", 
    select = function(v16) --[[ Line: 68 ]] --[[ Name: select ]]
        -- upvalues: v15 (ref)
        return v16[v15.OS];
    end
};
local v17 = require(l_Parent_1.React);
local v18 = {
    findNodeHandle = function(...) --[[ Line: 84 ]] --[[ Name: findNodeHandle ]]
        return nil;
    end
};
local v19 = require(script.Parent.ScrollViewStickyHeader);
local v20 = require(l_Parent_0.StyleSheet.StyleSheet);
local v21 = require(script.Parent.Parent.View.View);
local v22 = {
    measureLayout = function(...) --[[ Line: 103 ]] --[[ Name: measureLayout ]]

    end
};
local v23 = {
    addListener = function(...) --[[ Line: 109 ]] --[[ Name: addListener ]]
        return nil;
    end
};
local v24 = {
    beginScroll = function(...) --[[ Line: 116 ]] --[[ Name: beginScroll ]]
        warn("FrameRateLogger.beginScroll not implemented");
    end, 
    endScroll = function(...) --[[ Line: 119 ]] --[[ Name: endScroll ]]
        warn("FrameRateLogger.endScroll not implemented");
    end
};
local v25 = {
    blurTextInput = function(...) --[[ Line: 125 ]] --[[ Name: blurTextInput ]]
        warn("TextInputState.blurTextInput not implemented");
    end, 
    currentlyFocusedInput = function(...) --[[ Line: 128 ]] --[[ Name: currentlyFocusedInput ]]
        warn("TextInputState.currentlyFocusedInput not implemented");
        return nil;
    end, 
    isTextInput = function(...) --[[ Line: 132 ]] --[[ Name: isTextInput ]]
        warn("TextInputState.isTextInput not implemented");
        return nil;
    end
};
local function _() --[[ Line: 138 ]]
    warn("dismissKeyboard not implemented");
end;
local function _(v27) --[[ Line: 142 ]]
    return v27;
end;
local v29 = require(l_Parent_0.jsUtils.invariant);
local v30 = require(script.Parent.processDecelerationRate);
local function _(v31) --[[ Line: 152 ]]
    return {
        outer = v31, 
        inner = v31
    };
end;
local v33 = require(script.Parent.Parent.Parent.Utilities.setAndForwardRef);
local v34 = require(script.Parent.ScrollViewContext);
local l_default_0 = v34.default;
local l_HORIZONTAL_0 = v34.HORIZONTAL;
local l_VERTICAL_0 = v34.VERTICAL;
local _ = require(script.Parent.ScrollViewStickyHeader);
local l_default_1 = require(script.Parent.ScrollViewCommands).default;
local v40 = require(script.Parent.ScrollContentViewNativeComponent);
local v41 = require(script.Parent.ScrollViewNativeComponent);
local v42 = nil;
local v43 = nil;
local v44 = nil;
local v45 = if v15.OS == "android" then {
    NativeHorizontalScrollViewTuple = {
        "Frame", 
        "Frame"
    }, 
    NativeVerticalScrollViewTuple = {
        v41, 
        v21
    }
} else {
    NativeHorizontalScrollViewTuple = {
        v41, 
        v40
    }, 
    NativeVerticalScrollViewTuple = {
        v41, 
        v40
    }
};
v43 = v45.NativeHorizontalScrollViewTuple;
v44 = v45.NativeVerticalScrollViewTuple;
local v46 = v17.Component:extend("ScrollView");
v46.Context = l_default_0;
v46.init = function(v47, v48) --[[ Line: 953 ]] --[[ Name: init ]]
    -- upvalues: l_Map_0 (copy), v17 (copy), v33 (copy), v18 (copy), l_default_1 (copy), l_Boolean_0 (copy), v22 (copy), v29 (copy), v15 (ref), l_Array_0 (copy), l_Object_0 (copy), l_console_0 (copy), v14 (copy), l_setTimeout_0 (copy), v24 (copy), v25 (copy), v13 (copy)
    v47.props = v48;
    v47._scrollAnimatedValueAttachment = nil;
    v47._stickyHeaderRefs = l_Map_0.new();
    v47._headerLayoutYs = l_Map_0.new();
    v47._keyboardWillOpenTo = nil;
    v47._additionalScrollOffset = 0;
    v47._isTouching = false;
    v47._lastMomentumScrollBeginTime = 0;
    v47._lastMomentumScrollEndTime = 0;
    v47._observedScrollSinceBecomingResponder = false;
    v47._becameResponderWhileAnimating = false;
    v47._preventNegativeScrollOffset = nil;
    v47._animated = nil;
    v47._subscriptionKeyboardWillShow = nil;
    v47._subscriptionKeyboardWillHide = nil;
    v47._subscriptionKeyboardDidShow = nil;
    v47._subscriptionKeyboardDidHide = nil;
    v47.state = {
        layoutHeight = nil
    };
    v47._listLayoutRef = v17.createRef();
    v47._setNativeRef = v33({
        getForwardedRef = function() --[[ Line: 986 ]] --[[ Name: getForwardedRef ]]
            -- upvalues: v47 (copy)
            return v47.props.scrollViewRef;
        end, 
        setLocalRef = function(v49) --[[ Line: 989 ]] --[[ Name: setLocalRef ]]
            -- upvalues: v47 (copy)
            v47._scrollViewRef = v49;
            if v49 ~= nil then
                v49.getScrollResponder = v47.getScrollResponder;
                v49.getScrollableNode = v47.getScrollableNode;
                v49.getInnerViewNode = v47.getInnerViewNode;
                v49.getInnerViewRef = v47.getInnerViewRef;
                v49.getNativeScrollRef = v47.getNativeScrollRef;
                v49.scrollTo = v47.scrollTo;
                v49.scrollToEnd = v47.scrollToEnd;
                v49.flashScrollIndicators = v47.flashScrollIndicators;
                v49.scrollResponderZoomTo = v47.scrollResponderZoomTo;
                v49.scrollResponderScrollNativeHandleToKeyboard = v47.scrollResponderScrollNativeHandleToKeyboard;
            end;
            return nil;
        end
    });
    v47.getScrollResponder = function() --[[ Line: 1023 ]]
        -- upvalues: v47 (copy)
        return v47;
    end;
    v47.getScrollableNode = function() --[[ Line: 1028 ]]
        -- upvalues: v18 (ref), v47 (copy)
        return v18:findNodeHandle(v47._scrollViewRef);
    end;
    v47.getInnerViewNode = function() --[[ Line: 1032 ]]
        -- upvalues: v18 (ref), v47 (copy)
        return v18:findNodeHandle(v47._innerViewRef);
    end;
    v47.getInnerViewRef = function() --[[ Line: 1036 ]]
        -- upvalues: v47 (copy)
        return v47._innerViewRef;
    end;
    v47.getNativeScrollRef = function() --[[ Line: 1040 ]]
        -- upvalues: v47 (copy)
        return v47._scrollViewRef;
    end;
    v47.scrollTo = function(v50) --[[ Line: 1055 ]]
        -- upvalues: v47 (copy), l_default_1 (ref), l_Boolean_0 (ref)
        local v51 = nil;
        local v52 = nil;
        local v53 = nil;
        if v50 ~= nil then
            v52 = v50.y;
            v51 = v50.x;
            v53 = v50.animated;
        end;
        if v47._scrollViewRef == nil or v47._scrollViewRef._nativeRef.current == nil then
            return;
        else
            l_default_1.scrollTo(v47._scrollViewRef, l_Boolean_0.toJSBoolean(v51) and v51 or 0, l_Boolean_0.toJSBoolean(v52) and v52 or 0, not not v53);
            return;
        end;
    end;
    v47.scrollToEnd = function(v54) --[[ Line: 1103 ]]
        -- upvalues: v47 (copy), l_default_1 (ref)
        local v55 = false;
        if v54 ~= nil then
            v55 = v54.animated;
        end;
        local v56 = v55 ~= false;
        if v47._scrollViewRef == nil then
            return;
        else
            l_default_1.scrollToEnd(v47._scrollViewRef, v56);
            return;
        end;
    end;
    v47.flashScrollIndicators = function() --[[ Line: 1119 ]]
        -- upvalues: v47 (copy), l_default_1 (ref)
        if v47._scrollViewRef == nil then
            return;
        else
            l_default_1.flashScrollIndicators(v47._scrollViewRef);
            return;
        end;
    end;
    v47.scrollResponderScrollNativeHandleToKeyboard = function(v57, v58, v59) --[[ Line: 1136 ]]
        -- upvalues: v47 (copy), l_Boolean_0 (ref), v22 (ref), v18 (ref)
        v47._additionalScrollOffset = l_Boolean_0.toJSBoolean(v58) and v58 or 0;
        v47._preventNegativeScrollOffset = l_Boolean_0.toJSBoolean(v59);
        if v47._innerViewRef == nil then
            return;
        elseif typeof(v57) == "number" then
            v22:measureLayout(v57, v18:findNodeHandle(v47), v47._textInputFocusError, v47._inputMeasureAndScrollToKeyboard);
            return;
        else
            v57:measureLayout(v47._innerViewRef, v47._inputMeasureAndScrollToKeyboard, v47._textInputFocusError);
            return;
        end;
    end;
    v47.scrollResponderZoomTo = function(v60, v61) --[[ Line: 1172 ]]
        -- upvalues: v29 (ref), v15 (ref), l_Array_0 (ref), l_Object_0 (ref), v47 (copy), l_console_0 (ref), l_default_1 (ref)
        v29(v15.OS == "ios", "zoomToRect is not implemented");
        if l_Array_0.indexOf(l_Object_0.keys(v60), "animated") ~= -1 then
            v47._animated = v60.animated;
            v60.animated = nil;
        elseif typeof(v61) ~= "nil" then
            l_console_0.warn("`scrollResponderZoomTo` `animated` argument is deprecated. Use `options.animated` instead");
        end;
        if v47._scrollViewRef == nil then
            return;
        else
            l_default_1.zoomToRect(v47._scrollViewRef, v60, v61 ~= false);
            return;
        end;
    end;
    v47._inputMeasureAndScrollToKeyboard = function(_, v63, _, v65) --[[ Line: 1206 ]]
        -- upvalues: v14 (ref), v47 (copy), l_setTimeout_0 (ref)
        local l_height_0 = v14:get("window").height;
        local function v68() --[[ Line: 1208 ]] --[[ Name: scrollTextInputIntoVisibleRect ]]
            -- upvalues: v47 (ref), l_height_0 (ref), v63 (copy), v65 (copy)
            if v47._keyboardWillOpenTo ~= nil then
                l_height_0 = v47._keyboardWillOpenTo.endCoordinates.screenY;
            end;
            local v67 = v63 - l_height_0 + v65 + v47._additionalScrollOffset;
            if v47._preventNegativeScrollOffset == true then
                v67 = math.max(0, v67);
            end;
            v47.scrollTo({
                x = 0, 
                y = v67, 
                animated = true
            });
            v47._additionalScrollOffset = 0;
            v47._preventNegativeScrollOffset = false;
        end;
        if v47._keyboardWillOpenTo == nil then
            l_setTimeout_0(function() --[[ Line: 1234 ]]
                -- upvalues: v68 (copy)
                v68();
            end, 0);
        else
            v68();
        end;
    end;
    v47._handleScroll = function(v69) --[[ Line: 1242 ]]
        -- upvalues: v47 (copy), v15 (ref), l_console_0 (ref)
        if _G.__DEV__ and v47.props.onScroll and v47.props.scrollEventThrottle == nil and v15.OS == "ios" then
            l_console_0.log("You specified `onScroll` on a <ScrollView> but not `scrollEventThrottle`. You will only receive one event. Using `16` you get all the events but be aware that it may cause frame drops, use a bigger number if you don't need as much precision.");
        end;
        v47._observedScrollSinceBecomingResponder = true;
        if v47.props.onScroll then
            v47.props.onScroll(v69);
        end;
    end;
    v47._handleLayout = function(v70) --[[ Line: 1261 ]]
        -- upvalues: v47 (copy)
        if v47.props.invertStickyHeaders == true then
            v47:setState({
                layoutHeight = v70.AbsoluteWindowSize.Y
            });
        end;
        if v47.props.onLayout then
            v47.props.onLayout(v70);
        end;
    end;
    v47._overrideAutomaticCanvasSize = function(v71, v72) --[[ Line: 1275 ]]
        -- upvalues: v47 (copy)
        if v47._scrollViewRef == nil then
            return;
        else
            local l_current_0 = v47._scrollViewRef._nativeRef.current;
            if l_current_0 == nil then
                return;
            elseif v47.props.AutomaticCanvasSize == Enum.AutomaticSize.XY or v47.props.AutomaticCanvasSize == nil then
                l_current_0.CanvasSize = UDim2.new(0, v71, 0, v72);
                return;
            elseif v47.props.AutomaticCanvasSize == Enum.AutomaticSize.X then
                l_current_0.CanvasSize = UDim2.new(0, v71, 0, l_current_0.AbsoluteCanvasSize.Y);
                return;
            else
                if v47.props.AutomaticCanvasSize == Enum.AutomaticSize.Y then
                    l_current_0.CanvasSize = UDim2.new(0, l_current_0.AbsoluteCanvasSize.X, 0, v72);
                end;
                return;
            end;
        end;
    end;
    v47._handleContentOnLayout = function(v74) --[[ Line: 1294 ]]
        -- upvalues: v47 (copy)
        local l_X_0 = v74.AbsoluteSize.X;
        local l_Y_0 = v74.AbsoluteSize.Y;
        if v47.props.overrideAutomaticCanvasSize then
            v47._overrideAutomaticCanvasSize(l_X_0, l_Y_0);
        end;
        if v47.props.onContentSizeChange then
            v47.props.onContentSizeChange(l_X_0, l_Y_0);
        end;
    end;
    v47._scrollViewRef = nil;
    v47._innerViewRef = nil;
    v47._setInnerViewRef = v33({
        getForwardedRef = function() --[[ Line: 1309 ]] --[[ Name: getForwardedRef ]]
            -- upvalues: v47 (copy)
            return v47.props.innerViewRef;
        end, 
        setLocalRef = function(v77) --[[ Line: 1312 ]] --[[ Name: setLocalRef ]]
            -- upvalues: v47 (copy)
            v47._innerViewRef = v77;
            return nil;
        end
    });
    v47.scrollResponderKeyboardWillShow = function(v78) --[[ Line: 1348 ]]
        -- upvalues: v47 (copy)
        v47._keyboardWillOpenTo = v78;
        if v47.props.onKeyboardWillShow then
            v47.props.onKeyboardWillShow(v78);
        end;
    end;
    v47.scrollResponderKeyboardWillHide = function(v79) --[[ Line: 1355 ]]
        -- upvalues: v47 (copy)
        v47._keyboardWillOpenTo = nil;
        if v47.props.onKeyboardWillHide then
            v47.props.onKeyboardWillHide(v79);
        end;
    end;
    v47.scrollResponderKeyboardDidShow = function(v80) --[[ Line: 1362 ]]
        -- upvalues: l_Boolean_0 (ref), v47 (copy)
        if l_Boolean_0.toJSBoolean(v80) then
            v47._keyboardWillOpenTo = v80;
        end;
        if v47.props.onKeyboardDidShow then
            v47.props.onKeyboardDidShow(v80);
        end;
    end;
    v47.scrollResponderKeyboardDidHide = function(v81) --[[ Line: 1373 ]]
        -- upvalues: v47 (copy)
        v47._keyboardWillOpenTo = nil;
        if v47.props.onKeyboardDidHide then
            v47.props.onKeyboardDidHide(v81);
        end;
    end;
    v47._handleMomentumScrollBegin = function(v82) --[[ Line: 1383 ]]
        -- upvalues: v47 (copy)
        v47._lastMomentumScrollBeginTime = os.clock() * 1000;
        if v47.props.onMomentumScrollBegin then
            v47.props.onMomentumScrollBegin(v82);
        end;
    end;
    v47._handleMomentumScrollEnd = function(v83) --[[ Line: 1393 ]]
        -- upvalues: v24 (ref), v47 (copy)
        v24:endScroll();
        v47._lastMomentumScrollEndTime = os.clock() * 1000;
        if v47.props.onMomentumScrollEnd then
            v47.props.onMomentumScrollEnd(v83);
        end;
    end;
    v47._handleScrollBeginDrag = function(v84) --[[ Line: 1408 ]]
        -- upvalues: v24 (ref), v15 (ref), v47 (copy)
        v24:beginScroll();
        if v15.OS == "android" and v47.props.keyboardDismissMode == "on-drag" then
            warn("dismissKeyboard not implemented");
        end;
        if v47.props.onScrollBeginDrag then
            v47.props.onScrollBeginDrag(v84);
        end;
    end;
    v47._handleScrollEndDrag = function(v85, v86) --[[ Line: 1421 ]]
        -- upvalues: v47 (copy), l_Boolean_0 (ref), v24 (ref)
        if not v47:_isAnimating() and (not l_Boolean_0.toJSBoolean(nil) or (nil).x == 0 and (nil).y == 0) then
            v24:endScroll();
        end;
        if v47.props.onScrollEndDrag then
            v47.props.onScrollEndDrag(v85, v86);
        end;
    end;
    v47._isAnimating = function() --[[ Line: 1441 ]]
        -- upvalues: v47 (copy)
        return os.clock() * 1000 - v47._lastMomentumScrollEndTime < 16;
    end;
    v47._handleResponderGrant = function(v87) --[[ Line: 1451 ]]
        -- upvalues: v47 (copy)
        v47._observedScrollSinceBecomingResponder = false;
        if v47.props.onResponderGrant then
            v47.props.onResponderGrant(v87);
        end;
        v47._becameResponderWhileAnimating = v47:_isAnimating();
    end;
    v47._handleResponderReject = function() --[[ Line: 1469 ]]

    end;
    v47._handleResponderRelease = function(v88) --[[ Line: 1474 ]]
        -- upvalues: v47 (copy), l_console_0 (ref), v25 (ref)
        v47._isTouching = #v88.nativeEvent.touches ~= 0;
        if v47.props.onResponderRelease then
            v47.props.onResponderRelease(v88);
        end;
        if typeof(v88.target) == "number" then
            if _G.__DEV__ then
                l_console_0.error("Did not expect event target to be a number. Should have been a native component");
            end;
            return;
        else
            local v89 = v25:currentlyFocusedInput();
            if v47.props.keyboardShouldPersistTaps ~= true and v47.props.keyboardShouldPersistTaps ~= "always" and v47:_keyboardIsDismissible() and v88.target ~= v89 and not v47._observedScrollSinceBecomingResponder and not v47._becameResponderWhileAnimating then
                v25:blurTextInput(v89);
            end;
            return;
        end;
    end;
    v47._handleResponderTerminationRequest = function() --[[ Line: 1517 ]]
        -- upvalues: v47 (copy)
        return not v47._observedScrollSinceBecomingResponder;
    end;
    v47._handleScrollShouldSetResponder = function() --[[ Line: 1524 ]]
        -- upvalues: v47 (copy)
        if v47.props.disableScrollViewPanResponder == true then
            return false;
        else
            return v47._isTouching;
        end;
    end;
    v47._handleStartShouldSetResponder = function(v90) --[[ Line: 1557 ]]
        -- upvalues: v47 (copy), v25 (ref)
        if v47.props.disableScrollViewPanResponder == true then
            return false;
        else
            local v91 = v25:currentlyFocusedInput();
            if v47.props.keyboardShouldPersistTaps == "handled" and v47:_keyboardIsDismissible() and v90.target ~= v91 then
                return true;
            else
                return false;
            end;
        end;
    end;
    v47._handleStartShouldSetResponderCapture = function(v92) --[[ Line: 1586 ]]
        -- upvalues: v47 (copy), l_Boolean_0 (ref), l_console_0 (ref), v25 (ref)
        if v47:_isAnimating() then
            return true;
        elseif v47.props.disableScrollViewPanResponder == true then
            return false;
        else
            local l_keyboardShouldPersistTaps_0 = v47.props.keyboardShouldPersistTaps;
            local v94 = not l_Boolean_0.toJSBoolean(l_keyboardShouldPersistTaps_0) or l_keyboardShouldPersistTaps_0 == "never";
            if typeof(v92.target) == "number" then
                if _G.__DEV__ then
                    l_console_0.error("Did not expect event target to be a number. Should have been a native component");
                end;
                return false;
            elseif v94 and v47:_keyboardIsDismissible() and v92.target ~= nil and not l_Boolean_0.toJSBoolean(v25:isTextInput(v92.target)) then
                return true;
            else
                return false;
            end;
        end;
    end;
    v47._keyboardIsDismissible = function() --[[ Line: 1629 ]]
        -- upvalues: v25 (ref), v47 (copy), v15 (ref)
        local v95 = v25:currentlyFocusedInput();
        local v96 = false;
        if v95 ~= nil then
            v96 = v25:isTextInput(v95);
        end;
        local v97 = true;
        if v47._keyboardWillOpenTo == nil then
            v97 = v15.OS == "android";
        end;
        return v96 and v97;
    end;
    v47._handleTouchEnd = function(v98, v99) --[[ Line: 1652 ]]
        -- upvalues: v47 (copy)
        v47._isTouching = false;
        if v47.props.onTouchEnd then
            v47.props.onTouchEnd(v98, v99);
        end;
    end;
    v47._handleTouchCancel = function(v100, v101) --[[ Line: 1668 ]]
        -- upvalues: v47 (copy)
        v47._isTouching = false;
        if v47.props.onTouchCancel then
            v47.props.onTouchCancel(v100, v101);
        end;
    end;
    v47._handleTouchStart = function(v102, v103) --[[ Line: 1687 ]]
        -- upvalues: v47 (copy)
        v47._isTouching = true;
        if v47.props.onTouchStart then
            v47.props.onTouchStart(v102, v103);
        end;
    end;
    v47._handleTouchMove = function(v104, v105) --[[ Line: 1705 ]]
        -- upvalues: v47 (copy)
        if v47.props.onTouchMove then
            v47.props.onTouchMove(v104, v105);
        end;
    end;
    v47._scrollAnimatedValue = v13.Value.new(if v47.props.contentOffset and l_Boolean_0.toJSBoolean(v47.props.contentOffset.y) then v47.props.contentOffset.y else 0);
    v47._scrollAnimatedValue:setOffset(if v47.props.contentInset and l_Boolean_0.toJSBoolean(v47.props.contentInset.top) then v47.props.contentInset.top else 0);
end;
v46.componentDidMount = function(v106) --[[ Line: 1723 ]] --[[ Name: componentDidMount ]]
    -- upvalues: l_console_0 (copy), l_Boolean_0 (copy), v23 (copy)
    if typeof(v106.props.keyboardShouldPersistTaps) == "boolean" then
        l_console_0.warn(("'keyboardShouldPersistTaps={%s}' is deprecated. "):format(v106.props.keyboardShouldPersistTaps == true and "true" or "false") .. ("Use 'keyboardShouldPersistTaps=\"%s\"' instead"):format(l_Boolean_0.toJSBoolean(v106.props.keyboardShouldPersistTaps) and "always" or "never"));
    end;
    v106._keyboardWillOpenTo = nil;
    v106._additionalScrollOffset = 0;
    v106._subscriptionKeyboardWillShow = v23:addListener("keyboardWillShow", v106.scrollResponderKeyboardWillShow);
    v106._subscriptionKeyboardWillHide = v23:addListener("keyboardWillHide", v106.scrollResponderKeyboardWillHide);
    v106._subscriptionKeyboardDidShow = v23:addListener("keyboardDidShow", v106.scrollResponderKeyboardDidShow);
    v106._subscriptionKeyboardDidHide = v23:addListener("keyboardDidHide", v106.scrollResponderKeyboardDidHide);
    v106:_updateAnimatedNodeAttachment();
end;
v46.componentDidUpdate = function(v107, v108) --[[ Line: 1745 ]] --[[ Name: componentDidUpdate ]]
    -- upvalues: l_Boolean_0 (copy)
    local v109 = if v108.contentInset then v108.contentInset.top else 0;
    local v110 = if v107.props.contentInset then v107.props.contentInset.top else 0;
    if v109 ~= v110 then
        v107._scrollAnimatedValue:setOffset(l_Boolean_0.toJSBoolean(v110) and v110 or 0);
    end;
    v107:_updateAnimatedNodeAttachment();
end;
v46.componentWillUnmount = function(v111) --[[ Line: 1755 ]] --[[ Name: componentWillUnmount ]]
    if v111._subscriptionKeyboardWillShow ~= nil then
        v111._subscriptionKeyboardWillShow:remove();
    end;
    if v111._subscriptionKeyboardWillHide ~= nil then
        v111._subscriptionKeyboardWillHide:remove();
    end;
    if v111._subscriptionKeyboardDidShow ~= nil then
        v111._subscriptionKeyboardDidShow:remove();
    end;
    if v111._subscriptionKeyboardDidHide ~= nil then
        v111._subscriptionKeyboardDidHide:remove();
    end;
    if v111._scrollAnimatedValueAttachment then
        v111._scrollAnimatedValueAttachment:detach();
    end;
end;
v46._textInputFocusError = function() --[[ Line: 1774 ]] --[[ Name: _textInputFocusError ]]
    -- upvalues: l_console_0 (copy)
    l_console_0.warn("Error measuring text field.");
end;
v46._getKeyForIndex = function(v112, v113) --[[ Line: 1778 ]] --[[ Name: _getKeyForIndex ]]
    local v114 = v113[v112];
    if v114 then
        return v114.key;
    else
        return v114;
    end;
end;
v46._updateAnimatedNodeAttachment = function(v115) --[[ Line: 1783 ]] --[[ Name: _updateAnimatedNodeAttachment ]]
    -- upvalues: v13 (copy)
    if v115._scrollAnimatedValueAttachment then
        v115._scrollAnimatedValueAttachment:detach();
    end;
    if v115.props.stickyHeaderIndices and #v115.props.stickyHeaderIndices > 0 then
        v115._scrollAnimatedValueAttachment = v13:attachNativeEvent(v115._scrollViewRef, "onScroll", {
            {
                nativeEvent = {
                    contentOffset = {
                        y = v115._scrollAnimatedValue
                    }
                }
            }
        });
    end;
end;
v46._setStickyHeaderRef = function(v116, v117, v118) --[[ Line: 1796 ]] --[[ Name: _setStickyHeaderRef ]]
    -- upvalues: l_Boolean_0 (copy)
    if l_Boolean_0.toJSBoolean(v118) then
        v116._stickyHeaderRefs:set(v117, v118);
        return;
    else
        v116._stickyHeaderRefs:delete(v117);
        return;
    end;
end;
v46._onStickyHeaderLayout = function(v119, v120, v121, v122) --[[ Line: 1804 ]] --[[ Name: _onStickyHeaderLayout ]]
    -- upvalues: v17 (copy), l_Array_0 (copy), l_Boolean_0 (copy)
    local l_stickyHeaderIndices_0 = v119.props.stickyHeaderIndices;
    if not l_stickyHeaderIndices_0 then
        return;
    else
        local v124 = v17.Children.toArray(v119.props.children);
        if v122 ~= v119._getKeyForIndex(v120, v124) then
            return;
        else
            local l_y_0 = v121.nativeEvent.layout.y;
            v119._headerLayoutYs:set(v122, l_y_0);
            local v126 = l_stickyHeaderIndices_0[l_Array_0.indexOf(l_stickyHeaderIndices_0, v120) - 1];
            if v126 ~= nil then
                local v127 = v119._stickyHeaderRefs:get(v119._getKeyForIndex(v126, v124));
                if l_Boolean_0.toJSBoolean(v127) and v127.setNextHeaderY then
                    v127:setNextHeaderY(l_y_0);
                end;
            end;
            return;
        end;
    end;
end;
v46.render = function(v128) --[[ Line: 1827 ]] --[[ Name: render ]]
    -- upvalues: v43 (ref), v44 (ref), l_Array_0 (copy), v29 (copy), l_HttpService_0 (copy), v17 (copy), l_Boolean_0 (copy), v19 (copy), l_default_0 (copy), l_HORIZONTAL_0 (copy), l_VERTICAL_0 (copy), l_Object_0 (copy), v15 (ref), v42 (ref), v20 (copy), v30 (copy)
    local v129, v130 = table.unpack(if v128.props.horizontal == true then v43 else v44, 1, 2);
    local l_contentContainerStyle_0 = v128.props.contentContainerStyle;
    if _G.__DEV__ and v128.props.style ~= nil then
        local l_style_0 = v128.props.style;
        local l_l_style_0_0 = l_style_0 --[[ copy: 4 -> 20 ]];
        local v136 = l_Array_0.filter({
            "alignItems", 
            "justifyContent"
        }, function(v134) --[[ Line: 1839 ]]
            -- upvalues: l_l_style_0_0 (copy)
            local v135 = false;
            if type(l_l_style_0_0) == "table" then
                v135 = l_l_style_0_0[v134] ~= nil;
            end;
            return v135;
        end);
        v29(#v136 == 0, "ScrollView child layout (" .. l_HttpService_0:JSONEncode(v136) .. ") must be applied through the contentContainerStyle prop.");
    end;
    local v137 = if v128.props.onContentSizeChange == nil then nil else {
        onLayout = v128._handleContentOnLayout
    };
    local l_stickyHeaderIndices_1 = v128.props.stickyHeaderIndices;
    local l_children_0 = v128.props.children;
    if l_stickyHeaderIndices_1 ~= nil and #l_stickyHeaderIndices_1 > 0 then
        local v140 = v17.Children.toArray(v128.props.children);
        local l_v140_0 = v140 --[[ copy: 7 -> 19 ]];
        l_children_0 = l_Array_0.map(v140, function(v142, v143) --[[ Line: 1863 ]]
            -- upvalues: l_Boolean_0 (ref), l_Array_0 (ref), l_stickyHeaderIndices_1 (copy), v128 (copy), v19 (ref), v17 (ref), l_v140_0 (copy)
            local v144 = if l_Boolean_0.toJSBoolean(v142) then l_Array_0.indexOf(l_stickyHeaderIndices_1, v143) else -1;
            if v144 > -1 then
                local l_key_0 = v142.key;
                local v146 = l_stickyHeaderIndices_1[v144 + 1];
                local v147 = if v128.props.StickyHeaderComponent then v128.props.StickyHeaderComponent else v19;
                return (v17.createElement(v147, {
                    Name = "StickyHeaderComponent", 
                    key = l_key_0, 
                    nativeID = "StickyHeader-" .. tostring(l_key_0), 
                    ref = function(v148) --[[ Line: 1875 ]] --[[ Name: ref ]]
                        -- upvalues: v128 (ref), l_key_0 (copy)
                        return v128:_setStickyHeaderRef(l_key_0, v148);
                    end, 
                    nextHeaderLayoutY = v128._headerLayoutYs:get(v128._getKeyForIndex(v146, l_v140_0)), 
                    onLayout = function(v149) --[[ Line: 1879 ]] --[[ Name: onLayout ]]
                        -- upvalues: v128 (ref), v143 (copy), l_key_0 (copy)
                        return v128:_onStickyHeaderLayout(v143, v149, l_key_0);
                    end, 
                    scrollAnimatedValue = v128._scrollAnimatedValue, 
                    inverted = v128.props.invertStickyHeaders, 
                    hiddenOnScroll = v128.props.stickyHeaderHiddenOnScroll, 
                    scrollViewHeight = v128.state.layoutHeight
                }, v142));
            else
                return v142;
            end;
        end);
    end;
    l_children_0 = v17.createElement(l_default_0.Provider, {
        value = if v128.props.horizontal == true then l_HORIZONTAL_0 else l_VERTICAL_0
    }, v17.createElement("UIListLayout", {
        ref = v128._listLayoutRef, 
        key = "layout", 
        Name = v128.props.horizontal and "HorizontalLayout" or "VerticalLayout", 
        FillDirection = if v128.props.horizontal then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical, 
        VerticalAlignment = if v128.props.horizontal then Enum.VerticalAlignment.Center else if v128.props.layoutStyle then v128.props.layoutStyle.VerticalAlignment else Enum.VerticalAlignment.Top, 
        HorizontalAlignment = if v128.props.horizontal then if v128.props.layoutStyle then v128.props.layoutStyle.HorizontalAlignment else Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder
    }), l_children_0);
    local v150 = l_Array_0.isArray(l_stickyHeaderIndices_1) and #l_stickyHeaderIndices_1 > 0;
    local v151 = v17.createElement(v130, l_Object_0.assign({}, v137, {
        ref = v128._setInnerViewRef
    }, {
        style = l_contentContainerStyle_0, 
        Size = if v128.props.horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0), 
        AutomaticSize = if v128.props.horizontal then Enum.AutomaticSize.X else Enum.AutomaticSize.Y, 
        removeClippedSubviews = (not (v15.OS == "android") or not v150) and v128.props.removeClippedSubviews, 
        collapsable = false
    }), l_children_0);
    local v152 = if v128.props.alwaysBounceHorizontal ~= nil then v128.props.alwaysBounceHorizontal else v128.props.horizontal;
    local v153 = if v128.props.alwaysBounceVertical ~= nil then v128.props.alwaysBounceVertical else not v128.props.horizontal;
    local v154 = if v128.props.horizontal == true then v42.baseHorizontal else v42.baseVertical;
    local l_assign_0 = l_Object_0.assign;
    local v156 = table.clone(v128.props);
    local v157 = {
        alwaysBounceHorizontal = v152, 
        alwaysBounceVertical = v153, 
        style = v20.compose(v154, v128.props.style), 
        onContentSizeChange = l_Object_0.None, 
        onLayout = v128._handleLayout, 
        onMomentumScrollBegin = v128._handleMomentumScrollBegin, 
        onMomentumScrollEnd = v128._handleMomentumScrollEnd, 
        onResponderGrant = v128._handleResponderGrant, 
        onResponderReject = v128._handleResponderReject, 
        onResponderRelease = v128._handleResponderRelease, 
        onResponderTerminationRequest = v128._handleResponderTerminationRequest, 
        onScrollBeginDrag = v128._handleScrollBeginDrag, 
        onScrollEndDrag = v128._handleScrollEndDrag, 
        onScrollShouldSetResponder = v128._handleScrollShouldSetResponder, 
        onStartShouldSetResponder = v128._handleStartShouldSetResponder, 
        onStartShouldSetResponderCapture = v128._handleStartShouldSetResponderCapture, 
        onTouchEnd = v128._handleTouchEnd, 
        onTouchMove = v128._handleTouchMove, 
        onTouchStart = v128._handleTouchStart, 
        onTouchCancel = v128._handleTouchCancel, 
        onScroll = v128._handleScroll, 
        scrollEventThrottle = v150 and 1 or v128.props.scrollEventThrottle, 
        sendMomentumEvents = not not v128.props.onMomentumScrollBegin or v128.props.onMomentumScrollEnd and true or false, 
        snapToStart = v128.props.snapToStart ~= false, 
        snapToEnd = v128.props.snapToEnd ~= false
    };
    local l_select_0 = v15.select;
    local v159 = {};
    local v160 = false;
    if v128.props.pagingEnabled == true then
        v160 = false;
        if v128.props.snapToInterval == nil then
            v160 = v128.props.snapToOffsets == nil;
        end;
    end;
    v159.ios = v160;
    v160 = true;
    if v128.props.pagingEnabled ~= true then
        v160 = true;
        if v128.props.snapToInterval == nil then
            v160 = v128.props.snapToOffsets ~= nil;
        end;
    end;
    v159.android = v160;
    v157.pagingEnabled = l_select_0(v159);
    v157.AutomaticCanvasSize = if v128.props.overrideAutomaticCanvasSize then Enum.AutomaticSize.None else nil;
    l_assign_0 = l_assign_0(v156, v157);
    v156 = v128.props.decelerationRate;
    if v156 ~= nil then
        l_assign_0.decelerationRate = v30(v156);
    end;
    v157 = v128.props.refreshControl;
    if l_Boolean_0.toJSBoolean(v157) then
        if v15.OS == "ios" or v15.OS == "roblox" then
            return v17.createElement(v129, l_Object_0.assign(table.clone(l_assign_0), {
                ref = v128._setNativeRef
            }), v157, v151);
        elseif v15.OS == "android" then
            l_select_0 = nil;
            v159 = nil;
            local l_style_1 = l_assign_0.style;
            v160 = {
                outer = l_style_1, 
                inner = l_style_1
            };
            l_select_0 = v160.outer;
            v159 = v160.inner;
            return v17.cloneElement(v157, l_Object_0.assign({
                style = v20.compose(v154, l_select_0)
            }), v17.createElement(v129, l_Object_0.assign({}, l_assign_0, {
                style = v20.compose(v154, v159), 
                ref = v128._setNativeRef
            }), v151));
        end;
    end;
    l_assign_0.ref = v128._setNativeRef;
    return v17.createElement(v129, l_assign_0, v151);
end;
v42 = v20.create({
    baseVertical = {
        ScrollingDirection = Enum.ScrollingDirection.Y
    }, 
    baseHorizontal = {
        ScrollingDirection = Enum.ScrollingDirection.X
    }
});
local v164 = v17.forwardRef(function(v162, v163) --[[ Line: 2058 ]] --[[ Name: Wrapper ]]
    -- upvalues: v17 (copy), v46 (copy), l_Object_0 (copy)
    return v17.createElement(v46, l_Object_0.assign(table.clone(v162), {
        scrollViewRef = v163
    }));
end);
v164.Context = l_default_0;
v164.displayName = "ScrollView";
return v164;