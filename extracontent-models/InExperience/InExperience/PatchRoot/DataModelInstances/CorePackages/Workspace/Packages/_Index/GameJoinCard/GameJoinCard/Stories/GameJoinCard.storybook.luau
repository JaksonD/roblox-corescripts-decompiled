local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameJoinCard");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dev.ReactRoblox);
local v4 = require(l_Parent_0.Dev.Cryo);
local v5 = require(l_Parent_0.Style);
local l_StyleProviderWithDefaultTheme_0 = v5.StyleProviderWithDefaultTheme;
local l_DesignTokenProvider_0 = v5.DesignTokenProvider;
local l_mockLocale_0 = require(l_Parent_0.Dev.SocialTestHelpers).StoryHelpers.mockLocale;
local v9 = require(l_Parent_0.Dev.Rodux);
local v10 = require(l_Parent_0.Dev.RoactRodux);
local v11 = {};
local function v13(_) --[[ Line: 15 ]] --[[ Name: createStore ]]
    -- upvalues: v9 (copy)
    return v9.Store.new(function() --[[ Line: 16 ]]
        return {
            ScreenSize = Vector2.new(600, 600), 
            TopBar = {
                topBarHeight = 0
            }, 
            GlobalGuiInset = {
                left = 0, 
                top = 0, 
                right = 0, 
                bottom = 0
            }
        };
    end, {}, {
        v9.thunkMiddleware
    });
end;
return {
    name = "GameJoinCard", 
    storyRoot = l_script_FirstAncestor_0.Stories, 
    roact = v2, 
    reactRoblox = v3, 
    mapDefinition = function(v14) --[[ Line: 37 ]] --[[ Name: mapDefinition ]]
        -- upvalues: v4 (copy), v11 (copy)
        local v15 = v4.Dictionary.join(v11, v14.controls or {});
        return v4.Dictionary.join(v14, {
            controls = v15
        });
    end, 
    mapStory = function(v16) --[[ Line: 41 ]] --[[ Name: mapStory ]]
        -- upvalues: v2 (copy), l_StyleProviderWithDefaultTheme_0 (copy), v10 (copy), v13 (copy), l_DesignTokenProvider_0 (copy), l_mockLocale_0 (copy)
        return function(v17) --[[ Line: 42 ]]
            -- upvalues: v2 (ref), l_StyleProviderWithDefaultTheme_0 (ref), v10 (ref), v13 (ref), l_DesignTokenProvider_0 (ref), l_mockLocale_0 (ref), v16 (copy)
            local v18 = true;
            if v17.theme ~= nil then
                v18 = v17.theme ~= "Light";
            end;
            return v2.createElement(l_StyleProviderWithDefaultTheme_0, {
                withDarkTheme = v18, 
                withUiModeSupport = false
            }, {
                v2.createElement(v10.StoreProvider, {
                    store = v13(nil)
                }, {
                    designTokenProvider = v2.createElement(l_DesignTokenProvider_0, {
                        tokenMappers = {}
                    }, {
                        Child = l_mockLocale_0(v16, v17)
                    })
                })
            });
        end;
    end
};