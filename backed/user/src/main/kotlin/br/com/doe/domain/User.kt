package br.com.doe.domain

import javax.persistence.Entity
import javax.persistence.Id
import javax.persistence.Table

@Entity
@Table(name = "DoeUser")
data class User(
        @Id
        val email: String,
        val password: String
)