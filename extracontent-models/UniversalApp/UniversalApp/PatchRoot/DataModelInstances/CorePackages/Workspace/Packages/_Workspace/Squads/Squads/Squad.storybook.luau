local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
v3.init(require(l_Parent_0.Dev.RobloxAppUIBloxConfig));
local l_mockLocale_0 = require(l_Parent_0.Dev.SocialTestHelpers).StoryHelpers.mockLocale;
local v5 = require(l_script_FirstAncestor_0.dependencies);
local l_Cryo_0 = v5.Cryo;
local l_Foundation_0 = v5.Foundation;
local l_Roact_0 = v5.Roact;
local l_AppStyleProvider_0 = v3.App.Style.AppStyleProvider;
l_Roact_0.setGlobalConfig({
    propValidation = true, 
    elementTracing = true
});
local v10 = {
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
local v11 = {
    language = "en-us"
};
local function v14(v12) --[[ Line: 44 ]] --[[ Name: useCreateOverlay ]]
    -- upvalues: v2 (copy)
    local v13 = v2.useRef(Instance.new("Frame"));
    if v13.current.Parent ~= v12.focus then
        v13.current.Parent = v12.focus;
    end;
    v2.useEffect(function() --[[ Line: 52 ]]
        -- upvalues: v13 (copy)
        v13.current.Size = UDim2.fromScale(1, 1);
        v13.current.BackgroundTransparency = 1;
        return function() --[[ Line: 56 ]]
            -- upvalues: v13 (ref)
            v13.current:Destroy();
        end;
    end, {});
    return v13.current;
end;
return {
    name = "Squads", 
    storyRoot = l_script_FirstAncestor_0, 
    roact = l_Roact_0, 
    mapDefinition = function(v15) --[[ Line: 68 ]] --[[ Name: mapDefinition ]]
        -- upvalues: l_Cryo_0 (copy), v11 (copy)
        local v16 = l_Cryo_0.Dictionary.join(v11, v15.controls or {});
        return l_Cryo_0.Dictionary.join(v15, {
            controls = v16
        });
    end, 
    mapStory = function(v17) --[[ Line: 72 ]] --[[ Name: mapStory ]]
        -- upvalues: v14 (copy), v10 (copy), l_Roact_0 (copy), l_Foundation_0 (copy), l_AppStyleProvider_0 (copy), l_mockLocale_0 (copy)
        return function(v18) --[[ Line: 73 ]]
            -- upvalues: v14 (ref), v10 (ref), l_Roact_0 (ref), l_Foundation_0 (ref), l_AppStyleProvider_0 (ref), l_mockLocale_0 (ref), v17 (copy)
            local v19 = v14(v18);
            local v20 = v18 and v10[v18.theme] or v10.Default;
            return l_Roact_0.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                l_Roact_0.createElement(l_Foundation_0.FoundationProvider, {
                    device = "Desktop", 
                    theme = v20.themeName, 
                    overlayGui = v19
                }, {
                    l_Roact_0.createElement(l_AppStyleProvider_0, {
                        style = v20
                    }, {
                        Child = l_mockLocale_0(v17, v18)
                    })
                })
            });
        end;
    end
};