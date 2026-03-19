local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Array_0 = require(l_Parent_2.LuauPolyfill).Array;
local l_parse_0 = require(l_Parent_1.language.parser).parse;
local _ = require(l_Parent_1.type.schema);
local l_buildSchema_0 = require(l_Parent_1.utilities.buildASTSchema).buildSchema;
local v7 = require(l_Parent_0.validate);
local l_validate_0 = v7.validate;
local l_validateSDL_0 = v7.validateSDL;
local v10 = l_buildSchema_0("  interface Being {\n    name(surname: Boolean): String\n  }\n\n  interface Mammal {\n    mother: Mammal\n    father: Mammal\n  }\n\n  interface Pet implements Being {\n    name(surname: Boolean): String\n  }\n\n  interface Canine implements Mammal & Being {\n    name(surname: Boolean): String\n    mother: Canine\n    father: Canine\n  }\n\n  enum DogCommand {\n    SIT\n    HEEL\n    DOWN\n  }\n\n  type Dog implements Being & Pet & Mammal & Canine {\n    name(surname: Boolean): String\n    nickname: String\n    barkVolume: Int\n    barks: Boolean\n    doesKnowCommand(dogCommand: DogCommand): Boolean\n    isHouseTrained(atOtherHomes: Boolean = true): Boolean\n    isAtLocation(x: Int, y: Int): Boolean\n    mother: Dog\n    father: Dog\n  }\n\n  type Cat implements Being & Pet {\n    name(surname: Boolean): String\n    nickname: String\n    meows: Boolean\n    meowsVolume: Int\n    furColor: FurColor\n  }\n\n  union CatOrDog = Cat | Dog\n\n  interface Intelligent {\n    iq: Int\n  }\n\n  type Human implements Being & Intelligent {\n    name(surname: Boolean): String\n    pets: [Pet]\n    relatives: [Human]\n    iq: Int\n  }\n\n  type Alien implements Being & Intelligent {\n    name(surname: Boolean): String\n    numEyes: Int\n    iq: Int\n  }\n\n  union DogOrHuman = Dog | Human\n\n  union HumanOrAlien = Human | Alien\n\n  enum FurColor {\n    BROWN\n    BLACK\n    TAN\n    SPOTTED\n    NO_FUR\n    UNKNOWN\n  }\n\n  input ComplexInput {\n    requiredField: Boolean!\n    nonNullField: Boolean! = false\n    intField: Int\n    stringField: String\n    booleanField: Boolean\n    stringListField: [String]\n  }\n\n  type ComplicatedArgs {\n    # TODO List\n    # TODO Coercion\n    # TODO NotNulls\n    intArgField(intArg: Int): String\n    nonNullIntArgField(nonNullIntArg: Int!): String\n    stringArgField(stringArg: String): String\n    booleanArgField(booleanArg: Boolean): String\n    enumArgField(enumArg: FurColor): String\n    floatArgField(floatArg: Float): String\n    idArgField(idArg: ID): String\n    stringListArgField(stringListArg: [String]): String\n    stringListNonNullArgField(stringListNonNullArg: [String!]): String\n    complexArgField(complexArg: ComplexInput): String\n    multipleReqs(req1: Int!, req2: Int!): String\n    nonNullFieldWithDefault(arg: Int! = 0): String\n    multipleOpts(opt1: Int = 0, opt2: Int = 0): String\n    multipleOptAndReq(req1: Int!, req2: Int!, opt1: Int = 0, opt2: Int = 0): String\n  }\n\n  type QueryRoot {\n    human(id: ID): Human\n    alien: Alien\n    dog: Dog\n    cat: Cat\n    pet: Pet\n    catOrDog: CatOrDog\n    dogOrHuman: DogOrHuman\n    humanOrAlien: HumanOrAlien\n    complicatedArgs: ComplicatedArgs\n  }\n\n  schema {\n    query: QueryRoot\n  }\n\n  directive @onQuery on QUERY\n  directive @onMutation on MUTATION\n  directive @onSubscription on SUBSCRIPTION\n  directive @onField on FIELD\n  directive @onFragmentDefinition on FRAGMENT_DEFINITION\n  directive @onFragmentSpread on FRAGMENT_SPREAD\n  directive @onInlineFragment on INLINE_FRAGMENT\n  directive @onVariableDefinition on VARIABLE_DEFINITION\n");
local function v18(v11, v12, v13, v14) --[[ Line: 161 ]] --[[ Name: expectValidationErrorsWithSchema ]]
    -- upvalues: l_parse_0 (copy), l_validate_0 (copy), l_Array_0 (copy)
    local v15 = l_parse_0(v14);
    local v16 = l_validate_0(v12, v15, {
        v13
    });
    return v11((l_Array_0.map(v16, function(v17) --[[ Line: 171 ]]
        return {
            message = v17.message, 
            locations = v17.locations
        };
    end)));
end;
return {
    testSchema = v10, 
    expectValidationErrorsWithSchema = v18, 
    expectValidationErrors = function(v19, v20, v21) --[[ Line: 180 ]] --[[ Name: expectValidationErrors ]]
        -- upvalues: v18 (copy), v10 (copy)
        return v18(v19, v10, v20, v21);
    end, 
    expectSDLValidationErrors = function(v22, v23, v24, v25) --[[ Line: 184 ]] --[[ Name: expectSDLValidationErrors ]]
        -- upvalues: l_parse_0 (copy), l_validateSDL_0 (copy), l_Array_0 (copy)
        local v26 = l_parse_0(v25);
        local v27 = l_validateSDL_0(v26, v23, {
            v24
        });
        return v22((l_Array_0.map(v27, function(v28) --[[ Line: 189 ]]
            return {
                message = v28.message, 
                locations = v28.locations
            };
        end)));
    end
};