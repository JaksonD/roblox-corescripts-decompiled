local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_StyleProviderWithDefaultTheme_0 = require(l_CorePackages_0.Workspace.Packages.Style).StyleProviderWithDefaultTheme;
return {
    name = "sharetargetgame", 
    storyRoot = script, 
    middleware = function(v3, v4) --[[ Line: 10 ]] --[[ Name: middleware ]]
        -- upvalues: l_CorePackages_0 (copy), v1 (copy), l_StyleProviderWithDefaultTheme_0 (copy)
        require(l_CorePackages_0.Packages.UIBlox).init(require(l_CorePackages_0.Workspace.Packages.RobloxAppUIBloxConfig));
        local v5 = v1.createElement(l_StyleProviderWithDefaultTheme_0, nil, {
            Story = v1.createElement(v3)
        });
        local v6 = v1.mount(v5, v4, "StoryRoot");
        return function() --[[ Line: 19 ]]
            -- upvalues: v1 (ref), v6 (copy)
            v1.unmount(v6);
        end;
    end
};