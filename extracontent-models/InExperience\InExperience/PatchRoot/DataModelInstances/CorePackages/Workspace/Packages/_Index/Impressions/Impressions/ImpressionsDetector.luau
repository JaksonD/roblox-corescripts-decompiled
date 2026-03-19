local l_CollectionService_0 = game:GetService("CollectionService");
local l_Parent_0 = script:FindFirstAncestor("Impressions").Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.t);
local l_withNavigationFocus_0 = require(l_Parent_0.RoactNavigation).withNavigationFocus;
local v6 = require(script.Parent.Constants);
local v7 = require(script.Parent.ImpressionDetectorWithoutNavigation);
local v8 = v2.PureComponent:extend("ImpressionsDetector");
v8.validateProps = v4.strictInterface({
    scanDebounceSeconds = v4.optional(v4.number), 
    viewFillPercent = v4.optional(v4.number), 
    parentRef = v4.optional(v4.table), 
    impressionsTag = v4.string, 
    onRequestImpressionsSignal = v4.table, 
    viewPortBounds = v4.strictInterface({
        min = v4.Vector2, 
        max = v4.Vector2
    }), 
    filterImpressionFunc = v4.optional(v4.callback), 
    onImpressionsDetected = v4.union(v4.callback, v4.table), 
    skipZeroSizes = v4.optional(v4.boolean), 
    isFocused = v4.boolean, 
    navigation = v4.table
});
v8.defaultProps = {
    scanDebounceSeconds = 1, 
    viewFillPercent = 0.25
};
v8.init = function(v9) --[[ Line: 43 ]] --[[ Name: init ]]
    v9.isMounted = false;
    v9.lastImpressionTick = nil;
    v9.nextImpressionTick = nil;
end;
v8._boundingBoxIntersectsView = function(v10, v11) --[[ Line: 49 ]] --[[ Name: _boundingBoxIntersectsView ]]
    -- upvalues: v3 (copy)
    if not v11 then
        return false;
    else
        local l_viewPortBounds_0 = v10.props.viewPortBounds;
        v3.assert(l_viewPortBounds_0 ~= nil);
        if not l_viewPortBounds_0 then
            return false;
        else
            local l_AbsoluteSize_0 = v11.AbsoluteSize;
            local l_AbsolutePosition_0 = v11.AbsolutePosition;
            local v15 = l_AbsolutePosition_0 + l_AbsoluteSize_0;
            local v16 = false;
            if v15.X > l_viewPortBounds_0.min.X then
                v16 = l_AbsolutePosition_0.X < l_viewPortBounds_0.max.X;
            end;
            local v17 = false;
            if v15.Y > l_viewPortBounds_0.min.Y then
                v17 = l_AbsolutePosition_0.Y < l_viewPortBounds_0.max.Y;
            end;
            if v16 and v17 then
                return true;
            else
                return false;
            end;
        end;
    end;
