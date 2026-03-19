local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactRoblox);
local v4 = require(l_script_FirstAncestor_0.Providers.Foundation);
local _ = require(l_script_FirstAncestor_0.Providers.Preferences.PreferencesProvider);
local v6 = require(l_script_FirstAncestor_0.Enums.Theme);
local v7 = require(l_script_FirstAncestor_0.Enums.Device);
local l_useStyleSheet_0 = require(l_script_FirstAncestor_0.Providers.Style.StyleSheetContext).useStyleSheet;
local function v11(v9) --[[ Line: 28 ]] --[[ Name: StyleLinkPortal ]]
    -- upvalues: l_useStyleSheet_0 (copy), v3 (copy), v2 (copy)
    local v10 = l_useStyleSheet_0();
    if not v10 or not v9.overlay then
        return nil;
    else
        return v3.createPortal(v2.createElement("StyleLink", {
            StyleSheet = v10
        }), v9.overlay);
    end;
end;
local function v15(v12) --[[ Line: 43 ]] --[[ Name: useCreateOverlay ]]
    -- upvalues: v2 (copy)
    local v13 = v12.focus.Name == "StorybookEmbed";
    local v14 = v2.useRef(Instance.new("Frame"));
    if v14.current.Parent ~= v12.focus then
        v14.current.Parent = v12.focus;
    end;
    v2.useEffect(function() --[[ Line: 52 ]]
        -- upvalues: v14 (copy)
        v14.current.Size = UDim2.fromScale(1, 1);
        v14.current.BackgroundTransparency = 1;
        return function() --[[ Line: 56 ]]
            -- upvalues: v14 (ref)
            v14.current:Destroy();
        end;
    end, {});
    if v13 then
        return nil;
    else
        return v14.current;
    end;
end;
return function(v16) --[[ Line: 73 ]] --[[ Name: StoryMiddleware ]]
    -- upvalues: v15 (copy), v6 (copy), v2 (copy), v4 (copy), v7 (copy), v11 (copy)
    return function(v17) --[[ Line: 75 ]]
        -- upvalues: v15 (ref), v6 (ref), v2 (ref), v4 (ref), v7 (ref), v16 (copy), v11 (ref)
        local v18 = v15(v17);
        local v19 = v6[v17.theme];
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
            FoundationContext = v2.createElement(v4, {
                theme = v19, 
                device = v7[v17.platform], 
                preferences = v17.settings, 
                scale = v17.settings and v17.settings.scale, 
                overlayGui = v18
            }, {
                Child = v2.createElement(v16, v17), 
                StyleLink = v2.createElement(v11, if v18 then {
                    overlay = v18
                } else nil)
            })
        });
    end;
end;