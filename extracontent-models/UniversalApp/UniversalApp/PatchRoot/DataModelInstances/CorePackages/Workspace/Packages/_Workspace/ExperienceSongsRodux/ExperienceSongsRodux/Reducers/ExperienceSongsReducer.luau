local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExperienceSongsRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_script_FirstAncestor_0.Actions.AddExperienceSongs);
return {
    key = "ExperienceSongsKey", 
    reducer = function(v4, v5) --[[ Line: 12 ]]
        -- upvalues: v3 (copy), v2 (copy)
        v4 = v4 or {};
        assert(v4, "");
        if v5 and v5.type == v3.name then
            v4 = v2.Dictionary.join(v4, v5.experienceSongs);
        end;
        return v4;
    end
};