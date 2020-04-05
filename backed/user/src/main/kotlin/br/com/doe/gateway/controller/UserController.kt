package br.com.doe.gateway.controller

import br.com.doe.domain.User
import br.com.doe.usecases.InsertUseCase
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/user")
class UserController(
        val insertUseCase: InsertUseCase
) {

    @PostMapping
    fun insert(@RequestBody newUser: User) : ResponseEntity<User> = ResponseEntity.ok(insertUseCase.execute(newUser))


}