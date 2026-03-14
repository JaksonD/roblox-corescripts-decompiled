local l_Actions_0 = game:GetService("CoreGui").RobloxGui.Modules.Shell.Actions;
local v1 = require(l_Actions_0.InsertScreen);
local v2 = require(l_Actions_0.RemoveScreen);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Immutable_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Immutable;
return function(v5, v6) --[[ Line: 19 ]]
    -- upvalues: v1 (copy), l_Immutable_0 (copy), v2 (copy)
    v5 = v5 or {};
    assert(v5, "");
    if v6.type == v1.name then
        local v7 = l_Immutable_0.Append(v5, v6.item);
        table.sort(v7, function(v8, v9) --[[ Line: 26 ]]
            if v8.priority == v9.priority then
                return v8.createdAt > v9.createdAt;
            else
                return v8.priority > v9.priority;
            end;
        end);
        return v7;
    elseif v6.type == v2.name then
        return l_Immutable_0.RemoveValueFromList(v5, v6.item);
    else
        return v5;
    end;
end;