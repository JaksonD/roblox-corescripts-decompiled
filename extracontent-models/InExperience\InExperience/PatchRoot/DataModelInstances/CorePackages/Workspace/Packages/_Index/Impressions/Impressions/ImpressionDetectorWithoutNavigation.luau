local l_CollectionService_0 = game:GetService("CollectionService");
local l_Parent_0 = script:FindFirstAncestor("Impressions").Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.t);
local v5 = require(script.Parent.Constants);
local v6 = v2.PureComponent:extend("ImpressionsDetectorWithoutNavigation");
v6.validateProps = v4.strictInterface({
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
    isFocused = v4.optional(v4.boolean), 
    navigation = v4.optional(v4.table)
});
v6.defaultProps = {
    scanDebounceSeconds = 1, 
    viewFillPercent = 0.25
};
v6.init = function(v7) --[[ Line: 41 ]] --[[ Name: init ]]
    v7.isMounted = false;
    v7.lastImpressionTick = nil;
    v7.nextImpressionTick = nil;
end;
v6._boundingBoxIntersectsView = function(v8, v9) --[[ Line: 47 ]] --[[ Name: _boundingBoxIntersectsView ]]
    -- upvalues: v3 (copy)
    if not v9 then
        return false;
    else
        local l_viewPortBounds_0 = v8.props.viewPortBounds;
        v3.assert(l_viewPortBounds_0 ~= nil);
        if not l_viewPortBounds_0 then
            return false;
        else
            local l_AbsoluteSize_0 = v9.AbsoluteSize;
            local l_AbsolutePosition_0 = v9.AbsolutePosition;
            local v13 = l_AbsolutePosition_0 + l_AbsoluteSize_0;
            local v14 = false;
            if v13.X > l_viewPortBounds_0.min.X then
                v14 = l_AbsolutePosition_0.X < l_viewPortBounds_0.max.X;
            end;
            local v15 = false;
            if v13.Y > l_viewPortBounds_0.min.Y then
                v15 = l_AbsolutePosition_0.Y < l_viewPortBounds_0.max.Y;
            end;
            if v14 and v15 then
                return true;
            else
                return false;
            end;
        end;
    end;
end;
v6._isInstanceVisible = function(v16, v17) --[[ Line: 72 ]] --[[ Name: _isInstanceVisible ]]
    -- upvalues: v3 (copy)
    if not v16:_boundingBoxIntersectsView(v17) then
        return false;
    else
        local l_viewPortBounds_1 = v16.props.viewPortBounds;
        v3.assert(l_viewPortBounds_1 ~= nil);
        local v19 = nil;
        local v20 = l_viewPortBounds_1.max - l_viewPortBounds_1.min;
        if v20.X <= 0 or v20.Y <= 0 then
            return false;
        else
            v19 = v20 * v16.props.viewFillPercent;
            v20 = v3.assert;
            local v21 = false;
            if v19.X > 0 then
                v21 = v19.Y > 0;
            end;
            v20(v21);
            if v19.X <= 0 or v19.Y <= 0 then
                return false;
            else
                v20 = v17.AbsolutePosition;
                v21 = v17.AbsoluteSize;
                if v16.props.skipZeroSizes and (v21.X == 0 or v21.Y == 0) then
                    return false;
                else
                    local v22 = v20 + v21 / 2;
                    local v23 = v20 + v21;
                    local v24 = false;
                    if v22.X > l_viewPortBounds_1.min.X then
                        v24 = v22.X < l_viewPortBounds_1.max.X;
                    end;
                    local v25 = false;
                    if v22.Y > l_viewPortBounds_1.min.Y then
                        v25 = v22.Y < l_viewPortBounds_1.max.Y;
                    end;
                    if v24 and v25 then
                        return true;
                    else
                        local v26 = v20:Max(l_viewPortBounds_1.min);
                        local v27 = v23:Min(l_viewPortBounds_1.max) - v26;
                        local v28 = v27.X >= v19.X;
                        if v25 and v28 then
                            return true;
                        else
                            local v29 = v27.Y >= v19.Y;
                            if v24 and v29 then
                                return true;
                            elseif v28 and v29 then
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
v6._calculateImpressions = function(v30) --[[ Line: 142 ]] --[[ Name: _calculateImpressions ]]
    -- upvalues: l_CollectionService_0 (copy), v5 (copy), v3 (copy)
    if not v30.isMounted then
        return;
    elseif v30.props.isFocused == false then
        return;
    else
        v30.lastImpressionTick = tick();
        if v30.props.parentRef ~= nil then
            local l_current_0 = v30.props.parentRef.current;
            if l_current_0 == nil or not v30:_boundingBoxIntersectsView(l_current_0) then
                return;
            end;
        end;
        local l_impressionsTag_0 = v30.props.impressionsTag;
        local v33 = {};
        local l_l_CollectionService_0_Tagged_0 = l_CollectionService_0:GetTagged(l_impressionsTag_0);
        for _, v36 in ipairs(l_l_CollectionService_0_Tagged_0) do
            local l_v36_Attribute_0 = v36:GetAttribute(v5.ItemIndex);
            if l_v36_Attribute_0 and v36:IsA("GuiObject") and v30:_isInstanceVisible(v36) and (v30.props.filterImpressionFunc == nil or v30.props.filterImpressionFunc(l_v36_Attribute_0)) then
                table.insert(v33, l_v36_Attribute_0);
            end;
        end;
        if #v33 > 0 then
            v3.assert(v30.props.onImpressionsDetected ~= nil);
            v30.props.onImpressionsDetected(v33);
        end;
        return;
    end;
