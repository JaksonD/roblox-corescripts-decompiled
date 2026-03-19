local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Actions.ShowToast);
return function(v4, v5, v6) --[[ Line: 7 ]] --[[ Name: BlockPlayer ]]
    -- upvalues: v1 (copy), v3 (copy)
    return function(v7) --[[ Line: 8 ]]
        -- upvalues: v1 (ref), v4 (copy), v3 (ref), v5 (copy), v6 (copy)
        coroutine.wrap(function() --[[ Line: 9 ]]
            -- upvalues: v1 (ref), v4 (ref), v7 (copy), v3 (ref), v5 (ref), v6 (ref)
            if v1:BlockPlayerAsync(v4) then
                v7:dispatch(v3(v5, v6));
            end;
        end)();
    end;
end;