local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Cryo);
local l_View_0 = require(l_Parent_1.Foundation).View;
local v5 = require(l_Parent_0.Flags.FFlagAddNewPlayerListFocusNav);
local v6 = require(l_Parent_0.Flags.FFlagRemoveNewPlayerListOverlay);
local function v8(v7) --[[ Line: 30 ]] --[[ Name: EntryFrameView ]]
    -- upvalues: v2 (copy), l_View_0 (copy), v6 (copy), v5 (copy)
    return v2.createElement(l_View_0, {
        Size = v7.size, 
        BackgroundTransparency = if v6 then nil else 1, 
        AutoButtonColor = if v6 then nil else false, 
        backgroundStyle = if v6 then {
            Color3 = v7.backgroundStyle.Color, 
            Transparency = v7.backgroundStyle.Transparency
        } else nil, 
        Text = if v6 then nil else "", 
        AutoLocalize = if v6 then nil else false, 
        Selectable = not v7.isTeamFrame, 
        Active = if v6 then nil else not v7.isTeamFrame, 
        onActivated = v7.onActivated, 
        onStateChanged = v7.onStateChanged, 
        ref = if v5 then v7.forwardRef else v7.firstPlayerRef
    }, if v6 then v7.children else {
        BackgroundFrame = v2.createElement("Frame", {
            ZIndex = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v7.backgroundStyle.Transparency, 
            BackgroundColor3 = v7.backgroundStyle.Color, 
            BorderSizePixel = 0
        }), 
        DoubleOverLay = v2.createElement("Frame", {
            ZIndex = 1, 
            Visible = v7.doubleOverlay, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v7.overlayStyle and v7.overlayStyle.Transparency, 
            BackgroundColor3 = v7.overlayStyle and v7.overlayStyle.Color, 
            BorderSizePixel = 0
        }), 
        OverlayFrame = v2.createElement("Frame", {
            ZIndex = 2, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v7.overlayStyle and v7.overlayStyle.Transparency, 
            BackgroundColor3 = v7.overlayStyle and v7.overlayStyle.Color, 
            BorderSizePixel = 0
        }, v7.children)
    });
end;
if v5 then
    local v11 = v2.forwardRef(function(v9, v10) --[[ Line: 85 ]]
        -- upvalues: v2 (copy), v8 (copy), v3 (copy)
        return v2.createElement(v8, v3.Dictionary.join(v9, {
            forwardRef = v10
        }));
    end);
    return v2.memo(v11);
else
    return v2.memo(v8);
end;