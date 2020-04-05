package br.com.doe.usecases

import br.com.doe.domain.Item
import br.com.doe.gateway.repository.ItemRepository
import org.springframework.stereotype.Component

@Component
class InsertUseCase(val itemRepository: ItemRepository) {

    fun execute(newItem: Item) : Item = itemRepository.save(newItem)

}