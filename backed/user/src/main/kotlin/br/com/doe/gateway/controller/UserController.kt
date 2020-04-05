package br.com.doe.gateway.controller

import br.com.doe.domain.User
import br.com.doe.usecases.FindUserUseCase
import br.com.doe.usecases.InsertUseCase
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/user")
class UserController(
        val insertUseCase: InsertUseCase,
        val findUserUseCase: FindUserUseCase
) {

    @PostMapping
    fun insert(@RequestBody newUser: User) : ResponseEntity<User> = ResponseEntity.ok(insertUseCase.execute(newUser))

    @GetMapping("/{email}")
    fun getUser(@PathVariable email: String) : ResponseEntity<User> = ResponseEntity.ok(findUserUseCase.execute(email))


}