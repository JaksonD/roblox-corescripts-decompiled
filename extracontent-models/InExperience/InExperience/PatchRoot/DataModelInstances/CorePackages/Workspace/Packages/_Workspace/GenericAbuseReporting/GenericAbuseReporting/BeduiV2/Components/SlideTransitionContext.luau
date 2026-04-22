local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.React);
local v2 = v1.createBinding(false);
local v3 = v1.createContext(v2);
return {
    Provider = v3.Provider, 
    useIsSlideAnimating = function() --[[ Line: 13 ]] --[[ Name: useIsSlideAnimating ]]
        -- upvalues: v1 (copy), v3 (copy)
        return v1.useContext(v3);
    end
};