local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_CorePackages_0.Packages.React);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v5 = require(l_Modules_0.LuaApp.Components.UserSearch.Players.PlayerSearch);
local l_SearchTypes_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SearchTypes;
return function(v7) --[[ Line: 18 ]] --[[ Name: TenFootUiSearchPlayersGrid ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_SearchTypes_0 (copy), v3 (copy), l_HttpService_0 (copy), v5 (copy)
    local l_searchKeyword_0 = v7.searchKeyword;
    local l_layoutOrder_0 = v7.layoutOrder;
    local l_searchType_0 = v7.searchType;
    local l_SearchBoxAndTypeOffset_0 = l_useDesignTokens_0().LuaApps.Search.SearchBoxAndTypeOffset;
    if l_searchType_0 ~= l_SearchTypes_0.Players then
        return v3.createElement(v3.Fragment, nil, {});
    else
        local v12 = v3.useRef(l_HttpService_0:GenerateGUID(false));
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -l_SearchBoxAndTypeOffset_0), 
            LayoutOrder = l_layoutOrder_0, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            ["PlayerSearch_" .. l_searchKeyword_0] = v3.createElement(v5, {
                backgroundTransparency = 1, 
                enableNewEmptySearchUI = false, 
                searchParameters = {
                    searchKeyword = l_searchKeyword_0, 
                    isKeywordSuggestionEnabled = true
                }, 
                searchUuid = v12.current
            })
        });
    end;
end;