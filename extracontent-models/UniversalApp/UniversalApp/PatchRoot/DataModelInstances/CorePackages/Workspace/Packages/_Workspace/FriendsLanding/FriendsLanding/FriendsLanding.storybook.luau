local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.Logger);
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_AppStyleProvider_0 = v2.UIBlox.App.Style.AppStyleProvider;
local l_Roact_0 = v2.Roact;
local l_UniversalAppPolicy_0 = v2.UniversalAppPolicy;
local l_llama_0 = v2.llama;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_mockLocale_0 = require(l_Parent_0.Dev.SocialTestHelpers).StoryHelpers.mockLocale;
local v9 = v2.Lumberyak.Logger.new();
v9:addSink({
    maxLevel = v9.Levels.fromString("info"), 
    log = function(_, v11, _) --[[ Line: 25 ]] --[[ Name: log ]]
        print(v11);
    end
});
v1:setParent(v9);
local v13 = {
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
local v14 = {
    language = "en-us"
};
return {
    mapDefinition = function(v15) --[[ Line: 52 ]] --[[ Name: mapDefinition ]]
        -- upvalues: l_llama_0 (copy), v14 (copy)
        local v16 = l_llama_0.Dictionary.join(v14, v15.controls or {});
        return l_llama_0.Dictionary.join(v15, {
            controls = v16
        });
    end, 
    roact = l_Roact_0, 
    mapStory = function(v17) --[[ Line: 57 ]] --[[ Name: mapStory ]]
        -- upvalues: l_Roact_0 (copy), l_AppStyleProvider_0 (copy), v13 (copy), l_UniversalAppPolicy_0 (copy), l_mockLocale_0 (copy)
        return function(v18) --[[ Line: 58 ]]
            -- upvalues: l_Roact_0 (ref), l_AppStyleProvider_0 (ref), v13 (ref), l_UniversalAppPolicy_0 (ref), l_mockLocale_0 (ref), v17 (copy)
            return l_Roact_0.createElement(l_AppStyleProvider_0, {
                style = v18 and v13[v18.theme] or v13.Default
            }, {
                l_Roact_0.createElement(l_UniversalAppPolicy_0.Provider, {
                    policy = {
                        function() --[[ Line: 64 ]]
                            -- upvalues: v18 (copy)
                            return {
                                getShowDisplayName = function() --[[ Line: 66 ]] --[[ Name: getShowDisplayName ]]
                                    -- upvalues: v18 (ref)
                                    return v18.controls.getShowDisplayName;
                                end
                            };
                        end
                    }
                }, {
                    Child = l_mockLocale_0(v17, v18)
                })
            });
        end;
    end
};