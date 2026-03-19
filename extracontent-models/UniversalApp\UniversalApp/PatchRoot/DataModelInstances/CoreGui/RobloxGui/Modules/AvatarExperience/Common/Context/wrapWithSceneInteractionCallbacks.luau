local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(script.Parent.SceneInteractionCallbacksContext);
return function(v4) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v3 (copy), v1 (copy)
    return function(v5) --[[ Line: 9 ]]
        -- upvalues: v2 (ref), v3 (ref), v4 (copy), v1 (ref)
        return v2.createElement(v3.Consumer, {
            render = function(v6) --[[ Line: 11 ]] --[[ Name: render ]]
                -- upvalues: v2 (ref), v4 (ref), v1 (ref), v5 (copy)
                return v2.createElement(v4, v1.Dictionary.join(v5, v6));
            end
        });
    end;
end;