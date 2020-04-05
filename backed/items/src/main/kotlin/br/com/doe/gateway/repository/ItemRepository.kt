package br.com.doe.gateway.repository

import br.com.doe.domain.Item
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository

interface ItemRepository : ElasticsearchRepository<Item, String> {

    fun findByName(name: String, pageable: Pageable) : Page<Item>

}