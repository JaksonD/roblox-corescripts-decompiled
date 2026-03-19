local l_Parent_0 = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactRoblox);
local l_FoundationProvider_0 = v1.FoundationProvider;
local v5 = {
    Default = v1.Enums.Theme.Dark, 
    Light = v1.Enums.Theme.Light, 
    Dark = v1.Enums.Theme.Dark
};
local v6 = {
    Default = "Desktop", 
    Desktop = "Desktop", 
    Console = "Console"
};
local l_useStyleSheet_0 = v1.Hooks.useStyleSheet;
local function v9(v8) --[[ Line: 25 ]] --[[ Name: StyleLinkPortal ]]
    -- upvalues: l_useStyleSheet_0 (copy), v3 (copy)
    if not l_useStyleSheet_0() or not v8.overlay then
        return nil;
    else
        return v3.createPortal(nil, v8.overlay);
    end;
end;
local function v12(v10) --[[ Line: 35 ]] --[[ Name: useCreateOverlay ]]
    -- upvalues: v2 (copy)
    local v11 = v2.useRef(Instance.new("Frame"));
    if v11.current.Parent ~= v10.focus then
        v11.current.Parent = v10.focus;
    end;
    v2.useEffect(function() --[[ Line: 43 ]]
        -- upvalues: v11 (copy)
        v11.current.Size = UDim2.fromScale(1, 1);
        v11.current.BackgroundTransparency = 1;
        return function() --[[ Line: 47 ]]
            -- upvalues: v11 (ref)
            v11.current:Destroy();
        end;
    end, {});
    return v11.current;
end;
return function(v13) --[[ Line: 62 ]] --[[ Name: FoundationStorybookMiddleware ]]
    -- upvalues: v12 (copy), v5 (copy), v2 (copy), l_FoundationProvider_0 (copy), v6 (copy), v9 (copy)
    return function(v14) --[[ Line: 63 ]]
        -- upvalues: v12 (ref), v5 (ref), v2 (ref), l_FoundationProvider_0 (ref), v6 (ref), v13 (copy), v9 (ref)
        local v15 = v12(v14);
        local v16 = v5[v14.theme];
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
                theme = v16, 
                device = v6[v14.platform], 
                preferences = v14.settings, 
                scale = v14.settings and v14.settings.scale, 
                overlayGui = v15
            }, {
                Child = v2.createElement(v13, v14), 
                StyleLink = v2.createElement(v9, {
                    overlay = v15
                })
            })
        });
    end;
end;