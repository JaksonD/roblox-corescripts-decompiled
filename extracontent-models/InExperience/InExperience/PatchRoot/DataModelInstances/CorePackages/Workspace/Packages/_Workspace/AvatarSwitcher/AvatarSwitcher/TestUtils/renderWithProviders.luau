local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarSwitcher");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactRoblox);
local v4 = require(l_script_FirstAncestor_0.Internal.ContextProviders);
return function(v5, v6) --[[ Line: 9 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy)
    local l_Frame_0 = Instance.new("Frame");
    local v8 = v3.createRoot(l_Frame_0);
    v3.act(function() --[[ Line: 12 ]]
        -- upvalues: v8 (copy), v2 (ref), v4 (ref), v5 (copy), v6 (copy)
        v8:render(v2.createElement(v4, {
            theme = "Dark"
        }, {
            Child = v2.createElement(v5, v6)
        }));
    end);
    return l_Frame_0, v8;
end;