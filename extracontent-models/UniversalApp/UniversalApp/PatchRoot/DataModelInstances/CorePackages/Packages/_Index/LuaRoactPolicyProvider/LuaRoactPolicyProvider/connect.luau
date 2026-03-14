local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(script.Parent.Logger);
local v4 = require(script.Parent.AppPolicyContext);
local function v10(v5, v6) --[[ Line: 9 ]] --[[ Name: mergePolicies ]]
    -- upvalues: v2 (copy)
    local v7 = {};
    for _, v9 in ipairs(v6) do
        v7 = v2.Dictionary.join(v7, v9(v5));
    end;
    return v7;
end;
return function(v11) --[[ Line: 19 ]]
    -- upvalues: v3 (copy), v1 (copy), v10 (copy), v2 (copy), v4 (copy)
    assert(v11, "expected getPolicyImpl");
    return function(v12) --[[ Line: 22 ]]
        -- upvalues: v3 (ref), v1 (ref), v10 (ref), v11 (copy), v2 (ref), v4 (ref)
        assert(type(v12) == "function", "connect expects mapper to be a function");
        return function(v13) --[[ Line: 25 ]]
            -- upvalues: v3 (ref), v1 (ref), v10 (ref), v11 (ref), v12 (copy), v2 (ref), v4 (ref)
            local v14 = ("AppPolicy(%s)"):format((tostring(v13)));
            local v15 = v3:new(v14);
            v15:setContext({
                prefix = string.format("%s: ", v14)
            });
            local v16 = string.format("%s: Not a descendent of PolicyProvider", v14);
            local v17 = v1.PureComponent:extend(v14);
            v15:trace("Connected to component: {}", (tostring(v13)));
            v17.init = function(v18, v19) --[[ Line: 37 ]] --[[ Name: init ]]
                -- upvalues: v16 (copy), v10 (ref), v11 (ref), v15 (copy)
                v18.policyContext = v19.policy;
                assert(v18.policyContext, v16);
                v18.setWithEmptyPolicy = function() --[[ Line: 41 ]]
                    -- upvalues: v18 (copy), v10 (ref)
                    v18.state = {
                        policy = v10({}, v18.policyContext.presentationPolicy)
                    };
                end;
                if v18.policyContext.staticExternalPolicy then
                    v18.state = {
                        policy = v10(v18.policyContext.staticExternalPolicy, v18.policyContext.presentationPolicy)
                    };
                    return;
                else
                    local v20 = v11.read();
                    if v20 then
                        v18.state = {
                            policy = v10(v20, v18.policyContext.presentationPolicy)
                        };
                    else
                        v18.setWithEmptyPolicy();
                        v15:trace("No app policy data available");
                    end;
                    v18.onPolicyChanged = function(v21) --[[ Line: 67 ]]
                        -- upvalues: v18 (copy), v10 (ref)
                        v18:setState({
                            policy = v10(v21, v18.policyContext.presentationPolicy)
                        });
                    end;
                    return;
                end;
            end;
            v17.didMount = function(v22) --[[ Line: 75 ]] --[[ Name: didMount ]]
                -- upvalues: v11 (ref), v15 (copy)
                if v22.policyContext.staticExternalPolicy then
                    return;
                else
                    v22.connection = v11.onPolicyChanged(function(v23) --[[ Line: 79 ]]
                        -- upvalues: v15 (ref), v22 (copy)
                        v15:trace("Received policy update from MemStorageService");
                        v22.onPolicyChanged(v23);
                    end);
                    return;
                end;
            end;
            v17.render = function(v24) --[[ Line: 85 ]] --[[ Name: render ]]
                -- upvalues: v12 (ref), v2 (ref), v1 (ref), v13 (copy)
                local v25 = v12(v24.state.policy, v24.props.innerProps);
                local v26 = v2.Dictionary.join(v24.props.innerProps, v25);
                return v1.createElement(v13, v26);
            end;
            v17.willUnmount = function(v27) --[[ Line: 91 ]] --[[ Name: willUnmount ]]
                if v27.connection then
                    v27.connection:Disconnect();
                end;
                v27.onPolicyChange = nil;
            end;
            return function(v28) --[[ Line: 99 ]]
                -- upvalues: v1 (ref), v4 (ref), v17 (copy)
                return v1.createElement(v4.Consumer, {
                    render = function(v29) --[[ Line: 101 ]] --[[ Name: render ]]
                        -- upvalues: v1 (ref), v17 (ref), v28 (copy)
                        return v1.createElement(v17, {
                            innerProps = v28, 
                            policy = v29
                        });
                    end
                });
            end;
        end;
    end;
end;