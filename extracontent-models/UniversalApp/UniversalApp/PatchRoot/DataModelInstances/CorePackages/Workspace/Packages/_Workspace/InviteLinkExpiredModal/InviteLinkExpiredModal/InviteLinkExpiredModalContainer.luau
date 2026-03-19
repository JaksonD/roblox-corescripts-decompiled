local l_script_FirstAncestor_0 = script:FindFirstAncestor("InviteLinkExpiredModal");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_RoactNavigation_0 = v1.RoactNavigation;
local l_RoactRodux_0 = v1.RoactRodux;
local l_Dash_0 = v1.Dash;
local l_NetworkingGames_0 = v1.NetworkingGames;
local l_t_0 = v1.t;
local v8 = require(script.Parent.InviteLinkExpiredModal);
local v9 = require(script.Parent.inviteLinkExpiredMapStateToProps);
local v10 = l_Roact_0.Component:extend("InviteLinkExpiredModalContainer");
v10.validateProps = l_t_0.interface({
    navigation = l_t_0.table, 
    closeModal = l_t_0.callback, 
    launchGame = l_t_0.callback, 
    universeId = l_t_0.string
});
v10.init = function(v11) --[[ Line: 32 ]] --[[ Name: init ]]
    v11.closeModal = function(v12) --[[ Line: 33 ]]
        -- upvalues: v11 (copy)
        local l_props_0 = v11.props;
        l_props_0.closeModal(v12);
        l_props_0.navigation.pop();
    end;
end;
v10.didMount = function(v14) --[[ Line: 40 ]] --[[ Name: didMount ]]
    if #v14.props.universeId > 0 then
        v14.props.getExperiencesDetails(v14.props.universeId);
    end;
end;
v10.render = function(v15) --[[ Line: 46 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v8 (copy), l_Dash_0 (copy)
    return l_Roact_0.createElement(v8, l_Dash_0.join(v15.props, {
        closeModal = v15.closeModal
    }));
end;
v10 = l_RoactRodux_0.connect(v9, function(v16) --[[ Line: 55 ]]
    -- upvalues: l_NetworkingGames_0 (copy)
    return {
        getExperiencesDetails = function(v17) --[[ Line: 57 ]] --[[ Name: getExperiencesDetails ]]
            -- upvalues: v16 (copy), l_NetworkingGames_0 (ref)
            return v16(l_NetworkingGames_0.GetExperiencesDetails.API({
                v17
            }));
        end
    };
end)(v10);
return l_RoactNavigation_0.withNavigation(v10);