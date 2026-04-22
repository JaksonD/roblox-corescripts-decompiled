local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.RoactRodux);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.t);
local l_FFlagUseNavigationSelectors_0 = require(l_Parent_0.SharedFlags).FFlagUseNavigationSelectors;
local l_Selectors_0 = require(l_Parent_0.NavigationRodux).Selectors;
local v7 = v1.PureComponent:extend("AvatarExperienceImpressionsDetector");
local function _(v8) --[[ Line: 14 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    if l_FFlagUseNavigationSelectors_0 then
        return l_Selectors_0.selectCurrentPageName(v8);
    else
        local l_history_0 = v8.Navigation.history;
        local v10 = l_history_0[#l_history_0];
        return v10[#v10].name;
    end;
end;
v7.validateProps = v4.strictInterface({
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
v7.defaultProps = {
    scanDebounceSeconds = 1, 
    viewFillPercent = 0.25
};
v7.init = function(v12) --[[ Line: 52 ]] --[[ Name: init ]]
    v12.isMounted = false;
    v12.lastImpressionTick = nil;
    v12.nextImpressionTick = nil;
end;
v7._isInstanceVisible = function(v13, v14) --[[ Line: 58 ]] --[[ Name: _isInstanceVisible ]]
    -- upvalues: v3 (copy)
    if not v14 then
        return false;
    else
        local l_viewPortBounds_0 = v13.props.viewPortBounds;
        v3.assert(l_viewPortBounds_0 ~= nil);
        if not l_viewPortBounds_0 then
            return false;
        else
            local v16 = nil;
            local v17 = l_viewPortBounds_0.max - l_viewPortBounds_0.min;
            v3.assert(v17.X > 0);
            v3.assert(v17.Y > 0);
            v16 = v17 * v13.props.viewFillPercent;
            v17 = v3.assert;
            local v18 = false;
            if v16.X > 0 then
                v18 = v16.Y > 0;
            end;
            v17(v18);
            if v16.X <= 0 or v16.Y <= 0 then
                return false;
            else
                v17 = v14.AbsolutePosition;
                v18 = v17 + v14.AbsoluteSize / 2;
                local v19 = v17 + v14.AbsoluteSize;
                local v20 = false;
                if v18.X > l_viewPortBounds_0.min.X then
                    v20 = v18.X < l_viewPortBounds_0.max.X;
                end;
                local v21 = false;
                if v18.Y > l_viewPortBounds_0.min.Y then
                    v21 = v18.Y < l_viewPortBounds_0.max.Y;
                end;
                if v20 and v21 then
                    return true;
                else
                    local v22 = v17:Max(l_viewPortBounds_0.min);
                    local v23 = v19:Min(l_viewPortBounds_0.max) - v22;
                    local v24 = v23.X >= v16.X;
                    if v21 and v24 then
                        return true;
                    else
                        local v25 = v23.Y >= v16.Y;
                        if v20 and v25 then
                            return true;
                        elseif v24 and v25 then
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
v7._defaultObjectCollector = function(v26) --[[ Line: 122 ]] --[[ Name: _defaultObjectCollector ]]
    return v26:GetChildren();
end;
v7._calculateImpressions = function(v27) --[[ Line: 126 ]] --[[ Name: _calculateImpressions ]]
    -- upvalues: v3 (copy)
    if not v27.isMounted then
        return;
    else
        if v27.props.pageFilter then
            if not v27.props.pageFilter(v27.props.currentPage) then
                return;
            end;
        elseif v27.props.appPage ~= v27.props.currentPage then
            return;
        end;
        local v28 = v27.props.parentRef and v27.props.parentRef.current;
        if not v28 or not v27:_isInstanceVisible(v28) then
            return;
        else
            v27.lastImpressionTick = tick();
            local v29 = {};
            local v30 = (v27.props.collectObjectsFunc or v27._defaultObjectCollector)(v28);
            if v30 then
                for _, v32 in v30 do
                    if v32:IsA("GuiObject") and v27:_isInstanceVisible(v32) and (v27.props.filterImpressionFunc == nil or v27.props.filterImpressionFunc(v32)) then
                        table.insert(v29, v32);
                    end;
                end;
            end;
            if #v29 > 0 then
                v3.assert(v27.props.onImpressionsDetected ~= nil);
                v27.props.onImpressionsDetected(v29);
            end;
            return;
        end;
    end;
end;
v7._requestImpressions = function(v33) --[[ Line: 166 ]] --[[ Name: _requestImpressions ]]
    -- upvalues: v3 (copy)
    if not v33.isMounted then
        return;
    elseif v33.nextImpressionTick ~= nil then
        return;
    elseif not v33.props.parentRef or not v33.props.parentRef.current then
        return;
    else
        local v34 = 0;
        if v33.lastImpressionTick ~= nil then
            v33.nextImpressionTick = v33.lastImpressionTick + v33.props.scanDebounceSeconds;
            v34 = v33.nextImpressionTick - tick();
        end;
        if v34 > 0 then
            task.delay(v34, function() --[[ Line: 185 ]]
                -- upvalues: v3 (ref), v33 (copy)
                local l_assert_0 = v3.assert;
                local v36 = false;
                if v33.nextImpressionTick ~= nil then
                    v36 = tick() > v33.nextImpressionTick;
                end;
                l_assert_0(v36);
                v33.nextImpressionTick = nil;
                v33:_calculateImpressions();
            end);
            return;
        else
            v33.nextImpressionTick = nil;
            v33:_calculateImpressions();
            return;
        end;
    end;
end;
v7.render = function(_) --[[ Line: 197 ]] --[[ Name: render ]]
    return nil;
end;
v7.didMount = function(v38) --[[ Line: 201 ]] --[[ Name: didMount ]]
    v38.isMounted = true;
    v38:_requestImpressions();
    if v38.props.onRequestImpressionsSignal then
        v38.onRequestImpressionsConnection = v38.props.onRequestImpressionsSignal:connect(function() --[[ Line: 205 ]]
            -- upvalues: v38 (copy)
            v38:_requestImpressions();
        end);
    end;
end;
v7.willUnmount = function(v39) --[[ Line: 211 ]] --[[ Name: willUnmount ]]
    v39.isMounted = false;
    if v39.onRequestImpressionsConnection ~= nil then
        v39.onRequestImpressionsConnection:disconnect();
        v39.onRequestImpressionsConnection = nil;
    end;
end;
v7.didUpdate = function(v40, _, _) --[[ Line: 219 ]] --[[ Name: didUpdate ]]
    v40:_requestImpressions();
end;
return (v2.connect(function(v43, _) --[[ Line: 223 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    local v45 = {};
    local v46;
    if l_FFlagUseNavigationSelectors_0 then
        v46 = l_Selectors_0.selectCurrentPageName(v43);
    else
        local l_history_1 = v43.Navigation.history;
        local v48 = l_history_1[#l_history_1];
        v46 = v48[#v48].name;
    end;
    v45.currentPage = v46;
    return v45;
end)(v7));