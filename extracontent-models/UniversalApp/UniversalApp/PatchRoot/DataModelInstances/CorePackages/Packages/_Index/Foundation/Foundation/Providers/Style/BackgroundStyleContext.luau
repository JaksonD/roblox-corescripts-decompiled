local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v5 = v2.createContext(nil);
useBackgroundStyle = function() --[[ Line: 11 ]] --[[ Name: useBackgroundStyle ]]
    -- upvalues: v2 (copy), v5 (copy), v4 (copy)
    local v6 = v2.useContext(v5);
    local v7 = v4();
    if v6 == nil then
        return v7.Color.Surface.Surface_0;
    else
        return v6;
    end;
end;
return {
    useBackgroundStyle = useBackgroundStyle, 
    Provider = v5.Provider
};