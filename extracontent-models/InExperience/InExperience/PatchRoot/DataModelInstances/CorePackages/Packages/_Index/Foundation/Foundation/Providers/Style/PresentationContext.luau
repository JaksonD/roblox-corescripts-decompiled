local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Enums.ColorMode);
local v3 = require(l_Parent_0.React);
local v4 = v3.createContext({
    isIconSize = false, 
    colorMode = v2.Color
});
return {
    Provider = v4.Provider, 
    usePresentationContext = function() --[[ Line: 19 ]] --[[ Name: usePresentationContext ]]
        -- upvalues: v3 (copy), v4 (copy)
        return v3.useContext(v4);
    end
};