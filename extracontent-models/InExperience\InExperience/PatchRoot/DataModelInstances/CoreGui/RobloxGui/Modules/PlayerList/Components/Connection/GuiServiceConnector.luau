local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.Actions.SetInspectMenuEnabled);
local v6 = require(script.Parent.EventConnection);
local v7 = v2.PureComponent:extend("GuiServiceConnector");
v7.render = function(v8) --[[ Line: 16 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v6 (copy), l_GuiService_0 (copy)
    return v2.createFragment({
        InspectMenuEnabledConnection = v2.createElement(v6, {
            event = l_GuiService_0.InspectMenuEnabledChangedSignal, 
            callback = function(v9) --[[ Line: 20 ]] --[[ Name: callback ]]
                -- upvalues: v8 (copy)
                v8.props.setInspectMenuEnabled(v9);
            end
        })
    });
end;
return v3.connect(nil, function(v10) --[[ Line: 27 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v5 (copy)
    return {
        setInspectMenuEnabled = function(v11) --[[ Line: 29 ]] --[[ Name: setInspectMenuEnabled ]]
            -- upvalues: v10 (copy), v5 (ref)
            return v10(v5(v11));
        end
    };
end)(v7);