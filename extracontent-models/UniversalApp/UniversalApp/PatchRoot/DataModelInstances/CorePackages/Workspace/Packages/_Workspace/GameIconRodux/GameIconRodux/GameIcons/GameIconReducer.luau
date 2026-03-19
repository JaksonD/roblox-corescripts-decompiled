local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameIconRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_script_FirstAncestor_0.GameIcons.SetGameIcons);
return {
    key = "GameIconsKey", 
    reducer = function(v4, v5) --[[ Line: 7 ]]
        -- upvalues: v3 (copy), v2 (copy)
        v4 = v4 or {};
        if v5.type == v3.name then
            v4 = v2.Dictionary.join(v4, v5.gameIcons);
        end;
        return v4;
    end
};