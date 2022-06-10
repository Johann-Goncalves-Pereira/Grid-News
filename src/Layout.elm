module Layout exposing (Model, initLayout, viewLayout)

import Array
import Gen.Route as Route exposing (Route)
import Html exposing (Attribute, Html, a, div, header, main_, nav, text)
import Html.Attributes exposing (class, classList, href, id, tabindex)
import Regex



-- Model


type alias Model msg =
    { route : Route
    , content : { before : List (Html msg), after : List (Html msg) }
    , mainContent : List (Html msg)
    , mainAttrs : List (Attribute msg)
    }


initLayout : Model msg
initLayout =
    { route = Route.Home_
    , content = { before = [], after = [] }
    , mainContent = []
    , mainAttrs = []
    }



-- Structure


routeName : Route -> String
routeName route =
    let
        strRoute : String
        strRoute =
            Route.toHref route

        getLength =
            String.length strRoute

        getFirstCharacter =
            String.dropRight (getLength - 2) strRoute
                |> String.toUpper
                |> String.dropLeft 1
    in
    if route == Route.Home_ then
        "Home"

    else
        getFirstCharacter
            ++ String.replace "/" " - " (String.dropLeft 2 strRoute)


userReplace : String -> (Regex.Match -> String) -> String -> String
userReplace userRegex replacer string =
    case Regex.fromString userRegex of
        Nothing ->
            string

        Just regex ->
            Regex.replace regex replacer string


classBuilder : String -> String
classBuilder string =
    userReplace "[ ]" (\_ -> "-") string
        |> String.toLower



-- View


viewLayout : Model msg -> List (Html msg)
viewLayout model =
    let
        mainClass : Attribute msg
        mainClass =
            class <| "root__main main--" ++ classBuilder (routeName model.route)
    in
    [ div
        [ id "root"
        , classList
            [ ( "root", True )
            , ( "root--" ++ classBuilder (routeName model.route), True )
            ]
        ]
        (model.content.before
            ++ main_ (mainClass :: model.mainAttrs) model.mainContent
            :: model.content.after
        )
    ]
