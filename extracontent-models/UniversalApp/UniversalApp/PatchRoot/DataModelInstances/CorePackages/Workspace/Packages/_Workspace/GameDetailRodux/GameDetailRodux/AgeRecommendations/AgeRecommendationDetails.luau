local l_Parent_0 = script:FindFirstAncestor("GameDetailRodux").Parent;
local v1 = require(l_Parent_0.Dash);
local v2 = require(l_Parent_0.t);
local v3 = require(l_Parent_0.Result);
local l_FFlagLuaAppAddIgrsRatingToEdp_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddIgrsRatingToEdp;
local v5 = {
    new = function() --[[ Line: 49 ]] --[[ Name: new ]]
        return {};
    end, 
    validateModel = v2.interface({
        summary = v2.interface({
            ageRecommendation = v2.optional(v2.interface({
                displayName = v2.optional(v2.string), 
                displayNameWithHeaderShort = v2.optional(v2.string), 
                minimumAge = v2.number, 
                minimumAgeDisplay = v2.optional(v2.string), 
                contentMaturity = v2.optional(v2.string), 
                igrsRating = if l_FFlagLuaAppAddIgrsRatingToEdp_0 then v2.optional(v2.string) else nil, 
                igrsRatingDisplayMessage = if l_FFlagLuaAppAddIgrsRatingToEdp_0 then v2.optional(v2.string) else nil
            }))
        }), 
        descriptorUsages = v2.optional(v2.array(v2.interface({
            name = v2.optional(v2.string), 
            followsComplianceApi = v2.optional(v2.boolean), 
            descriptor = v2.interface({
                name = v2.string, 
                displayName = v2.string, 
                complianceApiSupported = v2.boolean, 
                iconUrl = v2.optional(v2.string), 
                localeCode = v2.optional(v2.string)
            }), 
            descriptorDimensionUsages = v2.optional(v2.array(v2.interface({
                dimensionName = v2.optional(v2.string), 
                dimensionValue = v2.optional(v2.string)
            })))
        })))
    })
};
v5.mock = function(v6) --[[ Line: 82 ]] --[[ Name: mock ]]
    -- upvalues: v5 (copy), v1 (copy)
    v6 = v6 or {};
    local v7 = v5.new();
    v7.summary = {
        ageRecommendation = {
            displayName = "13+", 
            minimumAge = 13
        }
    };
    v7.descriptorUsages = {
        [1] = {
            descriptor = {
                complianceApiSupported = false, 
                displayName = "Blood", 
                iconUrl = "https://images.rbxcdn.com/blood-icon.svg", 
                name = "blood"
            }, 
            descriptorDimensionUsages = {
                [1] = {
                    dimensionName = "realism", 
                    dimensionValue = "unrealistic"
                }, 
                [2] = {
                    dimensionName = "blood-level", 
                    dimensionValue = "heavy"
                }
            }, 
            name = "blood"
        }, 
        [2] = {
            descriptor = {
                complianceApiSupported = false, 
                displayName = "Violence", 
                iconUrl = "https://images.rbxcdn.com/violence-icon.svg", 
                name = "violence"
            }, 
            descriptorDimensionUsages = {
                [1] = {
                    dimensionName = "intensity", 
                    dimensionValue = "mild"
                }, 
                [2] = {
                    dimensionName = "frequency", 
                    dimensionValue = "infrequent"
                }
            }, 
            name = "violence"
        }
    };
    v7 = v1.joinDeep(v7, v6);
    if not v5.validateModel(v7) then
        return error("AgeRecommendationDetails mockData is invalid");
    else
        return v7;
    end;
end;
v5.fromJsonData = function(v8) --[[ Line: 142 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v5 (copy), v3 (copy), v1 (copy)
    if not v5.validateModel(v8) then
        return v3.error("AgeRecommendationDetails.fromJsonData expects a valid moderation JSON response");
    else
        local v9 = v5.new();
        v9 = v1.joinDeep(v9, v8);
        return v3.success(v9);
    end;
end;
return v5;