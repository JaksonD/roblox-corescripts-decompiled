local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_llama_0 = v1.llama;
local l_t_0 = v1.t;
local v5 = require(script.Parent.UserCarousel);
local v6 = l_Roact_0.PureComponent:extend("FreezableUserCarousel");
v6.defaultProps = {
    isFrozen = false, 
    analytics = {}
};
v6.validateProps = l_t_0.interface({
    isFrozen = l_t_0.optional(l_t_0.boolean)
});
v6.init = function(v7) --[[ Line: 22 ]] --[[ Name: init ]]
    v7.isMounted = false;
    v7.state = {
        peopleListFrozen = v7.props.isFrozen or false
    };
    v7.setPeopleListFrozen = function(v8) --[[ Line: 28 ]]
        -- upvalues: v7 (copy)
        if v7.isMounted then
            v7:setState({
                peopleListFrozen = v8
            });
        end;
    end;
end;
v6.render = function(v9) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v5 (copy), l_llama_0 (copy)
    return l_Roact_0.createElement(v5, l_llama_0.Dictionary.join(v9.props, {
        peopleListFrozen = v9.state.peopleListFrozen, 
        setPeopleListFrozen = v9.setPeopleListFrozen
    }));
end;
v6.didMount = function(v10) --[[ Line: 47 ]] --[[ Name: didMount ]]
    v10.isMounted = true;
end;
v6.willUnmount = function(v11) --[[ Line: 51 ]] --[[ Name: willUnmount ]]
    v11.isMounted = false;
end;
return v6;