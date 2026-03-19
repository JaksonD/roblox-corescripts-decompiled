local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactRodux);
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v6 = require(l_script_FirstAncestor_0.Components.ListSearchWidget);
local v7 = require(l_script_FirstAncestor_0.Thunks.ApiFetchCountryCodes);
local v8 = require(l_script_FirstAncestor_0.Components.CountryCodeSelectorButton);
local v9 = v2.PureComponent:extend("CountryCodeSelector");
v9.init = function(v10) --[[ Line: 16 ]] --[[ Name: init ]]
    v10.props.fetchCountryCodes(v10.props.networking):catch(function() --[[ Line: 17 ]]

    end);
end;
v9.render = function(v11) --[[ Line: 22 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v6 (copy), v8 (copy)
    return v2.createElement(v6, {
        Heading = "Authentication.SignUp.Heading.CountryCodeSelector", 
        CloseCallback = v11.props.CloseCallback, 
        VisibilityTarget = v11.props.WidgetVisible and 1 or 0, 
        List = v11.props.countryCodeList, 
        ListButton = v8, 
        SelectionCallback = v11.props.SelectionCallback
    });
end;
v9 = v3.connect(function(v12) --[[ Line: 33 ]]
    return {
        countryCodeList = v12.CountryCodeList
    };
end, function(v13) --[[ Line: 37 ]]
    -- upvalues: v7 (copy)
    return {
        fetchCountryCodes = function(v14) --[[ Line: 39 ]] --[[ Name: fetchCountryCodes ]]
            -- upvalues: v13 (copy), v7 (ref)
            return v13(v7.Fetch(v14));
        end
    };
end)(v9);
return l_RoactServices_0.connect({
    networking = l_RoactNetworking_0
})(v9);