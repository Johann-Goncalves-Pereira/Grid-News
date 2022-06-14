module Pages.Home_ exposing (Model, Msg, page)

import Gen.Params.Home_ exposing (Params)
import Gen.Route as Route
import Html exposing (Attribute, Html, a, button, div, h1, h2, h5, header, img, input, label, p, section, span, strong, text)
import Html.Attributes as Attributes exposing (alt, class, classList, href, id, name, rel, src, tabindex, target, type_)
import Html.Attributes.Aria exposing (ariaLabel, ariaLabelledby)
import Html.Events exposing (on, onCheck)
import Json.Decode as JsonDecode
import Layout exposing (initLayout)
import Page
import Request
import Shared
import Svg exposing (desc)
import View exposing (View)
import VitePluginHelper exposing (asset)


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page _ _ =
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


onScroll : msg -> Attribute msg
onScroll msg =
    on "scroll" (JsonDecode.succeed msg)



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
        [ viewCustomTitle <| Custom ( "2022", "bg-accent-0" )
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


type CustomTitle
    = Partner
    | Advisor
    | PortfolioFounder
    | News
    | Custom ( String, String )


viewCustomTitle : CustomTitle -> Html Msg
viewCustomTitle ct =
    let
        ctTo =
            case ct of
                News ->
                    ( "news", "" )

                Partner ->
                    ( "partner", "bg-accent-2" )

                Advisor ->
                    ( "advisor", "bg-accent-1" )

                PortfolioFounder ->
                    ( "portfolio founder", "bg-accent-0 text-brand-1" )

                Custom ( title, color ) ->
                    ( title, color )
    in
    p
        [ class <| ("custom-title " ++ Tuple.second ctTo)
        ]
        [ text <| Tuple.first ctTo ]


type alias BaseCard =
    { customTitle : CustomTitle
    , title : String
    , desc : String
    , link : String
    }


baseCard : BaseCard
baseCard =
    { customTitle = News
    , title = ""
    , desc = ""
    , link = "linkedin"
    }


viewBaseCard : BaseCard -> Html Msg
viewBaseCard card =
    let
        ctTo =
            case card.customTitle of
                News ->
                    "bg-brand-4"

                Partner ->
                    "bg-brand-4"

                Advisor ->
                    "bg-brand-3"

                PortfolioFounder ->
                    "bg-brand-2 text-brand-4"

                Custom ( _, color ) ->
                    color
    in
    div [ class <| "card--base " ++ ctTo ]
        [ viewCustomTitle card.customTitle
        , strong [ class "title" ] [ text card.title ]
        , p [ class "desc" ] [ text card.desc ]
        , a [ class "link" ] [ text card.link ]
        ]


viewMain : Model -> List (Html Msg)
viewMain _ =
    [ div [ class "card--purple row-ratio " ]
        [ img [ class "img", src <| asset "/assets/layered-steps-haikei.svg", alt "Svg Animation" ] []
        , span [ class "material-symbols-rounded" ] [ text "bar_chart" ]
        , strong [ class "title" ] [ text "Welcome To\n The Jungle" ]
        , p [ class "text-sm" ] [ text "July Team & Advisor Playlist" ]
        ]
    , viewBaseCard
        { baseCard
            | customTitle = Advisor
            , title = "Roman Rosslenbroich"
            , desc = """Roman is CEO & Co-Founder at Aquila Capital 
            and a Founding Limited Partner at July Fund. Roman is 
            based in Hamburg, Germany."""
        }
    , viewBaseCard
        { baseCard
            | customTitle = Partner
            , title = "Wayne Mackey"
            , desc = """Wayne is CEO & Co-Founder at Statespace 
            and Advisor for Gaming and Neuroscience at July. 
            Wayne is based in Youngstown, Ohio."""
        }
    , div [ class "card--core-theme row-ratio" ]
        [ div [ class "animation" ] [ span [] [] ]
        , viewCustomTitle <| Custom ( "CORE THEME", "bg-unique-1 text-accent-0" )
        , strong [ class "title" ] [ text "Infrastructure Tech" ]
        , p [ class "text-sm text-center px-4" ] [ text """We are convinced that there are a few 
         areas in which fundamental and indicatory infrastructure will be newly 
         created in the coming years. We primarily focus on five areas in this
         context: Web3, Defense, Climate Action, Space, and Manufacturing.""" ]
        ]
    , viewBaseCard
        { baseCard
            | customTitle = Partner
            , title = "Florian Schindler"
            , desc = """Florian is a General Partner at July 
            Fund. Florian is based in Berlin, Germany."""
        }
    , viewBaseCard
        { baseCard
            | customTitle = PortfolioFounder
            , title = "Florian Schindler"
            , desc = """Florian is a General Partner at July 
            Fund. Florian is based in Berlin, Germany."""
        }
    , div [ class "card--purple row-ratio " ]
        [ img [ class "img", src "/assets/layered-steps-haikei.svg", alt "Svg Animation" ] []
        , span [ class "material-symbols-rounded" ] [ text "bar_chart" ]
        , strong [ class "title" ] [ text "Welcome To\n The Jungle" ]
        , p [ class "text-sm" ] [ text "July Team & Advisor Playlist" ]
        ]
    , viewBaseCard
        { baseCard
            | customTitle = Partner
            , title = "Florian Schindler"
            , desc = """Florian is a General Partner at July 
            Fund. Florian is based in Berlin, Germany."""
        }
    , viewBaseCard
        { baseCard
            | customTitle = PortfolioFounder
            , title = "Florian Schindler"
            , desc = """Florian is a General Partner at July 
            Fund. Florian is based in Berlin, Germany."""
        }
    , viewBaseCard
        { baseCard
            | customTitle = Partner
            , title = "Florian Schindler"
            , desc = """Florian is a General Partner at July 
            Fund. Florian is based in Berlin, Germany."""
        }
    , viewBaseCard
        { baseCard
            | customTitle = Partner
            , title = "Wayne Mackey"
            , desc = """Wayne is CEO & Co-Founder at Statespace 
            and Advisor for Gaming and Neuroscience at July. 
            Wayne is based in Youngstown, Ohio."""
        }
    , viewBaseCard
        { baseCard
            | customTitle = Partner
            , title = "Wayne Mackey"
            , desc = """Wayne is CEO & Co-Founder at Statespace 
            and Advisor for Gaming and Neuroscience at July. 
            Wayne is based in Youngstown, Ohio."""
        }
    ]