end;
v6._requestImpressions = function(v38) --[[ Line: 180 ]] --[[ Name: _requestImpressions ]]
    -- upvalues: v3 (copy)
    if not v38.isMounted then
        return;
    elseif v38.props.isFocused == false then
        return;
    elseif v38.nextImpressionTick ~= nil then
        return;
    elseif not v38.props.impressionsTag then
        return;
    else
        local v39 = 0;
        if v38.lastImpressionTick ~= nil then
            v38.nextImpressionTick = v38.lastImpressionTick + v38.props.scanDebounceSeconds;
            v39 = v38.nextImpressionTick - tick();
        end;
        if v39 > 0 then
            task.delay(v39, function() --[[ Line: 202 ]]
                -- upvalues: v3 (ref), v38 (copy)
                local l_assert_0 = v3.assert;
                local v41 = false;
                if v38.nextImpressionTick ~= nil then
                    v41 = tick() > v38.nextImpressionTick;
                end;
                l_assert_0(v41);
                v38.nextImpressionTick = nil;
                v38:_calculateImpressions();
            end);
            return;
        else
            v38.nextImpressionTick = nil;
            v38:_calculateImpressions();
            return;
        end;
    end;
end;
v6.render = function(_) --[[ Line: 214 ]] --[[ Name: render ]]
    return nil;
end;
v6.didMount = function(v43) --[[ Line: 218 ]] --[[ Name: didMount ]]
    v43.isMounted = true;
    v43:_requestImpressions();
    if v43.props.onRequestImpressionsSignal then
        v43.onRequestImpressionsConnection = v43.props.onRequestImpressionsSignal:connect(function() --[[ Line: 222 ]]
            -- upvalues: v43 (copy)
            v43:_requestImpressions();
        end);
    end;
end;
v6.willUnmount = function(v44) --[[ Line: 228 ]] --[[ Name: willUnmount ]]
    v44.isMounted = false;
    if v44.onRequestImpressionsConnection ~= nil then
        v44.onRequestImpressionsConnection:disconnect();
        v44.onRequestImpressionsConnection = nil;
    end;
end;
v6.didUpdate = function(v45, _, _) --[[ Line: 236 ]] --[[ Name: didUpdate ]]
    v45:_requestImpressions();
end;
return v6;