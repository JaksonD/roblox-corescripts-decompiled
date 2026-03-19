local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.RoactRodux);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.t);
local v5 = v1.PureComponent:extend("AvatarExperienceImpressionsDetector");
local function _(v6) --[[ Line: 12 ]]
    local l_history_0 = v6.Navigation.history;
    local v8 = l_history_0[#l_history_0];
    return v8[#v8].name;
end;
v5.validateProps = v4.strictInterface({
    scanDebounceSeconds = v4.optional(v4.number), 
    viewFillPercent = v4.optional(v4.number), 
    parentRef = v4.optional(v4.table), 
    onRequestImpressionsSignal = v4.table, 
    viewPortBounds = v4.strictInterface({
        min = v4.Vector2, 
        max = v4.Vector2
    }), 
    appPage = v4.optional(v4.string), 
    currentPage = v4.optional(v4.string), 
    pageFilter = v4.optional(v4.callback), 
    collectObjectsFunc = v4.optional(v4.callback), 
    filterImpressionFunc = v4.optional(v4.callback), 
    onImpressionsDetected = v4.union(v4.callback, v4.table)
});
v5.defaultProps = {
    scanDebounceSeconds = 1, 
    viewFillPercent = 0.25
};
v5.init = function(v10) --[[ Line: 47 ]] --[[ Name: init ]]
    v10.isMounted = false;
    v10.lastImpressionTick = nil;
    v10.nextImpressionTick = nil;
end;
v5._isInstanceVisible = function(v11, v12) --[[ Line: 53 ]] --[[ Name: _isInstanceVisible ]]
    -- upvalues: v3 (copy)
    if not v12 then
        return false;
    else
        local l_viewPortBounds_0 = v11.props.viewPortBounds;
        v3.assert(l_viewPortBounds_0 ~= nil);
        if not l_viewPortBounds_0 then
            return false;
        else
            local v14 = nil;
            local v15 = l_viewPortBounds_0.max - l_viewPortBounds_0.min;
            v3.assert(v15.X > 0);
            v3.assert(v15.Y > 0);
            v14 = v15 * v11.props.viewFillPercent;
            v15 = v3.assert;
            local v16 = false;
            if v14.X > 0 then
                v16 = v14.Y > 0;
            end;
            v15(v16);
            if v14.X <= 0 or v14.Y <= 0 then
                return false;
            else
                v15 = v12.AbsolutePosition;
                v16 = v15 + v12.AbsoluteSize / 2;
                local v17 = v15 + v12.AbsoluteSize;
                local v18 = false;
                if v16.X > l_viewPortBounds_0.min.X then
                    v18 = v16.X < l_viewPortBounds_0.max.X;
                end;
                local v19 = false;
                if v16.Y > l_viewPortBounds_0.min.Y then
                    v19 = v16.Y < l_viewPortBounds_0.max.Y;
                end;
                if v18 and v19 then
                    return true;
                else
                    local v20 = v15:Max(l_viewPortBounds_0.min);
                    local v21 = v17:Min(l_viewPortBounds_0.max) - v20;
                    local v22 = v21.X >= v14.X;
                    if v19 and v22 then
                        return true;
                    else
                        local v23 = v21.Y >= v14.Y;
                        if v18 and v23 then
                            return true;
                        elseif v22 and v23 then
                            return true;
                        else
                            return false;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v5._defaultObjectCollector = function(v24) --[[ Line: 117 ]] --[[ Name: _defaultObjectCollector ]]
    return v24:GetChildren();
end;
v5._calculateImpressions = function(v25) --[[ Line: 121 ]] --[[ Name: _calculateImpressions ]]
    -- upvalues: v3 (copy)
    if not v25.isMounted then
        return;
    else
        if v25.props.pageFilter then
            if not v25.props.pageFilter(v25.props.currentPage) then
                return;
            end;
        elseif v25.props.appPage ~= v25.props.currentPage then
            return;
        end;
        local v26 = v25.props.parentRef and v25.props.parentRef.current;
        if not v26 or not v25:_isInstanceVisible(v26) then
            return;
        else
            v25.lastImpressionTick = tick();
            local v27 = {};
            local v28 = (v25.props.collectObjectsFunc or v25._defaultObjectCollector)(v26);
            if v28 then
                for _, v30 in v28 do
                    if v30:IsA("GuiObject") and v25:_isInstanceVisible(v30) and (v25.props.filterImpressionFunc == nil or v25.props.filterImpressionFunc(v30)) then
                        table.insert(v27, v30);
                    end;
                end;
            end;
            if #v27 > 0 then
                v3.assert(v25.props.onImpressionsDetected ~= nil);
                v25.props.onImpressionsDetected(v27);
            end;
            return;
        end;
    end;
end;
v5._requestImpressions = function(v31) --[[ Line: 161 ]] --[[ Name: _requestImpressions ]]
    -- upvalues: v3 (copy)
    if not v31.isMounted then
        return;
    elseif v31.nextImpressionTick ~= nil then
        return;
    elseif not v31.props.parentRef or not v31.props.parentRef.current then
        return;
    else
        local v32 = 0;
        if v31.lastImpressionTick ~= nil then
            v31.nextImpressionTick = v31.lastImpressionTick + v31.props.scanDebounceSeconds;
            v32 = v31.nextImpressionTick - tick();
        end;
        if v32 > 0 then
            task.delay(v32, function() --[[ Line: 180 ]]
                -- upvalues: v3 (ref), v31 (copy)
                local l_assert_0 = v3.assert;
                local v34 = false;
                if v31.nextImpressionTick ~= nil then
                    v34 = tick() > v31.nextImpressionTick;
                end;
                l_assert_0(v34);
                v31.nextImpressionTick = nil;
                v31:_calculateImpressions();
            end);
            return;
        else
            v31.nextImpressionTick = nil;
            v31:_calculateImpressions();
            return;
        end;
    end;
end;
v5.render = function(_) --[[ Line: 192 ]] --[[ Name: render ]]
    return nil;
end;
v5.didMount = function(v36) --[[ Line: 196 ]] --[[ Name: didMount ]]
    v36.isMounted = true;
    v36:_requestImpressions();
    if v36.props.onRequestImpressionsSignal then
        v36.onRequestImpressionsConnection = v36.props.onRequestImpressionsSignal:connect(function() --[[ Line: 200 ]]
            -- upvalues: v36 (copy)
            v36:_requestImpressions();
        end);
    end;
end;
v5.willUnmount = function(v37) --[[ Line: 206 ]] --[[ Name: willUnmount ]]
    v37.isMounted = false;
    if v37.onRequestImpressionsConnection ~= nil then
        v37.onRequestImpressionsConnection:disconnect();
        v37.onRequestImpressionsConnection = nil;
    end;
end;
v5.didUpdate = function(v38, _, _) --[[ Line: 214 ]] --[[ Name: didUpdate ]]
    v38:_requestImpressions();
end;
return (v2.connect(function(v41, _) --[[ Line: 218 ]]
    local v43 = {};
    local l_history_1 = v41.Navigation.history;
    local v45 = l_history_1[#l_history_1];
    v43.currentPage = v45[#v45].name;
    return v43;
end)(v5));