local l_Parent_0 = script:FindFirstAncestor("Responsive").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RoactServiceTags);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
return function() --[[ Line: 6 ]] --[[ Name: useIsInFullScreen ]]
    -- upvalues: l_useRoactService_0 (copy), v2 (copy), v1 (copy)
    local v4 = l_useRoactService_0(v2.AppUserGameSettings);
    local v5, v6 = v1.useState(v4:InFullScreen());
    v1.useEffect(function() --[[ Line: 10 ]]
        -- upvalues: v6 (copy), v4 (copy)
        v6(v4:InFullScreen());
        local v8 = v4.FullscreenChanged:Connect(function(v7) --[[ Line: 12 ]]
            -- upvalues: v6 (ref)
            v6(v7);
        end);
        return function() --[[ Line: 16 ]]
            -- upvalues: v8 (copy)
            v8:Disconnect();
        end;
    end, {});
    return v5;
end;