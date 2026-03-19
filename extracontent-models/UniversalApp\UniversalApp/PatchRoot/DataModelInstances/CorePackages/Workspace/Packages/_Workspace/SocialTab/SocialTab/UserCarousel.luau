local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_Roact_0 = require(l_script_FirstAncestor_0.dependencies).Roact;
local v2 = require(script.Components.UserCarouselContainer);
return {
    render = function(v3) --[[ Line: 8 ]] --[[ Name: render ]]
        -- upvalues: l_Roact_0 (copy), v2 (copy)
        return l_Roact_0.createElement(v2, v3);
    end
};