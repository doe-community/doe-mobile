package br.com.doe.gateway.controller

import br.com.doe.domain.Item
import br.com.doe.usecases.InsertUseCase
import br.com.doe.usecases.SearchUseCase
import org.springframework.data.domain.Page
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Sort
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/items")
class ItemController(
        val insertUseCase: InsertUseCase,
        val searchUseCase: SearchUseCase
) {

    @PostMapping
    fun insert(@RequestBody newItem: Item) : ResponseEntity<Item> = ResponseEntity.ok(insertUseCase.execute(newItem))

    @GetMapping()
    fun listItems(@RequestParam(value = "page", defaultValue = "0") page: Int,
                  @RequestParam(value = "linesPerPage", defaultValue = "24") linesPerPage: Int,
                  @RequestParam(value = "orderBy", defaultValue = "name") orderBy: String,
                  @RequestParam(value = "direction", defaultValue = "ASC") direction: String
    ) : ResponseEntity<Page<Item>> = ResponseEntity.ok(
            searchUseCase.execute(PageRequest.of(page, linesPerPage, Sort.Direction.valueOf(direction), orderBy))
    )


}