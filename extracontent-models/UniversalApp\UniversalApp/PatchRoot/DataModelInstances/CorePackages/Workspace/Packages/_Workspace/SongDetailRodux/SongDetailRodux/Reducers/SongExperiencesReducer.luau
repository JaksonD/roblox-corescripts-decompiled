local l_script_FirstAncestor_0 = script:FindFirstAncestor("SongDetailRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Actions.AddSongExperiences);
local v3 = require(l_Parent_0.Cryo);
return {
    key = "SongExperiencesKey", 
    reducer = function(v4, v5) --[[ Line: 15 ]]
        -- upvalues: v2 (copy), v3 (copy)
        v4 = v4 or {};
        assert(v4, "");
        if v5 and v5.type == v2.name then
            v4 = v3.Dictionary.join(v4, v5.songExperiences);
        end;
        return v4;
    end
};