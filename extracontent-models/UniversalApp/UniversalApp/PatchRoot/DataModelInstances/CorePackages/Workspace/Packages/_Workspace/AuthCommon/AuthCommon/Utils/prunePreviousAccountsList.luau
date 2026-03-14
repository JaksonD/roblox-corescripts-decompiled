local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local v1 = require(l_script_FirstAncestor_0.Utils.AppStorageUtilities);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = game:DefineFastInt("DefaultMaxPruneAccounts", 50);
local _ = require(l_script_FirstAncestor_0.Utils.PreviousAccountEntry);
return function() --[[ Line: 10 ]] --[[ Name: prunePreviousAccountsList ]]
    -- upvalues: v1 (copy), v3 (copy), v4 (copy)
    local v6 = v1.getPreviousAccountsList();
    local v7 = v3.Dictionary.values(v6);
    local v9 = v3.List.filter(v7, function(v8) --[[ Line: 13 ]]
        return v8.signOutTimestamp == nil;
    end);
    local v11 = v3.List.filter(v7, function(v10) --[[ Line: 16 ]]
        return v10.signOutTimestamp ~= nil;
    end);
    if #v11 <= v4 then
        return true;
    else
        v11 = v3.List.sort(v11, function(v12, v13) --[[ Line: 28 ]]
            return v12.signOutTimestamp > v13.signOutTimestamp;
        end);
        local v14 = {};
        local v15 = 0;
        for _, v17 in ipairs(v11) do
            if v4 > v15 then
                if v17.userId then
                    v14[v17.userId] = v17;
                end;
                v15 = v15 + 1;
            else
                break;
            end;
        end;
        for _, v19 in ipairs(v9) do
            if v19.userId then
                v14[v19.userId] = v19;
            end;
        end;
        v1.setPreviousAccountsList(v14);
        return true;
    end;
end;