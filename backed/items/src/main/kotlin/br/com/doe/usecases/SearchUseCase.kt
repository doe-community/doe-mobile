package br.com.doe.usecases

import br.com.doe.domain.Item
import br.com.doe.gateway.repository.ItemRepository
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.stereotype.Component

@Component
class SearchUseCase(val itemRepository: ItemRepository) {

    fun execute(pageable: Pageable) : Page<Item> = itemRepository.findAll(pageable)

}