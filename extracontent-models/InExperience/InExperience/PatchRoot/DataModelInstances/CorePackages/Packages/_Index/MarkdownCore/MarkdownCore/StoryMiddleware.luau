local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local l_FoundationProvider_0 = v1.FoundationProvider;
local l_Theme_0 = v1.Enums.Theme;
local l_Device_0 = v1.Enums.Device;
return function(v6) --[[ Line: 19 ]] --[[ Name: StoryMiddleware ]]
    -- upvalues: l_Theme_0 (copy), v2 (copy), l_FoundationProvider_0 (copy), l_Device_0 (copy)
    return function(v7) --[[ Line: 21 ]]
        -- upvalues: l_Theme_0 (ref), v2 (ref), l_FoundationProvider_0 (ref), l_Device_0 (ref), v6 (copy)
        local v8 = l_Theme_0[v7.theme];
        return v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 10), 
                PaddingBottom = UDim.new(0, 10), 
                PaddingLeft = UDim.new(0, 10), 
                PaddingRight = UDim.new(0, 10)
            }), 
            FoundationContext = v2.createElement(l_FoundationProvider_0, {
                theme = v8, 
                device = l_Device_0[v7.platform], 
                preferences = v7.settings
            }, {
                Child = v2.createElement(v6, v7)
            })
        });
    end;
end;