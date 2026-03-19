local v0 = require(script.Parent.Parent.Roact);
local v1 = require(script.Parent.shallowEqual);
local v2 = require(script.Parent.join);
local v3 = require(script.Parent.StoreContext);
local function _(v4, v5) --[[ Line: 9 ]] --[[ Name: formatMessage ]]
    return table.concat(v4, "\n"):format(unpack(v5 or {}));
end;
local function v7() --[[ Line: 13 ]] --[[ Name: noop ]]
    return nil;
end;
local function _(v8) --[[ Line: 26 ]] --[[ Name: makeStateUpdater ]]
    -- upvalues: v2 (copy)
    return function(v9, v10, v11) --[[ Line: 27 ]]
        -- upvalues: v8 (copy), v2 (ref)
        if v11 == nil then
            v11 = v10.mapStateToProps(v8:getState(), v9);
        end;
        local v12 = v2(v9, v11, v10.mappedStoreDispatch);
        return {
            mappedStoreState = v11, 
            propsForChild = v12
        };
    end;
end;
return function(v14, v15) --[[ Line: 50 ]] --[[ Name: connect ]]
    -- upvalues: v7 (copy), v0 (copy), v2 (copy), v1 (copy), v3 (copy)
    local v16 = debug.traceback();
    if v14 ~= nil then
        assert(typeof(v14) == "function", "mapStateToProps must be a function or nil!");
    else
        v14 = v7;
    end;
    local v17 = typeof(v15);
    if v15 ~= nil then
        local v18 = true;
        if v17 ~= "function" then
            v18 = v17 == "table";
        end;
        assert(v18, "mapDispatchToProps must be a function, table, or nil!");
    else
        v15 = v7;
    end;
    return function(v19) --[[ Line: 69 ]]
        -- upvalues: v16 (copy), v0 (ref), v14 (ref), v17 (copy), v15 (ref), v2 (ref), v1 (ref), v3 (ref)
        if v19 == nil then
            local v20 = {
                "connect returns a function that must be passed a component.", 
                "Check the connection at:", 
                "%s"
            };
            local v21 = {
                v16
            };
            local v22 = table.concat(v20, "\n"):format(unpack(v21 or {}));
            error(v22, 2);
        end;
        local v23 = ("RoduxConnection(%s)"):format((tostring(v19)));
        local v24 = v0.Component:extend(v23);
        v24.getDerivedStateFromProps = function(v25, v26) --[[ Line: 86 ]] --[[ Name: getDerivedStateFromProps ]]
            if v26.stateUpdater ~= nil then
                return v26.stateUpdater(v25.innerProps, v26);
            else
                return;
            end;
        end;
        v24.init = function(v27, v28) --[[ Line: 92 ]] --[[ Name: init ]]
            -- upvalues: v19 (copy), v14 (ref), v17 (ref), v15 (ref), v2 (ref)
            v27.store = v28.store;
            if v27.store == nil then
                local v29 = {
                    "Cannot initialize Roact-Rodux connection without being a descendent of StoreProvider!", 
                    "Tried to wrap component %q", 
                    "Make sure there is a StoreProvider above this component in the tree."
                };
                local v30 = {
                    (tostring(v19))
                };
                local v31 = table.concat(v29, "\n"):format(unpack(v30 or {}));
                error(v31);
            end;
            local v32 = v27.store:getState();
            local l_v14_0 = v14;
            local v34 = l_v14_0(v32, v27.props.innerProps);
            if typeof(v34) == "function" then
                l_v14_0 = v34;
                v34 = l_v14_0(v32, v27.props.innerProps);
            end;
            if v34 ~= nil and typeof(v34) ~= "table" then
                local v35 = {
                    "mapStateToProps must either return a table, or return another function that returns a table.", 
                    "Instead, it returned %q, which is of type %s."
                };
                local v36 = {
                    tostring(v34), 
                    (typeof(v34))
                };
                local v37 = table.concat(v35, "\n"):format(unpack(v36 or {}));
                error(v37);
            end;
            local function v38(...) --[[ Line: 133 ]] --[[ Name: dispatch ]]
                -- upvalues: v27 (copy)
                return v27.store:dispatch(...);
            end;
            local v39 = nil;
            if v17 == "table" then
                v39 = {};
                for v40, v41 in pairs(v15) do
                    assert(typeof(v41) == "function", "mapDispatchToProps must contain function values");
                    v39[v40] = function(...) --[[ Line: 144 ]]
                        -- upvalues: v38 (copy), v41 (copy)
                        v38(v41(...));
                    end;
                end;
            elseif v17 == "function" then
                v39 = v15(v38);
            end;
            local l_store_0 = v27.store;
            local l_l_store_0_0 = l_store_0 --[[ copy: 8 -> 14 ]];
            local function v48(v44, v45, v46) --[[ Line: 27 ]]
                -- upvalues: l_l_store_0_0 (copy), v2 (ref)
                if v46 == nil then
                    v46 = v45.mapStateToProps(l_l_store_0_0:getState(), v44);
                end;
                local v47 = v2(v44, v46, v45.mappedStoreDispatch);
                return {
                    mappedStoreState = v46, 
                    propsForChild = v47
                };
            end;
            v27.state = {
                stateUpdater = v48, 
                mapStateToProps = l_v14_0, 
                mappedStoreDispatch = v39, 
                propsForChild = nil
            };
            l_store_0 = v48(v27.props.innerProps, v27.state, v34);
            for v49, v50 in pairs(l_store_0) do
                v27.state[v49] = v50;
            end;
        end;
        v24.didMount = function(v51) --[[ Line: 179 ]] --[[ Name: didMount ]]
            -- upvalues: v1 (ref)
            local function v56(v52) --[[ Line: 180 ]]
                -- upvalues: v51 (copy), v1 (ref)
                v51:setState(function(v53, v54) --[[ Line: 181 ]]
                    -- upvalues: v52 (copy), v1 (ref)
                    local v55 = v53.mapStateToProps(v52, v54.innerProps);
                    if v1(v55, v53.mappedStoreState) then
                        return nil;
                    else
                        return v53.stateUpdater(v54.innerProps, v53, v55);
                    end;
                end);
            end;
            local v57 = v51.store:getState();
            v51:setState(function(v58, v59) --[[ Line: 181 ]]
                -- upvalues: v57 (copy), v1 (ref)
                local v60 = v58.mapStateToProps(v57, v59.innerProps);
                if v1(v60, v58.mappedStoreState) then
                    return nil;
                else
                    return v58.stateUpdater(v59.innerProps, v58, v60);
                end;
            end);
            v51.storeChangedConnection = v51.store.changed:connect(v56);
        end;
        v24.willUnmount = function(v61) --[[ Line: 203 ]] --[[ Name: willUnmount ]]
            if v61.storeChangedConnection then
                v61.storeChangedConnection:disconnect();
                v61.storeChangedConnection = nil;
            end;
        end;
        v24.render = function(v62) --[[ Line: 210 ]] --[[ Name: render ]]
            -- upvalues: v0 (ref), v19 (copy)
            return v0.createElement(v19, v62.state.propsForChild);
        end;
        local v63 = v0.Component:extend(v23);
        v63.render = function(v64) --[[ Line: 216 ]] --[[ Name: render ]]
            -- upvalues: v0 (ref), v3 (ref), v24 (copy)
            return v0.createElement(v3.Consumer, {
                render = function(v65) --[[ Line: 218 ]] --[[ Name: render ]]
                    -- upvalues: v0 (ref), v24 (ref), v64 (copy)
                    return v0.createElement(v24, {
                        innerProps = v64.props, 
                        store = v65
                    });
                end
            });
        end;
        return v63;
    end;
end;