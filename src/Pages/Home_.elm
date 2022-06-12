module Pages.Home_ exposing (Model, Msg, page)

import Gen.Params.Home_ exposing (Params)
import Gen.Route as Route
import Html exposing (Html, a, button, div, h1, h2, h5, header, input, label, p, section, span, strong, text)
import Html.Attributes as Attributes exposing (class, classList, href, id, name, rel, tabindex, target, type_)
import Html.Attributes.Aria exposing (ariaLabel, ariaLabelledby)
import Html.Events exposing (onCheck)
import Layout exposing (initLayout)
import Page
import Request
import Shared
import Svg exposing (desc)
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page shared req =
    Page.sandbox
        { init = init
        , update = update
        , view = view
        }



-- INIT


type alias Model =
    { toggler : Bool }


init : Model
init =
    { toggler = False }



-- UPDATE


type Msg
    = Toggler Bool


update : Msg -> Model -> Model
update msg model =
    case msg of
        Toggler invert ->
            { model | toggler = invert }



-- VIEW


view : Model -> View Msg
view model =
    { title = "March"
    , body =
        Layout.viewLayout
            { initLayout
                | route = Route.Home_
                , content =
                    { before =
                        viewHeader model
                            |> List.singleton
                    , after = []
                    }
                , mainContent = viewMain model
            }
    }


viewHeader : Model -> Html Msg
viewHeader model =
    header [ class "root__header " ]
        [ p [ class "custom-title" ] [ text "2022" ]
        , h1 [ class "title" ] [ text "March Fund" ]
        , span [ class "mr-auto mb-auto font-serif font-semibold text-3xl" ]
            [ text "About" ]
        , p [ class "desc" ] [ text """We invest in people that we like,
         trust, admire, and who have set out to build iconic 
         organizations in the most fundamental categories.""" ]
        , div
            [ classList
                [ ( "toggler", True )
                , ( "toggler--check", model.toggler )
                , ( "toggler--uncheck", not model.toggler )
                ]
            ]
            [ input
                [ class "toggler__input"
                , type_ "checkbox"
                , id <|
                    if model.toggler then
                        "march"

                    else
                        "merit"
                , name "toggler"
                , onCheck <| Toggler
                ]
                []
            , label [ class "toggler__option", Attributes.for "march" ] [ text "March" ]
            , label [ class "toggler__option", Attributes.for "merit" ] [ text "Merit" ]
            ]
        ]


viewMain : Model -> List (Html Msg)
viewMain _ =
    [ div [ class "card--base row-ratio" ] []
    , div [ class "card--base" ]
        [ p [ class "custom-title--orange" ] [ text "advisor" ]
        , strong [ class "title" ] [ text "Martina Rissmann" ]
        , p [ class "desc" ] [ text """Martina is Senior Partner and 
        Managing Director at Boston Consulting Group and Advisor for 
        MERIT and Corporate at July. Martina is based in Berlin, Germany.""" ]
        , a [ class "link" ] [ text "linkedin" ]
        ]
    , div [ class "card--base" ] []
    , div [ class "card--base" ] []
    , div [ class "card--base row-ratio" ] []
    , div [ class "card--base" ] []
    , div [ class "card--base row-ratio" ] []
    , div [ class "card--base" ] []
    , div [ class "card--base" ] []
    ]
