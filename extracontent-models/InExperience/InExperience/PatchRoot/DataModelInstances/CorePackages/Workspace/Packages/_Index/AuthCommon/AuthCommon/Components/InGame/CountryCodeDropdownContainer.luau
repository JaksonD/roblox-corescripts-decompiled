local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v4 = require(l_script_FirstAncestor_0.Thunks.ApiFetchCountryCodes);
local v5 = require(l_script_FirstAncestor_0.Components.InGame.CountryCodeDropdownView);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v7 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v7.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v7.Hooks.RoactRodux.useSelector;
local _ = require(l_script_FirstAncestor_0.Common.Types);
return function(v11) --[[ Line: 20 ]] --[[ Name: CountryCodeDropdownContainer ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useDispatch_0 (copy), v4 (copy), l_useSelector_0 (copy), v2 (copy), v5 (copy)
    local v12 = l_useRoactService_0(l_RoactNetworking_0);
    local v13 = l_useDispatch_0();
    local l_position_0 = v11.position;
    local l_maxHeight_0 = v11.maxHeight;
    local l_dropdownVisible_0 = v11.dropdownVisible;
    local l_onCountryCodeSelected_0 = v11.onCountryCodeSelected;
    local function _(v18) --[[ Line: 28 ]]
        -- upvalues: v13 (copy), v4 (ref)
        return v13(v4.Fetch(v18));
    end;
    local v21 = l_useSelector_0(function(v20) --[[ Line: 32 ]]
        return v20.CountryCodeList;
    end);
    v2.useEffect(function() --[[ Line: 36 ]]
        -- upvalues: v12 (copy), v13 (copy), v4 (ref)
        local l_v12_0 = v12;
        v13(v4.Fetch(l_v12_0)):catch(function() --[[ Line: 37 ]]

        end);
    end, {});
    return v2.createElement(v5, {
        dropdownVisible = l_dropdownVisible_0, 
        countryCodeList = v21, 
        onCountryCodeSelected = l_onCountryCodeSelected_0, 
        maxHeight = l_maxHeight_0, 
        position = l_position_0
    });
end;