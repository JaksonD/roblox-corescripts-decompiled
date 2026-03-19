local l_CorePackages_0 = game:GetService("CorePackages");
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Constants);
local v6 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v7 = v2.PureComponent:extend("WheelText");
v7.getWheelText = function(v8) --[[ Line: 15 ]] --[[ Name: getWheelText ]]
    -- upvalues: l_StarterPlayer_0 (copy), v6 (copy), v5 (copy)
    local l_currentEmotes_0 = v8.props.emotesPage.currentEmotes;
    local l_locale_0 = v8.props.locale;
    local l_numberEmotesLoaded_0 = v8.props.emotesPage.numberEmotesLoaded;
    if next(l_currentEmotes_0) == nil then
        if l_StarterPlayer_0.UserEmotesEnabled and l_numberEmotesLoaded_0 == 0 then
            return v6:FormatByKeyForLocale(v5.LocalizationKeys.NoEmotesEquipped, l_locale_0);
        else
            return v6:FormatByKeyForLocale(v5.LocalizationKeys.EmotesDisabled, l_locale_0);
        end;
    else
        local v12 = l_currentEmotes_0[v8.props.emotesWheel.focusedSegmentIndex];
        if v12 then
            return v12;
        else
            return v6:FormatByKeyForLocale(v5.LocalizationKeys.SelectAnEmote, l_locale_0);
        end;
    end;
end;
v7.render = function(v13) --[[ Line: 38 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v2 (copy)
    local v14 = v5.Layouts[v13.props.layout];
    local v15 = v13:getWheelText();
    return v2.createElement("TextLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.new(v5.InnerCircleSizeRatio, -v5.TextPadding, v5.InnerCircleSizeRatio, -v5.TextPadding), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundTransparency = 1, 
        Text = v15, 
        TextScaled = true, 
        TextSize = v14.MiddleTextSize, 
        TextColor3 = v5.Colors.White, 
        Font = v14.MiddleTextFont, 
        ZIndex = 5
    }, {
        TextSizeConstraint = v2.createElement("UITextSizeConstraint", {
            MaxTextSize = v14.MiddleTextSize
        })
    });
end;
return v3.connect(function(v16) --[[ Line: 65 ]] --[[ Name: mapStateToProps ]]
    return {
        emotesWheel = v16.emotesWheel, 
        emotesPage = v16.emotesPage, 
        layout = v16.layout, 
        locale = v16.locale
    };
end, nil)(v7);