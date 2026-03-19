local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local _ = require(l_script_FirstAncestor_0.Parent.ApolloClient);
local l_RetrievalStatus_0 = require(l_script_FirstAncestor_0.Parent.Http).Enum.RetrievalStatus;
return function(v3) --[[ Line: 16 ]] --[[ Name: getRetrievalStatusFromApolloQuery ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    if v3.loading then
        return l_RetrievalStatus_0.Fetching;
    elseif v3.data then
        return l_RetrievalStatus_0.Done;
    elseif v3.error then
        return l_RetrievalStatus_0.Failed;
    else
        return l_RetrievalStatus_0.NotStarted;
    end;
end;