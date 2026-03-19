local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_withStyle_0 = v1.UIBlox.Style.withStyle;
local v4 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v5 = l_Roact_0.PureComponent:extend("PlayerSearchWrapper");
v5.defaultProps = {
    layoutOrder = 1, 
    onActivated = nil, 
    searchText = ""
};
v5.render = function(v6) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), l_withStyle_0 (copy), l_Roact_0 (copy)
    return v4.with(function(v7) --[[ Line: 19 ]]
        -- upvalues: l_withStyle_0 (ref), v6 (copy), l_Roact_0 (ref)
        return l_withStyle_0(function(v8) --[[ Line: 20 ]]
            -- upvalues: v6 (ref), l_Roact_0 (ref), v7 (copy)
            local v9 = v6.props.navigation.getParam("searchText", nil) or "";
            local v10 = v6.props.navigation.getParam("shouldShowUserSearchLandingPage", nil);
            return l_Roact_0.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundColor3 = v8.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0
            }, {
                l_Roact_0.createElement(v7.playerSearchPage, {
                    searchParameters = {
                        searchKeyword = v9, 
                        isKeywordSuggestionEnabled = true
                    }, 
                    shouldShowUserSearchLandingPage = v10
                })
            });
        end);
    end);
end;
return v5;