local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local l_Symbol_0 = require(l_Parent_0.AppCommonLib).Symbol;
local v4 = require(script.Parent.RoactServicesContext);
local _ = require(script.Parent.RoactServicesTypes);
local v6 = v1.PureComponent:extend("ServiceProvider");
local v7 = {
    ServiceProvider = v6
};
v6.init = function(v8, v9) --[[ Line: 36 ]] --[[ Name: init ]]
    local v10 = {};
    if v9 and v9.services then
        assert(v9.services, "Expected some services to connect, found none");
        assert(type(v9.services) == "table", "Expected the provided services to be a map");
        for v11, v12 in pairs(v9.services) do
            if type(v11) == "table" then
                v11.set(v10, v12);
            end;
        end;
    end;
    v8:setState({
        services = v10
    });
end;
v6.render = function(v13) --[[ Line: 54 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v4 (copy)
    return v1.createElement(v4.Provider, {
        value = v13.state.services
    }, v1.oneChild(v13.props[v1.Children]));
end;
v7.createService = function(v14) --[[ Line: 62 ]] --[[ Name: createService ]]
    -- upvalues: l_Symbol_0 (copy)
    assert(type(v14) == "string", "Expected serviceName to be a string");
    local v15 = l_Symbol_0.named(v14);
    return {
        get = function(v16) --[[ Line: 68 ]] --[[ Name: get ]]
            -- upvalues: v15 (copy)
            if v16 then
                return v16[v15];
            else
                return nil;
            end;
        end, 
        set = function(v17, v18) --[[ Line: 72 ]] --[[ Name: set ]]
            -- upvalues: v15 (copy)
            v17[v15] = v18;
        end
    };
end;
v7.connect = function(v19) --[[ Line: 81 ]] --[[ Name: connect ]]
    -- upvalues: v1 (copy), l_Immutable_0 (copy), v4 (copy)
    assert(v19 ~= nil, "Expected some services to connect, found none.");
    return function(v20) --[[ Line: 83 ]]
        -- upvalues: v1 (ref), v19 (copy), l_Immutable_0 (ref), v4 (ref)
        assert(v20 ~= nil, "Expected a component to connect, found none.");
        local v21 = {};
        local v22 = ("Services(%s)"):format((tostring(v20)));
        local v23 = v1.PureComponent:extend(v22);
        v23.init = function(_, v25) --[[ Line: 91 ]] --[[ Name: init ]]
            -- upvalues: v19 (ref), v21 (copy)
            for v26, v27 in pairs(v19) do
                assert(type(v26) == "string", string.format("serviceMap must be indexed by strings, not %s", (type(v26))));
                assert(type(v27) == "table", "serviceMap must have a service created by createService()");
                assert(type(v27.get) == "function", "serviceMap must have a service created by createService()");
                assert(v25.innerProps[v26] == nil, "Naming conflict with prop : " .. v26);
                v21[v26] = v27.get(v25.services);
            end;
        end;
        v23.render = function(v28) --[[ Line: 105 ]] --[[ Name: render ]]
            -- upvalues: l_Immutable_0 (ref), v21 (copy), v1 (ref), v20 (copy)
            local v29 = l_Immutable_0.JoinDictionaries(v28.props.innerProps, v21);
            return v1.createElement(v20, v29);
        end;
        local v30 = v1.PureComponent:extend("ConnectionWrapper");
        v30.render = function(v31) --[[ Line: 112 ]] --[[ Name: render ]]
            -- upvalues: v1 (ref), v4 (ref), v23 (copy)
            return v1.createElement(v4.Consumer, {
                render = function(v32) --[[ Line: 114 ]] --[[ Name: render ]]
                    -- upvalues: v1 (ref), v23 (ref), v31 (copy)
                    return v1.createElement(v23, {
                        innerProps = v31.props, 
                        services = v32
                    });
                end
            });
        end;
        return v30;
    end;
end;
return v7;