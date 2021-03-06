module Components.Svg exposing (..)

import Html exposing (Html)
import Svg
    exposing
        ( circle
        , defs
        , feComposite
        , feFlood
        , feGaussianBlur
        , feMorphology
        , feOffset
        , g
        , line
        , linearGradient
        , polygon
        , rect
        , svg
        , use
        )
import Svg.Attributes as SvgA exposing (..)


none : Html msg
none =
    svg [] []
