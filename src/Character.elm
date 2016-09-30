module Character exposing ( Character
                          , attrValue
                          , affiliate
                          , characterFactory
                          , increaseAttribute
                          , increaseSkill
                          , unaffiliate
                          , valid
                          , validXp
                          , validFirstName
                          , validLastName
                          , validAttributes
                          )


import Attributes exposing ( Attributes
                           , attributesFactory
                           , combine
                           , reduce
                           , valid
                           )
import Affiliation exposing (Affiliation)
import List exposing (head, filter, map, member)
import Maybe exposing (withDefault)
import Skill exposing (Skill)
import String exposing (toUpper)


type alias Character =
  { xp : Int
  , firstName : String
  , lastName : String
  , concept: String
  , affiliations: List Affiliation
  , attributes: Attributes
  , skills: List Skill
  }

{-| Adds a skill to a character, or adds *to* a skill a character already has
  NOTE: The amount should really be a `Maybe Int` instead of `Int`
-}
increaseSkill : Character -> Skill -> Int -> Character
increaseSkill character skill amount =
  let
    result = findSkill character skill.name (withDefault "" skill.sub)
  in
    case result of
      Nothing -> character `addSkill` skill
      _       -> incrementSkill character skill amount

{-| Add a skill to a characters list of skills
-}
addSkill : Character -> Skill -> Character
addSkill character skill =
  { character | skills = skill :: character.skills }

{-| Add the provided XP to the matching skill
    NOTE: This is hideous and I hate it; but it works...
-}
incrementSkill : Character -> Skill -> Int -> Character
incrementSkill character skill amount =
  let
    cs = character.skills
  in
    { character
    | skills =
        case (skill.sub) of
          Nothing ->
            map (\s ->
                  if (s.name == skill.name && s.sub == Nothing) then
                    { s | xp = (s.xp + amount) }
                  else
                    s
                ) cs
          _ ->
            map (\s ->
                  if (  s.name == skill.name
                     && (withDefault "" s.sub) == (withDefault "" skill.sub)
                     )
                  then
                    { s | xp = (s.xp + amount) }
                  else
                    s
                ) cs
    }

{-| Gets the value of the specified attrubute on a character
  Note: An attributes value and XP are two different things.
-}
attrValue : Character -> String -> Int
attrValue character name =
    let
      attrs = character.attributes
    in
      case (toUpper name) of
        "STR" -> attrs.str // 100
        "BOD" -> attrs.bod // 100
        "RFL" -> attrs.rfl // 100
        "DEX" -> attrs.dex // 100
        "INT" -> attrs.int // 100
        "WIL" -> attrs.wil // 100
        "CHA" -> attrs.cha // 100
        "EDG" -> attrs.edg // 100
        _     -> 0


{-| Add an affiliation to a character
  If the provided character already has that affiliation in their list, then
  the character will just be returned. Otherwise, the provided affiliation will
  be added the affiliation list.
-}
affiliate : Character -> Affiliation -> Character
affiliate character affiliation =
  let
    affils = character.affiliations
  in
    if member affiliation affils then
      character
    else
      recurseSkills
        { character
        | affiliations =  affiliation :: affils
        , attributes = character.attributes `combine` affiliation.attributes
        , xp = character.xp - affiliation.cost
        }
        affiliation.skills


recurseSkills : Character -> List Skill -> Character
recurseSkills character skills =
  case skills of
    [] -> character
    (x::xs) ->
      let
        -- NOTE: I really should get rid of that Int argument...
        c = increaseSkill character x x.xp
      in
        recurseSkills c xs
    -- NOTE: this will throw a compiler exception because it's redundant!
    -- _ -> character

{-| Remove an affiliation from a character
-}
unaffiliate : Character -> Affiliation -> Character
unaffiliate character affiliation =
  let
    affils = character.affiliations
  in
    if not (member affiliation affils) then
      character
    else
      { character
      | affiliations = filter (\a -> a == affiliation) affils
      , attributes = character.attributes `reduce` affiliation.attributes
      , xp = character.xp + affiliation.cost
      }

{-| Creates a character type with default values.
-}
characterFactory: Character
characterFactory =
  Character 5000 "" "" "" [] attributesFactory []

{-| Increase the specified skill of a character by the specified XP
-}
increaseAttribute: Character -> String -> Int -> Character
increaseAttribute character name xp =
    let
      attrs = character.attributes
    in
      case (toUpper name) of
        "STR" -> { character
                 | attributes = { attrs | str = attrs.str + xp }
                 , xp = (character.xp - xp)
                 }
        "BOD" -> { character
                 | attributes = { attrs | bod = attrs.bod + xp }
                 , xp = (character.xp - xp)
                 }
        "RFL" -> { character
                 | attributes = { attrs | rfl = attrs.rfl + xp }
                 , xp = (character.xp - xp)
                 }
        "DEX" -> { character
                 | attributes = { attrs | dex = attrs.dex + xp }
                 , xp = (character.xp - xp)
                 }
        "INT" -> { character
                 | attributes = { attrs | int = attrs.int + xp }
                 , xp = (character.xp - xp)
                 }
        "WIL" -> { character
                 | attributes = { attrs | wil = attrs.wil + xp }
                 , xp = (character.xp - xp)
                 }
        "CHA" -> { character
                 | attributes = { attrs | cha = attrs.cha + xp }
                 , xp = (character.xp - xp)
                 }
        "EDG" -> { character
                 | attributes = { attrs | edg = attrs.edg + xp }
                 , xp = (character.xp - xp)
                 }
        _ -> character

{-| Checks the validity of a character type.
-}
valid: Character -> Bool
valid character =
  (  (fst <| validXp character)
  && (fst <| validFirstName character)
  && (fst <| validLastName character)
  && (fst <| validAttributes character)
  )

{-| Used to check the validity and return a helpful error message.
-}
validXp : Character -> (Bool, String)
validXp character =
  validator (character.xp >= 0) "This character's XP is below 0."

{-| Used to check the validity and return a helpful error message.
-}
validFirstName : Character -> (Bool, String)
validFirstName character =
  validator (character.firstName /= "") "This character needs a first name."

{-| Used to check the validity and return a helpful error message.
-}
validLastName : Character -> (Bool, String)
validLastName character =
  validator (character.lastName /= "") "This character needs a last name."

{-| Used to check the validity and return a helpful error message.
-}
validAttributes : Character -> (Bool, String)
validAttributes character =
  validator
  (Attributes.valid character.attributes)
  "One or more of this characters attributes have a value less than 1."

-- UNEXPOSED --

findSkill : Character -> String -> String -> Maybe Skill
findSkill character name sub =
  case sub of
    "" -> character.skills
          |> filter (\s -> s.name == name && (withDefault "" s.sub) == sub)
          |> head
    _  -> character.skills
          |> filter (\s -> s.name == name)
          |> head

validator : Bool -> String -> (Bool, String)
validator cond errorMessage =
  case cond of
    True  -> (True, "")
    False -> (False, errorMessage)
