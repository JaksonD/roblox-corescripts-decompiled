local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.Otter);
local v4 = require(l_script_FirstAncestor_0.Timer);
local v5 = require(l_Parent_0.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v8 = require(l_script_FirstAncestor_0.Localization);
local l_GameSettings_0 = UserSettings().GameSettings;
local v10 = v2.Component:extend("ChatTranslationFTUX");
v10.defaultProps = {
    timer = v4.new(10)
};
local v11 = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
local v12 = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
local v13 = {
    dampingRatio = 1, 
    frequency = 2
};
if game:GetEngineFeature("TextChatServiceSettingsSaved") then
    l_GameSettings_0.ChatTranslationFTUXShown = true;
end;
v10.init = function(v14) --[[ Line: 35 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v15, v16 = v2.createBinding(1);
    v14.transparency = v15;
    v14.updateTransparency = v16;
    v14.transparencyMotor = v3.createSingleMotor(1);
    v14.transparencyMotor:onStep(v14.updateTransparency);
end;
v10.render = function(v17) --[[ Line: 41 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v11 (copy), v12 (copy)
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Position = UDim2.new(0, 10, 0, 20), 
        Size = UDim2.new(0.25, 0, 0, 0), 
        BackgroundTransparency = 1
    }, {
        BubbleTail = v2.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0, 15, 0, 10), 
            BackgroundTransparency = 1, 
            ImageTransparency = v17.transparency, 
            ImageColor3 = Color3.new(0.5, 0.5, 0.5), 
            Image = l_Images_0["component_assets/triangleUp_16"], 
            Position = UDim2.new(0, 15, 0, -10), 
            ZIndex = 100
        }), 
        BubbleBody = v2.createElement("Frame", {
            Active = true, 
            BackgroundTransparency = v17.transparency, 
            BackgroundColor3 = Color3.new(0.5, 0.5, 0.5), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            ZIndex = 100, 
            Style = Enum.FrameStyle.Custom, 
            [v2.Event.TouchTap] = function() --[[ Line: 64 ]]
                -- upvalues: v17 (copy)
                v17:fadeOut();
            end, 
            [v2.Event.InputEnded] = function(_, v19) --[[ Line: 67 ]]
                -- upvalues: v17 (copy)
                if v19.UserInputType == Enum.UserInputType.MouseButton1 then
                    v17:fadeOut();
                end;
            end
        }, {
            RoundCorners = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 5)
            }), 
            SizeConstraint = v2.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(300, 400)
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 10), 
                PaddingTop = UDim.new(0, 10), 
                PaddingBottom = UDim.new(0, 10), 
                PaddingLeft = UDim.new(0, 10)
            }), 
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 10)
            }), 
            Title = v2.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                Text = if v17.props.FTUXTitle ~= "" then v17.props.FTUXTitle else "Chat translation is on for supported languages", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextTransparency = v17.transparency, 
                FontFace = v11, 
                TextSize = 16, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.new(1, 1, 1), 
                ZIndex = 101, 
                LayoutOrder = 1
            }), 
            Body = v2.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                Text = if v17.props.FTUXBody ~= "" then v17.props.FTUXBody else "Messages you send and receive will be translated automatically", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextTransparency = v17.transparency, 
                FontFace = v12, 
                TextSize = 16, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.new(1, 1, 1), 
                ZIndex = 101, 
                LayoutOrder = 2
            })
        })
    });
end;
v10.fadeOut = function(v20) --[[ Line: 128 ]] --[[ Name: fadeOut ]]
    -- upvalues: v3 (copy), v13 (copy)
    if not v20.isFadingOut then
        v20.isFadingOut = true;
        local function v22(v21) --[[ Line: 132 ]]
            -- upvalues: v3 (ref), v13 (ref)
            return v3.spring(v21, v13);
        end;
        v20.transparencyMotor:setGoal(v22(1));
    end;
end;
v10.didMount = function(v23) --[[ Line: 139 ]] --[[ Name: didMount ]]
    -- upvalues: v3 (copy), v13 (copy)
    local function v25(v24) --[[ Line: 140 ]]
        -- upvalues: v3 (ref), v13 (ref)
        return v3.spring(v24, v13);
    end;
    v23.transparencyMotor:setGoal(v25(0));
    v23.props.timer:start():andThen(function() --[[ Line: 146 ]]
        -- upvalues: v23 (copy)
        v23:fadeOut();
    end);
end;
v10.willUnmount = function(v26) --[[ Line: 151 ]] --[[ Name: willUnmount ]]
    v26.transparencyMotor:destroy();
end;
return v8.connect(function() --[[ Line: 155 ]]
    return {
        FTUXTitle = "CoreScripts.TextChat.ChatTranslation.FTUX.TitleNew", 
        FTUXBody = "CoreScripts.TextChat.ChatTranslation.FTUX.BodyNew"
    };
end)(v10);