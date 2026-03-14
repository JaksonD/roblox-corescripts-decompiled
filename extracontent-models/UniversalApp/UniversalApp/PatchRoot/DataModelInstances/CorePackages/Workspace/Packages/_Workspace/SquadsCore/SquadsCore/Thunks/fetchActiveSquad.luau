local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Http.NetworkingSquads);
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v4 = require(l_Parent_0.Promise);
local v5 = l_Logger_0:new("SquadsCore");
return function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), v5 (copy), v4 (copy)
    return function(v6) --[[ Line: 12 ]]
        -- upvalues: v2 (ref), v5 (ref), v4 (ref)
        return v6:dispatch(v2.GetSquadActive.API({})):catch(function(v7) --[[ Line: 13 ]]
            -- upvalues: v5 (ref), v4 (ref)
            v5:warning("Error fetching active squad: {}", if v7.StatusCode then v7.StatusCode else -1);
            return v4.reject(v7);
        end);
    end;
end;