local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppTopBanner");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Rodux);
local v4 = require(l_script_FirstAncestor_0.Enums.AppTopBannerType);
local v5 = require(l_script_FirstAncestor_0.Constants);
local v6 = require(l_script_FirstAncestor_0.Actions.SetAppTopBanner);
local v7 = require(l_script_FirstAncestor_0.Actions.DisableAppTopBanner);
local v8 = {
    isDisabled = true, 
    expanded = false, 
    appTopBannerType = v4.None, 
    appTopBannerContentProps = nil, 
    appTopBannerContentHeight = 0, 
    onAppTopBannerClick = function() --[[ Line: 37 ]] --[[ Name: onAppTopBannerClick ]]

    end
};
return v3.createReducer(v8, {
    [v6.name] = function(v9, v10) --[[ Line: 41 ]]
        -- upvalues: v2 (copy), v5 (copy), v8 (copy)
        local l_isDisabled_0 = v9.isDisabled;
        if v10.expanded then
            return (v2.Dictionary.join(v9, {
                expanded = v10.expanded, 
                appTopBannerType = v10.appTopBannerType, 
                appTopBannerContentProps = v10.appTopBannerContentProps, 
                onAppTopBannerClick = v10.onAppTopBannerClick, 
                appTopBannerContentHeight = v10.appTopBannerContentHeight or v5.CONTENT_HEIGHT, 
                isDisabled = l_isDisabled_0
            }));
        else
            if v9.expanded ~= v10.expanded then
                v9 = v2.Dictionary.join(v8, {
                    isDisabled = l_isDisabled_0
                });
            end;
            return v9;
        end;
    end, 
    [v7.name] = function(v12, v13) --[[ Line: 61 ]]
        -- upvalues: v2 (copy)
        if v12.isDisabled == v13.isDisabled then
            return v12;
        else
            return (v2.Dictionary.join(v12, {
                isDisabled = not v12.isDisabled
            }));
        end;
    end
});