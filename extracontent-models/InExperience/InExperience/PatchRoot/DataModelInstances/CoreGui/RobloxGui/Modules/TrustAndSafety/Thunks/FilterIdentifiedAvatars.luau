local l_CorePackages_0 = game:GetService("CorePackages");
local l_AvatarIdentification_0 = require(l_CorePackages_0.Workspace.Packages.TnSAvatarIdentification).AvatarIdentification;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Actions.SetSelectedAvatars);
local l_getAvatarsForPoint_0 = l_AvatarIdentification_0.getAvatarsForPoint;
return function(v5) --[[ Line: 10 ]]
    -- upvalues: l_getAvatarsForPoint_0 (copy), v3 (copy)
    return function(v6) --[[ Line: 11 ]]
        -- upvalues: v5 (copy), l_getAvatarsForPoint_0 (ref), v3 (ref)
        coroutine.wrap(function() --[[ Line: 13 ]]
            -- upvalues: v6 (copy), v5 (ref), l_getAvatarsForPoint_0 (ref), v3 (ref)
            local l_identifiedAvatars_0 = v6:getState().report.identifiedAvatars;
            local v8 = {};
            for _, v10 in ipairs(v5) do
                local v11 = l_getAvatarsForPoint_0(l_identifiedAvatars_0, v10);
                for v12, v13 in pairs(v11) do
                    v8[v12] = v13;
                    print("Selected avatar", v12, v13);
                end;
            end;
            v6:dispatch(v3(v8));
        end)();
    end;
end;