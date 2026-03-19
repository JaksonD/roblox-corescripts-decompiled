local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_Modules_0.Common.memoize);
local v5 = require(l_Modules_0.LuaApp.Models.HumanoidDescriptionProperties);
local v6 = require(l_Modules_0.LuaApp.Components.Generic.HumanoidViewportFrame);
local v7 = v2.PureComponent:extend("SignUpCharacter");
v7.init = function(v8) --[[ Line: 16 ]] --[[ Name: init ]]
    v8.state = {
        propertiesAppliedToHumanoidDescription = nil
    };
    v8.isMounted = false;
    v8.humanoidDescriptionInstance = nil;
end;
v7.generateHumanoidDescriptionWithCurrentProps = function(v9) --[[ Line: 25 ]] --[[ Name: generateHumanoidDescriptionWithCurrentProps ]]
    -- upvalues: v5 (copy)
    local l_humanoidDescriptionProperties_0 = v9.props.humanoidDescriptionProperties;
    if l_humanoidDescriptionProperties_0 then
        if v9.humanoidDescriptionInstance then
            v9.humanoidDescriptionInstance:Destroy();
        end;
        v9.humanoidDescriptionInstance = v5.createHumanoidDescription(l_humanoidDescriptionProperties_0);
        v9:setState({
            propertiesAppliedToHumanoidDescription = l_humanoidDescriptionProperties_0
        });
    end;
end;
v7.render = function(v11) --[[ Line: 42 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v6 (copy)
    local l_characterColor_0 = v11.props.characterColor;
    local l_humanoidDescriptionInstance_0 = v11.humanoidDescriptionInstance;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1
    }, {
        Character = v2.createElement(v6, {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            humanoidDescription = l_humanoidDescriptionInstance_0, 
            cameraCFrameOffset = CFrame.Angles(-0.2617993877991494, 0.2617993877991494, 0.03490658503988659), 
            topOffsetScale = 0.15, 
            bottomOffsetScale = 0.15, 
            ImageColor3 = l_characterColor_0, 
            LightDirection = Vector3.new(-40, -20, 60, 0), 
            LightColor = Color3.fromRGB(180, 180, 180)
        }), 
        Shadow = v2.createElement("ImageLabel", {
            Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/CharacterShadow.png", 
            Size = UDim2.new(1, 0, 0.25, 0), 
            Position = UDim2.new(0.5, 0, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 1
        })
    });
end;
v7.didMount = function(v14) --[[ Line: 77 ]] --[[ Name: didMount ]]
    v14.isMounted = true;
    v14:generateHumanoidDescriptionWithCurrentProps();
end;
v7.didUpdate = function(v15, v16, _) --[[ Line: 83 ]] --[[ Name: didUpdate ]]
    if v15.props.humanoidDescriptionProperties ~= v16.humanoidDescriptionProperties then
        v15:generateHumanoidDescriptionWithCurrentProps();
    end;
end;
v7.willUnmount = function(v18) --[[ Line: 92 ]] --[[ Name: willUnmount ]]
    v18.isMounted = false;
    local l_humanoidDescription_0 = v18.state.humanoidDescription;
    if l_humanoidDescription_0 then
        l_humanoidDescription_0:Destroy();
    end;
end;
local v24 = v4(function(v20, v21) --[[ Line: 102 ]]
    for _, v23 in ipairs(v20) do
        if v21 == v23.bundleId then
            return v23.userOutfitId;
        end;
    end;
    return "";
end);
return (v3.connect(function(v25, v26) --[[ Line: 112 ]]
    -- upvalues: v24 (copy)
    local l_bundleId_0 = v26.bundleId;
    local l_SignUpBundles_0 = v25.SignUpInfo.SignUpBundles;
    local v29 = v24(l_SignUpBundles_0, l_bundleId_0);
    return {
        humanoidDescriptionProperties = v25.SignUpInfo.HumanoidDescriptionProperties[v29]
    };
end)(v7));