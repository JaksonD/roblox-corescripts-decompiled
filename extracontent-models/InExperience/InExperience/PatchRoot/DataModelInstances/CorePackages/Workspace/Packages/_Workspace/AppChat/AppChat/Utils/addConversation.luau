local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Models.Conversation);
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
return function(v4, v5) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), l_Immutable_0 (copy)
    if v5.conversationType == v2.Type.ONE_TO_ONE_CONVERSATION then
        local v6 = v2.IdForFakeOneOnOne(v5.participants);
        if v4[v6] ~= nil then
            v4 = l_Immutable_0.Set(v4, v6, nil);
        end;
    end;
    if not v4[v5.id] then
        return l_Immutable_0.Set(v4, v5.id, v5);
    else
        return v4;
    end;
end;