end;
v8._isInstanceVisible = function(v18, v19) --[[ Line: 74 ]] --[[ Name: _isInstanceVisible ]]
    -- upvalues: v3 (copy)
    if not v18:_boundingBoxIntersectsView(v19) then
        return false;
    else
        local l_viewPortBounds_1 = v18.props.viewPortBounds;
        v3.assert(l_viewPortBounds_1 ~= nil);
        local v21 = nil;
        local v22 = l_viewPortBounds_1.max - l_viewPortBounds_1.min;
        if v22.X <= 0 or v22.Y <= 0 then
            return false;
        else
            v21 = v22 * v18.props.viewFillPercent;
            v22 = v3.assert;
            local v23 = false;
            if v21.X > 0 then
                v23 = v21.Y > 0;
            end;
            v22(v23);
            if v21.X <= 0 or v21.Y <= 0 then
                return false;
            else
                v22 = v19.AbsolutePosition;
                v23 = v19.AbsoluteSize;
                if v18.props.skipZeroSizes and (v23.X == 0 or v23.Y == 0) then
                    return false;
                else
                    local v24 = v22 + v23 / 2;
                    local v25 = v22 + v23;
                    local v26 = false;
                    if v24.X > l_viewPortBounds_1.min.X then
                        v26 = v24.X < l_viewPortBounds_1.max.X;
                    end;
                    local v27 = false;
                    if v24.Y > l_viewPortBounds_1.min.Y then
                        v27 = v24.Y < l_viewPortBounds_1.max.Y;
                    end;
                    if v26 and v27 then
                        return true;
                    else
                        local v28 = v22:Max(l_viewPortBounds_1.min);
                        local v29 = v25:Min(l_viewPortBounds_1.max) - v28;
                        local v30 = v29.X >= v21.X;
                        if v27 and v30 then
                            return true;
                        else
                            local v31 = v29.Y >= v21.Y;
                            if v26 and v31 then
                                return true;
                            elseif v30 and v31 then
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
end;
v8._calculateImpressions = function(v32) --[[ Line: 144 ]] --[[ Name: _calculateImpressions ]]
    -- upvalues: l_CollectionService_0 (copy), v6 (copy), v3 (copy)
    if not v32.isMounted then
        return;
    elseif not v32.props.isFocused then
        return;
    else
        v32.lastImpressionTick = tick();
        if v32.props.parentRef ~= nil then
            local l_current_0 = v32.props.parentRef.current;
            if l_current_0 == nil or not v32:_boundingBoxIntersectsView(l_current_0) then
                return;
            end;
        end;
        local l_impressionsTag_0 = v32.props.impressionsTag;
        local v35 = {};
        local l_l_CollectionService_0_Tagged_0 = l_CollectionService_0:GetTagged(l_impressionsTag_0);
        for _, v38 in ipairs(l_l_CollectionService_0_Tagged_0) do
            local l_v38_Attribute_0 = v38:GetAttribute(v6.ItemIndex);
            if l_v38_Attribute_0 and v38:IsA("GuiObject") and v32:_isInstanceVisible(v38) and (v32.props.filterImpressionFunc == nil or v32.props.filterImpressionFunc(l_v38_Attribute_0)) then
                table.insert(v35, l_v38_Attribute_0);
            end;
        end;
        if #v35 > 0 then
            v3.assert(v32.props.onImpressionsDetected ~= nil);
            v32.props.onImpressionsDetected(v35);
        end;
        return;
    end;
end;
v8._requestImpressions = function(v40) --[[ Line: 183 ]] --[[ Name: _requestImpressions ]]
    -- upvalues: v3 (copy)
    if not v40.isMounted then
        return;
    elseif not v40.props.isFocused then
        return;
    elseif v40.nextImpressionTick ~= nil then
        return;
    elseif not v40.props.impressionsTag then
        return;
    else
        local v41 = 0;
        if v40.lastImpressionTick ~= nil then
            v40.nextImpressionTick = v40.lastImpressionTick + v40.props.scanDebounceSeconds;
            v41 = v40.nextImpressionTick - tick();
        end;
        if v41 > 0 then
            task.delay(v41, function() --[[ Line: 206 ]]
                -- upvalues: v3 (ref), v40 (copy)
                local l_assert_0 = v3.assert;
                local v43 = false;
                if v40.nextImpressionTick ~= nil then
                    v43 = tick() > v40.nextImpressionTick;
                end;
                l_assert_0(v43);
                v40.nextImpressionTick = nil;
                v40:_calculateImpressions();
            end);
            return;
        else
            v40.nextImpressionTick = nil;
            v40:_calculateImpressions();
            return;
        end;
    end;
end;
v8.render = function(_) --[[ Line: 218 ]] --[[ Name: render ]]
    return nil;
end;
v8.didMount = function(v45) --[[ Line: 222 ]] --[[ Name: didMount ]]
    v45.isMounted = true;
    v45:_requestImpressions();
    if v45.props.onRequestImpressionsSignal then
        v45.onRequestImpressionsConnection = v45.props.onRequestImpressionsSignal:connect(function() --[[ Line: 226 ]]
            -- upvalues: v45 (copy)
            v45:_requestImpressions();
        end);
    end;
end;
v8.willUnmount = function(v46) --[[ Line: 232 ]] --[[ Name: willUnmount ]]
    v46.isMounted = false;
    if v46.onRequestImpressionsConnection ~= nil then
        v46.onRequestImpressionsConnection:disconnect();
        v46.onRequestImpressionsConnection = nil;
    end;
end;
v8.didUpdate = function(v47, _, _) --[[ Line: 240 ]] --[[ Name: didUpdate ]]
    v47:_requestImpressions();
end;
return (l_withNavigationFocus_0(v7));