local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local v4 = require(script.Parent.LocalizationConsumer);
return function(v5) --[[ Line: 9 ]] --[[ Name: withLocalization ]]
    -- upvalues: l_t_0 (copy), l_Roact_0 (copy), v4 (copy)
    assert(l_t_0.table(v5));
    return function(v6) --[[ Line: 12 ]]
        -- upvalues: l_t_0 (ref), l_Roact_0 (ref), v4 (ref), v5 (copy)
        assert(l_t_0.callback(v6));
        return l_Roact_0.createElement(v4, {
            render = v6, 
            stringsToBeLocalized = v5
        });
    end;
end;