package br.com.doe.domain

import com.fasterxml.jackson.annotation.JsonProperty
import org.springframework.data.annotation.Id
import org.springframework.data.elasticsearch.annotations.Document
import org.springframework.data.elasticsearch.annotations.Field
import org.springframework.data.elasticsearch.annotations.FieldType
import java.beans.ConstructorProperties

@Document(indexName = "items", type = "item")
data class Item  @ConstructorProperties("id", "name", "description", "properties", "localization", "email_owner")
        constructor (
                @Id
                val id: String?,
                @Field(type = FieldType.Text, fielddata = true)
                val name: String,
                val description: String,
                val properties: Map<String, String>,
                val localization: Localization,
                @JsonProperty("email_owner")
                val emailOwner: String
        )