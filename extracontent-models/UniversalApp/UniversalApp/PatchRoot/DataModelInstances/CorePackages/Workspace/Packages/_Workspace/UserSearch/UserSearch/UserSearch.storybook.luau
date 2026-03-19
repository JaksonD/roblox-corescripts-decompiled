local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.RoactRodux);
local v6 = require(l_Parent_0.Rodux);
local l_mockLocale_0 = require(l_Parent_0.Dev.SocialTestHelpers).StoryHelpers.mockLocale;
local v8 = require(l_Parent_0.ApolloClient);
local l_mockApolloClient_0 = require(l_Parent_0.GraphQLServer).ApolloClientTestUtils.mockApolloClient;
local v10 = require(l_Parent_0.Dev.RobloxAppUIBloxConfig);
v4.init(v10);
local l_AppStyleProvider_0 = v4.App.Style.AppStyleProvider;
v2.setGlobalConfig({
    elementTracing = true
});
local v12 = {
    Default = {
        themeName = "Light", 
        fontName = "Gotham"
    }, 
    Light = {
        themeName = "Light", 
        fontName = "Gotham"
    }, 
    Dark = {
        themeName = "Dark", 
        fontName = "Gotham"
    }
};
local v13 = {
    language = "en-us"
};
local function v15(v14) --[[ Line: 44 ]]
    -- upvalues: v6 (copy)
    return v6.Store.new(function() --[[ Line: 45 ]]
        -- upvalues: v14 (copy)
        return v14;
    end, {}, {
        v6.thunkMiddleware
    });
end;
return {
    name = "UserSearch", 
    storyRoot = l_script_FirstAncestor_0, 
    roact = v2, 
    mapDefinition = function(v16) --[[ Line: 54 ]] --[[ Name: mapDefinition ]]
        -- upvalues: v3 (copy), v13 (copy)
        local v17 = v3.join(v13, v16.controls or {});
        return v3.join(v16, {
            controls = v17, 
            state = v16.state or {}
        });
    end, 
    mapStory = function(v18) --[[ Line: 61 ]] --[[ Name: mapStory ]]
        -- upvalues: v2 (copy), l_AppStyleProvider_0 (copy), v12 (copy), v5 (copy), v15 (copy), v8 (copy), l_mockApolloClient_0 (copy), l_mockLocale_0 (copy)
        return function(v19) --[[ Line: 62 ]]
            -- upvalues: v2 (ref), l_AppStyleProvider_0 (ref), v12 (ref), v5 (ref), v15 (ref), v8 (ref), l_mockApolloClient_0 (ref), l_mockLocale_0 (ref), v18 (copy)
            local v20 = v19.definition.state or {};
            return v2.createElement(l_AppStyleProvider_0, {
                style = v19 and v12[v19.theme] or v12.Default
            }, {
                storeProvider = v2.createElement(v5.StoreProvider, {
                    store = v15(v20)
                }, {
                    apolloClient = v2.createElement(v8.ApolloProvider, {
                        client = l_mockApolloClient_0({})
                    }, {
                        Child = l_mockLocale_0(v18, v19)
                    })
                })
            });
        end;
    end
};