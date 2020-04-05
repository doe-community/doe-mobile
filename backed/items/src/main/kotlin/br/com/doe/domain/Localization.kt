package br.com.doe.domain

import java.beans.ConstructorProperties

data class Localization @ConstructorProperties("lat", "lng")
    constructor (
        val lat: Double,
        val lng: Double
    )