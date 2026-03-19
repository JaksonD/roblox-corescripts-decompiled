local l_script_FirstAncestor_0 = script:FindFirstAncestor("ShareLinkInvalidModal");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_RoactNavigation_0 = v1.RoactNavigation;
local l_RoactRodux_0 = v1.RoactRodux;
local l_Dash_0 = v1.Dash;
local l_t_0 = v1.t;
local v7 = require(script.Parent.ShareLinkInvalidModal);
local v8 = l_Roact_0.Component:extend("ShareLinkInvalidModalContainer");
v8.validateProps = l_t_0.interface({
    navigation = l_t_0.table, 
    closeModal = l_t_0.optional(l_t_0.callback)
});
v8.init = function(v9) --[[ Line: 24 ]] --[[ Name: init ]]
    v9.closeModal = function() --[[ Line: 25 ]]
        -- upvalues: v9 (copy)
        local l_props_0 = v9.props;
        if l_props_0.closeModal then
            l_props_0.closeModal();
        end;
        l_props_0.navigation.pop();
    end;
end;
v8.render = function(v11) --[[ Line: 34 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v7 (copy), l_Dash_0 (copy)
    return l_Roact_0.createElement(v7, l_Dash_0.join(v11.props, {
        closeModal = v11.closeModal
    }));
end;
v8 = l_RoactRodux_0.connect(function(v12) --[[ Line: 43 ]]
    return {
        screenSize = v12.ScreenSize
    };
end)(v8);
return l_RoactNavigation_0.withNavigation(v8);