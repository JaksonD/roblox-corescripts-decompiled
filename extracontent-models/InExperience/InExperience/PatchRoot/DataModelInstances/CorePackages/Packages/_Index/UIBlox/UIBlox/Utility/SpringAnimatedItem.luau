local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Otter);
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.t);
local v6 = v4.intersection(v4.strictInterface({
    animatedValues = v4.table, 
    mapValuesToProps = v4.callback, 
    springOptions = v4.optional(v4.table), 
    onComplete = v4.optional(v4.callback), 
    regularProps = v4.table, 
    [v2.Children] = v4.optional(v4.table)
}), function(v5) --[[ Line: 53 ]]
    -- upvalues: v2 (copy)
    if v5[v2.Children] ~= nil and v5.regularProps[v2.Children] ~= nil then
        return false, "Children must be specified in one place, but the [Roact.Children] key was found in both props and props.regularProps on SpringAnimatedItem.";
    else
        return true;
    end;
end);
local v31 = {
    wrap = function(v7) --[[ Line: 66 ]] --[[ Name: wrap ]]
        -- upvalues: v2 (copy), v1 (copy), v6 (copy), v3 (copy)
        local v8 = v2.PureComponent:extend(string.format("SpringAnimatedItem(%s)", (tostring(v7))));
        v8.defaultProps = {
            regularProps = {}
        };
        v8.init = function(v9) --[[ Line: 73 ]] --[[ Name: init ]]
            -- upvalues: v2 (ref)
            v9.ref = v9.props.regularProps[v2.Ref] or v2.createRef();
            v9.applyAnimatedValues = function(v10) --[[ Line: 76 ]]
                -- upvalues: v9 (copy)
                local l_current_0 = v9.ref.current;
                if l_current_0 == nil then
                    return;
                else
                    local v12 = v9.props.mapValuesToProps(v10);
                    for v13, v14 in pairs(v12) do
                        l_current_0[v13] = v14;
                    end;
                    return;
                end;
            end;
            v9.onComplete = function() --[[ Line: 90 ]]
                -- upvalues: v9 (copy)
                if v9.props.onComplete then
                    v9.props.onComplete();
                end;
            end;
            v9.motor = nil;
        end;
        v8.didMount = function(v15) --[[ Line: 99 ]] --[[ Name: didMount ]]
            -- upvalues: v1 (ref)
            local l_animatedValues_0 = v15.props.animatedValues;
            v15.applyAnimatedValues(l_animatedValues_0);
            v15.motor = v1.createGroupMotor(l_animatedValues_0);
            v15.motor:onStep(function(v17) --[[ Line: 107 ]]
                -- upvalues: v15 (copy)
                v15.applyAnimatedValues(v17);
            end);
            v15.motor:onComplete(v15.onComplete);
            v15.motor:start();
        end;
        v8.willUpdate = function(v18, v19) --[[ Line: 114 ]] --[[ Name: willUpdate ]]
            -- upvalues: v2 (ref)
            if v18.props.regularProps[v2.Ref] ~= v19.regularProps[v2.Ref] and v19.regularProps[v2.Ref] ~= nil then
                v18.ref = v19.regularProps[v2.Ref];
            end;
        end;
        v8.render = function(v20) --[[ Line: 123 ]] --[[ Name: render ]]
            -- upvalues: v6 (ref), v3 (ref), v2 (ref), v7 (copy)
            assert(v6(v20.props));
            local l_regularProps_0 = v20.props.regularProps;
            local v22 = v3.Dictionary.join(l_regularProps_0, {
                [v2.Ref] = v20.ref, 
                [v2.Children] = v20.props[v2.Children]
            });
            return v2.createElement(v7, v22);
        end;
        v8.didUpdate = function(v23, v24) --[[ Line: 135 ]] --[[ Name: didUpdate ]]
            -- upvalues: v1 (ref)
            if v23.props.animatedValues ~= v24.animatedValues then
                local v25 = {};
                local v26 = false;
                for v27, v28 in pairs(v23.props.animatedValues) do
                    local l_springOptions_0 = v23.props.springOptions;
                    v25[v27] = v1.spring(v28, l_springOptions_0);
                    if v28 ~= v24.animatedValues[v27] then
                        v26 = true;
                    end;
                end;
                if v26 then
                    v23.motor:setGoal(v25);
                end;
            end;
        end;
        v8.willUnmount = function(v30) --[[ Line: 153 ]] --[[ Name: willUnmount ]]
            if v30.motor then
                v30.motor:destroy();
                v30.motor = nil;
            end;
        end;
        return v8;
    end
};
v31.AnimatedFrame = v31.wrap("Frame");
v31.AnimatedScrollingFrame = v31.wrap("ScrollingFrame");
v31.AnimatedImageLabel = v31.wrap("ImageLabel");
v31.AnimatedTextButton = v31.wrap("TextButton");
v31.AnimatedUIScale = v31.wrap("UIScale");
return v31;