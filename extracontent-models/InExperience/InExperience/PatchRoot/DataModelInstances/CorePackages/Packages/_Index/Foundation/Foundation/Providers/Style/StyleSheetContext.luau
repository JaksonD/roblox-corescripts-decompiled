local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.Dash);
local v2 = require(l_Parent_0.React);
local l_None_0 = v1.None;
local v4 = v2.createContext(l_None_0);
return {
    Provider = v4.Provider, 
    useStyleSheet = function() --[[ Line: 11 ]] --[[ Name: useStyleSheet ]]
        -- upvalues: v2 (copy), v4 (copy), l_None_0 (copy)
        local v5 = v2.useContext(v4);
        if v5 == l_None_0 then
            return nil;
        else
            return v5;
        end;
    end
};