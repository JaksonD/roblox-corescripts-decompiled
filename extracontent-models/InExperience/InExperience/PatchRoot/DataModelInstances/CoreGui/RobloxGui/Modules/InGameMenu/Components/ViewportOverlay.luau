local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Resources.Constants);
local v9 = require(l_Parent_0.GlobalConfig);
local v10 = require(l_Parent_0.Thunks.CloseMenu);
local v11 = Vector2.new(0, 0);
local v12 = l_t_0.strictInterface({
    currentPage = l_t_0.string, 
    open = l_t_0.boolean, 
    onActivated = l_t_0.callback, 
    occupiedWidth = l_t_0.number, 
    screenSize = l_t_0.Vector2
});
return l_RoactRodux_0.UNSTABLE_connect2(function(v13, _) --[[ Line: 60 ]]
    return {
        currentPage = v13.menuPage, 
        open = v13.isMenuOpen, 
        occupiedWidth = 464, 
        screenSize = v13.screenSize
    };
end, function(v15) --[[ Line: 69 ]]
    -- upvalues: v10 (copy)
    return {
        onActivated = function() --[[ Line: 71 ]] --[[ Name: onActivated ]]
            -- upvalues: v15 (copy), v10 (ref)
            v15(v10);
        end
    };
end)(function(v16) --[[ Line: 28 ]] --[[ Name: ViewportOverlay ]]
    -- upvalues: v9 (copy), v12 (copy), v11 (copy), v8 (copy), l_withStyle_0 (copy), l_Roact_0 (copy)
    if v9.propValidation then
        assert(v12(v16));
    end;
    if v16.screenSize == v11 then
        return nil;
    else
        local v17 = v16.currentPage == v8.InitalPageKey;
        return l_withStyle_0(function(v18) --[[ Line: 39 ]]
            -- upvalues: l_Roact_0 (ref), v17 (copy), v16 (copy)
            return l_Roact_0.createElement("Frame", {
                BackgroundColor3 = v18.Theme.Overlay.Color, 
                BackgroundTransparency = v18.Theme.Overlay.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                Visible = not v17 and v16.open, 
                ZIndex = 0
            }, {
                InputCapturer = l_Roact_0.createElement("TextButton", {
                    AnchorPoint = Vector2.new(1, 0), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(1, 0, 0, 0), 
                    Size = UDim2.new(1, -v16.occupiedWidth, 1, 0), 
                    Text = "", 
                    [l_Roact_0.Event.Activated] = v16.onActivated
                })
            });
        end);
    end;
end);