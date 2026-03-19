local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.Foundation);
local l_FoundationProvider_0 = v3.FoundationProvider;
local l_Theme_0 = v3.Enums.Theme;
local l_Device_0 = v3.Enums.Device;
local v7 = require(l_Parent_0.Dev.ReactRoblox);
local v8 = require(l_Parent_0.Dev.RoactRodux);
local v9 = {
    Light = l_Theme_0.Light, 
    Dark = l_Theme_0.Dark
};
local v11 = v2.Store.new(function(v10) --[[ Line: 17 ]]
    return v10;
end, {
    ScreenSize = Vector2.new(1920, 1080), 
    TopBar = {
        topBarHeight = 10
    }, 
    GlobalGuiInset = {
        bottom = 0, 
        left = 0, 
        right = 0, 
        top = 0
    }, 
    GamesProductInfoKey = {}, 
    PlayabilityStatus = {}, 
    FetchingStatus = {}, 
    GameDetails = {}, 
    Personalization = {
        GameInfosKey = {}
    }, 
    GameIconsKey = {}, 
    UserGameVotes = {}, 
    AgeRecommendations = {}, 
    ShowAgeVerificationOverlay = {}
}, {});
return {
    name = "ServerDrivenUiContent", 
    roact = v1, 
    reactRoblox = v7, 
    mapStory = function(v12) --[[ Line: 34 ]] --[[ Name: mapStory ]]
        -- upvalues: v1 (copy), v8 (copy), v11 (copy), l_FoundationProvider_0 (copy), v9 (copy), l_Device_0 (copy)
        return function(v13) --[[ Line: 35 ]]
            -- upvalues: v1 (ref), v8 (ref), v11 (ref), l_FoundationProvider_0 (ref), v9 (ref), l_Device_0 (ref), v12 (copy)
            return v1.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                BackgroundTransparency = 1
            }, {
                UIPadding = v1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 10), 
                    PaddingBottom = UDim.new(0, 10), 
                    PaddingLeft = UDim.new(0, 10), 
                    PaddingRight = UDim.new(0, 10)
                }), 
                StoreProvider = v1.createElement(v8.StoreProvider, {
                    store = v11
                }, {
                    FoundationContext = v1.createElement(l_FoundationProvider_0, {
                        theme = v9[v13.theme], 
                        device = l_Device_0[v13.platform], 
                        preferences = v13.settings, 
                        scale = v13.settings and v13.settings.scale
                    }, {
                        Child = v1.createElement(v12, v13)
                    })
                })
            });
        end;
    end, 
    storyRoot = script.Parent.Content
};